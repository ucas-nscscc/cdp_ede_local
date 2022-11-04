`include "mycpu.h"

module exe_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          ms_allowin    ,
    output                         es_allowin    ,
    //from ds
    input                          ds_to_es_valid,
    input  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,
    //to ms
    output                         es_to_ms_valid,
    output [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus  ,
    // data sram interface
    input  [                 31:0] data_sram_rdata,
    input                          data_sram_data_ok,
    output                         data_sram_req  ,
    output                         data_sram_wr   ,
    output [                  1:0] data_sram_size ,
    output [                  3:0] data_sram_wstrb,
    output [                 31:0] data_sram_addr ,
    output [                 31:0] data_sram_wdata,
    input                          data_sram_addr_ok,
    // tlb
    output  [`TLB_INV_BUS_WD  -1:0] tlb_inv_bus   ,
    input   [`TLB_TO_ES_BUS_WD -1:0] tlb_to_es_bus,
    output  [`ES_TO_TLB_BUS_WD -1:0] es_to_tlb_bus,
    input   [`CSR_TO_ES_BUS_WD -1:0] csr_to_es_bus,
    // to ds check related
    output  [`ES_REL_BUS_WD   -1:0] es_related_bus ,
    //mul_result
    output  [63                 :0] es_mul_result  ,
    //exception handling
    input                          ms_ex          ,
    input                          ws_ex          ,
    output                         es_ex          
);

reg         es_valid      ;
wire        es_ready_go   ;

reg  [63:0] stable_counter;
reg  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus_r;

localparam IDLE   = 4'b0001,
           ADDROK = 4'b0010,
           DATAOK = 4'b0100,
           BADADDR = 4'b1000;

reg [3:0] sram_cur_state;
reg [3:0] sram_nxt_state;

reg [31:0] sram_rdata;

wire        es_rdtime_h   ;
wire        es_rdtime_l   ;
wire [11:0] es_alu_op     ;
wire        es_mul_op     ;
wire        es_mul_sign   ;
wire        es_mul_horl   ;
wire [ 3:0] es_div_op     ;
wire [1:0]  es_csr_op     ;
wire [13:0] es_csr_rnum   ;
wire [31:0] es_csr_wmask  ;
wire [31:0] es_csr_wvalue ;
wire [ 4:0] es_load_sel   ;
wire [ 2:0] es_store_sel  ;
wire        es_src1_is_pc ;
wire        es_src2_is_imm; 
wire        es_res_from_mem;
wire        es_gr_we      ;
wire        es_mem_we     ;
wire [ 4:0] es_dest       ;
wire [31:0] es_imm        ;
wire [31:0] es_rj_value   ;
wire [31:0] es_rkd_value  ;
wire [31:0] es_pc         ;

wire [ 9:0] es_ex_backward;//+5
wire        es_ex_local   ;
wire [ 13:0] es_ex_gather ;//+5 +3
wire        es_allow_mem  ;
wire        es_ertn       ;
wire        es_ertn_flush ;
wire [7:0] es_tlb_ex;

wire [31:0] es_alu_src1   ;
wire [31:0] es_alu_src2   ;
wire [31:0] es_alu_result ;
wire [31:0] es_div_result ;
wire [31:0] es_final_result;
wire        es_div_running;
wire        es_res_from_div = es_div_op[0] | es_div_op[1] | es_div_op[2] | es_div_op[3];

