`include "mycpu.h"

module wb_stage(
    input                           clk             ,
    input                           reset           ,
    //allowin
    output                          ws_allowin      ,
    //from ms
    input                           ms_to_ws_valid  ,
    input  [`MS_TO_WS_BUS_WD -1:0]  ms_to_ws_bus    ,
    //from ih
    input  [`IH_TO_WS_BUS_WD -1:0]  ih_to_ws_bus    ,
    //to ds
    output [`WS_FORWARD_BUS  -1:0]  ws_to_ds_forward,
    //to rf: for write back
    output [`WS_TO_RF_BUS_WD -1:0]  ws_to_rf_bus    ,
    //to ih
    output [`WS_TO_IH_BUS_WD -1:0]  ws_to_ih_bus    ,
    //to mmu
    output [`WS_TO_MMU_BUS_WD-1:0]  ws_to_mmu_bus   ,
    //to es
    output [`WS_TO_ES_BUS_WD -1:0]  ws_to_es_bus    ,
    //trace debug interface
    output [31:0] debug_wb_pc     ,
    output [ 3:0] debug_wb_rf_wen ,
    output [ 4:0] debug_wb_rf_wnum,
    output [31:0] debug_wb_rf_wdata
);

wire        ws_tlb_flush;
wire [31:0] ws_csr_rvalue;
wire        ws_ex_taken;
wire        ws_csr_re;
wire        ws_csr_we;
wire [31:0] ws_csr_wmask;
wire [31:0] ws_csr_wvalue;
wire        ws_ertn_flush;
wire        ws_ex;
wire [ 5:0] ws_ecode;
wire [ 8:0] ws_esubcode;

reg         ws_valid;
wire        ws_ready_go;

