`include "mycpu.h"

module id_stage(
    input                          clk           ,
    input                          reset         ,
    //allowin
    input                          es_allowin    ,
    output                         ds_allowin    ,
    //from fs
    input                          fs_to_ds_valid,
    input  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus  ,
    //to es
    output                         ds_to_es_valid,
    output [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus  ,
    //to fs
    output [`BR_BUS_WD       -1:0] br_bus        ,
    //to rf: for write back
    input  [`WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus  ,
    //check related
    input  [`ES_REL_BUS_WD   -1:0] es_related_bus,
    input  [`MS_REL_BUS_WD   -1:0] ms_related_bus,
    input  [`WS_REL_BUS_WD   -1:0] ws_related_bus,
    //exception handling
    input                          has_int       ,
    input                          es_ex         ,
    input                          ms_ex         ,
    input                          ws_ex         ,
    output                         ds_ex         
);

reg         ds_valid   ;
wire        ds_ready_go;

reg  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus_r;

wire [31:0] ds_inst;
wire [31:0] ds_pc  ;
//wire        ds_ex_backward;
wire [5:0] ds_ex_backward;
wire [ 3:0] ds_ex_local;
wire [ 9:0] ds_ex_gather;//+5
//!lab15
//wire [4:0] ds_tlb_ex;
assign {//ds_tlb_ex,already add it to ds_ex_backward
        ds_ex_backward,
        ds_inst    ,
        ds_pc      } = fs_to_ds_bus_r;

wire ds_r1_valid;
wire ds_r2_valid;

wire        rf_we   ;
wire [ 4:0] rf_waddr;
wire [31:0] rf_wdata;
assign {rf_we   ,  //37:37
        rf_waddr,  //36:32
        rf_wdata   //31:0
       } = ws_to_rf_bus;

wire        br_taken;
wire [31:0] br_target;

wire        csr_re;
wire        csr_we;
wire [ 1:0] csr_op;
wire [13:0] csr_rnum;

wire        ds_ertn;
wire        ds_ertn_flush;
wire        rdtimeh;
wire        rdtimel;
wire [ 3:0] div_op;
wire [ 2:0] mul_op;
wire [11:0] alu_op;
wire [ 4:0] load_sel;
wire [ 2:0] store_sel;
wire        load_op;
wire        src1_is_pc;
wire        src2_is_imm;
wire        res_from_mem;
wire        dst_is_r1;
wire        gr_we;
wire        mem_we;
wire        src_reg_is_rd;
wire [4: 0] dest;
wire [31:0] rj_value;
wire [31:0] rkd_value;
wire [31:0] ds_imm;
wire [31:0] br_offs;
wire [31:0] jirl_offs;
//lab14
wire [4:0] es_tlb_op;
wire [4:0] ms_tlb_op;
wire [4:0] ws_tlb_op;

wire [ 5:0] op_31_26;
wire [ 3:0] op_25_22;
wire [ 1:0] op_21_20;
wire [ 4:0] op_19_15;
wire [ 4:0] rd;
wire [ 4:0] rj;
wire [ 4:0] rk;
wire [11:0] i12;
wire [19:0] i20;
wire [15:0] i16;
wire [25:0] i26;

wire [63:0] op_31_26_d;
wire [15:0] op_25_22_d;
wire [ 3:0] op_21_20_d;
wire [31:0] op_19_15_d;
  
wire        inst_add_w; 
wire        inst_sub_w;  
wire        inst_sll_w;
wire        inst_sra_w;
wire        inst_srl_w;
wire        inst_slt;    
wire        inst_sltu;   
wire        inst_nor;    
wire        inst_and;    
wire        inst_or;     
wire        inst_xor;    
wire        inst_slli_w;  
wire        inst_srli_w;  
wire        inst_srai_w;  
wire        inst_addi_w; 
wire        inst_ld_w; 
wire        inst_ld_b;
wire        inst_ld_h;
wire        inst_ld_bu;
wire        inst_ld_hu; 
wire        inst_st_w;  
wire        inst_st_b;
wire        inst_st_h; 
wire        inst_jirl;   
wire        inst_b;      
wire        inst_bl;     
wire        inst_beq;    
wire        inst_bne;    
wire        inst_blt;
wire        inst_bge;
wire        inst_bltu;
wire        inst_bgeu;
wire        inst_lu12i_w;
wire        inst_pcaddu;
wire        inst_slti;
wire        inst_sltui;
wire        inst_andi;
wire        inst_ori;
wire        inst_xori;
wire        inst_mul_w;
wire        inst_mulh_w;
wire        inst_mulh_wu;
wire        inst_div_w;
wire        inst_mod_w;
wire        inst_div_wu;
wire        inst_mod_wu;
wire        branch_inst;
wire        inst_rdcntid_w;
wire        inst_rdcntvl_w;
wire        inst_rdcntvh_w;

