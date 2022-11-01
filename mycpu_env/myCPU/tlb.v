`default_nettype wire
module tlb
#(
    parameter TLBNUM = 16
)
(
    input clk,
    // search port 0 (for fetch)
    input  [              18:0] s0_vppn    ,
    input                       s0_va_bit12,
    input  [               9:0] s0_asid    ,
    output                      s0_found   ,
    output [$clog2(TLBNUM)-1:0] s0_index   ,
    output [              19:0] s0_ppn     ,
    output [               5:0] s0_ps      ,
    output [               1:0] s0_plv     ,
    output [               1:0] s0_mat     ,
    output                      s0_d       ,
    output                      s0_v       ,
    // search port 1 (for load/store)
    input  [              18:0] s1_vppn    ,
    input                       s1_va_bit12,
    input  [               9:0] s1_asid    ,
    output                      s1_found   ,
    output [$clog2(TLBNUM)-1:0] s1_index   ,
    output [              19:0] s1_ppn     ,
    output [               5:0] s1_ps      ,
    output [               1:0] s1_plv     ,
    output [               1:0] s1_mat     ,
    output                      s1_d       ,
    output                      s1_v       ,
    // invtlb opcode
    input        invtlb_valid,
    input [ 4:0] invtlb_op   ,
    // write port
    input                      we     , //w(rite) e(nable)
    input [$clog2(TLBNUM)-1:0] w_index,
    input                      w_e    ,
    input [               5:0] w_ps   ,
    input [              18:0] w_vppn ,
    input [               9:0] w_asid ,
    input                      w_g    ,
    input [              19:0] w_ppn0 ,
    input [               1:0] w_plv0 ,
    input [               1:0] w_mat0 ,
    input                      w_d0   ,
    input                      w_v0   ,
    input [              19:0] w_ppn1 ,
    input [               1:0] w_plv1 ,
    input [               1:0] w_mat1 ,
    input                      w_d1   ,
    input                      w_v1   ,
    // read port
    input [$clog2(TLBNUM)-1:0] r_index,
    output                     r_e    ,
    output [             18:0] r_vppn ,
    output [              5:0] r_ps   ,
    output [              9:0] r_asid ,
    output                     r_g    ,
    output [             19:0] r_ppn0 ,
    output [              1:0] r_plv0 ,
    output [              1:0] r_mat0 ,
    output                     r_d0   ,
    output                     r_v0   ,
    output [             19:0] r_ppn1 ,
    output [              1:0] r_plv1 ,
    output [              1:0] r_mat1 ,
    output                     r_d1   ,
    output                     r_v1
);

// TLB entries
// +-----------------------+----------+---+--------+---+
// |          VPPN         |    PS    | G |  ASID  | E |
// +-----------------------+----------+---+--------+---+
//
// +---------------------------+------+------+----+----+
// |           PPN0            | PLV0 | MAT0 | D0 | v0 |
// +---------------------------+------+------+----+----+
//
// +---------------------------+------+------+----+----+
// |           PPN1            | PLV0 | MAT0 | D0 | v0 |
// +---------------------------+------+------+----+----+

// TLB registers
reg [TLBNUM-1:0] tlb_e                ;
reg [TLBNUM-1:0] tlb_ps4MB            ; //pagesize 1:4MB, 0:4KB
reg [      18:0] tlb_vppn [TLBNUM-1:0];
reg [       9:0] tlb_asid [TLBNUM-1:0];
reg              tlb_g    [TLBNUM-1:0];

reg [ 19:0] tlb_ppn0 [TLBNUM-1:0];
reg [  1:0] tlb_plv0 [TLBNUM-1:0];
reg [  1:0] tlb_mat0 [TLBNUM-1:0];
reg         tlb_d0   [TLBNUM-1:0];
reg         tlb_v0   [TLBNUM-1:0];

reg [ 19:0] tlb_ppn1 [TLBNUM-1:0];
reg [ 1:0]  tlb_plv1 [TLBNUM-1:0];
reg [ 1:0]  tlb_mat1 [TLBNUM-1:0];
reg         tlb_d1   [TLBNUM-1:0];
reg         tlb_v1   [TLBNUM-1:0];

// search match
wire s0_even_or_odd; // 0 even, 1 odd
wire s1_even_or_odd;
wire [TLBNUM - 1:0] match0;
wire [TLBNUM - 1:0] match1;

// INVTLB support
wire [TLBNUM - 1:0] inv_g_not_zero ;
wire [TLBNUM - 1:0] inv_asid_equ   ;
wire [TLBNUM - 1:0] inv_va_equ     ;
wire [TLBNUM - 1:0] inv_set_invalid;

/* search port 0 */
genvar j;
generate
    for (j = 0; j < TLBNUM; j = j + 1) begin : gen_match0
        assign match0[j] = (s0_vppn[18:10] == tlb_vppn[j][18:10])
                        && (tlb_ps4MB[j] || s0_vppn[9:0] == tlb_vppn[j][9:0])
                        && ((s0_asid == tlb_asid[j]) || tlb_g[j]);
    end
endgenerate

assign s0_even_or_odd =  tlb_ps4MB[s0_index] & s0_vppn[9] |
                        ~tlb_ps4MB[s0_index] & s0_va_bit12;
assign s0_found  = |match0;
assign s0_index  = {4{match0[ 0]}} & 4'h0 | 
                   {4{match0[ 1]}} & 4'h1 |
                   {4{match0[ 2]}} & 4'h2 |
                   {4{match0[ 3]}} & 4'h3 |
                   {4{match0[ 4]}} & 4'h4 |
                   {4{match0[ 5]}} & 4'h5 |
                   {4{match0[ 6]}} & 4'h6 |
                   {4{match0[ 7]}} & 4'h7 |
                   {4{match0[ 8]}} & 4'h8 |
                   {4{match0[ 9]}} & 4'h9 |
                   {4{match0[10]}} & 4'hA |
                   {4{match0[11]}} & 4'hB |
                   {4{match0[12]}} & 4'hC |
                   {4{match0[13]}} & 4'hD |
                   {4{match0[14]}} & 4'hE |
                   {4{match0[15]}} & 4'hF ;
assign s0_ppn = s0_even_or_odd ? tlb_ppn1[s0_index] : tlb_ppn0[s0_index];
assign s0_ps  = tlb_ps4MB[s0_index] ? 6'h16              :              6'h0c;
assign s0_plv = s0_even_or_odd         ? tlb_plv1[s0_index] : tlb_plv0[s0_index];
assign s0_mat = s0_even_or_odd         ? tlb_mat1[s0_index] : tlb_mat0[s0_index];
assign s0_d   = s0_even_or_odd         ? tlb_d1  [s0_index] : tlb_d0  [s0_index];
assign s0_v   = s0_even_or_odd         ? tlb_v1  [s0_index] : tlb_v0  [s0_index];


/* search port 1 */
generate
    for (j = 0; j < TLBNUM; j = j + 1) begin : gen_match1
        assign match1[j] = (s1_vppn[18:10] == tlb_vppn[j][18:10])
                        && (tlb_ps4MB[j] || s1_vppn[9:0] == tlb_vppn[j][9:0])
                        && ((s1_asid==tlb_asid[j]) || tlb_g[j]);
    end
endgenerate

assign s1_even_or_odd =  tlb_ps4MB[s1_index] & s1_vppn[9] |
                        ~tlb_ps4MB[s1_index] & s1_va_bit12;
assign s1_found  = |match1;
assign s1_index  = {4{match1[ 0]}} & 4'h0 | 
                   {4{match1[ 1]}} & 4'h1 |
                   {4{match1[ 2]}} & 4'h2 |
                   {4{match1[ 3]}} & 4'h3 |
                   {4{match1[ 4]}} & 4'h4 |
                   {4{match1[ 5]}} & 4'h5 |
                   {4{match1[ 6]}} & 4'h6 |
                   {4{match1[ 7]}} & 4'h7 |
                   {4{match1[ 8]}} & 4'h8 |
                   {4{match1[ 9]}} & 4'h9 |
                   {4{match1[10]}} & 4'hA |
                   {4{match1[11]}} & 4'hB |
                   {4{match1[12]}} & 4'hC |
                   {4{match1[13]}} & 4'hD |
                   {4{match1[14]}} & 4'hE |
                   {4{match1[15]}} & 4'hF ;
assign s1_ppn = s1_even_or_odd ? tlb_ppn1[s1_index] : tlb_ppn0[s1_index];
assign s1_ps  = tlb_ps4MB[s1_index]   ? 6'h16              :              6'h0c;
assign s1_plv = s1_even_or_odd           ? tlb_plv1[s1_index] : tlb_plv0[s1_index];
assign s1_mat = s1_even_or_odd           ? tlb_mat1[s1_index] : tlb_mat0[s1_index];
assign s1_d   = s1_even_or_odd           ? tlb_d1  [s1_index] : tlb_d0  [s1_index];
assign s1_v   = s1_even_or_odd           ? tlb_v1  [s1_index] : tlb_v0  [s1_index];

/* read port */
assign r_e    = tlb_e    [r_index];
assign r_vppn = tlb_vppn [r_index];
assign r_ps   = tlb_ps4MB[r_index] ? 6'h16 : 6'h0c;
assign r_asid = tlb_asid [r_index];
assign r_g    = tlb_g    [r_index];
assign r_ppn0 = tlb_ppn0 [r_index];
assign r_plv0 = tlb_plv0 [r_index];
assign r_mat0 = tlb_mat0 [r_index];
assign r_d0   = tlb_d0   [r_index];
assign r_v0   = tlb_v0   [r_index];
assign r_ppn1 = tlb_ppn1 [r_index];
assign r_plv1 = tlb_plv1 [r_index];
assign r_mat1 = tlb_mat1 [r_index];
assign r_d1   = tlb_d1   [r_index];
assign r_v1   = tlb_v1   [r_index];

/* write port */
always @(posedge clk) begin
    if (invtlb_valid) begin
        tlb_e <= ~inv_set_invalid & tlb_e; 
    end else if (we) begin
        tlb_e    [w_index] <= w_e          ;
        tlb_ps4MB[w_index] <= w_ps == 6'h16;
        tlb_vppn [w_index] <= w_vppn       ;
        tlb_asid [w_index] <= w_asid       ;
        tlb_g    [w_index] <= w_g          ;
        tlb_ppn0 [w_index] <= w_ppn0       ;
        tlb_plv0 [w_index] <= w_plv0       ;
        tlb_mat0 [w_index] <= w_mat0       ;
        tlb_d0   [w_index] <= w_d0         ;
        tlb_v0   [w_index] <= w_v0         ;
        tlb_ppn1 [w_index] <= w_ppn1       ;
        tlb_plv1 [w_index] <= w_plv1       ;
        tlb_mat1 [w_index] <= w_mat1       ;
        tlb_d1   [w_index] <= w_d1         ;
        tlb_v1   [w_index] <= w_v1         ;
    end
end

/* invtlb support */
generate
    for (j = 0; j < TLBNUM; j = j + 1) begin : gen_inv_g_not_zero
        assign inv_g_not_zero[j] = tlb_g[j];
    end
endgenerate

generate
    for (j = 0; j < TLBNUM; j = j + 1) begin : gen_inv_asid_equ
        assign inv_asid_equ[j] = s1_asid == tlb_asid[j];
    end
endgenerate

generate
    for (j = 0; j < TLBNUM; j = j + 1) begin : gen_inv_va_equ
        assign inv_va_equ[j] = (s1_vppn[18:10] == tlb_vppn[j][18:10]) && 
                               (tlb_ps4MB[j] || s1_vppn[9:0] == tlb_vppn[j][9:0]);
    end
endgenerate

assign inv_set_invalid = {TLBNUM{invtlb_op == 5'h00}} & {16'hFFFF}                                  |
                         {TLBNUM{invtlb_op == 5'h01}} & {16'hFFFF}                                  | 
                         {TLBNUM{invtlb_op == 5'h02}} &  inv_g_not_zero                             |
                         {TLBNUM{invtlb_op == 5'h03}} & ~inv_g_not_zero                             |
                         {TLBNUM{invtlb_op == 5'h04}} & ~inv_g_not_zero & inv_asid_equ              |
                         {TLBNUM{invtlb_op == 5'h05}} & ~inv_g_not_zero & inv_asid_equ & inv_va_equ |
                         {TLBNUM{invtlb_op == 5'h06}} & (inv_g_not_zero | inv_asid_equ) & inv_va_equ;

endmodule