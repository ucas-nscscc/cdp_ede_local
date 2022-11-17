`include "mycpu.h"
module csr_regfile(
    input         reset,
    input         clk,
    //inst visit port: read & write           
    input         csr_we,       
    input  [13:0] csr_num,      
    input  [31:0] csr_wmask,    
    input  [31:0] csr_wvalue, 
    output [31:0] csr_rvalue,  
    //tlb
    input [4:0] tlb_op,
    input   [`CSR_TLB_IN_BUS_WD -1:0]   csr_tlb_in_bus,
    output  [`CSR_TLB_OUT_BUS_WD-1:0]   csr_tlb_out_bus,
    input ws_valid,
    //lab15
    output [`CSR_TO_FS_BUS_WD-1 :0] csr_to_fs_bus,
    output [`CSR_TO_ES_BUS_WD-1:0] csr_to_es_bus,
    //cpu interact port
    input         wb_ex,
    input  [5:0]  wb_ecode,
    input  [8:0]  wb_esubcode,
    input  [31:0] wb_pc,    
    input  [31:0] wb_vaddr,  
    input         ertn_flush,
    input  [7:0]  hw_int_in,
    input         ipi_int_in,
    output [31:0] pc_to_fs,
    output        has_int,
    output [31:0] csr_estat_rvalue
);

//csr_regs
reg [ 1:0] csr_crmd_plv;
reg        csr_crmd_ie;
reg        csr_crmd_da;     //continue in tlb
reg        csr_crmd_pg;
reg [ 1:0] csr_crmd_datf;
reg [ 1:0] csr_crmd_datm;
//crmd[31:9] reserved

reg [ 1:0] csr_prmd_pplv;
reg        csr_prmd_pie;
//prmd[31:3] reserved

reg [12:0] csr_ecfg_lie;
//ecfg[31:13] reserved

reg [12:0] csr_estat_is;
//estat[15:13] reserved
reg [ 5:0] csr_estat_ecode;
reg [ 8:0] csr_estat_esubcode;
//estat[31] reserved

reg [31:0] csr_era_pc;

reg [31:0] csr_badv_vaddr;

//eentry[5:0] always 0
reg [25:0] csr_eentry_va;

reg [ 8:0] csr_cpuid_coreid;
//cpuid[31:9] reserved

reg [31:0] csr_save0_data;
reg [31:0] csr_save1_data;
reg [31:0] csr_save2_data;
reg [31:0] csr_save3_data;

reg [31:0] csr_tid_tid;

reg        csr_tcfg_en;
reg        csr_tcfg_periodic;
reg [29:0] csr_tcfg_initval;

//TLB related regs
reg [3:0] csr_tlbidx_index;
reg [5:0] csr_tlbidx_ps;
reg csr_tlbidx_ne;

reg [18:0] csr_tlbehi_vppn;

reg csr_tlbelo0_v;
reg csr_tlbelo0_d;
reg [1:0] csr_tlbelo0_plv;
reg [1:0] csr_tlbelo0_mat;
reg csr_tlbelo0_g;
reg [23:0] csr_tlbelo0_ppn;

reg csr_tlbelo1_v;
reg csr_tlbelo1_d;
reg [1:0] csr_tlbelo1_plv;
reg [1:0] csr_tlbelo1_mat;
reg csr_tlbelo1_g;
reg [23:0] csr_tlbelo1_ppn;

reg [9:0] csr_asid_asid;
wire [7:0] csr_asid_asidbits = 8'ha;

reg [25:0] csr_tlbrentry_pa;

reg csr_dmw0_plv0;
reg csr_dmw0_plv3;
reg [1:0] csr_dmw0_mat;
reg [2:0] csr_dmw0_pseg;
reg [2:0] csr_dmw0_vseg;

reg csr_dmw1_plv0;
reg csr_dmw1_plv3;
reg [1:0] csr_dmw1_mat;
reg [2:0] csr_dmw1_pseg;
reg [2:0] csr_dmw1_vseg;

reg [3:0] tlb_fill_select;
always @ (posedge clk) begin
    if (reset) 
        tlb_fill_select <= 4'h0;
    else if (ws_valid & (tlb_op == `TLBFILL))
        tlb_fill_select <= tlb_fill_select + 4'h1;