wire        inst_csrrd;
wire        inst_csrwr;
wire        inst_csrxchg;
wire        inst_ertn;
wire        inst_syscall;
wire        inst_break;
wire        inst_non;

wire        inst_tlbsrch;
wire        inst_tlbrd;
wire        inst_tlbwr;
wire        inst_tlbfill;
wire        inst_invtlb;
wire [ 4:0] tlb_op;

wire        need_ui5;
wire        need_ui12;
wire        need_si12;
wire        need_si16;
wire        need_si20;
wire        need_si26;  
wire        src2_is_4;

wire [ 4:0] rf_raddr1;
wire [31:0] rf_rdata1;
wire [ 4:0] rf_raddr2;
wire [31:0] rf_rdata2;

wire        rj_eq_rd;
wire        rj_less_rd;
wire        rj_less_rd_u;
wire [32:0] rj_minus_rkd;

wire        es_block_op;
wire        es_valid;
wire [4:0]  es_dest;
wire [31:0] es_forward_data;

wire        ms_block_op;
wire        ms_valid;
wire [4:0]  ms_dest;
wire [31:0] ms_forward_data;

wire        ws_block_op;
wire        ws_valid;
wire [4:0]  ws_dest;
wire [31:0] ws_forward_data;


assign ds_ex_local  = {inst_syscall, inst_break, inst_non, has_int};
assign ds_ex_gather = {ds_ex_local, ds_ex_backward} & {10{ds_valid}};//位宽+5
assign ds_ertn      = inst_ertn & ds_valid;
assign ds_ertn_flush= ds_ertn;
assign ds_ex        = |ds_ex_gather | ds_ertn_flush;
assign br_bus       = {br_taken,br_target};

assign rdtimeh = inst_rdcntvh_w;
assign rdtimel = inst_rdcntvl_w;
assign ds_to_es_bus = {tlb_op      ,  //198:194
                       ds_ex_gather,  //193:184
                       ds_ertn     ,  //183:183
                       rdtimeh     ,  //182:182
                       rdtimel     ,  //181:181
                       csr_op      ,  //180:179
                       csr_rnum    ,  //178:165
                       mul_op      ,  //164:162
                       div_op      ,  //161:158
                       alu_op      ,  //157:146
                       load_op     ,  //145:145
                       load_sel    ,  //144:140
                       store_sel   ,  //139:137
                       src1_is_pc  ,  //136:136
                       src2_is_imm ,  //135:135
                       gr_we       ,  //134:134
                       mem_we      ,  //133:133
                       dest        ,  //132:128
                       ds_imm      ,  //127:96
                       rj_value    ,  //95 :64
                       rkd_value   ,  //63 :32
                       ds_pc          //31 :0
                      };
//TODO CHANGE WIDTH
assign {es_tlb_op,
        es_block_op,
        es_valid,
        es_dest,
        es_forward_data
        } = es_related_bus;

assign {ms_tlb_op,
        ms_block_op,
        ms_valid,
        ms_dest,
        ms_forward_data
        } = ms_related_bus;

assign {ws_tlb_op,
        ws_block_op,
        ws_valid
        } = ws_related_bus;

assign ws_dest          = rf_waddr;
assign ws_forward_data  = rf_wdata;

//r1 rj
//TODO invtlb rj rk
assign ds_r1_valid = |rf_raddr1 & 
                    (inst_add_w | inst_addi_w | inst_sub_w 
                    | inst_ld_w | inst_st_w | inst_ld_b | inst_ld_bu | inst_ld_h | inst_ld_hu | inst_st_b | inst_st_h
                    | inst_beq | inst_bne | inst_jirl | inst_blt | inst_bge | inst_bltu | inst_bgeu
                    | inst_slt | inst_sltu | inst_slti | inst_sltui 
                    | inst_slli_w | inst_srli_w | inst_srai_w | inst_sll_w | inst_sra_w | inst_srl_w
                    | inst_and | inst_nor | inst_or | inst_xor | inst_andi | inst_ori | inst_xori
                    | inst_mod_w | inst_mod_wu | inst_mul_w | inst_mulh_w | inst_mulh_wu | inst_div_w | inst_div_wu
                    | inst_csrxchg);

