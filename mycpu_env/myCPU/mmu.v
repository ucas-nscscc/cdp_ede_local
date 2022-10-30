`include "mycpu.h"

module mmu
#(
    parameter TLBNUM = 16
) 
(
    input clk,
    input reset,
    input [`ES_TO_MMU_BUS_WD  - 1:0] es_to_mmu_bus,
    input [`WS_TO_MMU_BUS_WD  - 1:0] ws_to_mmu_bus,
    input [`IH_TO_MMU_BUS_WD  - 1:0] ih_to_mmu_bus,
    input [`PFS_TO_MMU_BUS_WD - 1:0] pfs_to_mmu_bus,

    output [`MMU_TO_IH_BUS_WD - 1:0] mmu_to_ih_bus, 
    output [`MMU_TO_PFS_BUS_WD- 1:0] mmu_to_pfs_bus,
    output [`MMU_TO_ES_BUS_WD- 1:0] mmu_to_es_bus,

    output [31:0] inst_pa,
    output [31:0] data_pa
);

wire [31:0] inst_va;
wire [31:0] data_va;

wire inst_tlbsrch;
wire inst_tlbrd;
wire inst_tlbwr;
wire inst_tlbfill;
wire inst_invtlb;
wire inst_load;
wire inst_store;
wire [4:0] inst_invtlb_op;
wire [31:0] rj;
wire [31:0] rk;

wire        r_dmw1_plv0;
wire        r_dmw1_plv3;
wire [ 1:0] r_dmw1_mat;
wire [ 2:0] r_dmw1_vseg;
wire [ 2:0] r_dmw1_pseg;
wire        r_dmw0_plv0;
wire        r_dmw0_plv3;
wire [ 1:0] r_dmw0_mat;
wire [ 2:0] r_dmw0_vseg;
wire [ 2:0] r_dmw0_pseg;
wire [ 1:0] r_crmd_plv;
wire        r_crmd_da;
wire        r_crmd_pg;
wire [ 5:0] r_estat_ecode;
wire [ 9:0] r_asid_asid;
wire [18:0] r_tlbehi_vppn;
wire [$clog2(TLBNUM) - 1:0] r_tlbidx_index;
wire [ 5:0] r_tlbidx_ps;
wire        r_tlbidx_ne;
wire        r_tlbelo0_v;
wire        r_tlbelo0_d;
wire [ 1:0] r_tlbelo0_plv;
wire [ 1:0] r_tlbelo0_mat;
wire        r_tlbelo0_g;
wire [23:0] r_tlbelo0_ppn;
wire        r_tlbelo1_v;
wire        r_tlbelo1_d;
wire [ 1:0] r_tlbelo1_plv;
wire [ 1:0] r_tlbelo1_mat;
wire        r_tlbelo1_g;
wire [23:0] r_tlbelo1_ppn;

wire [ 9:0] w_asid_asid;
wire [18:0] w_tlbehi_vppn;
wire [$clog2(TLBNUM)-1:0] w_tlbidx_index;
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

// random tlbfill index
reg [$clog2(TLBNUM) - 1:0] cnt;

// search port 0
wire [18:0] s0_vppn;
wire        s0_va_bit12;
wire [9 :0] s0_asid;
wire        s0_found;
wire [$clog2(TLBNUM)-1:0]s0_index;
wire [19:0] s0_ppn;
wire [5 :0] s0_ps;
wire [1 :0] s0_plv;
wire [1 :0] s0_mat;
wire        s0_d;
wire        s0_v;
// search port 1
wire [18:0] s1_vppn;
wire        s1_va_bit12;
wire [9 :0] s1_asid;
wire        s1_found;
wire [$clog2(TLBNUM)-1:0] s1_index;
wire [19:0] s1_ppn;
wire [5 :0] s1_ps;
wire [1 :0] s1_plv;
wire [1 :0] s1_mat;
wire        s1_d;
wire        s1_v;
//invtlb port
wire        invtlb_valid;
wire [ 4:0] invtlb_op;
// write port
wire        we;
wire [$clog2(TLBNUM)-1:0] w_index;
wire        w_e;
wire [18:0] w_vppn;
wire [5 :0] w_ps  ;
wire [9 :0] w_asid;
wire        w_g;
wire [19:0] w_ppn0;
wire [1 :0] w_plv0;
wire [1 :0] w_mat0;
wire        w_d0;
wire        w_v0;
wire [19:0] w_ppn1;
wire [1 :0] w_plv1;
wire [1 :0] w_mat1;
wire        w_d1;
wire        w_v1;
// read port
wire [$clog2(TLBNUM)-1:0] r_index;
wire        r_e;
wire [18:0] r_vppn;
wire [5 :0] r_ps;
wire [9 :0] r_asid;
wire        r_g;
wire [19:0] r_ppn0;
wire [1 :0] r_plv0;
wire [1 :0] r_mat0;
wire        r_d0;
wire        r_v0;
wire [19:0] r_ppn1;
wire [1 :0] r_plv1;
wire [1 :0] r_mat1;
wire        r_d1;
wire        r_v1;