end 
//reg [31:0] csr_tval; read only, no need now

//reg        csr_ticlr_clr; always read 0, no need now
//ticlr[31:1] reserved

wire wb_ex_addr_err;
wire [31:0] tcfg_next_value;
reg [31:0] timer_cnt;

//SOFTWARE READ LOGIC
wire [31:0] csr_crmd_rvalue;
wire [31:0] csr_prmd_rvalue;
wire [31:0] csr_ecfg_rvalue;
// wire [31:0] csr_estat_rvalue;
wire [31:0] csr_era_rvalue;
wire [31:0] csr_badv_rvalue;
wire [31:0] csr_eentry_rvalue;
wire [31:0] csr_cpuid_rvalue;
wire [31:0] csr_save0_rvalue;
wire [31:0] csr_save1_rvalue;
wire [31:0] csr_save2_rvalue;
wire [31:0] csr_save3_rvalue;
wire [31:0] csr_tid_rvalue;
wire [31:0] csr_tcfg_rvalue;
wire [31:0] csr_tval_rvalue;
wire [31:0] csr_ticlr_rvalue;
//TLB RELATED READ LOGIC
wire [31:0] csr_tlbidx_rvalue;
wire [31:0] csr_tlbehi_rvalue;
wire [31:0] csr_tlbelo0_rvalue;
wire [31:0] csr_tlbelo1_rvalue;
wire [31:0] csr_asid_rvalue;
wire [31:0] csr_tlbrentry_rvalue;
wire [31:0] csr_dmw0_rvalue;
wire [31:0] csr_dmw1_rvalue;

wire [31:0] pc_entry;
wire [31:0] pc_back;