reg [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus_r;
wire        ws_ex_adem;
wire        ws_data_pil;
wire        ws_data_pis;
wire        ws_data_pme;
wire        ws_data_ppi;
wire        ws_data_tlbr;
wire        ws_inst_pif;
wire        ws_inst_ppi;
wire        ws_inst_tlbr;
wire        ws_csr_flush;
wire        ws_tlbsrch_conf;
wire [ 3:0] ws_tlb_op;
wire        ws_ex_int;
wire        ws_ex_break;
wire        ws_ex_ine;
wire [31:0] ws_ex_vaddr;
wire        ws_ex_ale;
wire        ws_ex_adef;
wire        ws_ex_syscall;
wire [13:0] ws_csr_num;
wire [31:0] ws_rd_value;
wire [ 2:0] ws_csr_op;
wire        ws_ertn;
wire        ws_gr_we;
wire [ 4:0] ws_dest;
wire [31:0] ws_final_result;
wire [31:0] ws_pc;
assign {ws_ex_adem     ,
        ws_data_pil    ,
        ws_data_pis    ,
        ws_data_pme    ,
        ws_data_ppi    ,
        ws_data_tlbr   ,
        ws_inst_pif         ,
        ws_inst_ppi         ,
        ws_inst_tlbr        ,
        ws_csr_flush   ,  //163
        ws_tlbsrch_conf,  //162
        ws_tlb_op      ,  //161:158
        ws_ex_int      ,  //157
        ws_ex_break    ,  //156
        ws_ex_ine      ,  //155
        ws_ex_vaddr    ,  //154:123
        ws_ex_ale      ,  //122
        ws_ex_adef     ,  //121
        ws_ex_syscall  ,  //120
        ws_csr_num     ,  //119:106
        ws_rd_value    ,  //105:74
        ws_csr_op      ,  //73:71
        ws_ertn        ,  //70
        ws_gr_we       ,  //69:69
        ws_dest        ,  //68:64
        ws_final_result,  //63:32
        ws_pc             //31:0
       } = ms_to_ws_bus_r;

wire        rf_we;
wire [4 :0] rf_waddr;
wire [31:0] rf_wdata;

wire [4 :0] ws_to_ds_dest ;
wire [31:0] ws_to_ds_data ;

assign ws_to_rf_bus = {rf_we   ,  //37:37
                       rf_waddr,  //36:32
                       rf_wdata   //31:0
                      };
assign ws_to_ih_bus = {ws_inst_ppi  ,
                       ws_inst_tlbr ,
                       ws_tlb_flush ,  //161:161
                       ws_csr_re    ,  //160:160
                       ws_csr_num   ,  //159:146
                       ws_csr_we    ,  //145:145
                       ws_csr_wmask ,  //144:113
                       ws_csr_wvalue,  //112:81
                       ws_ertn_flush,  //80:80
                       ws_ex        ,  //79:79
                       ws_ecode     ,  //78:73
                       ws_esubcode  ,  //72:64
                       ws_pc        ,  //63:32
                       ws_ex_vaddr     //31:0
                       };
assign ws_to_mmu_bus = ws_tlb_op[2:0] & {3{ws_valid}};
assign ws_to_es_bus = {ws_tlbsrch_conf & ws_valid,
                       ws_ex_taken | ws_tlb_flush};

assign ws_tlb_flush = (|ws_tlb_op | ws_csr_flush) & ~ws_ex & ws_valid;
assign ws_csr_rvalue = ih_to_ws_bus;
assign ws_ertn_flush = ws_ertn & ws_valid;
assign ws_ex = (ws_ex_int     |
                ws_data_pil   |
                ws_data_pis   |
                ws_inst_pif   |
                ws_data_pme   |
                ws_inst_ppi   |
                ws_data_ppi   |
                ws_ex_adef    |
                ws_ex_adem    |
                ws_ex_ine     |
                ws_ex_syscall |
                ws_ex_break   |
                ws_ex_ale     |
                ws_inst_tlbr  |
                ws_data_tlbr) & ws_valid;
assign ws_ecode = ws_ex_int  ? 6'h00 :
                  ws_ex_adef ? 6'h08 :
                  (ws_inst_pif | ws_inst_ppi | ws_inst_tlbr) ? 
                  ({6{ws_inst_pif}} & 6'h03 |
                   {6{ws_inst_ppi}} & 6'h07 |
                   {6{ws_inst_tlbr}}& 6'h3f ) : 
                 (ws_ex_ine | ws_ex_syscall | ws_ex_break) ? 
                 ({6{ws_ex_syscall}} & 6'h0b |
                  {6{ws_ex_break  }} & 6'h0c |
                  {6{ws_ex_ine    }} & 6'h0d ) :
                  ws_ex_ale  ? 6'h09 :
                  ws_ex_adem ? 6'h08 :
                  (ws_data_pil | ws_data_pis | ws_data_pme | ws_data_ppi | ws_data_tlbr) ?
                  ({6{ws_data_pil}} & 6'h01 |
                   {6{ws_data_pis}} & 6'h02 |
                   {6{ws_data_pme}} & 6'h04 |
                   {6{ws_data_ppi}} & 6'h07 |
                   {6{ws_data_tlbr}}& 6'h3f) :
                               6'h00;
assign ws_esubcode = {9{ws_ex_adef}} & 9'h000 |
                     {9{ws_ex_adem}} & 9'h001;
assign ws_ex_taken = ws_ex | ws_ertn_flush;

assign ws_csr_re = |ws_csr_op & ws_valid;
assign ws_csr_we = |ws_csr_op[2:1] & ws_valid;
assign ws_csr_wmask = ws_csr_op[2] ? ws_final_result : 32'hffffffff;
assign ws_csr_wvalue = ws_rd_value;

assign ws_ready_go = 1'b1;
assign ws_allowin  = !ws_valid || ws_ready_go;
always @(posedge clk) begin
    if (reset || ws_ex_taken || ws_tlb_flush) begin
        ws_valid <= 1'b0;
    end
    else if (ws_allowin) begin
        ws_valid <= ms_to_ws_valid;
    end

    if (ms_to_ws_valid && ws_allowin) begin
        ms_to_ws_bus_r <= ms_to_ws_bus;
    end
end

assign ws_to_ds_dest    = {5{ws_valid && ws_gr_we}} & ws_dest;
assign ws_to_ds_data    = rf_wdata;
assign ws_to_ds_forward = {ws_to_ds_data, ws_to_ds_dest};
                          
assign rf_we    = ws_gr_we && ws_valid && !ws_ex;
assign rf_waddr = ws_dest;
assign rf_wdata = |ws_csr_op ? ws_csr_rvalue : ws_final_result;

// debug info generate
assign debug_wb_pc       = ws_pc;
assign debug_wb_rf_wen   = {4{rf_we}};
assign debug_wb_rf_wnum  = rf_waddr;
assign debug_wb_rf_wdata = rf_wdata;

endmodule
