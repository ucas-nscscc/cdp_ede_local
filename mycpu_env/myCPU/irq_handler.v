`include "mycpu.h"

module irq_handler (
    // input         csr_re,
    // input  [13:0] csr_num,
    // input         csr_we,
    // input  [31:0] csr_wmask,
    // input  [31:0] csr_wvalue,
    // output [31:0] csr_rvalue,
    input clock,
    input reset,
    input  [`WS_TO_IH_BUS_WD  - 1:0] ws_to_ih_bus,
    input  [`MMU_TO_IH_BUS_WD - 1:0] mmu_to_ih_bus,
    
    output [`IH_TO_FS_BUS_WD  - 1:0] ih_to_fs_bus,
    output [`IH_TO_DS_BUS_WD  - 1:0] ih_to_ds_bus,
    output [`IH_TO_ES_BUS_WD  - 1:0] ih_to_es_bus,
    output [`IH_TO_MS_BUS_WD  - 1:0] ih_to_ms_bus,
    output [`IH_TO_WS_BUS_WD  - 1:0] ih_to_ws_bus,
    output [`IH_TO_MMU_BUS_WD - 1:0] ih_to_mmu_bus
);

wire        csr_re;
wire [13:0] csr_num;
wire        csr_we;
wire [31:0] csr_wmask;
wire [31:0] csr_wvalue;
wire [31:0] csr_rvalue;

wire        ws_inst_ppi;
wire        ws_inst_tlbr;
wire        ws_tlb_flush;
wire [31:0] ex_entry;
wire [31:0] ex_pc;
wire        has_int;
wire        ertn_flush;
wire        ws_ex;
wire [ 5:0] ws_ecode;
wire [ 8:0] ws_esubcode;
wire [31:0] ws_pc;
wire [31:0] ws_vaddr;

wire        ws_ex_addr_err;
wire        ws_tlb_addr_err;

wire [31:0] csr_crmd;
reg  [ 1:0] csr_crmd_plv;
reg         csr_crmd_ie;
reg         csr_crmd_da;
reg         csr_crmd_pg;
reg  [ 1:0] csr_crmd_datf;
reg  [ 1:0] csr_crmd_datm;

wire [31:0] csr_prmd;
reg  [ 1:0] csr_prmd_pplv;
reg         csr_prmd_pie;

wire [31:0] csr_ecfg;
reg  [12:0] csr_ecfg_lie;

wire [31:0] csr_estat;
reg  [12:0] csr_estat_is;
reg  [ 5:0] csr_estat_ecode;
reg  [ 8:0] csr_estat_esubcode;

wire [31:0] csr_era;
reg  [31:0] csr_era_pc;

wire [31:0] csr_badv;
reg  [31:0] csr_badv_vaddr;

wire [31:0] csr_eentry;
reg  [25:0] csr_eentry_va;

reg [31:0] csr_save0_data;
reg [31:0] csr_save1_data;
reg [31:0] csr_save2_data;
reg [31:0] csr_save3_data;

wire [31:0] csr_tid;
reg  [31:0] csr_tid_tid;

wire [31:0] csr_tcfg;
reg         csr_tcfg_en;
reg         csr_tcfg_periodic;
reg  [29:0] csr_tcfg_initval;
wire [31:0] tcfg_next_value;

wire [31:0] csr_tval;
reg [31:0] timer_cnt;

wire [31:0] csr_ticlr;
wire        csr_ticlr_clr = 1'b0;

wire [31:0] csr_asid;
reg  [ 9:0] csr_asid_asid;
wire [ 7:0] csr_asid_asidbits = 8'd10;

wire [31:0] csr_tlbehi;
reg  [18:0] csr_tlbehi_vppn;

wire [31:0] csr_tlbelo0;
reg         csr_tlbelo0_v;
reg         csr_tlbelo0_d;
reg  [ 1:0] csr_tlbelo0_plv;
reg  [ 1:0] csr_tlbelo0_mat;
reg         csr_tlbelo0_g;
reg  [23:0] csr_tlbelo0_ppn;

wire [31:0] csr_tlbelo1;
reg         csr_tlbelo1_v;
reg         csr_tlbelo1_d;
reg  [ 1:0] csr_tlbelo1_plv;
reg  [ 1:0] csr_tlbelo1_mat;
reg         csr_tlbelo1_g;
reg  [23:0] csr_tlbelo1_ppn;

wire [31:0] csr_tlbidx;
reg  [ 3:0] csr_tlbidx_index;
reg  [ 5:0] csr_tlbidx_ps;
reg         csr_tlbidx_ne;

wire [31:0] csr_tlbrentry;
reg  [25:0] csr_tlbrentry_pa;

wire [31:0] csr_dmw0;
reg         csr_dmw0_plv0;
reg         csr_dmw0_plv3;
reg  [ 1:0] csr_dmw0_mat;
reg  [ 2:0] csr_dmw0_pseg;
reg  [ 2:0] csr_dmw0_vseg;

wire [31:0] csr_dmw1;
reg         csr_dmw1_plv0;
reg         csr_dmw1_plv3;
reg  [ 1:0] csr_dmw1_mat;
reg  [ 2:0] csr_dmw1_pseg;
reg  [ 2:0] csr_dmw1_vseg;

wire s1_found;
wire r_e;
wire inst_tlbsrch;
wire inst_tlbrd;
wire inst_tlbwr;
wire inst_tlbfill;
wire [ 9:0] w_asid_asid;
wire [18:0] w_tlbehi_vppn;
wire [ 3:0] w_tlbidx_index;
wire [ 5:0] w_tlbidx_ps;
wire        w_tlbidx_ne;
wire        w_tlbelo0_v;
wire        w_tlbelo0_d;
wire [ 1:0] w_tlbelo0_plv;
wire [ 1:0] w_tlbelo0_mat;
wire        w_tlbelo0_g;
wire [23:0] w_tlbelo0_ppn;
wire        w_tlbelo1_v;
wire        w_tlbelo1_d;
wire [ 1:0] w_tlbelo1_plv;
wire [ 1:0] w_tlbelo1_mat;
wire        w_tlbelo1_g;
wire [23:0] w_tlbelo1_ppn;

assign {
    s1_found      ,
    r_e           ,
    inst_tlbsrch  ,
    inst_tlbrd    ,
    inst_tlbwr    ,
    inst_tlbfill  ,
    w_asid_asid   ,
    w_tlbehi_vppn ,
    w_tlbidx_index,
    w_tlbidx_ps   ,
    w_tlbidx_ne   ,
    w_tlbelo0_v   ,
    w_tlbelo0_d   ,
    w_tlbelo0_plv ,
    w_tlbelo0_mat ,
    w_tlbelo0_g   ,
    w_tlbelo0_ppn ,
    w_tlbelo1_v   ,
    w_tlbelo1_d   ,
    w_tlbelo1_plv ,
    w_tlbelo1_mat ,
    w_tlbelo1_g   ,
    w_tlbelo1_ppn
} = mmu_to_ih_bus;

assign {ws_inst_ppi ,
        ws_inst_tlbr,
        ws_tlb_flush,
        csr_re      ,
        csr_num     ,
        csr_we      ,
        csr_wmask   ,
        csr_wvalue  ,
        ertn_flush  ,
        ws_ex       ,
        ws_ecode    ,
        ws_esubcode ,
        ws_pc       ,
        ws_vaddr    } = ws_to_ih_bus;
assign ih_to_fs_bus = {ws_ex | ertn_flush | ws_tlb_flush, ex_pc};
assign ex_pc = {32{  ertn_flush}} & csr_era                       |
               {32{ws_ex & ~(ws_ecode == 6'h3f)}} & csr_eentry    |
               {32{ws_ex &  (ws_ecode == 6'h3f)}} & csr_tlbrentry |
               {32{ws_tlb_flush}} & (ws_pc + 4'h4);
assign ih_to_ds_bus = {ws_ex | ertn_flush | ws_tlb_flush, has_int};
assign ih_to_es_bus = ws_ex | ertn_flush | ws_tlb_flush;
assign ih_to_ms_bus = ws_ex | ertn_flush | ws_tlb_flush;
assign ih_to_ws_bus = {csr_rvalue};
assign ih_to_mmu_bus = {csr_dmw1_plv0,
                        csr_dmw1_plv3,
                        csr_dmw1_mat,
                        csr_dmw1_vseg,
                        csr_dmw1_pseg,
                        csr_dmw0_plv0,
                        csr_dmw0_plv3,
                        csr_dmw0_mat,
                        csr_dmw0_vseg,
                        csr_dmw0_pseg,
                        csr_crmd_plv,
                        csr_crmd_da,
                        csr_crmd_pg,
                        csr_estat_ecode,
                        csr_asid_asid,   
                        csr_tlbehi_vppn, 
                        csr_tlbidx_index,
                        csr_tlbidx_ps,   
                        csr_tlbidx_ne,   
                        csr_tlbelo0_v,   
                        csr_tlbelo0_d,   
                        csr_tlbelo0_plv, 
                        csr_tlbelo0_mat, 
                        csr_tlbelo0_g,   
                        csr_tlbelo0_ppn, 
                        csr_tlbelo1_v,   
                        csr_tlbelo1_d,   
                        csr_tlbelo1_plv, 
                        csr_tlbelo1_mat, 
                        csr_tlbelo1_g,   
                        csr_tlbelo1_ppn  
                        };

always @(posedge clock) begin
    if (csr_we && csr_num == `CSR_ASID) begin 
        csr_asid_asid <= csr_wmask[`CSR_ASID_ASID] & csr_wvalue[`CSR_ASID_ASID] |
                        ~csr_wmask[`CSR_ASID_ASID] & csr_asid_asid;
    end else if (inst_tlbrd & r_e) begin
        csr_asid_asid <= w_asid_asid;
    end
end

always @(posedge clock) begin
    if (csr_we && csr_num == `CSR_TLBIDX) begin
        csr_tlbidx_ps <= csr_wmask[`CSR_TLBIDX_PS] & csr_wvalue[`CSR_TLBIDX_PS]
                      | ~csr_wmask[`CSR_TLBIDX_PS] & csr_tlbidx_ps;
    end else if (inst_tlbrd & r_e) begin
        csr_tlbidx_ps <= w_tlbidx_ps;
    end
end

always @(posedge clock) begin
    if (csr_we && csr_num == `CSR_TLBIDX) begin
        csr_tlbidx_index <= csr_wmask[`CSR_TLBIDX_INDEX] & csr_wvalue[`CSR_TLBIDX_INDEX]
                         | ~csr_wmask[`CSR_TLBIDX_INDEX] & csr_tlbidx_index;
    end else if (inst_tlbsrch & s1_found) begin
        csr_tlbidx_index <= w_tlbidx_index;
    end
end

always @(posedge clock) begin
    if (csr_we && csr_num == `CSR_TLBIDX) begin
        csr_tlbidx_ne <= csr_wmask[`CSR_TLBIDX_NE] & csr_wvalue[`CSR_TLBIDX_NE]
                      | ~csr_wmask[`CSR_TLBIDX_NE] & csr_tlbidx_ne;
    end else if (inst_tlbsrch || inst_tlbrd) begin
        csr_tlbidx_ne <= w_tlbidx_ne;
    end
end

assign ws_tlb_addr_err = ws_ecode == `ECODE_PIL ||
                         ws_ecode == `ECODE_PIS ||
                         ws_ecode == `ECODE_PIF ||
                         ws_ecode == `ECODE_PME ||
                         ws_ecode == `ECODE_PPI ||
                         ws_ecode == `ECODE_TLBR;
always @(posedge clock) begin
    if (ws_ex && ws_tlb_addr_err) begin
        csr_tlbehi_vppn <= (ws_ecode == `ECODE_PIF                                  ||
                            ws_ecode == `ECODE_PPI && ws_inst_ppi                   ||
                            ws_ecode == `ECODE_TLBR&& ws_inst_tlbr                  ) ? 
                            ws_pc[31:13] : ws_vaddr[31:13];
    end else if (csr_we && csr_num == `CSR_TLBEHI) begin
        csr_tlbehi_vppn <= csr_wmask[`CSR_TLBEHI_VPPN] & csr_wvalue[`CSR_TLBEHI_VPPN]
                        | ~csr_wmask[`CSR_TLBEHI_VPPN] & csr_tlbehi_vppn;
    end else if (inst_tlbrd & r_e) begin
        csr_tlbehi_vppn <= w_tlbehi_vppn;
    end