//lab14 
wire [ 4:0] es_tlb_op;
//lab15
wire [18:0]   tlb_s1_vppn;
wire [ 9:0]   tlb_s1_asid;
wire          tlb_s1_va_bit12;
wire          tlb_s1_found;
wire [ 3:0]   tlb_s1_index;
wire [19:0]   tlb_s1_ppn;
wire [ 5:0]   tlb_s1_ps;
wire [ 1:0]   tlb_s1_mat;
wire [ 1:0]   tlb_s1_plv;
wire          tlb_s1_d;
wire          tlb_s1_v;
wire [31:0] es_vaddr;
wire [18:0] tlb_w_vppn;
wire [9:0]  tlb_w_asid;
wire [4:0] csr_crmd_useful;
wire [31:0] csr_dmw0;
wire [31:0] csr_dmw1;
wire csr_crmd_pg = csr_crmd_useful[4];
wire csr_crmd_da = csr_crmd_useful[3];
wire [1:0] csr_crmd_plv = csr_crmd_useful[1:0];//!bug 4 adem 无法识别，位宽导致的
wire tlb_inv_valid = es_valid & es_tlb_op[4];
wire [ 4:0] tlb_inv_op = {2'b0, es_tlb_op[2:0]};
//
wire es_ex_new = es_ex_local | es_tlb_ex[1] | es_tlb_ex[2] | es_tlb_ex[4] | es_tlb_ex[5] | es_tlb_ex[6] | es_tlb_ex[7];
assign es_ex_local   = (|es_load_sel[3:2] | es_store_sel[1]) && es_final_result[0] 
                     || (es_load_sel[4] | es_store_sel[2]) && (es_final_result[1:0] != 2'b0);//地址非对齐？
assign es_ex_gather  = {es_ex_local, es_ex_backward[9:5],es_tlb_ex[7:0]} & {14{es_valid}};//5 ,ale +3
assign es_ertn_flush = es_ertn & es_valid;
assign es_ex         = |es_ex_gather | es_ertn_flush;
assign es_allow_mem  = ~es_ex_new;//~es_ex_local;
assign es_tlb_op //193:189 new: 198:194
        = ds_to_es_bus_r[`DS_TO_ES_BUS_WD-1:`DS_TO_ES_BUS_WD-5];//!bug
assign es_ex_backward     //188:184 +5 new: 193:184
        = ds_to_es_bus_r[`DS_TO_ES_BUS_WD-6:`DS_TO_ES_BUS_WD-15];//10->15 
        //if inst_non, then stop doing anything, like mul, div, or writing into registers
assign {es_ertn        ,  //183:183 -> 
        es_rdtime_h    ,  //182:182
        es_rdtime_l    ,  //181:181
        es_csr_op      ,  //180:179
        es_csr_rnum    ,  //178:165
        es_mul_horl    ,  //164:164
        es_mul_sign    ,  //163:163
        es_mul_op      ,  //162:162
        es_div_op      ,  //161:158
        es_alu_op      ,  //157:146
        es_res_from_mem,  //145:145
        es_load_sel    ,  //144:140
        es_store_sel   ,  //139:137
        es_src1_is_pc  ,  //136:136
        es_src2_is_imm ,  //135:135
        es_gr_we       ,  //134:134
        es_mem_we      ,  //133:133
        es_dest        ,  //132:128
        es_imm         ,  //127:96
        es_rj_value    ,  //95 :64
        es_rkd_value   }  //63 :32
 = ds_to_es_bus_r[`DS_TO_ES_BUS_WD-16:32] & {(`DS_TO_ES_BUS_WD-46){~es_ex_backward[7] && ~es_ex_backward[5]}};//!change,debug
 //!bug 1 try 3 :+5 2 0 -> 7 5 success
assign  es_pc             //31 :0
         = ds_to_es_bus_r[31:0];

assign {tlb_w_vppn,  //19 97:79
        tlb_w_asid,  //10 78:69
        csr_dmw0,      //68:37
        csr_dmw1,      //36:5
        csr_crmd_useful //4:0
} = csr_to_es_bus;

assign {tlb_s1_found,
        tlb_s1_index,
        tlb_s1_ppn,
        tlb_s1_ps,
        tlb_s1_mat,
        tlb_s1_plv,
        tlb_s1_d,
        tlb_s1_v
} = tlb_to_es_bus;  // same with s0 in if width = 37

assign es_to_tlb_bus = {
    tlb_s1_vppn,
    tlb_s1_asid,
    tlb_s1_va_bit12
};

assign tlb_inv_bus = {
    es_valid,   //1
    es_tlb_op,  //5
    tlb_inv_valid,//1
    tlb_inv_op//5
};//to tlb
//assign es_res_from_mem = es_load_op;
assign es_to_ms_bus = {es_vaddr,
                       es_tlb_op,//170:166
                       es_ex_gather             ,  //165:160
                       es_ertn                  ,  //159:159
                       es_csr_op                ,  //158:157
                       es_csr_rnum              ,  //156:143
                       es_csr_wmask             ,  //142:111
                       es_csr_wvalue            ,  //110:79
                       es_mul_horl              ,  //78:78
                       es_mul_op                ,  //77:77
                       es_load_sel              ,  //76:72
                       sram_rdata               ,  //71:71
                       es_res_from_mem          ,  //70:70
                       es_gr_we &~es_ex_new,//& ~es_ex_local  ,  //69:69
                       es_dest                  ,  //68:64
                       es_final_result          ,  //63:32
                       es_pc                       //31:0
                      };

assign es_csr_wmask = es_rj_value;
assign es_csr_wvalue = es_rkd_value;
assign es_ready_go    = ~(es_div_running & |es_div_op & es_valid | sram_cur_state != DATAOK & (es_res_from_mem | es_mem_we));
assign es_allowin     = !es_valid || es_ready_go && ms_allowin;
assign es_to_ms_valid =  es_valid && es_ready_go && ~ms_ex && ~ws_ex;
assign es_related_bus = {es_tlb_op,
                         es_res_from_mem | es_mul_op | es_csr_op[0],// load or mul or csr_read
                         es_valid & es_gr_we,                       // check whether data valid 
                         es_dest,                                   // dest_addr
                         es_final_result};                          // dest_value

always @(posedge clk) begin
    if (reset) begin     
        es_valid <= 1'b0;
    end
    else if (ms_ex | ws_ex)
        es_valid <= 1'b0;
    else if (es_allowin) begin
        es_valid <= ds_to_es_valid;
    end

    if (ds_to_es_valid && es_allowin) begin
        ds_to_es_bus_r <= ds_to_es_bus;
    end
end

always @(posedge clk) begin
    if (reset)
        stable_counter <= 64'b0;
    else
        stable_counter <= stable_counter + 1'b1;
end

assign es_alu_src1 = es_src1_is_pc  ? es_pc[31:0] : 
                                      es_rj_value;
                                      
assign es_alu_src2 = es_src2_is_imm ? es_imm : 
                                      es_rkd_value;

assign es_final_result = es_res_from_div ? es_div_result :
                         es_rdtime_h     ? stable_counter[63:32] :
                         es_rdtime_l     ? stable_counter[31:0] :
                                            es_alu_result;

alu u_alu(
    .alu_op     (es_alu_op      ),
    .alu_src1   (es_alu_src1    ),
    .alu_src2   (es_alu_src2    ),
    .alu_result (es_alu_result  )
    );

wallace u_wallace(
    .mul_clk    (clk            ),
    .resetn     (~reset         ),
    .x          (es_alu_src1    ),
    .y          (es_alu_src2    ),
    .mul_signed (es_mul_sign    ),
    .result     (es_mul_result  )
    );

div u_div(
    .clk        (clk           ),
    .reset      (reset         ),
    .div_op     (es_div_op & {4{es_valid & ~ms_ex & ~ws_ex}}),
    .div_src1   (es_alu_src1   ),
    .div_src2   (es_alu_src2   ),
    .div_final_result(es_div_result ),
    .div_running(es_div_running)
    );

always @(posedge clk) begin
    if(reset)
        sram_cur_state <= IDLE;
    else
        sram_cur_state <= sram_nxt_state;
end

always @(*) begin
    case(sram_cur_state)
        IDLE:
            if (data_sram_req & data_sram_addr_ok)
                sram_nxt_state = ADDROK;
            else if ((es_res_from_mem | es_mem_we) & es_ex_new)//& es_ex_local)
                sram_nxt_state = DATAOK;
            else
                sram_nxt_state = IDLE;
        ADDROK:
            if (data_sram_data_ok)
                sram_nxt_state = DATAOK;
            else
                sram_nxt_state = ADDROK;
        DATAOK:
            if (ms_allowin)
                sram_nxt_state = IDLE;
            else
                sram_nxt_state = DATAOK;
        default:
                sram_nxt_state = IDLE;
    endcase
end

always @(posedge clk) begin
    if (data_sram_data_ok)
        sram_rdata <= data_sram_rdata;
end

//hit signal
wire dmw0_hit = csr_dmw0[csr_crmd_plv] && (csr_dmw0[31:29] == es_final_result[31:29]);
wire dmw1_hit = csr_dmw1[csr_crmd_plv] && (csr_dmw1[31:29] == es_final_result[31:29]);
wire direct_va_valid = csr_crmd_da && !csr_crmd_pg; //直接地址翻译模式
wire tlb_va_valid = !direct_va_valid && !dmw0_hit && !dmw1_hit && (es_res_from_mem || es_mem_we); //映射地址翻译模式且dmw miss
//!data_sram_req???
wire tlb_va_hit = tlb_va_valid && tlb_s1_found && (tlb_s1_plv >= csr_crmd_plv);
wire tlb_pg4MB = tlb_s1_ps == 6'h16; //pagesize 1:4MB, 0:4KB
wire es_ade = tlb_va_valid && (csr_crmd_plv[1:0] == 2'h3) && es_final_result[31];//!final or ??
// wire es_ale = ((data_sram_size == 2'd2) & (es_final_result[1:0]!=2'd0)) |
//                 ((data_sram_size == 2'd1) & es_final_result[0]);//地址非对齐错
//!即local
//TODO : 是否�?查访存地�?对齐？精�?版上没有，但理论上似乎应�?�?;ALE,
//ASID等于GR[rj][9:0]且VA等于GR[rk][31:0] according to 精简版P56
assign tlb_s1_vppn = tlb_inv_valid ? es_rkd_value[31:13] : 
                    es_tlb_op[0] ? tlb_w_vppn ://srch
                    es_final_result[31:13];//!如果都不是那值应该是多少
assign tlb_s1_asid = tlb_inv_valid ? es_rj_value[9:0] : tlb_w_asid;//= tlb_inv_valid ? es_tlb_inv_asid[9:0] : tlb_w_asid;
assign tlb_s1_va_bit12 = tlb_inv_valid ? es_rj_value[12] : 
                    es_tlb_op[0] ? 1'b0 ://!srch why
                    es_final_result[12];//= tlb_inv_valid ? es_tlb_inv_vppn[12] : 1'b0;//TBM

assign es_vaddr = (|es_ex_backward) ? es_pc : es_final_result;
assign es_tlb_ex[`TLB_ADEF_EX] = es_ex_backward[`TLB_ADEF_EX];//0
assign es_tlb_ex[`TLB_ADEM_EX] = es_ex_backward[`TLB_ADEM_EX] | es_ade;//1
assign es_tlb_ex[`TLB_TLBR_EX] = es_ex_backward[`TLB_TLBR_EX] | (!tlb_s1_found & tlb_va_valid);
assign es_tlb_ex[`TLB_PIF_EX ]= es_ex_backward[`TLB_PIF_EX ];
assign es_tlb_ex[`TLB_PPI_EX ]=es_ex_backward[`TLB_PPI_EX ] | (tlb_s1_found & (tlb_s1_plv < csr_crmd_plv) & tlb_va_valid); 
assign es_tlb_ex[`TLB_PIL_EX]=tlb_s1_found &  !tlb_s1_v & es_res_from_mem & tlb_va_valid;
assign es_tlb_ex[`TLB_PIS_EX]= tlb_s1_found & !tlb_s1_v & es_mem_we & tlb_va_valid; 
assign es_tlb_ex[`TLB_PME_EX]=tlb_s1_found & es_mem_we & !tlb_s1_d & tlb_va_valid;
assign data_sram_req   = (es_res_from_mem || es_mem_we) && es_valid && es_allow_mem && sram_cur_state == IDLE;
//if ale, then stop load and store; else if check ms and ws in exception state, then stop load and store, either.
assign data_sram_wstrb = es_store_sel[2] ? 4'hf: //st.w
                         es_store_sel[1] ?  (es_final_result[1] ? 4'hc : 4'h3):
                         es_store_sel[0] ? ((es_final_result[1:0] == 2'b11) ? 4'h8:
                                            (es_final_result[1:0] == 2'b10) ? 4'h4:
                                            (es_final_result[1:0] == 2'b01) ? 4'h2:
                                                                              4'h1):
                                                                              4'h0;
assign data_sram_size  = es_store_sel[2] |  es_load_sel[4]   ? 2'd2 :
                         es_store_sel[1] | |es_load_sel[3:2] ? 2'd1 :
                                                               2'd0 ;//感动qwq
assign data_sram_wr    = es_mem_we && es_valid && es_allow_mem;
assign data_sram_addr = direct_va_valid ? es_final_result :
                        dmw0_hit ? {csr_dmw0[27:25],es_final_result[28:0]} :
                        dmw1_hit ? {csr_dmw1[27:25],es_final_result[28:0]} :
                        (tlb_va_hit && tlb_pg4MB) ? {tlb_s1_ppn[9:0],es_final_result[21:0]} :
                        (tlb_va_hit && !tlb_pg4MB) ? {tlb_s1_ppn[19:0],es_final_result[11:0]} :
                        32'b0;//!else?
//assign data_sram_addr  = es_final_result;
assign data_sram_wdata = es_store_sel[1] ? {2{es_rkd_value[15:0]}}:
                         es_store_sel[0] ? {4{es_rkd_value[ 7:0]}}:
                                              es_rkd_value           ;
 
endmodule
