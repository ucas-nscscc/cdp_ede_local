`include "mycpu.h"

module id_stage(
    input                          clk             ,
    input                          reset           ,
    //allowin
    input                          es_allowin      ,
    output                         ds_allowin      ,
    //from fs
    input                          fs_to_ds_valid  ,
    input  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus    ,
    //from es
    input  [`ES_FORWARD_BUS  -1:0] es_to_ds_forward,
    //from ms
    input  [`MS_FORWARD_BUS  -1:0] ms_to_ds_forward,     
    //from ws
    input  [`WS_FORWARD_BUS  -1:0] ws_to_ds_forward,
    //from ih
    input  [`IH_TO_DS_BUS_WD -1:0] ih_to_ds_bus    ,
    //to es
    output                         ds_to_es_valid  ,
    output [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus    ,
    //to fs
    output [`BR_BUS_WD       -1:0] br_bus          ,
    //to rf: for write back
    input  [`WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus
);

wire ds_ex_taken;
wire ds_has_int;
assign {ds_ex_taken, ds_has_int} = ih_to_ds_bus;

reg         ds_valid   ;
wire        ds_ready_go;

reg  [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus_r;

wire        ds_inst_pif;
wire        ds_inst_ppi;
wire        ds_inst_tlbr;
wire        ds_ex_adef;
wire [31:0] ds_inst;
wire [31:0] ds_pc  ;
assign {ds_inst_pif    ,
        ds_inst_ppi    ,
        ds_inst_tlbr   ,
        ds_ex_adef,
        ds_inst   ,
        ds_pc     } = fs_to_ds_bus_r;

wire        rf_we   ;
wire [ 4:0] rf_waddr;
wire [31:0] rf_wdata;
assign {rf_we   ,  //37:37
        rf_waddr,  //36:32
        rf_wdata   //31:0
       } = ws_to_rf_bus;

wire [31:0] br_src1;
wire [31:0] br_src2;
wire        br_taken;
wire [31:0] br_target;

wire        csr_flush;
wire        tlbsrch_conf;
wire [ 4:0] tlb_op;
wire [ 1:0] rdcnt_op;
wire        ds_ex_break;
wire        ds_ex_ine;
wire        ds_ex_syscall;
wire [13:0] csr_num;
wire [ 2:0] csr_op;
wire [ 2:0] st_op;
wire [ 4:0] ld_op;
wire [ 3:0] div_op;
wire [ 2:0] mul_op;
wire [11:0] alu_op;
wire        src1_is_pc;
wire        src2_is_imm;
wire        res_from_mem;
wire        dst_is_r0;
wire        dst_is_r1;
wire        dst_is_rj;
wire        gr_we;
wire        mem_we;
wire        src_reg_is_rd;
wire [4: 0] dest;
wire [31:0] rj_value;
wire [31:0] rkd_value;
wire [31:0] ds_imm;
wire [31:0] br_offs;
wire [31:0] jirl_offs;

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

wire        is_inst;
wire        inst_add_w;
wire        inst_sub_w;
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
wire        inst_lu12i_w;
wire        inst_slti;
wire        inst_sltui;
wire        inst_andi;
wire        inst_ori;
wire        inst_xori;
wire        inst_sll_w;
wire        inst_srl_w;
wire        inst_sra_w;
wire        inst_pcaddu12i;
wire        inst_mul_w;
wire        inst_mulh_w;
wire        inst_mulh_wu;
wire        inst_div_w;
wire        inst_mod_w;
wire        inst_div_wu;
wire        inst_mod_wu;

wire        inst_ld_b;
wire        inst_ld_h;
wire        inst_ld_w;
wire        inst_ld_bu;
wire        inst_ld_hu;

wire        inst_st_b;
wire        inst_st_h;
wire        inst_st_w;

wire        inst_jirl;
wire        inst_b;
wire        inst_bl;
wire        inst_beq;
wire        inst_bne;
wire        inst_blt;
wire        inst_bge;
wire        inst_bltu;
wire        inst_bgeu;

wire        inst_syscall;
wire        inst_break;
wire        inst_ertn;
wire        inst_csrrd;
wire        inst_csrwr;
wire        inst_csrxchg;

wire        inst_rdcntid_w;
wire        inst_rdcntvl_w;
wire        inst_rdcntvh_w;

wire        inst_tlbsrch;
wire        inst_tlbrd;
wire        inst_tlbwr;
wire        inst_tlbfill;
wire        inst_invtlb;

wire        need_ui5;
wire        need_ui12;
wire        need_si12;
wire        need_si16;
wire        need_si20;
// wire        need_si20_pcadd;
wire        need_si26;
wire        src2_is_4;

wire [ 4:0] rf_raddr1;
wire [31:0] rf_rdata1;
wire [ 4:0] rf_raddr2;
wire [31:0] rf_rdata2;

wire rj_eq_rd;
wire rj_lt_rd;
wire rj_ltu_rd;

wire data_correlation_block;
wire raddr1_correlation;
wire raddr2_correlation;
wire raddr1_required;
wire raddr2_required;

wire [4 :0] es_to_ds_dest    = es_to_ds_forward[4 :0]; 
wire [4 :0] ms_to_ds_dest    = ms_to_ds_forward[4 :0]; 
wire [4 :0] ws_to_ds_dest    = ws_to_ds_forward[4 :0]; 
wire [31:0] es_to_ds_data    = es_to_ds_forward[36:5];
wire [31:0] ms_to_ds_data    = ms_to_ds_forward[36:5];
wire [31:0] ws_to_ds_data    = ws_to_ds_forward[36:5];
wire        es_to_ds_block = es_to_ds_forward[37  ];
wire        ms_to_ds_block = ms_to_ds_forward[37  ];
wire        es_to_ds_ex    = es_to_ds_forward[38];
wire        ms_to_ds_ex    = ms_to_ds_forward[38];

wire raddr2_es_correlation;
wire raddr2_ms_correlation;
wire raddr2_ws_correlation;
wire raddr1_es_correlation;
wire raddr1_ms_correlation;
wire raddr1_ws_correlation;

assign br_bus = {br_taken, br_target};

assign ds_to_es_bus = {ds_inst_pif       ,  //199
                       ds_inst_ppi       ,  //198
                       ds_inst_tlbr      ,  //197
                       csr_flush    ,  //196
                       tlbsrch_conf ,  //195
                       tlb_op       ,  //194:190
                       rdcnt_op     ,  //189:188
                       ds_has_int   ,  //187
                       ds_ex_break  ,  //186
                       ds_ex_ine    ,  //185
                       ds_ex_adef   ,  //184
                       ds_ex_syscall,  //183
                       csr_num      ,  //182:169
                       csr_op       ,  //168:166
                       inst_ertn    ,  //165
                       st_op        ,  //164:162
                       ld_op        ,  //161:157
                       div_op       ,  //156:153
                       mul_op       ,  //152:150
                       alu_op       ,  //149:138
                       res_from_mem ,  //137:137
                       src1_is_pc   ,  //136:136
                       src2_is_imm  ,  //135:135
                       gr_we        ,  //134:134
                       mem_we       ,  //133:133
                       dest         ,  //132:128
                       ds_imm       ,  //127:96
                       rj_value     ,  //95 :64
                       rkd_value    ,  //63 :32
                       ds_pc           //31 :0
                      };

assign ds_ready_go    = ~data_correlation_block;
assign ds_allowin     = !ds_valid || ds_ready_go && es_allowin;
assign ds_to_es_valid = ds_valid && ds_ready_go;
always @(posedge clk) begin
    if (reset || ds_ex_taken) begin
        ds_valid <= 1'b0;
    end
    else if (br_taken && es_allowin) begin
        ds_valid <= 1'b0;
    end
    else if (ds_allowin) begin
        ds_valid <= fs_to_ds_valid;
    end

    // if (reset) begin
    //     fs_to_ds_bus_r <= `FS_TO_DS_BUS_WD'b0;
    // end else 
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
assign inst_srl_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0f];
assign inst_sra_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h10];
assign inst_mul_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h18];
assign inst_mulh_w = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h19];
assign inst_mulh_wu= op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h1a];
assign inst_div_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h00];
assign inst_mod_w  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h01];
assign inst_div_wu = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h02];
assign inst_mod_wu = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h03];