end

always @(posedge clock) begin
    if (reset) begin

    end else if (csr_we && csr_num == `CSR_TLBELO0) begin
        csr_tlbelo0_v <= csr_wmask[`CSR_TLBELO0_V] & csr_wvalue[`CSR_TLBELO0_V] |
                        ~csr_wmask[`CSR_TLBELO0_V] & csr_tlbelo0_v;
        csr_tlbelo0_d <= csr_wmask[`CSR_TLBELO0_D] & csr_wvalue[`CSR_TLBELO0_D] |
                        ~csr_wmask[`CSR_TLBELO0_D] & csr_tlbelo0_d;
        csr_tlbelo0_plv <= csr_wmask[`CSR_TLBELO0_PLV] & csr_wvalue[`CSR_TLBELO0_PLV] |
                          ~csr_wmask[`CSR_TLBELO0_PLV] & csr_tlbelo0_plv;
        csr_tlbelo0_mat <= csr_wmask[`CSR_TLBELO0_MAT] & csr_wvalue[`CSR_TLBELO0_MAT] |
                          ~csr_wmask[`CSR_TLBELO0_MAT] & csr_tlbelo0_mat;
        csr_tlbelo0_g <= csr_wmask[`CSR_TLBELO0_G] & csr_wvalue[`CSR_TLBELO0_G] |
                        ~csr_wmask[`CSR_TLBELO0_G] & csr_tlbelo0_g;
        csr_tlbelo0_ppn <= csr_wmask[`CSR_TLBELO0_PPN] & csr_wvalue[`CSR_TLBELO0_PPN] |
                          ~csr_wmask[`CSR_TLBELO0_PPN] & csr_tlbelo0_ppn;
    end else if (inst_tlbrd & r_e) begin
        csr_tlbelo0_v <= w_tlbelo0_v;
        csr_tlbelo0_d <= w_tlbelo0_d;
        csr_tlbelo0_plv <= w_tlbelo0_plv;
        csr_tlbelo0_mat <= w_tlbelo0_mat;
        csr_tlbelo0_g <= w_tlbelo0_g;
        csr_tlbelo0_ppn <= w_tlbelo0_ppn;
    end
end

always @(posedge clock) begin
    if (csr_we && csr_num == `CSR_TLBELO1) begin
        csr_tlbelo1_v <= csr_wmask[`CSR_TLBELO1_V] & csr_wvalue[`CSR_TLBELO1_V]
                      | ~csr_wmask[`CSR_TLBELO1_V] & csr_tlbelo1_v;
        csr_tlbelo1_d <= csr_wmask[`CSR_TLBELO1_D] & csr_wvalue[`CSR_TLBELO1_D]
                      | ~csr_wmask[`CSR_TLBELO1_D] & csr_tlbelo1_d;
        csr_tlbelo1_plv <= csr_wmask[`CSR_TLBELO1_PLV] & csr_wvalue[`CSR_TLBELO1_PLV]
                        | ~csr_wmask[`CSR_TLBELO1_PLV] & csr_tlbelo1_plv;
        csr_tlbelo1_mat <= csr_wmask[`CSR_TLBELO1_MAT] & csr_wvalue[`CSR_TLBELO1_MAT]
                        | ~csr_wmask[`CSR_TLBELO1_MAT] & csr_tlbelo1_mat;
        csr_tlbelo1_g <= csr_wmask[`CSR_TLBELO1_G] & csr_wvalue[`CSR_TLBELO1_G]
                      | ~csr_wmask[`CSR_TLBELO1_G] & csr_tlbelo1_g;
        csr_tlbelo1_ppn <= csr_wmask[`CSR_TLBELO1_PPN] & csr_wvalue[`CSR_TLBELO1_PPN]
                        | ~csr_wmask[`CSR_TLBELO1_PPN] & csr_tlbelo1_ppn;
    end else if (inst_tlbrd & r_e) begin
        csr_tlbelo1_v <= w_tlbelo1_v;
        csr_tlbelo1_d <= w_tlbelo1_d;
        csr_tlbelo1_plv <= w_tlbelo1_plv;
        csr_tlbelo1_mat <= w_tlbelo1_mat;
        csr_tlbelo1_g <= w_tlbelo1_g;
        csr_tlbelo1_ppn <= w_tlbelo1_ppn;
    end
