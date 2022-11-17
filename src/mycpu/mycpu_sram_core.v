`include "mycpu.h"
module mycpu_sram_core(
    input         clk,
    input         resetn,
    input  [ 7:0] hw_int_in,
    // inst sram interface
    output        inst_sram_req,
    output        inst_sram_wr,
    output [ 1:0] inst_sram_size,
    output [ 3:0] inst_sram_wstrb,
    output [31:0] inst_sram_addr,
    output [31:0] inst_sram_wdata,
    input         inst_sram_addr_ok,
    input         inst_sram_data_ok,
    input  [31:0] inst_sram_rdata,
    // data sram interface
    output        data_sram_req,
    output        data_sram_wr,
    output [ 1:0] data_sram_size,
    output [ 3:0] data_sram_wstrb,
    output [31:0] data_sram_addr,
    output [31:0] data_sram_wdata,
    input         data_sram_addr_ok,
    input         data_sram_data_ok,
    input  [31:0] data_sram_rdata,
    // trace debug interface
    output [31:0] debug_wb_pc,
    output [ 3:0] debug_wb_rf_wen,
    output [ 4:0] debug_wb_rf_wnum,
    output [31:0] debug_wb_rf_wdata,
    output [31:0] csr_estat_rvalue
);
reg         reset;
always @(posedge clk) reset <= ~resetn; 

wire         ds_allowin;
wire         es_allowin;
wire         ms_allowin;
wire         ws_allowin;
wire         fs_to_ds_valid;
wire         ds_to_es_valid;
wire         es_to_ms_valid;
wire         ms_to_ws_valid;
wire [`FS_TO_DS_BUS_WD -1:0] fs_to_ds_bus;
wire [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus;
wire [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus;
wire [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus;
wire [`WS_TO_RF_BUS_WD -1:0] ws_to_rf_bus;
wire [`BR_BUS_WD       -1:0] br_bus;
wire [`ES_REL_BUS_WD   -1:0] es_related_bus;
wire [`MS_REL_BUS_WD   -1:0] ms_related_bus;
wire [`WS_REL_BUS_WD   -1:0] ws_related_bus;
wire [63                 :0] es_mul_result;
//LAB15
wire [`TLB_TO_FS_BUS_WD-1:0] tlb_to_fs_bus;
wire [`FS_TO_TLB_BUS_WD-1:0] fs_to_tlb_bus;
wire [`CSR_TO_FS_BUS_WD-1 :0] csr_to_fs_bus;
wire [`TLB_TO_ES_BUS_WD-1 :0] tlb_to_es_bus;
wire [`ES_TO_TLB_BUS_WD-1:0] es_to_tlb_bus;
wire [`CSR_TO_ES_BUS_WD-1:0] csr_to_es_bus;
//
wire        ws_ex;
wire        ws_ex_to_csr;
wire        ms_ex;
wire        es_ex;
wire        ds_ex;
wire [31:0] pc_to_fs;
wire        ws_ertn_flush;
wire        has_int;
wire [ 5:0] ws_ecode;
wire [ 8:0] ws_esubcode;
wire [31:0] ws_vaddr;
wire        ws_csr_we;
wire [13:0] ws_csr_rnum;
wire [31:0] ws_csr_wmask;
wire [31:0] ws_csr_wvalue;
wire [31:0] ws_csr_rvalue;
// wire [ 7:0] hw_int_in;
wire        ipi_int_in;
wire        ws_valid;
// assign hw_int_in = 8'b0;
assign ipi_int_in = 1'b0;

wire [`TLB_INV_BUS_WD-1:0] tlb_inv_bus;
wire        es_valid;
wire [ 4:0] es_tlb_op;
wire [31:0] es_tlb_inv_vppn;
wire [31:0] es_tlb_inv_asid;
wire [ 4:0] ws_tlb_op;
wire [1:0]  es_load_store;
wire tlb_inv_valid;// = es_valid & es_tlb_op[4];
wire [ 4:0] tlb_inv_op;// = {2'b0, es_tlb_op[2:0]};
// assign {es_load_store,
//         es_valid,
//         es_tlb_op,
//         es_tlb_inv_asid,
//         es_tlb_inv_vppn} = tlb_inv_bus;
assign {
        es_valid,
        es_tlb_op,
        tlb_inv_valid,
        tlb_inv_op} = tlb_inv_bus;

//write port
wire          tlb_we;
wire [ 3:0]   tlb_w_index;
wire          tlb_w_e;
wire [18:0]   tlb_w_vppn;
wire [ 5:0]   tlb_w_ps;
wire [ 9:0]   tlb_w_asid;
wire          tlb_w_g;
wire [19:0]   tlb_w_ppn0;
wire [ 1:0]   tlb_w_plv0;
wire [ 1:0]   tlb_w_mat0;
wire          tlb_w_d0;
wire          tlb_w_v0;
wire [19:0]   tlb_w_ppn1;
wire [ 1:0]   tlb_w_plv1;
wire [ 1:0]   tlb_w_mat1;
wire          tlb_w_d1;
wire          tlb_w_v1;
//read port
wire [ 3:0]   tlb_r_index;
wire          tlb_r_e;
wire [18:0]   tlb_r_vppn;
wire [ 5:0]   tlb_r_ps;
wire [ 9:0]   tlb_r_asid;
wire          tlb_r_g;
wire [19:0]   tlb_r_ppn0;
wire [ 1:0]   tlb_r_plv0;
wire [ 1:0]   tlb_r_mat0;
wire          tlb_r_d0;
wire          tlb_r_v0;
wire [19:0]   tlb_r_ppn1;
wire [ 1:0]   tlb_r_plv1;
wire [ 1:0]   tlb_r_mat1;
wire          tlb_r_d1;
wire          tlb_r_v1;
//search port 0 (for fetch)
wire [18:0]   tlb_s0_vppn;
wire [ 9:0]   tlb_s0_asid;
wire          tlb_s0_va_bit12;
wire          tlb_s0_found;
wire [ 3:0]   tlb_s0_index;
wire [19:0]   tlb_s0_ppn;
wire [ 5:0]   tlb_s0_ps;
wire [ 1:0]   tlb_s0_mat;
wire [ 1:0]   tlb_s0_plv;
wire          tlb_s0_d;
wire          tlb_s0_v;
//search port 1 (for load/store)
wire [18:0]   csr_tlbehi_vppn;
wire [ 9:0]   csr_asid_asid;

wire [18:0]   tlb_s1_vppn ;//= tlb_inv_valid ? es_tlb_inv_vppn[31:13] : tlb_w_vppn;
wire [ 9:0]   tlb_s1_asid ;//= tlb_inv_valid ? es_tlb_inv_asid[9:0] : tlb_w_asid;
wire          tlb_s1_va_bit12 ;//= tlb_inv_valid ? es_tlb_inv_vppn[12] : 1'b0;//TBM
wire          tlb_s1_found;
wire [ 3:0]   tlb_s1_index;
wire [19:0]   tlb_s1_ppn;
wire [ 5:0]   tlb_s1_ps;
wire [ 1:0]   tlb_s1_mat;
wire [ 1:0]   tlb_s1_plv;
wire          tlb_s1_d;
wire          tlb_s1_v;
wire [`CSR_TLB_IN_BUS_WD-1:0] csr_tlb_in_bus = {
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
    tlb_r_v1};

wire [`CSR_TLB_OUT_BUS_WD-1:0] csr_tlb_out_bus;
assign {
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
    csr_asid_asid} = csr_tlb_out_bus;

// //!lab 15

assign tlb_to_fs_bus = {
        tlb_s0_found, //36:26  1
        tlb_s0_index, //35:22  4
        tlb_s0_ppn, //31:12  20
        tlb_s0_ps, //11:6  6
        tlb_s0_mat, //5:4  2
        tlb_s0_plv, //3:2  2
        tlb_s0_d,  //1:1   1
        tlb_s0_v   //0:0  1
};
assign tlb_to_es_bus = {
        tlb_s1_found,
        tlb_s1_index,
        tlb_s1_ppn,
        tlb_s1_ps,
        tlb_s1_mat,
        tlb_s1_plv,
        tlb_s1_d,
        tlb_s1_v
};
assign {
    tlb_s0_vppn,    //19:1
    tlb_s0_va_bit12 //0:0
} = fs_to_tlb_bus;
assign {
    tlb_s1_vppn,
    tlb_s1_asid,
    tlb_s1_va_bit12
} = es_to_tlb_bus;
// IF stage
if_stage if_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ds_allowin     (ds_allowin     ),
    //brbus
    .br_bus         (br_bus         ),
    //exception handling
    .ex_taken       (ws_ex          ),
    .ex_target      (pc_to_fs       ),
    //outputs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),
    //tlb & csr
    .tlb_to_fs_bus  (tlb_to_fs_bus),
    .fs_to_tlb_bus  (fs_to_tlb_bus),
    .csr_to_fs_bus  (csr_to_fs_bus),//TODO
    //inst sram interface
    .inst_sram_req  (inst_sram_req  ),
    .inst_sram_wr   (inst_sram_wr   ),
    .inst_sram_size (inst_sram_size ),
    .inst_sram_wstrb(inst_sram_wstrb),
    .inst_sram_addr (inst_sram_addr ),
    .inst_sram_wdata(inst_sram_wdata),
    .inst_sram_addr_ok(inst_sram_addr_ok),
    .inst_sram_data_ok(inst_sram_data_ok),
    .inst_sram_rdata(inst_sram_rdata)
);
// ID stage
id_stage id_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .es_allowin     (es_allowin     ),
    .ds_allowin     (ds_allowin     ),
    //from fs
    .fs_to_ds_valid (fs_to_ds_valid ),
    .fs_to_ds_bus   (fs_to_ds_bus   ),
    //to es
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //to fs
    .br_bus         (br_bus         ),
    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   ),
    //check related
    .es_related_bus (es_related_bus ),
    .ms_related_bus (ms_related_bus ),
    .ws_related_bus (ws_related_bus ),
    //exception handling
    .has_int        (has_int        ),
    .ds_ex          (ds_ex          ),
    .es_ex          (es_ex          ),
    .ms_ex          (ms_ex          ),
    .ws_ex          (ws_ex          )
);
// EXE stage
exe_stage exe_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ms_allowin     (ms_allowin     ),
    .es_allowin     (es_allowin     ),
    //from ds
    .ds_to_es_valid (ds_to_es_valid ),
    .ds_to_es_bus   (ds_to_es_bus   ),
    //to ms
    .es_to_ms_valid (es_to_ms_valid ),
    .es_to_ms_bus   (es_to_ms_bus   ),
    // data sram interface
    .data_sram_rdata(data_sram_rdata),
    .data_sram_data_ok(data_sram_data_ok),
    .data_sram_req  (data_sram_req  ),
    .data_sram_wr   (data_sram_wr   ),
    .data_sram_size (data_sram_size ),
    .data_sram_wstrb(data_sram_wstrb),
    .data_sram_addr (data_sram_addr ),
    .data_sram_wdata(data_sram_wdata),
    .data_sram_addr_ok(data_sram_addr_ok),
    //tlb
    .tlb_inv_bus    (tlb_inv_bus    ),
    .tlb_to_es_bus (tlb_to_es_bus),
    .es_to_tlb_bus (es_to_tlb_bus),
    .csr_to_es_bus (csr_to_es_bus),
    //check related
    .es_related_bus (es_related_bus ),
    //mul_result
    .es_mul_result  (es_mul_result  ),
    .es_ex          (es_ex          ),
    .ms_ex          (ms_ex          ),
    .ws_ex          (ws_ex          )
);
// MEM stage
mem_stage mem_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    .ms_allowin     (ms_allowin     ),
    //from es
    .es_to_ms_valid (es_to_ms_valid ),
    .es_to_ms_bus   (es_to_ms_bus   ),
    //to ws
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    //check related
    .ms_related_bus (ms_related_bus ),
    //mul_result
    .mul_result     (es_mul_result  ),
    //exception handling
    .ms_ex          (ms_ex          ),
    .ws_ex          (ws_ex          )
);
// WB stage
wb_stage wb_stage(
    .clk            (clk            ),
    .reset          (reset          ),
    //allowin
    .ws_allowin     (ws_allowin     ),
    //from ms
    .ms_to_ws_valid (ms_to_ws_valid ),
    .ms_to_ws_bus   (ms_to_ws_bus   ),
    //to rf: for write back
    .ws_to_rf_bus   (ws_to_rf_bus   ),
    //trace debug interface
    .debug_wb_pc      (debug_wb_pc      ),
    .debug_wb_rf_wen  (debug_wb_rf_wen  ),
    .debug_wb_rf_wnum (debug_wb_rf_wnum ),
    .debug_wb_rf_wdata(debug_wb_rf_wdata),
    //check related
    .ws_related_bus (ws_related_bus ),
    //tlb
    .ws_tlb_op (ws_tlb_op),
    .ws_valid_out (ws_valid),
    //exception handling
    .ws_ex_to_csr   (ws_ex_to_csr   ),
    .ws_ertn_flush  (ws_ertn_flush  ),
    .ws_ecode       (ws_ecode       ),
    .ws_esubcode    (ws_esubcode    ),
    .ws_vaddr       (ws_vaddr       ),
    .ws_csr_we      (ws_csr_we      ),
    .ws_csr_rnum    (ws_csr_rnum    ),
    .ws_csr_wmask   (ws_csr_wmask   ),
    .ws_csr_wvalue  (ws_csr_wvalue  ),
    .ws_csr_rvalue  (ws_csr_rvalue  ),
    .ws_ex          (ws_ex          )
);