// address translate
wire da_hit;
wire pg_hit;
wire inst_dmw0_hit;
wire data_dmw0_hit;      
wire inst_dmw1_hit;
wire data_dmw1_hit;
wire inst_tlb_hit;
wire data_tlb_hit;
wire [3:0] inst_trans_mode;
wire [3:0] data_trans_mode;

wire [31:0] inst_da_pa;
wire [31:0] inst_dmw0_pa;
wire [31:0] inst_dmw1_pa;
wire [31:0] inst_tlb_pa;
wire [31:0] data_da_pa;
wire [31:0] data_dmw0_pa;
wire [31:0] data_dmw1_pa;
wire [31:0] data_tlb_pa;

// TLB exception
wire adem;
wire adef;
wire pil;
wire pis;
wire pif;
wire pme;
wire inst_ppi;
wire data_ppi;
wire inst_tlbr;
wire data_tlbr;

assign da_hit = r_crmd_da;
assign pg_hit = r_crmd_pg;
assign inst_dmw0_hit = (r_dmw0_vseg == inst_va[31:29]) && 
                      ((r_dmw0_plv0 & (r_crmd_plv == 2'd0)) || 
                       (r_dmw0_plv3 & (r_crmd_plv == 2'd3)));
assign data_dmw0_hit = (r_dmw0_vseg == data_va[31:29]) && 
                      ((r_dmw0_plv0 & (r_crmd_plv == 2'd0)) || 
                       (r_dmw0_plv3 & (r_crmd_plv == 2'd3)));
assign inst_dmw1_hit = (r_dmw1_vseg == inst_va[31:29]) && 
                      ((r_dmw1_plv0 & (r_crmd_plv == 2'd0)) || 
                       (r_dmw1_plv3 & (r_crmd_plv == 2'd3)));
assign data_dmw1_hit = (r_dmw1_vseg == data_va[31:29]) && 
                      ((r_dmw1_plv0 & (r_crmd_plv == 2'd0)) || 
                       (r_dmw1_plv3 & (r_crmd_plv == 2'd3)));
assign inst_tlb_hit = s0_found;
assign data_tlb_hit = s1_found;
assign inst_trans_mode[0] = da_hit;
assign inst_trans_mode[1] = pg_hit & inst_dmw0_hit;
assign inst_trans_mode[2] = pg_hit & inst_dmw1_hit;
assign inst_trans_mode[3] = pg_hit & ~inst_dmw0_hit & ~inst_dmw1_hit & inst_tlb_hit;
assign data_trans_mode[0] = da_hit;
assign data_trans_mode[1] = pg_hit & data_dmw0_hit;
assign data_trans_mode[2] = pg_hit & data_dmw1_hit;
assign data_trans_mode[3] = pg_hit & ~data_dmw0_hit & ~data_dmw1_hit & data_tlb_hit;

//va2pa
assign inst_da_pa = inst_va;
assign inst_dmw0_pa = {r_dmw0_pseg, inst_va[28:0]};
assign inst_dmw1_pa = {r_dmw1_pseg, inst_va[28:0]};
assign inst_tlb_pa = {s0_ppn[19:10], (s0_ps == 6'h0c) ? s0_ppn[9:0] : inst_va[21:12], inst_va[11:0]}; 
assign data_da_pa = data_va;
assign data_dmw0_pa = {r_dmw0_pseg, data_va[28:0]};
assign data_dmw1_pa = {r_dmw1_pseg, data_va[28:0]};
assign data_tlb_pa = {s1_ppn[19:10], (s1_ps == 6'h0c) ? s1_ppn[9:0] : data_va[21:12], data_va[11:0]};

assign inst_pa = {32{inst_trans_mode[0]}} & inst_da_pa |
                 {32{inst_trans_mode[1]}} & inst_dmw0_pa |
                 {32{inst_trans_mode[2]}} & inst_dmw1_pa |
                 {32{inst_trans_mode[3]}} & inst_tlb_pa;
assign data_pa = {32{data_trans_mode[0]}} & data_da_pa |
                 {32{data_trans_mode[1]}} & data_dmw0_pa |
                 {32{data_trans_mode[2]}} & data_dmw1_pa |
                 {32{data_trans_mode[3]}} & data_tlb_pa;

assign adef = ((inst_va[31] & r_crmd_plv == 2'b11) | |inst_va[1:0]);
assign adem = (inst_load | inst_store) & data_va[31] & r_crmd_plv == 2'b11;
assign pil = inst_load & data_trans_mode[3] & ~s1_v;
assign pis = inst_store & data_trans_mode[3] & ~s1_v;
assign pif = inst_trans_mode[3] & ~s0_v;
assign pme = inst_store & data_trans_mode[3] & s1_v & ((s1_plv == r_crmd_plv) | (r_crmd_plv == 2'b11)) & ~s1_d;
assign inst_ppi = inst_trans_mode[3] & s0_v & (s0_plv == 2'b00) & (r_crmd_plv == 2'b11);
assign data_ppi = (inst_load | inst_store) & data_trans_mode[3] & s1_v & (s1_plv == 2'b00) & (r_crmd_plv == 2'b11);
assign inst_tlbr = pg_hit & ~inst_dmw0_hit & ~inst_dmw1_hit & ~s0_found;
assign data_tlbr = (inst_load | inst_store) & pg_hit & ~data_dmw0_hit & ~data_dmw1_hit & ~s1_found;

assign {
    inst_va
} = pfs_to_mmu_bus;

assign {
    inst_load     ,
    inst_store    ,
    data_va       ,
    inst_tlbsrch  ,
    inst_invtlb   ,
    inst_invtlb_op,
    rj            , 
    rk
} = es_to_mmu_bus;

assign {
    inst_tlbfill,
    inst_tlbwr  ,
    inst_tlbrd  
} = ws_to_mmu_bus;

assign {
    r_dmw1_plv0   ,
    r_dmw1_plv3   ,
    r_dmw1_mat    ,
    r_dmw1_vseg   ,
    r_dmw1_pseg   ,
    r_dmw0_plv0   ,
    r_dmw0_plv3   ,
    r_dmw0_mat    ,
    r_dmw0_vseg   ,
    r_dmw0_pseg   ,
    r_crmd_plv    ,
    r_crmd_da     ,
    r_crmd_pg     ,
    r_estat_ecode ,
    r_asid_asid   ,
    r_tlbehi_vppn ,
    r_tlbidx_index,
    r_tlbidx_ps   ,
    r_tlbidx_ne   ,
    r_tlbelo0_v   ,
    r_tlbelo0_d   ,
    r_tlbelo0_plv ,
    r_tlbelo0_mat ,
    r_tlbelo0_g   ,
    r_tlbelo0_ppn ,
    r_tlbelo1_v   ,
    r_tlbelo1_d   ,
    r_tlbelo1_plv ,
    r_tlbelo1_mat ,
    r_tlbelo1_g   ,
    r_tlbelo1_ppn  
} = ih_to_mmu_bus;

assign mmu_to_ih_bus = {
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
};

assign mmu_to_pfs_bus = {
    adef,
    pif,
    inst_ppi,
    inst_tlbr
};

assign mmu_to_es_bus = {
    adem,
    pil,
    pis,
    pme,
    data_ppi,
    data_tlbr
};

// inst_tlbsrch
assign s0_vppn = inst_va[31:13];
assign s0_va_bit12 = inst_va[12];
assign s0_asid = r_asid_asid;
assign s1_vppn = {19{inst_tlbsrch}} & r_tlbehi_vppn |
                 {19{inst_invtlb}} & rk[31:13] | 
                 {19{inst_load | inst_store}} & data_va[31:13];
assign s1_va_bit12 = inst_invtlb & rk[12] |
                     (inst_load | inst_store) & data_va[12];
assign s1_asid = {10{inst_tlbsrch | inst_load | inst_store}} & r_asid_asid | 
                 {10{inst_invtlb}} & rj[9:0];

assign invtlb_valid = inst_invtlb;
assign invtlb_op = inst_invtlb_op;

assign we      = inst_tlbwr | inst_tlbfill;
assign w_index = {$clog2(TLBNUM){inst_tlbwr}} & r_tlbidx_index |
                 {$clog2(TLBNUM){inst_tlbfill}} & cnt;
assign w_e     = we & ~(r_estat_ecode == 6'h3f) & ~r_tlbidx_ne |
                 we &  (r_estat_ecode == 6'h3f) & 1'b1;
assign w_ps    = {6{we}} & r_tlbidx_ps;
assign w_vppn  = {19{we}} & r_tlbehi_vppn;
assign w_asid  = {10{we}} & r_asid_asid;
assign w_g     = we & r_tlbelo0_g & r_tlbelo1_g;
assign w_ppn0  = {20{we}} & r_tlbelo0_ppn[19:0];
assign w_plv0  = {2{we}} & r_tlbelo0_plv; 
assign w_mat0  = {2{we}} & r_tlbelo0_mat; 
assign w_d0    = we & r_tlbelo0_d; 
assign w_v0    = we & r_tlbelo0_v; 
assign w_ppn1  = {20{we}} & r_tlbelo1_ppn[19:0];
assign w_plv1  = {2{we}} & r_tlbelo1_plv; 
assign w_mat1  = {2{we}} & r_tlbelo1_mat; 
assign w_d1    = we & r_tlbelo1_d; 
assign w_v1    = we & r_tlbelo1_v; 


assign r_index = {$clog2(TLBNUM){inst_tlbrd}} & r_tlbidx_index;

// assign w_asid_asid = {10{inst_tlbrd & r_e}} & r_asid;
// assign w_tlbehi_vppn = {19{inst_tlbrd & r_e}} & r_vppn;
// assign w_tlbidx_index = {$clog2(TLBNUM){inst_tlbsrch & s1_found}} & s1_index;
// assign w_tlbidx_ps = {6{inst_tlbrd & r_e}} & r_ps;
// assign w_tlbidx_ne = inst_tlbsrch & ~s1_found |
//                      inst_tlbrd   & ~r_e      ;
// assign w_tlbelo0_v = (inst_tlbrd & r_e) & r_v0;
// assign w_tlbelo0_d = (inst_tlbrd & r_e) & r_d0;
// assign w_tlbelo0_plv = {2{inst_tlbrd & r_e}} & r_plv0;
// assign w_tlbelo0_mat = {2{inst_tlbrd & r_e}} & r_mat0;
// assign w_tlbelo0_g = (inst_tlbrd & r_e) & r_g;
// assign w_tlbelo0_ppn = {24{inst_tlbrd & r_e}} & {4'h0, r_ppn0}; 
// assign w_tlbelo1_v = (inst_tlbrd & r_e) & r_v1;
// assign w_tlbelo1_d = (inst_tlbrd & r_e) & r_d1;
// assign w_tlbelo1_plv = {2{inst_tlbrd & r_e}} & r_plv1;
// assign w_tlbelo1_mat = {2{inst_tlbrd & r_e}} & r_mat1;
// assign w_tlbelo1_g = (inst_tlbrd & r_e) & r_g;
// assign w_tlbelo1_ppn = {24{inst_tlbrd & r_e}} & {4'h0, r_ppn1};

assign w_asid_asid = {10{inst_tlbrd}} & r_asid;
assign w_tlbehi_vppn = {19{inst_tlbrd}} & r_vppn;
assign w_tlbidx_index = {$clog2(TLBNUM){inst_tlbsrch & s1_found}} & s1_index;
assign w_tlbidx_ps = {6{inst_tlbrd}} & r_ps;
assign w_tlbidx_ne = inst_tlbsrch & ~s1_found |
                     inst_tlbrd   & ~r_e      ;
assign w_tlbelo0_v = (inst_tlbrd) & r_v0;
assign w_tlbelo0_d = (inst_tlbrd) & r_d0;
assign w_tlbelo0_plv = {2{inst_tlbrd}} & r_plv0;
assign w_tlbelo0_mat = {2{inst_tlbrd}} & r_mat0;
assign w_tlbelo0_g = (inst_tlbrd) & r_g;
assign w_tlbelo0_ppn = {24{inst_tlbrd}} & {4'h0, r_ppn0}; 
assign w_tlbelo1_v = (inst_tlbrd) & r_v1;
assign w_tlbelo1_d = (inst_tlbrd) & r_d1;
assign w_tlbelo1_plv = {2{inst_tlbrd}} & r_plv1;
assign w_tlbelo1_mat = {2{inst_tlbrd}} & r_mat1;
assign w_tlbelo1_g = (inst_tlbrd) & r_g;
assign w_tlbelo1_ppn = {24{inst_tlbrd}} & {4'h0, r_ppn1}; 

always @(posedge clk) begin
    if (reset) begin
        cnt <= 4'h0;
    end else begin
        cnt <= cnt + 1'b1;
    end
end

tlb #(.TLBNUM(16)) u_tlb (
    .clk        (clk        ),
    .s0_vppn    (s0_vppn    ),
    .s0_va_bit12(s0_va_bit12),
    .s0_asid    (s0_asid    ),
    .s0_found   (s0_found   ),
    .s0_index   (s0_index   ),
    .s0_ppn     (s0_ppn     ),
    .s0_ps      (s0_ps      ),
    .s0_plv     (s0_plv     ),
    .s0_mat     (s0_mat     ),
    .s0_d       (s0_d       ),
    .s0_v       (s0_v       ),

    .s1_vppn    (s1_vppn    ),
    .s1_va_bit12(s1_va_bit12),
    .s1_asid    (s1_asid    ),
    .s1_found   (s1_found   ),
    .s1_index   (s1_index   ),
    .s1_ppn     (s1_ppn     ),
    .s1_ps      (s1_ps      ),
    .s1_plv     (s1_plv     ),
    .s1_mat     (s1_mat     ),
    .s1_d       (s1_d       ),
    .s1_v       (s1_v       ),

    .invtlb_valid(invtlb_valid),
    .invtlb_op  (invtlb_op),

    .we         (we         ),
    .w_index    (w_index    ),
    .w_e        (w_e        ),
    .w_vppn     (w_vppn     ),
    .w_ps       (w_ps       ),
    .w_asid     (w_asid     ),
    .w_g        (w_g        ),
    .w_ppn0     (w_ppn0     ),
    .w_plv0     (w_plv0     ),
    .w_mat0     (w_mat0     ),
    .w_d0       (w_d0       ),
    .w_v0       (w_v0       ),
    .w_ppn1     (w_ppn1     ),
    .w_plv1     (w_plv1     ),
    .w_mat1     (w_mat1     ),
    .w_d1       (w_d1       ),
    .w_v1       (w_v1       ),

    .r_index    (r_index    ),
    .r_e        (r_e        ),
    .r_vppn     (r_vppn     ),
    .r_ps       (r_ps       ),
    .r_asid     (r_asid     ),
    .r_g        (r_g        ),
    .r_ppn0     (r_ppn0     ),
    .r_plv0     (r_plv0     ),
    .r_mat0     (r_mat0     ),
    .r_d0       (r_d0       ),
    .r_v0       (r_v0       ),
    .r_ppn1     (r_ppn1     ),
    .r_plv1     (r_plv1     ),
    .r_mat1     (r_mat1     ),
    .r_d1       (r_d1       ),
    .r_v1       (r_v1       )
);


endmodule //mmu