end

always @(posedge clock) begin
    if (csr_we && csr_num == `CSR_TLBRENTRY) begin
        csr_tlbrentry_pa <= csr_wmask[`CSR_TLBRENTRY_PA] & csr_wvalue[`CSR_TLBRENTRY_PA]
                      | ~csr_wmask[`CSR_TLBRENTRY_PA] & csr_tlbrentry_pa;
    end
end

always @(posedge clock) begin
    if (reset) begin
        csr_dmw0_plv0 <= 0;
        csr_dmw0_plv3 <= 0;
    end else if (csr_we && csr_num == `CSR_DMW0) begin
        csr_dmw0_plv0 <= csr_wmask[`CSR_DMW0_PLV0] & csr_wvalue[`CSR_DMW0_PLV0]
                      | ~csr_wmask[`CSR_DMW0_PLV0] & csr_dmw0_plv0;
        csr_dmw0_plv3 <= csr_wmask[`CSR_DMW0_PLV3] & csr_wvalue[`CSR_DMW0_PLV3]
                      | ~csr_wmask[`CSR_DMW0_PLV3] & csr_dmw0_plv3;
        csr_dmw0_mat  <= csr_wmask[`CSR_DMW0_MAT]  & csr_wvalue[`CSR_DMW0_MAT]
                      | ~csr_wmask[`CSR_DMW0_MAT]  & csr_dmw0_mat;
        csr_dmw0_pseg <= csr_wmask[`CSR_DMW0_PSEG] & csr_wvalue[`CSR_DMW0_PSEG]
                      | ~csr_wmask[`CSR_DMW0_PSEG] & csr_dmw0_pseg;
        csr_dmw0_vseg <= csr_wmask[`CSR_DMW0_VSEG] & csr_wvalue[`CSR_DMW0_VSEG]
                      | ~csr_wmask[`CSR_DMW0_VSEG]  & csr_dmw0_vseg;
    end