csr_regfile csr_regfile(
    .clk            (clk            ),
    .reset          (reset          ),
    //ports for inst read and write
    .csr_we         (ws_csr_we      ),
    .csr_num        (ws_csr_rnum    ),
    .csr_wmask      (ws_csr_wmask   ),
    .csr_wvalue     (ws_csr_wvalue  ),
    .csr_rvalue     (ws_csr_rvalue  ),
    //tlb
    .tlb_op         (ws_tlb_op),
    .csr_tlb_in_bus (csr_tlb_in_bus ),
    .csr_tlb_out_bus(csr_tlb_out_bus),
    .ws_valid (ws_valid),
    //lab15
    .csr_to_fs_bus (csr_to_fs_bus),
    .csr_to_es_bus (csr_to_es_bus), 
    //ports for hardware interact
    .wb_ex          (ws_ex_to_csr   ),
    .wb_ecode       (ws_ecode       ),
    .wb_esubcode    (ws_esubcode    ),
    .wb_pc          (debug_wb_pc    ),
    .wb_vaddr       (ws_vaddr       ),
    .ertn_flush     (ws_ertn_flush  ),
    .hw_int_in      (hw_int_in      ),
    .ipi_int_in     (ipi_int_in     ),
    .pc_to_fs       (pc_to_fs       ),
    .has_int        (has_int        ),
    .csr_estat_rvalue(csr_estat_rvalue)
);