//r2 rkd
assign ds_r2_valid = |rf_raddr2 & 
                    (inst_add_w | inst_sub_w 
                    | inst_st_w | inst_st_b | inst_st_h
                    | inst_beq | inst_bne | inst_blt | inst_bge | inst_bltu | inst_bgeu
                    | inst_slt | inst_sltu | inst_sll_w | inst_sra_w | inst_srl_w
                    | inst_and | inst_nor | inst_or | inst_xor
                    | inst_mod_w | inst_mod_wu | inst_mul_w | inst_mulh_w | inst_mulh_wu | inst_div_w | inst_div_wu
                    | inst_csrwr | inst_csrxchg);

assign ds_ready_go  = ~((/*((inst_beq | inst_bne) & ds_valid) |*/ 
                        es_block_op) & es_valid & (ds_r1_valid & (rf_raddr1 == es_dest) | ds_r2_valid & (rf_raddr2 == es_dest))
                       | ms_block_op & ms_valid & (ds_r1_valid & (rf_raddr1 == ms_dest) | ds_r2_valid & (rf_raddr2 == ms_dest))
                       | ws_block_op & ws_valid & (ds_r1_valid & (rf_raddr1 == ws_dest) | ds_r2_valid & (rf_raddr2 == ws_dest))
                       | (ds_valid & ((es_valid & (es_tlb_op != 5'b0))))
                       | (ds_valid & ((ms_valid & (ms_tlb_op != 5'b0))) )
                       | (ds_valid & ((ws_valid & (ws_tlb_op != 5'b0))))
                       );
//TODO block or not? tlb inst                    
assign ds_allowin     = !ds_valid || ds_ready_go && es_allowin;
assign ds_to_es_valid = ds_valid && ds_ready_go && ~es_ex && ~ms_ex && ~ws_ex;

always @(posedge clk) begin
    if (reset) begin
        ds_valid <= 1'b0;
    end
    else if (es_ex | ms_ex | ws_ex)
        ds_valid <= 1'b0;
    else if (ds_allowin) begin
        ds_valid <= fs_to_ds_valid;
    end
end

always @(posedge clk) begin 
    if (fs_to_ds_valid && ds_allowin) begin
        fs_to_ds_bus_r <= fs_to_ds_bus;
    end
end

assign op_31_26  = ds_inst[31:26];
assign op_25_22  = ds_inst[25:22];
assign op_21_20  = ds_inst[21:20];
assign op_19_15  = ds_inst[19:15];

assign rd   = ds_inst[ 4: 0];
assign rj   = ds_inst[ 9: 5];
assign rk   = ds_inst[14:10];

assign i12  = ds_inst[21:10];
assign i20  = ds_inst[24: 5];
assign i16  = ds_inst[25:10];
assign i26  = {ds_inst[ 9: 0], ds_inst[25:10]};

decoder_6_64 u_dec0(.in(op_31_26 ), .out(op_31_26_d ));
decoder_4_16 u_dec1(.in(op_25_22 ), .out(op_25_22_d ));
decoder_2_4  u_dec2(.in(op_21_20 ), .out(op_21_20_d ));
decoder_5_32 u_dec3(.in(op_19_15 ), .out(op_19_15_d ));

assign inst_add_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h00];
assign inst_sub_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h02];
assign inst_slt    = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h04];
assign inst_sltu   = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h05];
assign inst_nor    = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h08];
assign inst_and    = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h09];
assign inst_or     = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0a];
assign inst_xor    = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0b];
assign inst_sll_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0e];
assign inst_sra_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h10];
assign inst_srl_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0f];
assign inst_slli_w = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h01];
assign inst_srli_w = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h09];
assign inst_srai_w = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h11];
assign inst_mul_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h18];
assign inst_mulh_w = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h19];
assign inst_mulh_wu= op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h1a];
assign inst_div_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h00];
assign inst_mod_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h01];
assign inst_div_wu = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h02];
assign inst_mod_wu = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h03];  
assign inst_addi_w = op_31_26_d[6'h00] & op_25_22_d[4'ha];
assign inst_andi   = op_31_26_d[6'h00] & op_25_22_d[4'hd];
assign inst_ori    = op_31_26_d[6'h00] & op_25_22_d[4'he];
assign inst_xori   = op_31_26_d[6'h00] & op_25_22_d[4'hf];
assign inst_slti   = op_31_26_d[6'h00] & op_25_22_d[4'h8];
assign inst_sltui  = op_31_26_d[6'h00] & op_25_22_d[4'h9];
assign inst_ld_w   = op_31_26_d[6'h0a] & op_25_22_d[4'h2];
assign inst_ld_b   = op_31_26_d[6'h0a] & op_25_22_d[4'h0];
assign inst_ld_h   = op_31_26_d[6'h0a] & op_25_22_d[4'h1];
assign inst_ld_bu  = op_31_26_d[6'h0a] & op_25_22_d[4'h8];
assign inst_ld_hu  = op_31_26_d[6'h0a] & op_25_22_d[4'h9];
assign inst_st_b   = op_31_26_d[6'h0a] & op_25_22_d[4'h4];
assign inst_st_h   = op_31_26_d[6'h0a] & op_25_22_d[4'h5];
assign inst_st_w   = op_31_26_d[6'h0a] & op_25_22_d[4'h6];
assign inst_jirl   = op_31_26_d[6'h13];
assign inst_b      = op_31_26_d[6'h14];
assign inst_bl     = op_31_26_d[6'h15];
assign inst_beq    = op_31_26_d[6'h16];
assign inst_bne    = op_31_26_d[6'h17];
assign inst_blt    = op_31_26_d[6'h18];
assign inst_bge    = op_31_26_d[6'h19];
assign inst_bltu   = op_31_26_d[6'h1a];
assign inst_bgeu   = op_31_26_d[6'h1b];
assign inst_lu12i_w= op_31_26_d[6'h05] & ~ds_inst[25];
assign inst_pcaddu = op_31_26_d[6'h07] & ~ds_inst[25];
assign inst_csrrd  = op_31_26_d[6'h01] && ~ds_inst[25] && ~ds_inst[24] && (rj == 5'h00);
assign inst_csrwr  = op_31_26_d[6'h01] && ~ds_inst[25] && ~ds_inst[24] && (rj == 5'h01);
assign inst_csrxchg= op_31_26_d[6'h01] & ~ds_inst[25] & ~ds_inst[24] & ~inst_csrrd & ~inst_csrwr;
assign inst_ertn   = op_31_26_d[6'h01] && op_25_22_d[4'h9] && op_21_20_d[2'h0] && op_19_15_d[5'h10] && (rk == 5'h0e) && (rj == 5'h00) && (rd == 5'h00);
assign inst_syscall= op_31_26_d[6'h0] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h16];
assign inst_break  = op_31_26_d[6'h0] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h14];
assign branch_inst = inst_beq | inst_bne | inst_bl | inst_b | inst_blt | inst_bge | inst_bltu | inst_bgeu;
assign inst_rdcntid_w=op_31_26_d[6'h0] & op_25_22_d[4'h0] & op_21_20_d[2'h0] & op_19_15_d[5'h0] & (rk == 5'h18) & (rd == 5'h0);
assign inst_rdcntvl_w=op_31_26_d[6'h0] & op_25_22_d[4'h0] & op_21_20_d[2'h0] & op_19_15_d[5'h0] & (rk == 5'h18) & (rj == 5'h0);
assign inst_rdcntvh_w=op_31_26_d[6'h0] & op_25_22_d[4'h0] & op_21_20_d[2'h0] & op_19_15_d[5'h0] & (rk == 5'h19) & (rj == 5'h0);
assign inst_non    = ~(|alu_op | |div_op | |mul_op | load_op | |store_sel | branch_inst |
                         inst_jirl | inst_csrrd | inst_csrwr | inst_csrxchg | inst_ertn | 
                         inst_syscall | inst_break | inst_rdcntid_w | inst_rdcntvh_w | inst_rdcntvl_w | 
                         inst_tlbfill | inst_tlbrd | inst_tlbsrch | inst_tlbwr | inst_invtlb);// | ilegal_invtlb;
assign inst_tlbsrch = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (rk==5'h0a) & (rj==5'h00) & (rd==5'h00);
assign inst_tlbrd   = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (rk==5'h0b) & (rj==5'h00) & (rd==5'h00);
assign inst_tlbwr   = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (rk==5'h0c) & (rj==5'h00) & (rd==5'h00);
assign inst_tlbfill = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (rk==5'h0d) & (rj==5'h00) & (rd==5'h00);
assign inst_invtlb  = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h13] & (ds_inst[4:0] < 5'h7);//rk,rj,op 

assign alu_op[ 0] = inst_add_w | inst_addi_w 
                    | inst_ld_w | inst_ld_b | inst_ld_bu | inst_ld_h | inst_ld_hu 
                    | inst_st_w | inst_st_b | inst_st_h
                    | inst_jirl | inst_bl | inst_pcaddu;
assign alu_op[ 1] = inst_sub_w;
assign alu_op[ 2] = inst_slt | inst_slti;
assign alu_op[ 3] = inst_sltu | inst_sltui;
assign alu_op[ 4] = inst_and | inst_andi;
assign alu_op[ 5] = inst_nor;
assign alu_op[ 6] = inst_or | inst_ori;
assign alu_op[ 7] = inst_xor| inst_xori;
assign alu_op[ 8] = inst_slli_w | inst_sll_w;
assign alu_op[ 9] = inst_srli_w | inst_srl_w;
assign alu_op[10] = inst_srai_w | inst_sra_w;
assign alu_op[11] = inst_lu12i_w;

assign div_op[ 0] = inst_div_w;
assign div_op[ 1] = inst_div_wu;
assign div_op[ 2] = inst_mod_w;
assign div_op[ 3] = inst_mod_wu;

assign mul_op[ 0] = inst_mul_w | inst_mulh_w | inst_mulh_wu;
assign mul_op[ 1] = inst_mulh_w; // sign
assign mul_op[ 2] = inst_mulh_w | inst_mulh_wu; // high or low
//TODO tlb_op
assign tlb_op     = ({5{inst_tlbsrch}} & 5'h01) |
                    ({5{inst_tlbrd  }} & 5'h02) |
                    ({5{inst_tlbwr  }} & 5'h04) |
                    ({5{inst_tlbfill}} & 5'h08) |
                    ({5{inst_invtlb }} & (5'h10 + {2'b0, ds_inst[2:0]}));

assign load_sel[0]  = inst_ld_b;
assign load_sel[1]  = inst_ld_bu;
assign load_sel[2]  = inst_ld_h;
assign load_sel[3]  = inst_ld_hu;
assign load_sel[4]  = inst_ld_w;
assign store_sel[0] = inst_st_b;
assign store_sel[1] = inst_st_h;
assign store_sel[2] = inst_st_w; 

assign load_op    = inst_ld_w | inst_ld_b | inst_ld_bu | inst_ld_h | inst_ld_hu;

assign csr_op       = {csr_we, csr_re};
assign csr_re       = inst_csrrd | inst_csrwr | inst_csrxchg | inst_rdcntid_w;
assign csr_we       = inst_csrwr | inst_csrxchg;
assign csr_rnum     = inst_rdcntid_w ? `CSR_TID : ds_inst[23:10];

assign need_ui5   =  inst_slli_w | inst_srli_w | inst_srai_w;
assign need_ui12  =  inst_andi | inst_ori | inst_xori;
assign need_si12  =  inst_addi_w | inst_slti | inst_sltui
                   | inst_ld_w | inst_ld_b | inst_ld_bu | inst_ld_h | inst_ld_hu
                   | inst_st_w | inst_st_b | inst_st_h;
assign need_si16  =  inst_jirl | inst_beq | inst_bne | inst_blt | inst_bge | inst_bltu | inst_bgeu;
assign need_si20  =  inst_lu12i_w | inst_pcaddu;
assign need_si26  =  inst_b | inst_bl;
assign src2_is_4  =  inst_jirl | inst_bl;


assign ds_imm = src2_is_4 ? 32'h4     :
        need_si20 ? {i20[19:0],12'b0} :
        need_ui12   ? {20'b0,i12[11:0]} :
  /*need_ui5 || need_si12*/ {{20{i12[11]}}, i12[11:0]} ;

assign br_offs = need_si26 ? {{ 4{i26[25]}}, i26[25:0], 2'b0} : 
                             {{14{i16[15]}}, i16[15:0], 2'b0} ;

assign jirl_offs = {{14{i16[15]}}, i16[15:0], 2'b0};

assign src_reg_is_rd = inst_beq | inst_bne | inst_st_w | inst_st_b | inst_st_h | inst_blt | inst_bge | inst_bltu | inst_bgeu | csr_we;

assign src1_is_pc    = inst_jirl | inst_bl | inst_pcaddu;

assign src2_is_imm   = inst_slli_w | 
                       inst_srli_w |
                       inst_srai_w |
                       inst_addi_w |
                       inst_slti   |
                       inst_sltui  |
                       inst_andi   |
                       inst_ori    |
                       inst_xori   |
                       inst_ld_w   |
                       inst_ld_b   |
                       inst_ld_bu  |
                       inst_ld_h   |
                       inst_ld_hu  |
                       inst_st_w   |
                       inst_st_b   |
                       inst_st_h   |
                       inst_lu12i_w|
                       inst_jirl   |
                       inst_bl     |
                       inst_pcaddu;

assign res_from_mem  = inst_ld_w | inst_ld_b | inst_ld_bu | inst_ld_h | inst_ld_hu;
assign dst_is_r1     = inst_bl;
assign gr_we         = ~inst_st_b & ~inst_st_h & ~inst_st_w & ~inst_beq & ~inst_bne 
                    & ~inst_b & ~inst_blt & ~inst_bge & ~inst_bltu & ~inst_bgeu 
                    & ~inst_syscall & ~inst_break & ~inst_ertn 
                    & ~inst_tlbfill & ~inst_tlbrd & ~inst_tlbsrch 
                    & ~inst_tlbwr & ~inst_invtlb;
assign mem_we        = inst_st_b | inst_st_h | inst_st_w;
assign dest          = dst_is_r1 ? 5'd1 : 
                       inst_rdcntid_w ? rj : rd;

assign rf_raddr1 = rj;
assign rf_raddr2 = src_reg_is_rd ? rd :rk;
regfile u_regfile(
    .clk    (clk      ),
    .raddr1 (rf_raddr1),
    .rdata1 (rf_rdata1),
    .raddr2 (rf_raddr2),
    .rdata2 (rf_rdata2),
    .we     (rf_we    ),
    .waddr  (rf_waddr ),
    .wdata  (rf_wdata )
    );

assign rj_value  = ~|rf_raddr1                       ?           32'd0 :
                   es_valid & (es_dest == rf_raddr1) ? es_forward_data :
                   ms_valid & (ms_dest == rf_raddr1) ? ms_forward_data :
                   ws_valid & (ws_dest == rf_raddr1) ? ws_forward_data :
                   inst_csrwr                        ?     32'hffffffff:
                                                              rf_rdata1;
assign rkd_value = ~|rf_raddr2                       ?           32'd0 :
                   es_valid & (es_dest == rf_raddr2) ? es_forward_data :
                   ms_valid & (ms_dest == rf_raddr2) ? ms_forward_data :
                   ws_valid & (ws_dest == rf_raddr2) ? ws_forward_data :
                                                              rf_rdata2;

assign rj_eq_rd = ~|rj_minus_rkd[31:0];
assign rj_less_rd = rj_value[31] & ~rkd_value[31] | (rj_value[31] ^ ~rkd_value[31]) & rj_minus_rkd[31];
assign rj_less_rd_u = ~rj_minus_rkd[32];
assign rj_minus_rkd = {1'b0, rj_value} + {1'b0, ~rkd_value} + 1;

assign br_taken = (   inst_beq  &&  rj_eq_rd
                   || inst_bne  && !rj_eq_rd
                   || inst_blt  &&  rj_less_rd
                   || inst_bge  && !rj_less_rd
                   || inst_bltu &&  rj_less_rd_u
                   || inst_bgeu && !rj_less_rd_u
                   || inst_jirl
                   || inst_bl
                   || inst_b
) && ds_valid && ds_ready_go; 
assign br_target = branch_inst ? (ds_pc + br_offs) : /*inst_jirl*/ (rj_value + jirl_offs);

endmodule