end

always @(posedge clock) begin
    if (reset) begin
        csr_dmw1_plv0 <= 0;
        csr_dmw1_plv3 <= 0;
    end else if (csr_we && csr_num == `CSR_DMW1) begin
        csr_dmw1_plv0 <= csr_wmask[`CSR_DMW1_PLV0] & csr_wvalue[`CSR_DMW1_PLV0]
                      | ~csr_wmask[`CSR_DMW1_PLV0] & csr_dmw1_plv0;
        csr_dmw1_plv3 <= csr_wmask[`CSR_DMW1_PLV3] & csr_wvalue[`CSR_DMW1_PLV3]
                      | ~csr_wmask[`CSR_DMW1_PLV3] & csr_dmw1_plv3;
        csr_dmw1_mat  <= csr_wmask[`CSR_DMW1_MAT]  & csr_wvalue[`CSR_DMW1_MAT]
                      | ~csr_wmask[`CSR_DMW1_MAT]  & csr_dmw1_mat;
        csr_dmw1_pseg <= csr_wmask[`CSR_DMW1_PSEG] & csr_wvalue[`CSR_DMW1_PSEG]
                      | ~csr_wmask[`CSR_DMW1_PSEG] & csr_dmw1_pseg;
        csr_dmw1_vseg <= csr_wmask[`CSR_DMW1_VSEG] & csr_wvalue[`CSR_DMW1_VSEG]
                      | ~csr_wmask[`CSR_DMW1_VSEG] & csr_dmw1_vseg;
    end
