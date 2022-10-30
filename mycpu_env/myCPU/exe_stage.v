`include "mycpu.h"

module exe_stage(
    input                          clk              ,
    input                          reset            ,
    //allowin
    input                          ms_allowin       ,
    output                         es_allowin       ,
    //from ds
    input                          ds_to_es_valid   ,
    input  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus     ,
    //from ih
    input  [`IH_TO_ES_BUS_WD -1:0] ih_to_es_bus     ,
    //from ms
    input  [`MS_TO_ES_BUS_WD -1:0] ms_to_es_bus   ,
    //from ws
    input  [`WS_TO_ES_BUS_WD -1:0] ws_to_es_bus   ,
    //from mmu
    input  [`MMU_TO_ES_BUS_WD-1:0] mmu_to_es_bus  ,

    //to ds
    output [`ES_FORWARD_BUS  -1:0] es_to_ds_forward ,
    //to ms
    output                         es_to_ms_valid   ,
    output [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus     ,
    //to mmu
    output [`ES_TO_MMU_BUS_WD-1:0] es_to_mmu_bus    ,
    // data sram interface
    output        data_sram_req    ,
    output        data_sram_wr     ,
    output [ 1:0] data_sram_size   ,
    output [ 3:0] data_sram_wstrb  ,
    output [31:0] data_sram_wdata  ,
    input         data_sram_addr_ok,
    input         data_sram_data_ok,
    input  [31:0] data_sram_rdata
);

wire [31:0] data_sram_addr;

/* exception */
wire es_ex_taken;
wire es_ine;
wire es_data_pil;
wire es_data_pis;
wire es_data_pme;
wire es_data_ppi;
wire es_data_tlbr;

/* sram access */
wire        es_br_taken        ;
reg         es_br_taken_r      ;
wire        es_data_cancel     ;
reg         es_data_cancel_r   ;
wire        es_ldst            ;
wire        es_ldst_en         ;
wire        es_ldst_data_valid ;
wire [31:0] es_ldst_data       ;
reg         es_ldst_ready_go_r ;
reg         es_ldst_buf_valid  ;
reg  [31:0] es_ldst_buf_data   ;
wire es_ms_ex             = ms_to_es_bus[0];
wire es_ms_data_has_taken = ms_to_es_bus[1];
wire es_ms_tlbsrch_conf   = ms_to_es_bus[2];
wire es_ws_ex             = ws_to_es_bus[0];
wire es_ws_tlbsrch_conf   = ws_to_es_bus[1];

/* EXE stage */
reg         es_valid      ;
wire        es_ready_go   ;

reg  [`DS_TO_ES_BUS_WD -1:0] ds_to_es_bus_r;
wire        es_inst_pif         ;
wire        es_inst_ppi         ;
wire        es_inst_tlbr        ;
wire        es_csr_flush   ;
wire        es_tlbsrch_conf;
wire [ 4:0] es_tlb_op      ;
wire [ 1:0] es_rdcnt_op    ;
wire        es_ex_int      ;
wire        es_ex_break    ;
wire        es_ex_ine      ;
wire        es_ex_adef     ;
wire        es_ex_syscall  ;
wire [13:0] es_csr_num     ;
wire [ 2:0] es_csr_op      ;
wire        es_ertn        ;
wire [ 2:0] es_st_op       ;
wire [ 4:0] es_ld_op       ;
wire [ 3:0] es_div_op      ;
wire [ 2:0] es_mul_op      ;
wire [11:0] es_alu_op      ;
wire        es_src1_is_pc  ;
wire        es_src2_is_imm ; 
wire        es_gr_we       ;
wire        es_mem_we      ;
wire [ 4:0] es_dest        ;
wire [31:0] es_imm         ;
wire [31:0] es_rj_value    ;
wire [31:0] es_rkd_value   ;
wire [31:0] es_pc          ;
wire        es_div         ;

wire        es_res_from_mem;
wire [ 1:0] es_ls_offset   ;
wire [ 3:0] es_sram_wen    ;
wire [31:0] es_sram_wdata  ;
wire        es_ex_ale      ;
wire [31:0] es_ex_vaddr    ;
wire        es_ex_adem     ;

/* data forward bus */
wire [4 :0] es_to_ds_dest ;
wire [31:0] es_to_ds_data ;
wire        es_to_ds_block;

wire        es_src_sign  ;
wire [32:0] es_src1      ;
wire [32:0] es_src2      ;
wire [31:0] es_alu_result;
wire [63:0] es_mul_result;

/* divide unit */
reg         es_div_ready_go_r     ;
wire        es_div_buf_valid      ;
reg  [79:0] es_div_buf_data       ;
reg         es_div_divisor_tvalid ;
reg         es_div_dividend_tvalid;
wire        es_div_divisor_tready ;
wire        es_div_dividend_tready;
wire        es_div_dout_tvalid    ;
wire [79:0] es_div_result         ;
wire [79:0] es_div_dout           ;

/* timer unit */
wire [63:0] tick;

/* final es result pass to ms */
wire [31:0] es_result;

// EXE stage
assign {es_inst_pif    ,
        es_inst_ppi    ,
        es_inst_tlbr   ,
        es_csr_flush   ,  //196
        es_tlbsrch_conf,  //195
        es_tlb_op      ,  //194:190
        es_rdcnt_op    ,  //189:188
        es_ex_int      ,  //187
        es_ex_break    ,  //186
        es_ex_ine      ,  //185
        es_ex_adef     ,  //184
        es_ex_syscall  ,  //183
        es_csr_num     ,  //182:169
        es_csr_op      ,  //168:166
        es_ertn        ,  //165
        es_st_op       ,  //164:162
        es_ld_op       ,  //161:157
        es_div_op      ,  //156:153
        es_mul_op      ,  //152:150
        es_alu_op      ,  //149:138
        es_res_from_mem,  //137:137
        es_src1_is_pc  ,  //136:136
        es_src2_is_imm ,  //135:135
        es_gr_we       ,  //134:134
        es_mem_we      ,  //133:133
        es_dest        ,  //132:128
        es_imm         ,  //127:96
        es_rj_value    ,  //95 :64
        es_rkd_value   ,  //63 :32
        es_pc             //31 :0
       } = ds_to_es_bus_r;
assign {
    es_ex_adem,
    es_data_pil,
    es_data_pis,
    es_data_pme,
    es_data_ppi,
    es_data_tlbr
} = mmu_to_es_bus;

assign es_ex_taken = ih_to_es_bus;

assign es_ine = es_ex_ine | es_tlb_op[4] & (es_dest[4] | es_dest[3] | (es_dest[2] & es_dest[1] & es_dest[0]));

assign es_to_ms_bus = {es_ex_adem       ,
                       es_data_pil      ,
                       es_data_pis      ,
                       es_data_pme      ,
                       es_data_ppi      ,
                       es_data_tlbr     ,
                       es_inst_pif      ,  //208
                       es_inst_ppi      ,  //207
                       es_inst_tlbr     ,  //206
                       es_csr_flush     ,  //205
                       es_tlbsrch_conf  ,  //204
                       es_tlb_op[4:1]   ,  //203:200
                       es_mem_we        ,  //199
                       es_ldst_data_valid,  //198
                       es_ldst_data     ,  //197:166
                       es_ex_int        ,  //165
                       es_ex_break      ,  //164
                       es_ine        ,  //163
                       es_ex_vaddr      ,  //162:131
                       es_ex_ale        ,  //130
                       es_ex_adef       ,  //129
                       es_ex_syscall    ,  //128
                       es_csr_num       ,  //127:114
                       es_rkd_value     ,  //113:82
                       es_csr_op        ,  //81:79
                       es_ertn          ,  //78
                       es_ld_op         ,  //77:73
                       es_ls_offset     ,  //72:71
                       es_res_from_mem  ,  //70:70 
                       es_gr_we         ,  //69:69 
                       es_dest          ,  //68:64 
                       es_result        ,  //63:32
                       es_pc               //31:0
                      };
assign es_to_mmu_bus = {
    es_res_from_mem,
    es_mem_we,
    data_sram_addr,
    es_tlb_op[0] & ~es_ms_ex & ~es_ws_ex & ~es_ws_ex & ~es_ms_tlbsrch_conf & ~es_ws_tlbsrch_conf,
    es_tlb_op[4] & ~es_ine & ~es_ms_ex,
    es_dest     ,
    es_rj_value ,
    es_rkd_value
};

assign es_ready_go    = (!es_div  && !es_ldst && !es_tlb_op[0]) && 1'b1                                                                       ||
                          es_div                                && (es_div_dout_tvalid                 || es_div_ready_go_r )                 ||
                          es_ldst                               && (data_sram_req && data_sram_addr_ok || es_ldst_ready_go_r  || ~es_ldst_en) ||
                          es_tlb_op[0]                          && !es_ms_tlbsrch_conf && !es_ws_tlbsrch_conf                                  ;
assign es_allowin     = !es_valid || es_ready_go && ms_allowin;
assign es_to_ms_valid =  es_valid && es_ready_go;
always @(posedge clk) begin
    if (reset || es_ex_taken) begin
        es_valid <= 1'b0;
    end
    else if (es_allowin) begin
        es_valid <= ds_to_es_valid;
    end

    if (ds_to_es_valid && es_allowin) begin
        ds_to_es_bus_r <= ds_to_es_bus;
    end
end

// divide unit
// assign es_div = |ds_to_es_bus[156:153];
assign es_div = |es_div_op;
assign es_div_buf_valid = es_div_ready_go_r;
assign es_div_result = es_div_buf_valid ? es_div_buf_data : es_div_dout;

always @(posedge clk) begin
    if (reset || es_div_divisor_tready && es_div_divisor_tvalid) begin
        es_div_divisor_tvalid <= 1'b0;
    end
    else if (ds_to_es_valid && es_allowin) begin
        es_div_divisor_tvalid <= |ds_to_es_bus[156:153];
    end
end

always @(posedge clk) begin
    if (reset || es_div_dividend_tready && es_div_dividend_tvalid) begin
        es_div_dividend_tvalid <= 1'b0;
    end
    else if (ds_to_es_valid && es_allowin) begin
        es_div_dividend_tvalid <= |ds_to_es_bus[156:153];
    end
end

always @(posedge clk) begin
    if (reset) begin
        es_div_ready_go_r <= 1'b0;
    end else if (es_div_dout_tvalid && !(ms_allowin && es_to_ms_valid)) begin
        es_div_ready_go_r <= 1'b1;
    end else if (ms_allowin && es_to_ms_valid) begin
        es_div_ready_go_r <= 1'b0;
    end
end 

always @(posedge clk) begin
    if (es_div_dout_tvalid && !es_div_ready_go_r) begin
        es_div_buf_data <= es_div_dout;
    end
end

div u_div (
  .aclk                  (clk                        ), // input wire aclk
  .s_axis_divisor_tvalid (es_div_divisor_tvalid     ), // input wire s_axis_divisor_tvalid
  .s_axis_divisor_tready (es_div_divisor_tready     ), // output wire s_axis_divisor_tready
  .s_axis_divisor_tdata  ({{7{es_src2[32]}}, es_src2}), // input wire [31 : 0] s_axis_divisor_tdata
  .s_axis_dividend_tvalid(es_div_dividend_tvalid    ), // input wire s_axis_dividend_tvalid
  .s_axis_dividend_tready(es_div_dividend_tready    ), // output wire s_axis_dividend_tready
  .s_axis_dividend_tdata ({{7{es_src2[32]}}, es_src1}), // input wire [31 : 0] s_axis_dividend_tdata
  .m_axis_dout_tvalid    (es_div_dout_tvalid        ), // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata     (es_div_dout             )  // output wire [63 : 0] m_axis_dout_tdata
);

// data forward                             
assign es_to_ds_dest    = {5{es_valid && es_gr_we}} & es_dest;
assign es_to_ds_data    = es_result;
assign es_to_ds_block   = es_res_from_mem | (|es_csr_op);
assign es_to_ds_forward = {(es_ex_int    |
                           es_ex_syscall | 
                           es_ex_break   |
                           es_ex_ine     |
                           es_ex_ale     |
                           es_ex_adef    |
                           es_inst_pif        |
                           es_inst_ppi        |
                           es_inst_tlbr       |
                           es_data_pil   |
                           es_data_pis   |
                           es_data_pme   |
                           es_data_ppi   |
                           es_data_tlbr  |
                           es_ertn)       & es_valid,
                           es_to_ds_block, es_to_ds_data, es_to_ds_dest}; 

// alu
assign es_src_sign = es_mul_op[1] | es_mul_op[0] | es_div_op[1] | es_div_op[0];
assign es_src1[32] = es_src_sign & es_src1[31];
assign es_src2[32] = es_src_sign & es_src2[31];
assign es_src1[31:0] = es_src1_is_pc  ? es_pc[31:0] : 
                                      es_rj_value;
                                      
assign es_src2[31:0] = es_src2_is_imm ? es_imm : 
                                      es_rkd_value;

mul u_mul (
    .mul_src1  (es_src1      ),
    .mul_src2  (es_src2      ),
    .mul_result(es_mul_result)
);

alu u_alu(
    .alu_op     (es_alu_op    ),
    .alu_src1   (es_src1[31:0]),
    .alu_src2   (es_src2[31:0]),
    .alu_result (es_alu_result)
);

timer u_timer(
    .clk  (clk  ),
    .reset(reset),
    .tick (tick )
);

assign es_result = {32{es_mul_op[0]   }} & es_mul_result [31: 0] |
                   {32{|es_mul_op[2:1]}} & es_mul_result [63:32] |
                   {32{es_div_op[0] | es_div_op[2]  }} & es_div_result[71:40] |
                   {32{es_div_op[1] | es_div_op[3]  }} & es_div_result[31: 0] |
                   {32{|es_alu_op     }} & es_alu_result         |
                   {32{es_csr_op[2]   }} & es_rj_value           |
                   {32{es_rdcnt_op[0] }} & tick[31: 0]           |
                   {32{es_rdcnt_op[1] }} & tick[63:32]           ;

// sram access
assign es_ldst_data_valid = es_ldst_buf_valid || (data_sram_data_ok && es_ms_data_has_taken);
assign es_ldst_data       = es_ldst_buf_valid ? es_ldst_buf_data : data_sram_rdata;
assign es_ldst            = es_res_from_mem || es_mem_we;
assign es_ls_offset       = es_alu_result[1:0];

st_data u_st_data(
    .offset    (es_ls_offset ),
    .st_op     (es_st_op     ),
    .rkd_value (es_rkd_value ),
    .sram_wen  (es_sram_wen  ),
    .sram_wdata(es_sram_wdata)
);

assign es_ex_ale       = (es_ld_op[1] | es_ld_op[4] | es_st_op[1]) &  es_alu_result[0]  |
                         (es_ld_op[2] | es_st_op[2]              ) & |es_alu_result[1:0];
assign es_ex_vaddr     = es_alu_result;

assign es_ldst_en      =  es_ldst   && 
                          es_valid  && 
                         !es_ms_ex  && 
                         !es_ws_ex  && 
                         !es_ex_ale && 
                         !es_ex_int &&
                         !es_ex_ine &&  
                         !es_ex_adef&&
                         !es_ex_adem&&
                         !es_inst_pif    &&
                         !es_inst_ppi    &&
                         !es_inst_tlbr   &&
                         !es_data_pil    &&
                         !es_data_ppi    &&
                         !es_data_pis    &&
                         !es_data_pme    &&
                         !es_data_tlbr   ;

always @(posedge clk) begin
    if (reset) begin
        es_ldst_ready_go_r <= 1'b0;
    end else if (data_sram_req && data_sram_addr_ok && !(ms_allowin && es_to_ms_valid)) begin
        es_ldst_ready_go_r <= 1'b1;
    end else if (ms_allowin && es_to_ms_valid) begin
        es_ldst_ready_go_r <= 1'b0;
    end
end

always @(posedge clk) begin
    if (reset) begin
        es_ldst_buf_valid <= 1'b0;
    end else if (data_sram_data_ok && !ms_allowin && es_ms_data_has_taken) begin
        es_ldst_buf_valid <= 1'b1;    
    end else if (ms_allowin) begin
        es_ldst_buf_valid <= 1'b0;
    end
end

always @(posedge clk) begin
    if (data_sram_data_ok && !es_ldst_buf_valid) begin
        es_ldst_buf_data <= data_sram_rdata;
    end
end

// assign es_br_taken = es_ex_taken || es_br_taken_r;
// always @(posedge clk) begin
//     if (reset) begin
//         es_br_taken_r <= 1'b0;
//     end else if (es_ex_taken && !(es_to_ms_valid && ms_allowin)) begin
//         es_br_taken_r <= 1'b1;
//     end else if (es_allowin && ms_allowin) begin
//         es_br_taken_r <= 1'b0;
//     end
// end

// assign es_data_cancel = es_ex_taken || es_data_cancel_r;
// always @(posedge clk) begin
//     if (reset) begin
//         es_data_cancel_r <= 1'b0;
//     end else if (es_ex_taken && es_ready_go && !(es_to_ms_valid && ms_allowin)) begin
//         es_data_cancel_r <= 1'b1;
//     end else if (es_to_ms_valid && ms_allowin) begin
//         es_data_cancel_r <= 1'b0;
//     end
// end

assign data_sram_req     = ~es_ldst_ready_go_r & es_ldst_en;
assign data_sram_wr      = es_mem_we;
assign data_sram_size[0] = es_st_op[1] | es_ld_op[1] | es_ld_op[4];
assign data_sram_size[1] = es_st_op[2] | es_ld_op[2];
assign data_sram_wstrb   = es_mem_we ? es_sram_wen : 4'h0;
// assign data_sram_addr  = {es_alu_result[31:2], 2'b00};
assign data_sram_addr    = es_alu_result;
assign data_sram_wdata   = es_sram_wdata;

endmodule

module st_data (    
    input [ 1:0] offset,
    input [ 2:0] st_op,
    input [31:0] rkd_value,

    output [ 3:0] sram_wen,
    output [31:0] sram_wdata
);

wire st_op_b = st_op[0];
wire st_op_h = st_op[1];
wire st_op_w = st_op[2];

assign sram_wdata = st_op_b ? {4{rkd_value[ 7:0]}} :
                    st_op_h ? {2{rkd_value[15:0]}} :
                                 rkd_value[31:0]   ;

assign sram_wen[0] = ~(|offset);
assign sram_wen[1] = (st_op_b & ~offset[1] &  offset[0]) |
                     (st_op_h & ~offset[1] & ~offset[0]) |
                      st_op_w;
assign sram_wen[2] = (st_op_b & offset[1] & ~offset[0]) | 
                     (st_op_h & offset[1] & ~offset[0]) |
                      st_op_w;
assign sram_wen[3] = (st_op_b & offset[1] &  offset[0]) |
                     (st_op_h & offset[1] & ~offset[0]) |
                      st_op_w;    
endmodule

module timer (
    input clk,
    input reset,
    output reg [63:0] tick
);
    always @(posedge clk) begin
        if (reset)
            tick <= 64'd0; 
        else
            tick <= tick + 1'b1;
    end
endmodule