tlb u_tlb(
    .clk            (clk            ),
    .s0_vppn        (tlb_s0_vppn    ),
    .s0_asid        (tlb_s0_asid    ),
    .s0_va_bit12    (tlb_s0_va_bit12),
    .s0_found       (tlb_s0_found   ),
    .s0_index       (tlb_s0_index   ),
    .s0_ppn         (tlb_s0_ppn     ),
    .s0_ps          (tlb_s0_ps      ),
    .s0_mat         (tlb_s0_mat     ),
    .s0_plv         (tlb_s0_plv     ),
    .s0_d           (tlb_s0_d       ),
    .s0_v           (tlb_s0_v       ),
    .s1_vppn        (tlb_s1_vppn    ),
    .s1_asid        (tlb_s1_asid    ),
    .s1_va_bit12    (tlb_s1_va_bit12),
    .s1_found       (tlb_s1_found   ),
    .s1_index       (tlb_s1_index   ),
    .s1_ppn         (tlb_s1_ppn     ),
    .s1_ps          (tlb_s1_ps      ),
    .s1_mat         (tlb_s1_mat     ),
    .s1_plv         (tlb_s1_plv     ),
    .s1_d           (tlb_s1_d       ),
    .s1_v           (tlb_s1_v       ),
    .invtlb_valid   (tlb_inv_valid  ),
    .invtlb_op      (tlb_inv_op     ),
    .we             (tlb_we         ),
    .w_index        (tlb_w_index    ),
    .w_e            (tlb_w_e        ),
    .w_vppn         (tlb_w_vppn     ),
    .w_ps           (tlb_w_ps       ),
    .w_asid         (tlb_w_asid     ),
    .w_g            (tlb_w_g        ),
    .w_ppn0         (tlb_w_ppn0     ),
    .w_plv0         (tlb_w_plv0     ),
    .w_mat0         (tlb_w_mat0     ),
    .w_d0           (tlb_w_d0       ),
    .w_v0           (tlb_w_v0       ),
    .w_ppn1         (tlb_w_ppn1     ),
    .w_plv1         (tlb_w_plv1     ),
    .w_mat1         (tlb_w_mat1     ),
    .w_d1           (tlb_w_d1       ),
    .w_v1           (tlb_w_v1       ),
    .r_index        (tlb_r_index    ),
    .r_e            (tlb_r_e        ),
    .r_vppn         (tlb_r_vppn     ),
    .r_ps           (tlb_r_ps       ),
    .r_asid         (tlb_r_asid     ),
    .r_g            (tlb_r_g        ),
    .r_ppn0         (tlb_r_ppn0     ),
    .r_plv0         (tlb_r_plv0     ),
    .r_mat0         (tlb_r_mat0     ),
    .r_d0           (tlb_r_d0       ),
    .r_v0           (tlb_r_v0       ),
    .r_ppn1         (tlb_r_ppn1     ),
    .r_plv1         (tlb_r_plv1     ),
    .r_mat1         (tlb_r_mat1     ),
    .r_d1           (tlb_r_d1       ),
    .r_v1           (tlb_r_v1       )
);

endmodule