assign inst_slli_w = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h01];
assign inst_srli_w = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h09];
assign inst_srai_w = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h11];

assign inst_addi_w   = op_31_26_d[6'h00] & op_25_22_d[4'ha];
assign inst_ld_b     = op_31_26_d[6'h0a] & op_25_22_d[4'h0];
assign inst_ld_h     = op_31_26_d[6'h0a] & op_25_22_d[4'h1];
assign inst_ld_w     = op_31_26_d[6'h0a] & op_25_22_d[4'h2];
assign inst_ld_bu    = op_31_26_d[6'h0a] & op_25_22_d[4'h8];
assign inst_ld_hu    = op_31_26_d[6'h0a] & op_25_22_d[4'h9];
assign inst_st_b     = op_31_26_d[6'h0a] & op_25_22_d[4'h4];
assign inst_st_h     = op_31_26_d[6'h0a] & op_25_22_d[4'h5];
assign inst_st_w     = op_31_26_d[6'h0a] & op_25_22_d[4'h6];

assign inst_jirl     = op_31_26_d[6'h13];
assign inst_b        = op_31_26_d[6'h14];
assign inst_bl       = op_31_26_d[6'h15];
assign inst_beq      = op_31_26_d[6'h16];
assign inst_bne      = op_31_26_d[6'h17];
assign inst_blt      = op_31_26_d[6'h18];
assign inst_bge      = op_31_26_d[6'h19];
assign inst_bltu     = op_31_26_d[6'h1a];
assign inst_bgeu     = op_31_26_d[6'h1b];
assign inst_lu12i_w  = op_31_26_d[6'h05] & ~ds_inst[25];
assign inst_pcaddu12i= op_31_26_d[6'h07] & ~ds_inst[25];
assign inst_slti     = op_31_26_d[6'h00] & op_25_22_d[4'h8];
assign inst_sltui    = op_31_26_d[6'h00] & op_25_22_d[4'h9];
assign inst_andi     = op_31_26_d[6'h00] & op_25_22_d[4'hd];
assign inst_ori      = op_31_26_d[6'h00] & op_25_22_d[4'he];
assign inst_xori     = op_31_26_d[6'h00] & op_25_22_d[4'hf];

assign inst_break    = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h14];
assign inst_syscall  = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h2] & op_19_15_d[5'h16];
assign inst_ertn     = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (~rk[4] & rk[3] & rk[2] & rk[1] & ~rk[0]); // rk == 5'h0e
assign inst_csrrd    = op_31_26_d[6'h01] & ~(|ds_inst[25:24]) & ~(|rj); // rk == 5'h00
assign inst_csrwr    = op_31_26_d[6'h01] & ~(|ds_inst[25:24]) & ~(|rj[4:1]) & rj[0]; // rj == 5'h01
assign inst_csrxchg  = op_31_26_d[6'h01] & ~(|ds_inst[25:24]) & ((|rj[4:1]) | ~rj[0]) & (|rj); // rj != 5'h00 & rj != 5'h01

assign inst_rdcntid_w = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h0] & op_19_15_d[5'h00] & (rk[4] & rk[3] & ~rk[2] & ~rk[1] & ~rk[0]) & ~(|rd); // (rk == 5'h18) & (rd == 5'h00);
assign inst_rdcntvl_w = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h0] & op_19_15_d[5'h00] & (rk[4] & rk[3] & ~rk[2] & ~rk[1] & ~rk[0]) & ~(|rj); // (rk == 5'h18) & (rj == 5'h00);
assign inst_rdcntvh_w = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h0] & op_19_15_d[5'h00] & (rk[4] & rk[3] & ~rk[2] & ~rk[1] &  rk[0]) & ~(|rj); // (rk == 5'h19) & (rj == 5'h00);

assign inst_tlbsrch = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (~rk[4] & rk[3] & ~rk[2] &  rk[1] & ~rk[0]) & ~(|rj) & ~(|rd);
assign inst_tlbrd   = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (~rk[4] & rk[3] & ~rk[2] &  rk[1] &  rk[0]) & ~(|rj) & ~(|rd);
assign inst_tlbwr   = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (~rk[4] & rk[3] &  rk[2] & ~rk[1] & ~rk[0]) & ~(|rj) & ~(|rd);
assign inst_tlbfill = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h10] & (~rk[4] & rk[3] &  rk[2] & ~rk[1] &  rk[0]) & ~(|rj) & ~(|rd);

assign inst_invtlb = op_31_26_d[6'h01] & op_25_22_d[4'h9] & op_21_20_d[2'h0] & op_19_15_d[5'h13];

assign is_inst = inst_add_w     |
                 inst_sub_w     |
                 inst_slt       |
                 inst_sltu      |
                 inst_nor       |
                 inst_and       |
                 inst_or        |
                 inst_xor       |
                 inst_slli_w    |
                 inst_srli_w    |
                 inst_srai_w    |
                 inst_addi_w    |
                 inst_lu12i_w   |
                 inst_slti      |
                 inst_sltui     |
                 inst_andi      |
                 inst_ori       |
                 inst_xori      |
                 inst_sll_w     |
                 inst_srl_w     |
                 inst_sra_w     |
                 inst_pcaddu12i |
                 inst_mul_w     |
                 inst_mulh_w    |
                 inst_mulh_wu   |
                 inst_div_w     |
                 inst_mod_w     |
                 inst_div_wu    |
                 inst_mod_wu    |
                 inst_ld_b      |
                 inst_ld_h      |
                 inst_ld_w      |
                 inst_ld_bu     |
                 inst_ld_hu     |
                 inst_st_b      |
                 inst_st_h      |
                 inst_st_w      |
                 inst_jirl      |
                 inst_b         |
                 inst_bl        |
                 inst_beq       |
                 inst_bne       |
                 inst_blt       |
                 inst_bge       |
                 inst_bltu      |
                 inst_bgeu      |
                 inst_syscall   |
                 inst_break     |
                 inst_ertn      |
                 inst_csrrd     |
                 inst_csrwr     |
                 inst_csrxchg   |
                 inst_rdcntid_w |
                 inst_rdcntvl_w |
                 inst_rdcntvh_w |
                 inst_tlbsrch   |
                 inst_tlbrd     |
                 inst_tlbwr     |
                 inst_tlbfill   |
                 inst_invtlb    ;

assign csr_flush = (csr_op[1] || csr_op[2]) && (csr_num == `CSR_CRMD || 
                                                csr_num == `CSR_DMW0 || 
                                                csr_num == `CSR_DMW1 || 
                                                csr_num == `CSR_ASID);
assign tlbsrch_conf = (csr_op[1] || csr_op[2]) && (csr_num == 14'h0011 || csr_num == 14'h0018);
assign tlb_op[0] = inst_tlbsrch;
assign tlb_op[1] = inst_tlbrd  ;
assign tlb_op[2] = inst_tlbwr  ;
assign tlb_op[3] = inst_tlbfill;
assign tlb_op[4] = inst_invtlb ;

assign rdcnt_op[0] = inst_rdcntvl_w;
assign rdcnt_op[1] = inst_rdcntvh_w;

assign ds_ex_ine     = ~is_inst;
assign ds_ex_break   = inst_break;
assign ds_ex_syscall = inst_syscall;

assign csr_num   = (inst_rdcntid_w) ? `CSR_TID : ds_inst[23:10];
assign csr_op[0] = inst_csrrd | inst_rdcntid_w;
assign csr_op[1] = inst_csrwr;
assign csr_op[2] = inst_csrxchg;

assign st_op[0] = inst_st_b;
assign st_op[1] = inst_st_h;
assign st_op[2] = inst_st_w;

assign ld_op[0] = inst_ld_b;
assign ld_op[1] = inst_ld_h;
assign ld_op[2] = inst_ld_w;
assign ld_op[3] = inst_ld_bu;
assign ld_op[4] = inst_ld_hu;

assign mul_op[0] = inst_mul_w;
assign mul_op[1] = inst_mulh_w;
assign mul_op[2] = inst_mulh_wu;

assign div_op[0] = inst_div_w;
assign div_op[1] = inst_mod_w;
assign div_op[2] = inst_div_wu;
assign div_op[3] = inst_mod_wu;

assign alu_op[ 0] = inst_add_w    |
                    inst_addi_w   |
                    inst_ld_b     | 
                    inst_ld_h     | 
                    inst_ld_w     | 
                    inst_ld_bu    | 
                    inst_ld_hu    | 
                    inst_st_b     | 
                    inst_st_h     | 
                    inst_st_w     | 
                    inst_jirl     | 
                    inst_bl       | 
                    inst_pcaddu12i;
assign alu_op[ 1] = inst_sub_w;
assign alu_op[ 2] = inst_slt | inst_slti;
assign alu_op[ 3] = inst_sltu | inst_sltui;
assign alu_op[ 4] = inst_and | inst_andi;
assign alu_op[ 5] = inst_nor;
assign alu_op[ 6] = inst_or | inst_ori;
assign alu_op[ 7] = inst_xor | inst_xori;
assign alu_op[ 8] = inst_slli_w | inst_sll_w;
assign alu_op[ 9] = inst_srli_w | inst_srl_w;
assign alu_op[10] = inst_srai_w | inst_sra_w;
assign alu_op[11] = inst_lu12i_w;

assign need_ui5   =  inst_slli_w | inst_srli_w | inst_srai_w;
assign need_ui12  =  inst_andi | inst_ori | inst_xori;
assign need_si12  =  inst_addi_w |
                     inst_ld_b   |
                     inst_ld_h   |
                     inst_ld_w   | 
                     inst_ld_bu  |
                     inst_ld_hu  |
                     inst_st_b   | 
                     inst_st_h   | 
                     inst_st_w   | 
                     inst_slti   | 
                     inst_sltui  ;
assign need_si16  =  inst_jirl | 
                     inst_beq  | 
                     inst_bne  | 
                     inst_blt  | 
                     inst_bge  | 
                     inst_bltu | 
                     inst_bgeu ;
assign need_si20  =  inst_lu12i_w | inst_pcaddu12i;
assign need_si26  =  inst_b | inst_bl;
assign src2_is_4  =  inst_jirl | inst_bl;


assign ds_imm = src2_is_4 ? 32'h4                      :
		        // need_si20 ? {12'b0,i20[4:0],i20[19:5]} :  //i20[16:5]==i12[11:0]
                need_si20 ? {i20, 12'b0} : 
                need_si12 ? {{20{i12[11]}}, i12[11:0]} :
                {20'd0, i12[11:0]}                     ;

assign br_offs = need_si26 ? {{ 4{i26[25]}}, i26[25:0], 2'b0} :
                             {{14{i16[15]}}, i16[15:0], 2'b0} ;

assign jirl_offs = {{14{i16[15]}}, i16[15:0], 2'b0};

assign src_reg_is_rd = inst_beq    | 
                       inst_bne    |
                       inst_blt    | 
                       inst_bge    | 
                       inst_bltu   | 
                       inst_bgeu   |   
                       inst_st_b   |
                       inst_st_h   |
                       inst_st_w   |
                       inst_csrwr  |
                       inst_csrxchg;

assign src1_is_pc    = inst_jirl | inst_bl | inst_pcaddu12i;

assign src2_is_imm   = inst_slli_w   |
                       inst_srli_w   |
                       inst_srai_w   |
                       inst_addi_w   |
                       inst_ld_b     |
                       inst_ld_h     |
                       inst_ld_w     |
                       inst_ld_bu    |
                       inst_ld_hu    |
                       inst_st_b     |
                       inst_st_h     |
                       inst_st_w     |
                       inst_lu12i_w  |
                       inst_jirl     |
                       inst_bl       |
                       inst_slti     |
                       inst_sltui    |
                       inst_andi     |
                       inst_ori      |
                       inst_xori     |
                       inst_pcaddu12i;


assign res_from_mem  = inst_ld_b |
                       inst_ld_h |
                       inst_ld_w |
                       inst_ld_bu|
                       inst_ld_hu;
assign dst_is_r0     = src_reg_is_rd & ~(|csr_op);
assign dst_is_r1     = inst_bl;
assign dst_is_rj     = inst_rdcntid_w;
assign gr_we         = ~inst_st_b    &
                       ~inst_st_h    &
                       ~inst_st_w    &
                       ~inst_beq     &
                       ~inst_bne     & 
                       ~inst_blt     & 
                       ~inst_bge     & 
                       ~inst_bltu    & 
                       ~inst_bgeu    &
                       ~inst_b       &
                       ~inst_tlbsrch & 
                       ~inst_tlbrd   &
                       ~inst_tlbwr   &
                       ~inst_tlbfill &
                       ~inst_invtlb  ;
assign mem_we        = inst_st_b | inst_st_h | inst_st_w;
assign dest          = dst_is_r0 ? 5'b0 :
                       dst_is_r1 ? 5'b1 :
                       dst_is_rj ? rj   :
                                   rd;

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


assign rj_value  = (raddr1_es_correlation & ~es_to_ds_block) ? es_to_ds_data :
                   (raddr1_ms_correlation & ~ms_to_ds_block) ? ms_to_ds_data :
                    raddr1_ws_correlation ? ws_to_ds_data :
                                            rf_rdata1     ;
assign rkd_value = (raddr2_es_correlation & ~es_to_ds_block) ? es_to_ds_data :
                   (raddr2_ms_correlation & ~ms_to_ds_block) ? ms_to_ds_data :
                    raddr2_ws_correlation ? ws_to_ds_data :
                                            rf_rdata2     ;

assign br_src1 = raddr1_ms_correlation ? ms_to_ds_data :
                 raddr1_ws_correlation ? ws_to_ds_data :
                                         rf_rdata1     ;
assign br_src2 = raddr2_ms_correlation ? ms_to_ds_data :
                 raddr2_ws_correlation ? ws_to_ds_data :
                                         rf_rdata2     ;

br_judge u_br_judge(
    .br_src1  (br_src1  ),
    .br_src2  (br_src2  ),

    .rj_eq_rd (rj_eq_rd ),
    .rj_lt_rd (rj_lt_rd ),
    .rj_ltu_rd(rj_ltu_rd)
);

// assign data_correlation_block = (raddr2_es_correlation | raddr1_es_correlation) & es_to_ds_block |
//                                 (raddr2_ms_correlation | raddr1_ms_correlation) & ms_to_ds_block;
assign data_correlation_block = (raddr2_es_correlation | raddr1_es_correlation) & (es_to_ds_block | (inst_jirl   |
                                                                                                     inst_beq    |
                                                                                                     inst_bne    |
                                                                                                     inst_blt    |
                                                                                                     inst_bge    |
                                                                                                     inst_bltu   |
                                                                                                     inst_bgeu)) |
                                (raddr2_ms_correlation | raddr1_ms_correlation) & ms_to_ds_block;

assign raddr2_es_correlation = (|rf_raddr2) & ~(|(rf_raddr2 ^ es_to_ds_dest));
assign raddr2_ms_correlation = (|rf_raddr2) & ~(|(rf_raddr2 ^ ms_to_ds_dest));
assign raddr2_ws_correlation = (|rf_raddr2) & ~(|(rf_raddr2 ^ ws_to_ds_dest));
assign raddr1_es_correlation = (|rf_raddr1) & ~(|(rf_raddr1 ^ es_to_ds_dest));
assign raddr1_ms_correlation = (|rf_raddr1) & ~(|(rf_raddr1 ^ ms_to_ds_dest));
assign raddr1_ws_correlation = (|rf_raddr1) & ~(|(rf_raddr1 ^ ws_to_ds_dest));

//找规律还是罗列？？？
assign raddr2_required = raddr1_required &
                         ~inst_ld_b      &
                         ~inst_ld_h      &
                         ~inst_ld_w      & 
                         ~inst_ld_bu     &
                         ~inst_ld_hu     &
                         ~inst_jirl      &
                         ~inst_addi_w    &
                         ~inst_slli_w    &
                         ~inst_srli_w    &
                         ~inst_srai_w    & 
                         ~inst_slti      &
                         ~inst_sltui     &
                         ~inst_andi      &
                         ~inst_ori       &
                         ~inst_xori      ;
assign raddr1_required = ~inst_b        &
                         ~inst_bl       &
                         ~inst_lu12i_w  &
                         ~inst_pcaddu12i&
                         ~inst_csrrd    &
                         ~inst_csrwr    &
                         ~inst_rdcntid_w&
                         ~inst_rdcntvl_w&
                         ~inst_rdcntvh_w&
                         ~inst_tlbsrch  &
                         ~inst_tlbrd    &
                         ~inst_tlbwr    &
                         ~inst_tlbfill  ;

assign br_taken = (   inst_beq  &&  rj_eq_rd
                   || inst_bne  && !rj_eq_rd
                   || inst_blt  &&  rj_lt_rd
                   || inst_bge  && !rj_lt_rd
                   || inst_bltu &&  rj_ltu_rd
                   || inst_bgeu && !rj_ltu_rd
                   || inst_jirl
                   || inst_bl
                   || inst_b
                  ) && ds_valid               && 
                      ~data_correlation_block && 
                      ~es_to_ds_ex            && 
                      ~ms_to_ds_ex            &&
                      ~ds_ex_taken            ;
assign br_target = (inst_beq || 
                    inst_bne || 
                    inst_blt || 
                    inst_bge ||
                    inst_bltu||
                    inst_bgeu||
                    inst_bl  || 
                    inst_b   ) ? (ds_pc + br_offs) :
                                                   /*inst_jirl*/ (br_src1 + jirl_offs);

endmodule

module br_judge(
    input [31:0] br_src1,
    input [31:0] br_src2,
    
    output rj_eq_rd,
    output rj_lt_rd,
    output rj_ltu_rd
);

wire [31:0] br_result;
wire        br_cin;
wire        br_cout;

assign br_cin = 1'b1;
assign {br_cout, br_result} = {1'b0, br_src1} + {1'b0, ~br_src2} + br_cin;

assign rj_eq_rd = ~(|br_result);
assign rj_lt_rd = (br_src1[31] & ~br_src2[31])
                | ((br_src1[31] ~^ br_src2[31]) & br_result[31]);
assign rj_ltu_rd = ~br_cout;

endmodule