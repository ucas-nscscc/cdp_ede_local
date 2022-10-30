`include "mycpu.h"

module mem_stage(
    input                          clk             ,
    input                          reset           ,
    //allowin
    input                          ws_allowin      ,
    output                         ms_allowin      ,
    //from es
    input                          es_to_ms_valid  ,
    input  [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus    ,
    //from ih
    input  [`IH_TO_MS_BUS_WD -1:0] ih_to_ms_bus    ,
    //to ds
    output [`MS_FORWARD_BUS  -1:0] ms_to_ds_forward,
    //to ws
    output                         ms_to_ws_valid  ,
    output [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus    ,
    //to es
    output [`MS_TO_ES_BUS_WD -1:0] ms_to_es_bus    ,
    //from data-sram
    input                          data_sram_data_ok,
    input  [31                 :0] data_sram_rdata
);

/* exception */
wire ms_ex_taken;

/* MEM stage */
reg         ms_valid;
wire        ms_ready_go;

reg [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus_r;
wire        ms_ex_adem;
wire        ms_data_pil;
wire        ms_data_pis;
wire        ms_data_pme;
wire        ms_data_ppi;
wire        ms_data_tlbr;
wire        ms_inst_pif;
wire        ms_inst_ppi;
wire        ms_inst_tlbr;
wire        ms_csr_flush;
wire        ms_tlbsrch_conf;
wire [ 3:0] ms_tlb_op;
wire        ms_mem_we;
wire        ms_es_data_valid;
wire [31:0] ms_es_data;
wire        ms_ex_int;
wire        ms_ex_break;
wire        ms_ex_ine;
wire [31:0] ms_ex_vaddr;
wire        ms_ex_ale;
wire        ms_ex_adef;
wire        ms_ex_syscall;
wire [13:0] ms_csr_num;
wire [31:0] ms_rd_value;
wire [ 2:0] ms_csr_op;
wire        ms_ertn;
wire [ 4:0] ms_ld_op;
wire [ 1:0] ms_ld_offset;
wire        ms_res_from_mem;
wire        ms_gr_we;
wire [ 4:0] ms_dest;
wire [31:0] ms_result;
wire [31:0] ms_pc;
assign {ms_ex_adem     ,
        ms_data_pil    ,
        ms_data_pis    ,
        ms_data_pme    ,
        ms_data_ppi    ,
        ms_data_tlbr   ,
        ms_inst_pif         ,
        ms_inst_ppi         ,
        ms_inst_tlbr        ,
        ms_csr_flush   ,  //205
        ms_tlbsrch_conf,  //204
        ms_tlb_op      ,  //203:200
        ms_mem_we      ,  //199
        ms_es_data_valid, //198
        ms_es_data     ,  //197:166
        ms_ex_int      ,  //165
        ms_ex_break    ,  //164
        ms_ex_ine      ,  //163
        ms_ex_vaddr    ,  //162:131
        ms_ex_ale      ,  //130
        ms_ex_adef     ,  //129
        ms_ex_syscall  ,  //128
        ms_csr_num     ,  //127:114
        ms_rd_value    ,  //113:82
        ms_csr_op      ,  //81:79
        ms_ertn        ,  //78
        ms_ld_op       ,  //77:73
        ms_ld_offset   ,  //72:71
        ms_res_from_mem,  //70:70
        ms_gr_we       ,  //69:69
        ms_dest        ,  //68:64
        ms_result      ,  //63:32
        ms_pc             //31:0
       } = es_to_ms_bus_r;

wire [31:0] ms_final_result;

/* data forward */
wire [4 :0] ms_to_ds_dest ;
wire [31:0] ms_to_ds_data ;
wire        ms_to_ds_block;

/* data sram access */
reg         ms_ready_go_r;
wire        ms_buf_valid ;
reg  [31:0] ms_buf_data  ;
wire [31:0] read_data    ;
wire [31:0] mem_result   ;

// MEM stage
assign ms_to_ws_bus = {ms_ex_adem     ,
                       ms_data_pil    ,
                       ms_data_pis    ,
                       ms_data_pme    ,
                       ms_data_ppi    ,
                       ms_data_tlbr   ,
                       ms_inst_pif    ,
                       ms_inst_ppi    ,
                       ms_inst_tlbr   ,
                       ms_csr_flush   ,  //163
                       ms_tlbsrch_conf,  //162
                       ms_tlb_op      ,  //161:158
                       ms_ex_int      ,  //157
                       ms_ex_break    ,  //156
                       ms_ex_ine      ,  //155
                       ms_ex_vaddr    ,  //154:123
                       ms_ex_ale      ,  //122
                       ms_ex_adef     ,  //121
                       ms_ex_syscall  ,  //120
                       ms_csr_num     ,  //119:106
                       ms_rd_value    ,  //105:74
                       ms_csr_op      ,  //73:71
                       ms_ertn        ,  //70
                       ms_gr_we       ,  //69:69
                       ms_dest        ,  //68:64
                       ms_final_result,  //63:32
                       ms_pc             //31:0
                      };
assign ms_to_es_bus = {ms_tlbsrch_conf & ms_valid,
                       ms_ready_go_r | ms_es_data_valid | !ms_valid,
                       (ms_ex_int    |
                       ms_ex_syscall | 
                       ms_ex_break   |
                       ms_ex_ine     |
                       ms_ex_ale     |
                       ms_ex_adef    |
                       ms_ex_adem    |
                       ms_inst_pif        |
                       ms_inst_ppi        |
                       ms_inst_tlbr       |
                       ms_data_pil   |
                       ms_data_pis   |
                       ms_data_pme   |
                       ms_data_ppi   |
                       ms_data_tlbr  |
                       ms_ertn       |
                       (|ms_tlb_op)  |
                       ms_csr_flush)  & ms_valid};
assign ms_ex_taken = ih_to_ms_bus;

assign ms_ready_go    = (!ms_res_from_mem && !ms_mem_we) && 1'b1                                    ||
                        ( ms_res_from_mem ||  ms_mem_we) && (!ms_es_data_valid && data_sram_data_ok || 
                                                              ms_ready_go_r                         ||
                                                              ms_es_data_valid                      ||
                                                              ms_ex_ale                             ||
                                                              ms_ex_adem                            ||
                                                              ms_inst_pif                           ||
                                                              ms_inst_ppi                           ||
                                                              ms_inst_tlbr                          ||
                                                              ms_data_pil                           ||
                                                              ms_data_pis                           ||
                                                              ms_data_pme                           ||
                                                              ms_data_ppi                           ||
                                                              ms_data_tlbr                           );
assign ms_allowin     = !ms_valid || ms_ready_go && ws_allowin;
assign ms_to_ws_valid = ms_valid && ms_ready_go;
always @(posedge clk) begin
    if (reset || ms_ex_taken) begin
        ms_valid <= 1'b0;
    end
    else if (ms_allowin) begin
        ms_valid <= es_to_ms_valid;
    end

    if (es_to_ms_valid && ms_allowin) begin
        es_to_ms_bus_r <= es_to_ms_bus;
    end
end

// data sram access
load_memdata_control u_mdc(
    .read_data(read_data   ),
    .sel_load (ms_ld_op    ),
    .offset   (ms_ld_offset),
    .load_data(mem_result  )
);

assign ms_buf_valid = ms_ready_go_r;
assign read_data = {32{data_sram_data_ok & ~ms_es_data_valid & ~ms_buf_valid}} & data_sram_rdata |
                   {32{ms_buf_valid                                         }} & ms_buf_data     |
                   {32{ms_es_data_valid                                     }} & ms_es_data      ;
always @(posedge clk) begin
    if (reset) begin
        ms_ready_go_r <= 1'b0;
    end else if (data_sram_data_ok && !ws_allowin && !ms_es_data_valid) begin
        ms_ready_go_r <= 1'b1;
    end else if (ms_to_ws_valid && ws_allowin) begin
        ms_ready_go_r <= 1'b0;
    end
end

always @(posedge clk) begin
    if (data_sram_data_ok && !ms_buf_valid) begin
        ms_buf_data <= data_sram_rdata;
    end
end

assign ms_final_result = ms_res_from_mem ? mem_result :
                                           ms_result;

// data forward
assign ms_to_ds_dest    = {5{ms_valid && ms_gr_we}} & ms_dest;
assign ms_to_ds_data    = ms_final_result;
assign ms_to_ds_block   = |ms_csr_op | ms_res_from_mem & ~ms_ready_go;
assign ms_to_ds_forward = {(ms_ex_int     |
                           ms_ex_syscall | 
                           ms_ex_break   |
                           ms_ex_ine     |
                           ms_ex_ale     |
                           ms_ex_adef    |
                           ms_ex_adem    |
                           ms_ertn       |
                           ms_inst_pif   |
                           ms_inst_ppi   |
                           ms_data_pil   |
                           ms_data_pis   |
                           ms_data_pme   |
                           ms_data_ppi   |
                           ms_data_tlbr  |
                           ms_inst_tlbr)& ms_valid,
                           ms_to_ds_block, ms_to_ds_data, ms_to_ds_dest}; 

endmodule

module load_memdata_control (
    input  [31:0] read_data,
    input  [ 4:0] sel_load,
    input  [ 1:0] offset,
    output [31:0] load_data
);

    // assign load_data = {32{sel_load[0] & ~offset[1] & ~offset[0]}} & {{24{read_data[ 7]}}, read_data[ 7: 0]} |
    //                    {32{sel_load[0] & ~offset[1] &  offset[0]}} & {{24{read_data[15]}}, read_data[15: 8]} |
    //                    {32{sel_load[0] &  offset[1] & ~offset[0]}} & {{24{read_data[23]}}, read_data[23:16]} |
    //                    {32{sel_load[0] &  offset[1] &  offset[0]}} & {{24{read_data[31]}}, read_data[31:24]} |  // ld_b
    //                    {32{sel_load[3] & ~offset[1] & ~offset[0]}} & {24'b0, read_data[ 7: 0]} |
    //                    {32{sel_load[3] & ~offset[1] &  offset[0]}} & {24'b0, read_data[15: 8]} |
    //                    {32{sel_load[3] &  offset[1] & ~offset[0]}} & {24'b0, read_data[23:16]} |
    //                    {32{sel_load[3] &  offset[1] &  offset[0]}} & {24'b0, read_data[31:24]} |  // ld_bu
    //                    {32{sel_load[1] & ~offset[1] & ~offset[0]}} & {{16{read_data[15]}}, read_data[15: 0]} |  // ld_h
    //                    {32{sel_load[1] &  offset[1] & ~offset[0]}} & {{16{read_data[31]}}, read_data[31:16]} |
    //                    {32{sel_load[4] & ~offset[1] & ~offset[0]}} & {16'b0, read_data[15: 0]} |
    //                    {32{sel_load[4] &  offset[1] & ~offset[0]}} & {16'b0, read_data[31:16]} |  // ld_hu
    //                    {32{sel_load[2]}} & read_data;  // ld_w
    assign load_data[31:24] = {8{sel_load[3] | sel_load[4]}} & 8'b0 |
                              {8{sel_load[0] & ~offset[1] &  offset[0] | sel_load[1] & ~offset[1] & ~offset[0]}} & {8{read_data[15]}} |
                              {8{sel_load[0] &  offset[1] &  offset[0] | sel_load[1] &  offset[1] & ~offset[0]}} & {8{read_data[31]}} |
                              {8{sel_load[0] & ~offset[1] & ~offset[0]}} & {8{read_data[ 7]}} |
                              {8{sel_load[0] &  offset[1] & ~offset[0]}} & {8{read_data[23]}} |
                              {8{sel_load[2]}} & read_data[31:24];
    assign load_data[23:16] = {8{sel_load[3] | sel_load[4]}} & 8'b0 |
                              {8{sel_load[0] & ~offset[1] &  offset[0] | sel_load[1] & ~offset[1] & ~offset[0]}} & {8{read_data[15]}} |
                              {8{sel_load[0] &  offset[1] &  offset[0] | sel_load[1] &  offset[1] & ~offset[0]}} & {8{read_data[31]}} |
                              {8{sel_load[0] & ~offset[1] & ~offset[0]}} & {8{read_data[ 7]}} |
                              {8{sel_load[0] &  offset[1] & ~offset[0]}} & {8{read_data[23]}} |
                              {8{sel_load[2]}} & read_data[23:16];
    assign load_data[15: 8] = {8{sel_load[3]}} & 8'b0 |
                              {8{sel_load[0] & ~offset[1] &  offset[0]}} & {8{read_data[15]}} |
                              {8{sel_load[0] &  offset[1] &  offset[0]}} & {8{read_data[31]}} |
                              {8{sel_load[0] & ~offset[1] & ~offset[0]}} & {8{read_data[ 7]}} |
                              {8{sel_load[0] &  offset[1] & ~offset[0]}} & {8{read_data[23]}} |
                              {8{sel_load[1] & ~offset[1] & ~offset[0] | sel_load[4] & ~offset[1] & ~offset[0]}} & read_data[15: 8] |  // ld_h
                              {8{sel_load[1] &  offset[1] & ~offset[0] | sel_load[4] &  offset[1] & ~offset[0]}} & read_data[31:24] |
                              {8{sel_load[2]}} & read_data[15: 8];
    assign load_data[ 7: 0] = {8{sel_load[0] & ~offset[1] & ~offset[0] | sel_load[3] & ~offset[1] & ~offset[0] | sel_load[1] & ~offset[1] & ~offset[0] | sel_load[4] & ~offset[1] & ~offset[0] | sel_load[2]}} & read_data[ 7: 0] |
                              {8{sel_load[0] & ~offset[1] &  offset[0] | sel_load[3] & ~offset[1] &  offset[0]}} & read_data[15: 8] |
                              {8{sel_load[0] &  offset[1] & ~offset[0] | sel_load[3] &  offset[1] & ~offset[0] | sel_load[1] &  offset[1] & ~offset[0] | sel_load[4] &  offset[1] & ~offset[0]}} & read_data[23:16] |
                              {8{sel_load[0] &  offset[1] &  offset[0] | sel_load[3] &  offset[1] &  offset[0]}} & read_data[31:24];
                              
                
endmodule

