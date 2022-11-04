module tlb
#(
    parameter TLBNUM = 16
)
(
    input clk,
    // search port 0 (for fetch)
    input  [18:0]                 s0_vppn     ,
    input  [ 9:0]                 s0_asid     ,
    input                         s0_va_bit12 ,
    output                        s0_found    ,
    output [$clog2(TLBNUM) -1:0]  s0_index    ,
    output [19:0]                 s0_ppn      ,
    output [ 5:0]                 s0_ps       ,
    output [ 1:0]                 s0_plv      ,
    output [ 1:0]                 s0_mat      ,
    output                        s0_d        ,
    output                        s0_v        ,
    // search port 1 (for load/store)
    input  [18:0]                 s1_vppn     ,
    input  [ 9:0]                 s1_asid     ,
    input                         s1_va_bit12 ,
    output                        s1_found    ,
    output [$clog2(TLBNUM) -1:0]  s1_index    ,
    output [19:0]                 s1_ppn      ,
    output [ 5:0]                 s1_ps       ,
    output [ 1:0]                 s1_plv      ,
    output [ 1:0]                 s1_mat      ,
    output                        s1_d        ,
    output                        s1_v        ,
    // invtlb opcode
    input                         invtlb_valid,
    input  [ 4:0]                 invtlb_op   , //TODO
    // write port
    input                         we          , //w(rite) e(nable)
    input  [$clog2(TLBNUM) -1:0]  w_index     ,
    input                         w_e         ,
    input  [18:0]                 w_vppn      ,
    input  [ 5:0]                 w_ps        ,
    input  [ 9:0]                 w_asid      ,
    input                         w_g         ,
    input  [19:0]                 w_ppn0      ,
    input  [ 1:0]                 w_plv0      ,
    input  [ 1:0]                 w_mat0      ,
    input                         w_d0        ,
    input                         w_v0        ,
    input  [19:0]                 w_ppn1      ,
    input  [ 1:0]                 w_plv1      ,
    input  [ 1:0]                 w_mat1      ,
    input                         w_d1        ,
    input                         w_v1        ,
    // read port
    input  [$clog2(TLBNUM) -1:0]  r_index     ,
    output                        r_e         ,
    output [18:0]                 r_vppn      ,
    output [ 5:0]                 r_ps        ,
    output [ 9:0]                 r_asid      , 
    output                        r_g         ,
    output [19:0]                 r_ppn0      ,
    output [ 1:0]                 r_plv0      ,
    output [ 1:0]                 r_mat0      ,
    output                        r_d0        ,
    output                        r_v0        ,
    output [19:0]                 r_ppn1      ,
    output [ 1:0]                 r_plv1      ,
    output [ 1:0]                 r_mat1      ,
    output                        r_d1        ,
    output                        r_v1
);

reg [TLBNUM -1:0] tlb_e;
reg [TLBNUM -1:0] tlb_ps4MB; //pagesize 1:4MB, 0:4KB
reg [18:0]        tlb_vppn [TLBNUM -1:0];
reg [ 9:0]        tlb_asid [TLBNUM -1:0];
reg tlb_g  [TLBNUM -1:0];
reg [19:0]        tlb_ppn0 [TLBNUM -1:0];
reg [ 1:0]        tlb_plv0 [TLBNUM -1:0];
reg [ 1:0]        tlb_mat0 [TLBNUM -1:0];
reg tlb_d0 [TLBNUM -1:0];
reg tlb_v0 [TLBNUM -1:0];
reg [19:0]        tlb_ppn1 [TLBNUM -1:0];
reg [ 1:0]        tlb_plv1 [TLBNUM -1:0];
reg [ 1:0]        tlb_mat1 [TLBNUM -1:0];
reg tlb_d1 [TLBNUM -1:0];
reg tlb_v1 [TLBNUM -1:0];

wire [$clog2(TLBNUM) -1:0] s0_index_gen [TLBNUM -1:0];
wire [$clog2(TLBNUM) -1:0] s1_index_gen [TLBNUM -1:0];
wire [TLBNUM -1:0] match0;
wire [TLBNUM -1:0] match1;
wire [TLBNUM -1:0] inv_match;
wire odd_page0;
wire odd_page1;