end

always @(posedge clock) begin
    if (reset) begin
        /* reset */
        csr_crmd_plv <= 2'b0;
        csr_crmd_ie <= 1'b0;
        csr_crmd_datf <= 2'b0;
        csr_crmd_datm <= 2'b0;
    end else if (ws_ex) begin
        /* interrupt and exception */
        csr_crmd_plv <= 2'b0;
        csr_crmd_ie <= 1'b0;
    end else if (ertn_flush) begin
        /* inst_ertn */
        csr_crmd_plv <= csr_prmd_pplv;
        csr_crmd_ie <= csr_prmd_pie;
    end else if (csr_we && csr_num == `CSR_CRMD) begin
        /* inst_csrx */
        csr_crmd_plv <= csr_wmask[`CSR_CRMD_PLV] & csr_wvalue[`CSR_CRMD_PLV]
                     | ~csr_wmask[`CSR_CRMD_PLV] & csr_crmd_plv;
        csr_crmd_ie <= csr_wmask[`CSR_CRMD_PIE]&csr_wvalue[`CSR_CRMD_PIE]
                     | ~csr_wmask[`CSR_CRMD_PIE]&csr_crmd_ie;
    end
end

always @(posedge clock) begin
    if (reset) begin
        csr_crmd_da <= 1'b1;
        csr_crmd_pg <= 1'b0;
    end else if (csr_we && csr_num == `CSR_CRMD) begin
        /* inst_csrx */
        csr_crmd_da <= csr_wmask[`CSR_CRMD_DA] & csr_wvalue[`CSR_CRMD_DA]
                     | ~csr_wmask[`CSR_CRMD_DA] & csr_crmd_da;
        csr_crmd_pg <= csr_wmask[`CSR_CRMD_PG]&csr_wvalue[`CSR_CRMD_PG]
                     | ~csr_wmask[`CSR_CRMD_PG]&csr_crmd_pg;
    end else if (ws_ex && (ws_ecode == 6'h3f) || 
                 ertn_flush && csr_estat_ecode == 6'h3f) begin
        csr_crmd_da <= ws_ex & 1'b1 | ertn_flush & 1'b0;
        csr_crmd_pg <= ws_ex & 1'b0 | ertn_flush & 1'b1;
    end
end

always @(posedge clock) begin
    if (ws_ex) begin
        csr_prmd_pplv <= csr_crmd_plv;
        csr_prmd_pie <= csr_crmd_ie;
    end else if (csr_we && csr_num == `CSR_PRMD) begin
        csr_prmd_pplv <= csr_wmask[`CSR_PRMD_PPLV] & csr_wvalue[`CSR_PRMD_PPLV]
                      | ~csr_wmask[`CSR_PRMD_PPLV] & csr_prmd_pplv;
        csr_prmd_pie <= csr_wmask[`CSR_PRMD_PIE] & csr_wvalue[`CSR_PRMD_PIE]
                     | ~csr_wmask[`CSR_PRMD_PIE] & csr_prmd_pie;
    end
end

always @(posedge clock) begin
    if (reset)
        csr_ecfg_lie <= 13'b0;
    else if (csr_we && csr_num==`CSR_ECFG)
        csr_ecfg_lie <= csr_wmask[`CSR_ECFG_LIE]&csr_wvalue[`CSR_ECFG_LIE]
                     | ~csr_wmask[`CSR_ECFG_LIE]&csr_ecfg_lie;
end

always @(posedge clock) begin
    if (reset)
        csr_estat_is[1:0] <= 2'b0;
    else if (csr_we && csr_num == `CSR_ESTAT)
        csr_estat_is[1:0] <= csr_wmask[`CSR_ESTAT_IS10] & csr_wvalue[`CSR_ESTAT_IS10]
                          | ~csr_wmask[`CSR_ESTAT_IS10] & csr_estat_is[1:0];

    // csr_estat_is[9:2] <= hw_int_in[7:0];
    csr_estat_is[9:2] <= 8'h00;

    csr_estat_is[10] <= 1'b0;
    // csr_estat_is[12] <= ipi_int_in;
    csr_estat_is[12] <= 1'b0;

    // csr_estat_is[11] <= 1'b0;

    
    if (timer_cnt[31:0] == 32'b0)
        csr_estat_is[11] <= 1'b1;
    else if (csr_we && csr_num == `CSR_TICLR && csr_wmask[`CSR_TICLR_CLR]
          && csr_wvalue[`CSR_TICLR_CLR])
        csr_estat_is[11] <= 1'b0;
end

always @(posedge clock) begin
    if (ws_ex) begin
        csr_estat_ecode <= ws_ecode;
        csr_estat_esubcode <= ws_esubcode;
    end
end

always @(posedge clock) begin
    if (ws_ex)
        csr_era_pc <= ws_pc;
    else if (csr_we && csr_num == `CSR_ERA)
        csr_era_pc <= csr_wmask[`CSR_ERA_PC] & csr_wvalue[`CSR_ERA_PC]
                   | ~csr_wmask[`CSR_ERA_PC] & csr_era_pc;
end

assign ws_ex_addr_err = ws_ecode == `ECODE_ADE || 
                        ws_ecode == `ECODE_ALE ||
                        ws_ecode == `ECODE_PIL ||
                        ws_ecode == `ECODE_PIS ||
                        ws_ecode == `ECODE_PIF ||
                        ws_ecode == `ECODE_PME ||
                        ws_ecode == `ECODE_PPI ||
                        ws_ecode == `ECODE_TLBR;
always @(posedge clock) begin
    if (ws_ex && ws_ex_addr_err)
        csr_badv_vaddr <= (ws_ecode == `ECODE_ADE && ws_esubcode == `ESUBCODE_ADEF ||
                           ws_ecode == `ECODE_PIF                                  ||
                           ws_ecode == `ECODE_PPI && ws_inst_ppi                   ||
                           ws_ecode == `ECODE_TLBR&& ws_inst_tlbr                  ) ? 
                           ws_pc : ws_vaddr;
end

always @(posedge clock) begin
    if (csr_we && csr_num == `CSR_EENTRY)
        csr_eentry_va <= csr_wmask[`CSR_EENTRY_VA] & csr_wvalue[`CSR_EENTRY_VA]
                      | ~csr_wmask[`CSR_EENTRY_VA] & csr_eentry_va;
end

always @(posedge clock) begin
    if (csr_we && csr_num==`CSR_SAVE0)
        csr_save0_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save0_data;
    if (csr_we && csr_num==`CSR_SAVE1)
        csr_save1_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save1_data;
    if (csr_we && csr_num==`CSR_SAVE2)
        csr_save2_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save2_data;
    if (csr_we && csr_num==`CSR_SAVE3)
        csr_save3_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save3_data;
end

always @(posedge clock) begin
    if (reset)
        // csr_tid_tid <= coreid_in;
        csr_tid_tid <= 32'd0;
    else if (csr_we && csr_num == `CSR_TID)
        csr_tid_tid <= csr_wmask[`CSR_TID_TID]&csr_wvalue[`CSR_TID_TID]
                    | ~csr_wmask[`CSR_TID_TID]&csr_tid_tid;
end

always @(posedge clock) begin
    if (reset)
        csr_tcfg_en <= 1'b0;
    else if (csr_we && csr_num==`CSR_TCFG)
        csr_tcfg_en <= csr_wmask[`CSR_TCFG_EN]&csr_wvalue[`CSR_TCFG_EN]
                    | ~csr_wmask[`CSR_TCFG_EN]&csr_tcfg_en;
    if (csr_we && csr_num==`CSR_TCFG) begin
        csr_tcfg_periodic <= csr_wmask[`CSR_TCFG_PERIOD]&csr_wvalue[`CSR_TCFG_PERIOD]
                          | ~csr_wmask[`CSR_TCFG_PERIOD]&csr_tcfg_periodic;
        csr_tcfg_initval <= csr_wmask[`CSR_TCFG_INITV]&csr_wvalue[`CSR_TCFG_INITV]
                         | ~csr_wmask[`CSR_TCFG_INITV]&csr_tcfg_initval;
    end
end

assign tcfg_next_value = csr_wmask[31:0] & csr_wvalue[31:0]
                      | ~csr_wmask[31:0] & csr_tcfg;

always @(posedge clock) begin
    if (reset)
        timer_cnt <= 32'hffffffff;
    else if (csr_we && csr_num==`CSR_TCFG && tcfg_next_value[`CSR_TCFG_EN])
        timer_cnt <= {tcfg_next_value[`CSR_TCFG_INITV], 2'b0};
    else if (csr_tcfg_en && timer_cnt!=32'hffffffff) begin
        if (timer_cnt[31:0]==32'b0 && csr_tcfg_periodic)
            timer_cnt <= {csr_tcfg_initval, 2'b0};
        else
            timer_cnt <= timer_cnt - 1'b1;
    end
end

assign csr_crmd  = {23'b0        , 
                    csr_crmd_datm,
                    csr_crmd_datf,
                    csr_crmd_pg  ,
                    csr_crmd_da  ,
                    csr_crmd_ie  ,
                    csr_crmd_plv };
assign csr_prmd  = {29'b0        ,
                    csr_prmd_pie ,
                    csr_prmd_pplv};
assign csr_ecfg  = {19'b0       ,
                    csr_ecfg_lie};
assign csr_estat = {1'b0              , 
                    csr_estat_esubcode,
                    csr_estat_ecode   ,
                    3'h0              ,
                    csr_estat_is      };
assign csr_era   = csr_era_pc;
assign csr_badv  = csr_badv_vaddr;
assign csr_eentry = {csr_eentry_va, 6'b0};
assign csr_tid   = csr_tid_tid;
assign csr_tcfg  = {csr_tcfg_initval, csr_tcfg_periodic, csr_tcfg_en};
assign csr_tval  = timer_cnt[31:0];
assign csr_ticlr = {31'b0, csr_ticlr_clr};
assign csr_tlbidx = {csr_tlbidx_ne, 1'b0, csr_tlbidx_ps, 20'b0, csr_tlbidx_index};
assign csr_tlbehi = {csr_tlbehi_vppn, 13'b0};
assign csr_tlbelo0 = {csr_tlbelo0_ppn, 1'b0, csr_tlbelo0_g, csr_tlbelo0_mat, csr_tlbelo0_plv, 
                      csr_tlbelo0_d, csr_tlbelo0_v};
assign csr_tlbelo1 = {csr_tlbelo1_ppn, 1'b0, csr_tlbelo1_g, csr_tlbelo1_mat, csr_tlbelo1_plv, 
                      csr_tlbelo1_d, csr_tlbelo1_v};
assign csr_asid = {8'b0, csr_asid_asidbits, 6'b0, csr_asid_asid};
assign csr_tlbrentry = {csr_tlbrentry_pa, 6'b0};
assign csr_dmw0 = {csr_dmw0_vseg, 1'b0, csr_dmw0_pseg, 19'b0, csr_dmw0_mat, 
                   csr_dmw0_plv3, 2'b0, csr_dmw0_plv0};
assign csr_dmw1 = {csr_dmw1_vseg, 1'b0, csr_dmw1_pseg, 19'b0, csr_dmw1_mat, 
                   csr_dmw1_plv3, 2'b0, csr_dmw1_plv0};

assign ex_entry = {csr_eentry_va, 6'b0};
assign has_int = ((csr_estat_is[11:0] & csr_ecfg_lie[11:0]) != 12'b0)
              && (csr_crmd_ie == 1'b1);
assign csr_rvalue = {32{csr_num == `CSR_CRMD     }} & csr_crmd       |
                    {32{csr_num == `CSR_PRMD     }} & csr_prmd       |
                    {32{csr_num == `CSR_ECFG     }} & csr_ecfg       |
                    {32{csr_num == `CSR_ESTAT    }} & csr_estat      |
                    {32{csr_num == `CSR_ERA      }} & csr_era        |
                    {32{csr_num == `CSR_BADV     }} & csr_badv       |
                    {32{csr_num == `CSR_EENTRY   }} & csr_eentry     |
                    {32{csr_num == `CSR_TLBIDX   }} & csr_tlbidx     |
                    {32{csr_num == `CSR_TLBEHI   }} & csr_tlbehi     |
                    {32{csr_num == `CSR_TLBELO0  }} & csr_tlbelo0    |
                    {32{csr_num == `CSR_TLBELO1  }} & csr_tlbelo1    |
                    {32{csr_num == `CSR_ASID     }} & csr_asid       |
                    {32{csr_num == `CSR_SAVE0    }} & csr_save0_data |
                    {32{csr_num == `CSR_SAVE1    }} & csr_save1_data |
                    {32{csr_num == `CSR_SAVE2    }} & csr_save2_data |
                    {32{csr_num == `CSR_SAVE3    }} & csr_save3_data |
                    {32{csr_num == `CSR_TID      }} & csr_tid        |
                    {32{csr_num == `CSR_TCFG     }} & csr_tcfg       |
                    {32{csr_num == `CSR_TVAL     }} & csr_tval       |
                    {32{csr_num == `CSR_TICLR    }} & csr_ticlr      |
                    {32{csr_num == `CSR_TLBRENTRY}} & csr_tlbrentry  |
                    {32{csr_num == `CSR_DMW0     }} & csr_dmw0       |
                    {32{csr_num == `CSR_DMW1     }} & csr_dmw1       ;


endmodule