//tlb
wire        tlb_we = ws_valid & ((tlb_op == `TLBWR) | (tlb_op == `TLBFILL));
wire [ 3:0] tlb_w_index = (ws_valid & (tlb_op == `TLBFILL)) ? tlb_fill_select : csr_tlbidx_index;
wire        tlb_w_e = (csr_estat_ecode == 6'h3f)?1'b1:~csr_tlbidx_ne;
wire [18:0] tlb_w_vppn = csr_tlbehi_vppn;
wire [ 5:0] tlb_w_ps = csr_tlbidx_ps;
wire [ 9:0] tlb_w_asid = csr_asid_asid;
wire        tlb_w_g = (csr_tlbelo0_g & csr_tlbelo1_g);
wire [19:0] tlb_w_ppn0 = csr_tlbelo0_ppn;
wire [ 1:0] tlb_w_plv0 = csr_tlbelo0_plv;
wire [ 1:0] tlb_w_mat0 = csr_tlbelo0_mat;
wire        tlb_w_d0 = csr_tlbelo0_d;
wire        tlb_w_v0 = csr_tlbelo0_v;
wire [19:0] tlb_w_ppn1 = csr_tlbelo1_ppn;
wire [ 1:0] tlb_w_plv1 = csr_tlbelo1_plv;
wire [ 1:0] tlb_w_mat1 = csr_tlbelo1_mat;
wire        tlb_w_d1 = csr_tlbelo1_d;
wire        tlb_w_v1 = csr_tlbelo1_v;

wire [ 3:0] tlb_r_index = csr_tlbidx_index;
wire        tlb_r_e;
wire [18:0] tlb_r_vppn;
wire [ 5:0] tlb_r_ps;
wire [ 9:0] tlb_r_asid;
wire        tlb_r_g;
wire [19:0] tlb_r_ppn0;
wire [ 1:0] tlb_r_plv0;
wire [ 1:0] tlb_r_mat0;
wire        tlb_r_d0;
wire        tlb_r_v0;
wire [19:0] tlb_r_ppn1;
wire [ 1:0] tlb_r_plv1;
wire [ 1:0] tlb_r_mat1;
wire        tlb_r_d1;
wire        tlb_r_v1;
wire       tlb_s1_found;
wire [3:0] tlb_s1_index;
wire       es_valid;
wire [4:0] es_tlb_op;

//connect with TLB
assign {
    es_valid,
    es_tlb_op,
    tlb_s1_found,
    tlb_s1_index,
    tlb_r_e,
    tlb_r_vppn,
    tlb_r_ps,
    tlb_r_asid,
    tlb_r_g,
    tlb_r_ppn0,
    tlb_r_plv0,
    tlb_r_mat0,
    tlb_r_d0,
    tlb_r_v0,
    tlb_r_ppn1,
    tlb_r_plv1,
    tlb_r_mat1,
    tlb_r_d1,
    tlb_r_v1
    } = csr_tlb_in_bus;

assign csr_tlb_out_bus = {
    tlb_we,
    tlb_w_index,
    tlb_w_e,
    tlb_w_vppn,
    tlb_w_ps,
    tlb_w_asid,
    tlb_w_g,
    tlb_w_ppn0,
    tlb_w_plv0,
    tlb_w_mat0,
    tlb_w_d0,
    tlb_w_v0,
    tlb_w_ppn1,
    tlb_w_plv1,
    tlb_w_mat1,
    tlb_w_d1,
    tlb_w_v1,
    tlb_r_index,
    csr_tlbehi_vppn,
    csr_asid_asid
    };
assign csr_to_fs_bus = {
        csr_dmw0_rvalue,      //68:37
        csr_dmw1_rvalue,      //36:5
        csr_crmd_rvalue[4:0] //4:0
};
assign csr_to_es_bus = {
    tlb_w_vppn,  //19 97:79
        tlb_w_asid,  //10 78:69
        csr_dmw0_rvalue,      //68:37
        csr_dmw1_rvalue,      //36:5
        csr_crmd_rvalue[4:0] //4:0
};
//TODO change all related code
wire [31:0] csr_managed_wvalue = (csr_rvalue & ~csr_wmask) | (csr_wvalue & csr_wmask);
// CRMD
always @(posedge clk) begin
    if (reset) begin
        csr_crmd_plv <= 2'b0;
        csr_crmd_ie  <= 1'b0;
    end
    else if (wb_ex) begin
        csr_crmd_plv <= 2'b0;
        csr_crmd_ie  <= 1'b0;
    end
    else if (ertn_flush) begin
        csr_crmd_plv <= csr_prmd_pplv;
        csr_crmd_ie  <= csr_prmd_pie;
    end
    else if (csr_we && csr_num == `CSR_CRMD) begin
        csr_crmd_plv <= csr_wmask[`CSR_CRMD_PLV] & csr_wvalue[`CSR_CRMD_PLV]
                     | ~csr_wmask[`CSR_CRMD_PLV] & csr_crmd_plv;
        csr_crmd_ie  <= csr_wmask[`CSR_CRMD_IE]  & csr_wvalue[`CSR_CRMD_IE]
                    |  ~csr_wmask[`CSR_CRMD_IE]  & csr_crmd_ie; 
    end
end
//TODO TLB refill
always @(posedge clk) begin
    if (reset) begin
        csr_crmd_da <= 1'b1;
        csr_crmd_pg <= 1'b0;
    end
    else if (ertn_flush && csr_estat_ecode == `CSR_ECODE_TLBR) begin // todo change to `CSR... 6'h3f
        csr_crmd_da <= 1'b0;
        csr_crmd_pg <= 1'b1; 
    end
    else if (wb_ex && wb_ecode == `CSR_ECODE_TLBR) begin
        csr_crmd_da <= 1'b1;
        csr_crmd_pg <= 1'b0;//!bug 3 9806997 try 1
    end
    else if (csr_we && csr_num == `CSR_CRMD) begin
        csr_crmd_da <= csr_wmask[`CSR_CRMD_DA] & csr_wvalue[`CSR_CRMD_DA]
                    | ~csr_wmask[`CSR_CRMD_DA] & csr_crmd_da;
        csr_crmd_pg <= csr_wmask[`CSR_CRMD_PG] & csr_wvalue[`CSR_CRMD_PG]
                    | ~csr_wmask[`CSR_CRMD_PG] & csr_crmd_pg;
    end
end

always @(posedge clk) begin
    if (reset) begin
        csr_crmd_datf <= 2'h0;
        csr_crmd_datm <= 2'h0;
    end
    else if (csr_we && csr_num == `CSR_CRMD && csr_wmask[`CSR_CRMD_PG] && csr_wvalue[`CSR_CRMD_PG])begin
        csr_crmd_datf <= csr_wmask[`CSR_CRMD_DATF] & csr_wvalue[`CSR_CRMD_DATF]
                    | ~csr_wmask[`CSR_CRMD_DATF] & csr_crmd_datf;//2'h1;//!bug3 try 3  
        csr_crmd_datm <= csr_wmask[`CSR_CRMD_DATM] & csr_wvalue[`CSR_CRMD_DATM]
                    | ~csr_wmask[`CSR_CRMD_DATM] & csr_crmd_datm;//2'h1;//!to do? yes
    end
    else if (wb_ex && wb_ecode == `CSR_ECODE_TLBR) begin
        csr_crmd_datf <= 2'h0;
        csr_crmd_datm <= 2'h0;//!bug 3 try 2
    end
    // [9812857 ns] Error!!!
    // reference: PC = 0x1c008288, wb_rf_wnum = 0x0c, wb_rf_wdata = 0x00000010
    // mycpu    : PC = 0x1c008288, wb_rf_wnum = 0x0c, wb_rf_wdata = 0x000000b0
end

assign csr_crmd_rvalue = {23'b0, csr_crmd_datm, csr_crmd_datf, csr_crmd_pg, csr_crmd_da, csr_crmd_ie, csr_crmd_plv};

//PRMD
always @(posedge clk) begin
    if(wb_ex) begin
        csr_prmd_pplv <= csr_crmd_plv;
        csr_prmd_pie  <= csr_crmd_ie;
    end
    else if (csr_we && csr_num == `CSR_PRMD) begin
        csr_prmd_pplv <= csr_wmask[`CSR_PRMD_PPLV] & csr_wvalue[`CSR_PRMD_PPLV]
                      | ~csr_wmask[`CSR_PRMD_PPLV] & csr_prmd_pplv;
        csr_prmd_pie  <= csr_wmask[`CSR_PRMD_PIE]  & csr_wvalue[`CSR_PRMD_PIE]
                      | ~csr_wmask[`CSR_PRMD_PIE]  & csr_prmd_pie;
    end
end

assign csr_prmd_rvalue = {29'b0, csr_prmd_pie, csr_prmd_pplv};

//ECFG
always @(posedge clk) begin
    if (reset)
        csr_ecfg_lie <= 13'b0;
    else if (csr_we && csr_num == `CSR_ECFG)
        csr_ecfg_lie <= csr_wmask[`CSR_ECFG_LIE] & csr_wvalue[`CSR_ECFG_LIE]
                     | ~csr_wmask[`CSR_ECFG_LIE] & csr_ecfg_lie;
end

assign csr_ecfg_rvalue = {19'b0, csr_ecfg_lie};

//ESTAT
always @(posedge clk) begin
    if (reset)
        csr_estat_is[1:0] <= 2'b0;
    else if (csr_we && csr_num ==`CSR_ESTAT)
        csr_estat_is[1:0] <= csr_wmask[`CSR_ESTAT_IS10] & csr_wvalue[`CSR_ESTAT_IS10]
                          | ~csr_wmask[`CSR_ESTAT_IS10] & csr_estat_is[1:0];
    
    csr_estat_is[9:2] <= hw_int_in;
    csr_estat_is[10]  <= 1'b0;

    if (csr_tcfg_en && timer_cnt[31:0] == 32'b0) 
        csr_estat_is[11] <= 1'b1;
    else if (csr_we && csr_num==`CSR_TICLR && csr_wmask[`CSR_TICLR_CLR] && csr_wvalue[`CSR_TICLR_CLR])
        csr_estat_is[11] <= 1'b0;
    
    csr_estat_is[12] <= ipi_int_in;
end

always @(posedge clk) begin
    if (wb_ex) begin
        csr_estat_ecode    <= wb_ecode;
        csr_estat_esubcode <= wb_esubcode;
    end
end

assign csr_estat_rvalue = {1'b0, csr_estat_esubcode, csr_estat_ecode, 3'b0, csr_estat_is};

//ERA
always @(posedge clk) begin
    if (wb_ex)
        csr_era_pc <= wb_pc;
    else if (csr_we && csr_num ==`CSR_ERA)
        csr_era_pc <= csr_wmask[`CSR_ERA_PC] & csr_wvalue[`CSR_ERA_PC]
                   | ~csr_wmask[`CSR_ERA_PC] & csr_era_pc;
end

assign csr_era_rvalue = csr_era_pc;

//BADV
assign wb_ex_addr_err = wb_ecode == `CSR_ECODE_ADE | wb_ecode == `CSR_ECODE_ALE | 
                        wb_ecode == `CSR_ECODE_TLBR| wb_ecode == `CSR_ECODE_PIL |
                        wb_ecode == `CSR_ECODE_PIS | wb_ecode == `CSR_ECODE_PIF |
                        wb_ecode == `CSR_ECODE_PME | wb_ecode == `CSR_ECODE_PPI ;
always @(posedge clk) begin
    if (wb_ex & wb_ex_addr_err)
        csr_badv_vaddr <= (wb_ecode == `CSR_ECODE_ADE & wb_esubcode == `CSR_ESUBCODE_ADEF) ? wb_pc : wb_vaddr;
end

assign csr_badv_rvalue = csr_badv_vaddr;

//EENTRY
always @(posedge clk) begin
    if (csr_we && csr_num ==`CSR_EENTRY)
        csr_eentry_va <= csr_wmask[`CSR_EENTRY_VA] & csr_wvalue[`CSR_EENTRY_VA]
                      | ~csr_wmask[`CSR_EENTRY_VA] & csr_eentry_va;
end

assign csr_eentry_rvalue = {csr_eentry_va, 6'b0};

//CPUID
always @(posedge clk) begin
    if (reset)
        csr_cpuid_coreid <= 9'b0;
end

assign csr_cpuid_rvalue = {23'b0, csr_cpuid_coreid};

//SAVE0~3
always @(posedge clk) begin
    if(csr_we && csr_num ==`CSR_SAVE0)
        csr_save0_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save0_data;
    
    if(csr_we && csr_num ==`CSR_SAVE1)
        csr_save1_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save1_data;
    
    if(csr_we && csr_num ==`CSR_SAVE2)
        csr_save2_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save2_data;
    
    if(csr_we && csr_num ==`CSR_SAVE3)
        csr_save3_data <= csr_wmask[`CSR_SAVE_DATA] & csr_wvalue[`CSR_SAVE_DATA]
                       | ~csr_wmask[`CSR_SAVE_DATA] & csr_save3_data;
end

assign csr_save0_rvalue  = csr_save0_data;
assign csr_save1_rvalue  = csr_save1_data;
assign csr_save2_rvalue  = csr_save2_data;
assign csr_save3_rvalue  = csr_save3_data;

//TID
always @(posedge clk) begin
    if (reset)
        csr_tid_tid <= {23'b0, csr_cpuid_coreid};
    else if (csr_we && csr_num==`CSR_TID)
        csr_tid_tid <= csr_wmask[`CSR_TID_TID] & csr_wvalue[`CSR_TID_TID]
                    | ~csr_wmask[`CSR_TID_TID] & csr_tid_tid;
end
assign csr_tid_rvalue = csr_tid_tid;

//TCFG
always @(posedge clk) begin
    if (reset)
        csr_tcfg_en <= 1'b0;
    else if (csr_we && csr_num==`CSR_TCFG)
        csr_tcfg_en <= csr_wmask[`CSR_TCFG_EN] & csr_wvalue[`CSR_TCFG_EN]
                    | ~csr_wmask[`CSR_TCFG_EN] & csr_tcfg_en;

    if (csr_we && csr_num==`CSR_TCFG)begin
        csr_tcfg_periodic <= csr_wmask[`CSR_TCFG_PERIOD] & csr_wvalue[`CSR_TCFG_PERIOD]
                          | ~csr_wmask[`CSR_TCFG_PERIOD] & csr_tcfg_periodic;
        csr_tcfg_initval  <= csr_wmask[`CSR_TCFG_INITV]  & csr_wvalue[`CSR_TCFG_INITV]
                          | ~csr_wmask[`CSR_TCFG_INITV]  & csr_tcfg_initval;
    end
end

assign csr_tcfg_rvalue = {csr_tcfg_initval, csr_tcfg_periodic, csr_tcfg_en};

//TVAL
assign tcfg_next_value = csr_wmask[31:0] & csr_wvalue[31:0]
                      | ~csr_wmask[31:0] & csr_tcfg_rvalue;
always @(posedge clk)begin
    if (reset)
        timer_cnt <= 32'hffffffff;
    else if (csr_we && csr_num==`CSR_TCFG && tcfg_next_value[`CSR_TCFG_EN])
        timer_cnt <= {tcfg_next_value[`CSR_TCFG_INITV], 2'b0};
    else if (csr_tcfg_en && timer_cnt != 32'hffffffff)begin
        if (timer_cnt[31:0] == 32'b0 && csr_tcfg_periodic)
            timer_cnt <= {csr_tcfg_initval, 2'b0};
        else
            timer_cnt <= timer_cnt - 1'b1;
    end
end

assign csr_tval_rvalue = timer_cnt[31:0];

//TICLR
assign csr_ticlr_rvalue = 32'b0;

//TLBIDX
always @ (posedge clk) begin
    if (reset) begin
        {csr_tlbidx_ps,csr_tlbidx_index} <= 10'b0;
        csr_tlbidx_ne <= 1'b1;
    end
    else if (csr_we & (csr_num == `CSR_TLBIDX)) 
        {csr_tlbidx_ne,csr_tlbidx_ps,csr_tlbidx_index} <= 
            {csr_managed_wvalue[31],csr_managed_wvalue[29:24],csr_managed_wvalue[3:0]};
    else if (es_valid & (es_tlb_op == `TLBSRCH)) begin
        if (tlb_s1_found) 
            {csr_tlbidx_ne,csr_tlbidx_index} <= {1'b0,tlb_s1_index};
        else 
            csr_tlbidx_ne <= 1'b1;
    end
    else if (ws_valid & (tlb_op == `TLBRD)) 
        {csr_tlbidx_ne,csr_tlbidx_ps} <= {~tlb_r_e,tlb_r_ps};
end
assign csr_tlbidx_rvalue = {csr_tlbidx_ne, 1'b0, csr_tlbidx_ps, 20'b0, csr_tlbidx_index};

//TLBEHI
always @ (posedge clk) begin
if (reset) 
    csr_tlbehi_vppn <= 19'b0;
else if (csr_we & (csr_num == `CSR_TLBEHI)) 
    csr_tlbehi_vppn <= csr_managed_wvalue[31:13];
else if (wb_ex & ((wb_ecode == `CSR_ECODE_TLBR) | (wb_ecode == `CSR_ECODE_PIL) | (wb_ecode == `CSR_ECODE_PIS) | (wb_ecode == `CSR_ECODE_PIF) | (wb_ecode == `CSR_ECODE_PME) | (wb_ecode == `CSR_ECODE_PPI))) 
    csr_tlbehi_vppn <= wb_vaddr[31:13];
else if (ws_valid & (tlb_op == `TLBRD) & tlb_r_e) 
    csr_tlbehi_vppn <= tlb_r_vppn;
end
assign csr_tlbehi_rvalue = {csr_tlbehi_vppn, 13'h0};

//TLBELO0 & TLBELO1
always @ (posedge clk) begin
    if (reset) 
        {csr_tlbelo0_ppn,csr_tlbelo0_g,csr_tlbelo0_mat,csr_tlbelo0_plv,csr_tlbelo0_d,csr_tlbelo0_v} <= 31'b0;
    else if (csr_we & (csr_num == `CSR_TLBELO0)) 
        {csr_tlbelo0_ppn,csr_tlbelo0_g,csr_tlbelo0_mat,csr_tlbelo0_plv,csr_tlbelo0_d,csr_tlbelo0_v} <= 
            {csr_managed_wvalue[31:8],csr_managed_wvalue[6:0]};
    else if (ws_valid & (tlb_op == `TLBRD) & tlb_r_e) 
        {csr_tlbelo0_ppn,csr_tlbelo0_g,csr_tlbelo0_mat,csr_tlbelo0_plv,csr_tlbelo0_d,csr_tlbelo0_v} <= 
            {tlb_r_ppn0,tlb_r_g,tlb_r_mat0,tlb_r_plv0,tlb_r_d0,tlb_r_v0};
end
always @ (posedge clk) begin
    if (reset) 
        {csr_tlbelo1_ppn,csr_tlbelo1_g,csr_tlbelo1_mat,csr_tlbelo1_plv,csr_tlbelo1_d,csr_tlbelo1_v} <= 31'b0;
    else if (csr_we & (csr_num == `CSR_TLBELO1)) 
        {csr_tlbelo1_ppn,csr_tlbelo1_g,csr_tlbelo1_mat,csr_tlbelo1_plv,csr_tlbelo1_d,csr_tlbelo1_v} <= 
            {csr_managed_wvalue[31:8],csr_managed_wvalue[6:0]};
    else if (ws_valid & (tlb_op == `TLBRD) & tlb_r_e) 
        {csr_tlbelo1_ppn,csr_tlbelo1_g,csr_tlbelo1_mat,csr_tlbelo1_plv,csr_tlbelo1_d,csr_tlbelo1_v} <= 
            {tlb_r_ppn1,tlb_r_g,tlb_r_mat1,tlb_r_plv1,tlb_r_d1,tlb_r_v1};
end
assign csr_tlbelo0_rvalue = {csr_tlbelo0_ppn, 1'b0, csr_tlbelo0_g, csr_tlbelo0_mat, csr_tlbelo0_plv, csr_tlbelo0_d, csr_tlbelo0_v};
assign csr_tlbelo1_rvalue = {csr_tlbelo1_ppn, 1'b0, csr_tlbelo1_g, csr_tlbelo1_mat, csr_tlbelo1_plv, csr_tlbelo1_d, csr_tlbelo1_v};

//ASID
always @ (posedge clk) begin
    if (reset) 
        csr_asid_asid <= 10'b0;
    else if (csr_we & (csr_num == `CSR_ASID)) 
        csr_asid_asid <= csr_managed_wvalue[9:0];
    else if (ws_valid & (tlb_op == `TLBRD) & tlb_r_e) 
        csr_asid_asid <= tlb_r_asid;
end
assign csr_asid_rvalue = {8'b0, csr_asid_asidbits, 6'b0, csr_asid_asid};

//TLBENTRY
always @ (posedge clk) begin
    if (reset) 
        csr_tlbrentry_pa <= 26'b0;
    else if (csr_we & (csr_num == `CSR_TLBRENTRY)) 
        csr_tlbrentry_pa <= csr_managed_wvalue[31:6];
end
assign csr_tlbrentry_rvalue  = {csr_tlbrentry_pa, 6'b0}; 

//DMW0 & DMW1 直接映射窗口
always @ (posedge clk) begin
    if (reset) 
        {csr_dmw0_vseg,csr_dmw0_pseg,csr_dmw0_mat,csr_dmw0_plv3,csr_dmw0_plv0} <= 10'b0;
    else if (csr_we & (csr_num == `CSR_DMW0)) 
        {csr_dmw0_vseg,csr_dmw0_pseg,csr_dmw0_mat,csr_dmw0_plv3,csr_dmw0_plv0} <= 
            {csr_managed_wvalue[31:29],csr_managed_wvalue[27:25],csr_managed_wvalue[5:4],csr_managed_wvalue[3],csr_managed_wvalue[0]};
end
always @ (posedge clk) begin
    if (reset) 
        {csr_dmw1_vseg,csr_dmw1_pseg,csr_dmw1_mat,csr_dmw1_plv3,csr_dmw1_plv0} <= 10'b0;
    else if (csr_we & (csr_num == `CSR_DMW1)) 
        {csr_dmw1_vseg,csr_dmw1_pseg,csr_dmw1_mat,csr_dmw1_plv3,csr_dmw1_plv0} <= 
            {csr_managed_wvalue[31:29],csr_managed_wvalue[27:25],csr_managed_wvalue[5:4],csr_managed_wvalue[3],csr_managed_wvalue[0]};
end
assign csr_dmw0_rvalue = {csr_dmw0_vseg, 1'b0, csr_dmw0_pseg, 19'b0, csr_dmw0_mat, csr_dmw0_plv3, 2'b0, csr_dmw0_plv0};
assign csr_dmw1_rvalue = {csr_dmw1_vseg, 1'b0, csr_dmw1_pseg, 19'b0, csr_dmw1_mat, csr_dmw1_plv3, 2'b0, csr_dmw1_plv0};

//INTERACT
assign pc_entry =  (wb_ecode == `CSR_ECODE_TLBR) ? csr_tlbrentry_rvalue :
                    csr_eentry_rvalue;//!bug 2 9806437
assign pc_back  = csr_era_pc;
assign pc_to_fs = {32{wb_ex}} & pc_entry | {32{~wb_ex}} & pc_back;
assign has_int  = ((csr_estat_is[12:0] & csr_ecfg_lie[12:0]) != 13'b0) && csr_crmd_ie;

//READ
assign csr_rvalue = {32{csr_num ==`CSR_CRMD      }} & csr_crmd_rvalue
                 |  {32{csr_num ==`CSR_PRMD      }} & csr_prmd_rvalue
                 |  {32{csr_num ==`CSR_ECFG      }} & csr_ecfg_rvalue
                 |  {32{csr_num ==`CSR_ESTAT     }} & csr_estat_rvalue
                 |  {32{csr_num ==`CSR_ERA       }} & csr_era_rvalue
                 |  {32{csr_num ==`CSR_BADV      }} & csr_badv_rvalue
                 |  {32{csr_num ==`CSR_EENTRY    }} & csr_eentry_rvalue
                 |  {32{csr_num ==`CSR_SAVE0     }} & csr_save0_rvalue
                 |  {32{csr_num ==`CSR_SAVE1     }} & csr_save1_rvalue
                 |  {32{csr_num ==`CSR_SAVE2     }} & csr_save2_rvalue
                 |  {32{csr_num ==`CSR_SAVE3     }} & csr_save3_rvalue
                 |  {32{csr_num ==`CSR_TID       }} & csr_tid_rvalue
                 |  {32{csr_num ==`CSR_TCFG      }} & csr_tcfg_rvalue
                 |  {32{csr_num ==`CSR_TVAL      }} & csr_tval_rvalue
                 |  {32{csr_num ==`CSR_TICLR     }} & csr_ticlr_rvalue
                 |  {32{csr_num == `CSR_TLBIDX   }} & csr_tlbidx_rvalue
                 |  {32{csr_num == `CSR_TLBEHI   }} & csr_tlbehi_rvalue
                 |  {32{csr_num == `CSR_TLBELO0  }} & csr_tlbelo0_rvalue
                 |  {32{csr_num == `CSR_TLBELO1  }} & csr_tlbelo1_rvalue
                 |  {32{csr_num == `CSR_ASID     }} & csr_asid_rvalue  
                 |  {32{csr_num == `CSR_TLBRENTRY}} & csr_tlbrentry_rvalue
                 |  {32{csr_num == `CSR_DMW0     }} & csr_dmw0_rvalue 
                 |  {32{csr_num == `CSR_DMW1     }} & csr_dmw1_rvalue ;

endmodule