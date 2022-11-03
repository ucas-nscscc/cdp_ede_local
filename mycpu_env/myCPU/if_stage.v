`include "mycpu.h"

module if_stage(
    input                          clk            ,
    input                          reset          ,
    //allwoin
    input                          ds_allowin     ,
    //brbus
    input  [`BR_BUS_WD       -1:0] br_bus         ,
    //exception handling
    input                          ex_taken       ,
    input  [                 31:0] ex_target      ,
    //to ds
    output                         fs_to_ds_valid ,
    output [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus   ,
    // interact with tlb, mmu
    input  [`TLB_TO_FS_BUS_WD -1:0] tlb_to_fs_bus,
    output [`FS_TO_TLB_BUS_WD -1:0] fs_to_tlb_bus,
    //csr signal
    input  [`CSR_TO_FS_BUS_WD -1:0] csr_to_fs_bus,
    
    //inst sram interface
    output                         inst_sram_req  ,
    output                         inst_sram_wr,
    output [                  1:0] inst_sram_size,
    output [                  3:0] inst_sram_wstrb,
    output [                 31:0] inst_sram_addr ,
    output [                 31:0] inst_sram_wdata,
    input                          inst_sram_addr_ok,
    input                          inst_sram_data_ok,
    input  [                 31:0] inst_sram_rdata
);

localparam IDLE   = 4'b0001,
           ADDROK = 4'b0010,
           DATAOK = 4'b0100,
           BADADDR = 4'b1000;

reg [3:0] sram_cur_state;
reg [3:0] sram_nxt_state;

// reg         fs_valid;
wire        fs_ready_go;
// wire        fs_allowin;

reg [31:0] req_pc;
reg [31:0] rev_inst;
wire [31:0] seq_pc;
reg [31:0] fs_pc;
wire [31:0] fs_inst;
wire fs_ex_local;

reg target_valid;
reg [31:0] target_pc;

wire        br_taken;
wire [31:0] br_target;

assign {br_taken, br_target} = br_bus;

//vaddr transfer related signal
wire [18:0]   tlb_s0_vppn;
wire          tlb_s0_va_bit12;
wire          tlb_s0_found;
wire [ 3:0]   tlb_s0_index;
wire [19:0]   tlb_s0_ppn;
wire [ 5:0]   tlb_s0_ps;
wire [ 1:0]   tlb_s0_mat;
wire [ 1:0]   tlb_s0_plv;
wire          tlb_s0_d;
wire          tlb_s0_v;
wire [4:0] csr_crmd_useful;
wire [31:0] csr_dmw0;
wire [31:0] csr_dmw1;
wire csr_crmd_pg = csr_crmd_useful[4];
wire csr_crmd_da = csr_crmd_useful[3];
wire [1:0] csr_crmd_plv = csr_crmd_useful[1:0];
//hit signal
wire dmw0_hit = csr_dmw0[csr_crmd_plv] && (csr_dmw0[31:29] == req_pc[31:29]);
wire dmw1_hit = csr_dmw1[csr_crmd_plv] && (csr_dmw1[31:29] == req_pc[31:29]);
wire direct_va_valid = csr_crmd_da && !csr_crmd_pg; //直接地址翻译模式
wire tlb_va_valid = !direct_va_valid && !dmw0_hit && !dmw1_hit; //映射地址翻译模式且dmw miss
wire tlb_va_hit = tlb_va_valid && tlb_s0_found && (tlb_s0_plv >= csr_crmd_plv);
wire tlb_pg4MB = tlb_s0_ps == 6'h16; //pagesize 1:4MB, 0:4KB
// tlb related ex
wire [4:0] fs_tlb_ex;
// 
//TODO fs_adef ???
assign fs_to_tlb_bus = {
    tlb_s0_vppn,    //19:1
    tlb_s0_va_bit12 //0:0
};

assign {csr_dmw0,      //68:37
        csr_dmw1,      //36:5
        csr_crmd_useful //4:0
    } = csr_to_fs_bus; //69

assign {tlb_s0_found, //36:26  1
        tlb_s0_index, //35:22  4
        tlb_s0_ppn, //31:12  20
        tlb_s0_ps, //11:6  6
        tlb_s0_mat, //5:4  2
        tlb_s0_plv, //3:2  2
        tlb_s0_d,  //1:1   1
        tlb_s0_v   //0:0  1
    } = tlb_to_fs_bus;  //37
wire fs_ade = tlb_va_valid && (csr_crmd_plv == 2'h3) && req_pc[31];
// according to 精简版介绍P42
assign fs_tlb_ex[`TLB_ADEF_EX] = (req_pc[1:0]!=2'b0) | fs_ade; //inst addr error
assign fs_tlb_ex[`TLB_ADEM_EX] = 1'b0;//fs_ade; fs address error
assign fs_tlb_ex[`TLB_TLBR_EX] = tlb_va_valid & !tlb_s0_found;
assign fs_tlb_ex[`TLB_PIF_EX ] = tlb_va_valid & tlb_s0_found & !tlb_s0_v;
assign fs_tlb_ex[`TLB_PPI_EX ] = tlb_va_valid & tlb_s0_found & (tlb_s0_plv < csr_crmd_plv);
wire fs_ex_new = fs_ex_local | (fs_tlb_ex != 5'h00);
assign tlb_s0_vppn = req_pc[31:13];
assign tlb_s0_va_bit12 = req_pc[12];//!bug 1 未连接导致信号为Z 9065407
always @(posedge clk) begin
    if(reset)
        sram_cur_state <= IDLE;
    else
        sram_cur_state <= sram_nxt_state;
end

always @(*) begin
    case(sram_cur_state)
        IDLE:
            if (inst_sram_req & inst_sram_addr_ok)
                sram_nxt_state = ADDROK;
            else if (fs_ex_new)//(fs_ex_local)
                sram_nxt_state = BADADDR;
            else
                sram_nxt_state = IDLE;
        ADDROK:
            if (inst_sram_data_ok)
                sram_nxt_state = DATAOK;
            else
                sram_nxt_state = ADDROK;
        DATAOK:
            if (ds_allowin)
                sram_nxt_state = IDLE;
            else
                sram_nxt_state = DATAOK;
        BADADDR:
            if (~fs_ex_new)//(~fs_ex_local)
                sram_nxt_state = IDLE;
            else
                sram_nxt_state = BADADDR;
        default:
                sram_nxt_state = IDLE;
    endcase
end

always @(posedge clk) begin
    if (reset)
        req_pc <= 32'h1c000000;
    else if (sram_cur_state == DATAOK & ds_allowin)begin
        if (target_valid)
            req_pc <= target_pc;
        else
            req_pc <= seq_pc;
    end
    else if (sram_cur_state == BADADDR)begin
        if (target_valid)
            req_pc <= target_pc;
    end
    
    if (inst_sram_data_ok)
        fs_pc <= req_pc;
    else if (fs_ex_new)//(fs_ex_local)
        fs_pc <= req_pc;

    if (inst_sram_data_ok)
        rev_inst <= inst_sram_rdata;
end

always @(posedge clk) begin
    if (reset)
        target_valid <= 1'b0;
    else if (ex_taken)
        target_valid <= 1'b1;
    else if (br_taken)
        target_valid <= 1'b1;
    else if (sram_cur_state == DATAOK & ds_allowin)
        target_valid <= 1'b0;

    if (ex_taken)
        target_pc <= ex_target;
    else if (br_taken)
        target_pc <= br_target;
end


// IF stage
assign fs_ready_go    = sram_cur_state == DATAOK | sram_cur_state == BADADDR;
// assign fs_allowin     = !fs_valid || fs_ready_go && ds_allowin;
assign fs_to_ds_valid =  fs_ready_go & ~target_valid;

assign seq_pc = req_pc + 3'd4;
assign inst_sram_req = sram_cur_state == IDLE & ~fs_ex_new & ~reset;//IDLE & ~fs_ex_local & ~reset;
//assign inst_sram_addr = req_pc;
assign inst_sram_addr = direct_va_valid ? req_pc :     //According to ref [5.2]
                        dmw0_hit ? {csr_dmw0[27:25],req_pc[28:0]} :
                        dmw1_hit ? {csr_dmw1[27:25],req_pc[28:0]} :
                        (tlb_va_hit & tlb_pg4MB) ? {tlb_s0_ppn[9:0],req_pc[21:0]} :
                        (tlb_va_hit & !tlb_pg4MB) ? {tlb_s0_ppn[19:0],req_pc[11:0]} :
                        32'b0;
assign inst_sram_wr     = 1'b0;
assign inst_sram_size   = 2'd2;
assign inst_sram_wstrb  = 4'b0;
assign inst_sram_wdata  = 32'b0;

assign fs_inst = rev_inst;
assign fs_ex_local = ((req_pc[1:0] & 2'b11) != 2'd0);//可以删去
assign fs_to_ds_bus = {fs_ex_local,
                       fs_tlb_ex,
                       fs_inst    ,
                       fs_pc      };
endmodule