genvar i;
generate 
  for(i = 0; i < TLBNUM; i = i + 1) 
    begin: tlb_search
      assign match0[i] = (s0_vppn[18:10]==tlb_vppn[i][18:10])
                      && (tlb_ps4MB[i] || s0_vppn[9:0]==tlb_vppn[i][9:0])
                      && ((s0_asid==tlb_asid[i]) || tlb_g[i]);
      assign match1[i] = (s1_vppn[18:10]==tlb_vppn[i][18:10])
                      && (tlb_ps4MB[i] || s1_vppn[9:0]==tlb_vppn[i][9:0])
                      && ((s1_asid==tlb_asid[i]) || tlb_g[i]);
      if (i == 0) 
        begin
          assign s0_index_gen[i] = {$clog2(TLBNUM){match0[i]}} & i;
          assign s1_index_gen[i] = {$clog2(TLBNUM){match1[i]}} & i;
        end 
        else begin
          assign s0_index_gen[i] = s0_index_gen[i - 1] | ({$clog2(TLBNUM){match0[i]}} & i);
          assign s1_index_gen[i] = s1_index_gen[i - 1] | ({$clog2(TLBNUM){match1[i]}} & i);
        end
      assign inv_match[i] =  ( invtlb_op == 5'h0) | 
                             ( invtlb_op == 5'h1) | 
                             ((invtlb_op == 5'h2) & ( tlb_g[i] == 1'h1)) |
                             ((invtlb_op == 5'h3) & ( tlb_g[i] == 1'h0)) |
                             ((invtlb_op == 5'h4) & ( tlb_g[i] == 1'h0) & (s1_asid == tlb_asid[i])) |
                             ((invtlb_op == 5'h5) & ( tlb_g[i] == 1'h0) & (s1_asid == tlb_asid[i] ) 
                              & (s1_vppn[18:10] == tlb_vppn[i][18:10]) & (tlb_ps4MB[i] | (s1_vppn[9:0] == tlb_vppn[i][9:0]))) |
                             ((invtlb_op == 5'h6) & ((tlb_g[i] == 1'h1)  | (s1_asid == tlb_asid[i])) 
                              & (s1_vppn[18:10] == tlb_vppn[i][18:10]) & (tlb_ps4MB[i] | (s1_vppn[9:0] == tlb_vppn[i][9:0])));
    end
endgenerate

assign s0_found  = | match0;
assign s0_index  = s0_index_gen[TLBNUM -1];
assign s0_ps     = tlb_ps4MB[s0_index] ? 6'h16 : 6'h0c;
assign odd_page0 = tlb_ps4MB[s0_index] ? s0_vppn[9] : s0_va_bit12;
assign s0_ppn    = odd_page0 ? tlb_ppn1[s0_index] : tlb_ppn0[s0_index];
assign s0_plv    = odd_page0 ? tlb_plv1[s0_index] : tlb_plv0[s0_index];
assign s0_mat    = odd_page0 ? tlb_mat1[s0_index] : tlb_mat0[s0_index];
assign s0_d      = odd_page0 ? tlb_d1  [s0_index] : tlb_d0[s0_index];
assign s0_v      = odd_page0 ? tlb_v1  [s0_index] : tlb_v0[s0_index];
assign s1_found  = | match1;
assign s1_index  = s1_index_gen[TLBNUM -1];
assign s1_ps     = tlb_ps4MB[s1_index] ? 6'h16 : 6'h0c;
assign odd_page1 = tlb_ps4MB[s1_index] ? s1_vppn[9] : s1_va_bit12;
assign s1_ppn    = odd_page1 ? tlb_ppn1[s1_index] : tlb_ppn0[s1_index];
assign s1_plv    = odd_page1 ? tlb_plv1[s1_index] : tlb_plv0[s1_index];
assign s1_mat    = odd_page1 ? tlb_mat1[s1_index] : tlb_mat0[s1_index];
assign s1_d      = odd_page1 ? tlb_d1  [s1_index] : tlb_d0  [s1_index];
assign s1_v      = odd_page1 ? tlb_v1  [s1_index] : tlb_v0  [s1_index];

//write part
generate
  genvar j;
  for (j = 0;j < TLBNUM;j = j + 1) 
    begin:invtlb
      always @ (posedge clk) begin
        if (invtlb_valid & inv_match[j]) 
          tlb_e[j] <= 1'h0;
        else if (!invtlb_valid & we & (w_index == j)) begin
          tlb_e   [j] <= w_e   ;
          tlb_vppn[j] <= w_vppn;
          tlb_ps4MB[j]<= w_ps == 6'h16;
          tlb_asid[j] <= w_asid;
          tlb_g   [j] <= w_g   ;
          tlb_ppn0[j] <= w_ppn0;
          tlb_plv0[j] <= w_plv0;
          tlb_mat0[j] <= w_mat0;
          tlb_d0  [j] <= w_d0  ;
          tlb_v0  [j] <= w_v0  ;
          tlb_ppn1[j] <= w_ppn1;
          tlb_plv1[j] <= w_plv1;
          tlb_mat1[j] <= w_mat1;
          tlb_d1  [j] <= w_d1  ;
          tlb_v1  [j] <= w_v1  ;           
        end
      end
    end
endgenerate

//read
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

endmodule