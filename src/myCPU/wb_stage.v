`include "mycpu.h"

module wb_stage(
    input                           clk           ,
    input                           reset         ,
    //allowin
    output                          ws_allowin    ,
    //from ms
    input                           ms_to_ws_valid,
    input  [`MS_TO_WS_BUS_WD -1:0]  ms_to_ws_bus  ,
    //to rf: for write back
    output [`WS_TO_RF_BUS_WD -1:0]  ws_to_rf_bus  ,
    //trace debug interface
    output [31:0] debug_wb_pc     ,
    output [ 3:0] debug_wb_rf_wen ,
    output [ 4:0] debug_wb_rf_wnum,
    output [31:0] debug_wb_rf_wdata,
    //to ds check related
    output  [`WS_REL_BUS_WD-1:0]      ws_related_bus,
    //tlb
    output [4:0] ws_tlb_op, 
    output       ws_valid_out,
    //exception handling
    output        ws_ex_to_csr,
    output        ws_ertn_flush,
    output [ 5:0] ws_ecode,
    output [ 8:0] ws_esubcode,
    output [31:0] ws_vaddr,
    output        ws_csr_we,
    output [13:0] ws_csr_rnum,
    output [31:0] ws_csr_wmask,
    output [31:0] ws_csr_wvalue,
    input  [31:0] ws_csr_rvalue,
    output        ws_ex
);

reg         ws_valid;
wire        ws_ready_go;
reg [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus_r;
wire        ws_gr_we;
wire [ 4:0] ws_dest;
wire [31:0] ws_final_result;
wire [31:0] ws_pc;
wire [13:0] ws_ex_backward;//+8
wire [ 1:0] ws_csr_op;
wire        ws_ertn;

assign ws_valid_out = ws_valid;
assign {ws_tlb_op,        //193:189
        ws_ex_backward ,  //188:183
        ws_ertn        ,  //182:182
        ws_vaddr       ,  //181:150
        ws_csr_op      ,  //149:148
        ws_csr_rnum    ,  //147:134
        ws_csr_wmask   ,  //133:102
        ws_csr_wvalue  ,  //101:70
        ws_gr_we       ,  //69:69
        ws_dest        ,  //68:64
        ws_final_result,  //63:32
        ws_pc             //31:0
       } = ms_to_ws_bus_r;
assign ws_ex_to_csr = |ws_ex_backward & ws_valid;// | (ws_tlb_op != 4'b0) & ws_valid;//! lab14 bug
assign ws_ertn_flush = ws_ertn & ws_valid;
assign ws_ex = ws_ex_to_csr | ws_ertn_flush;

assign ws_ecode = ws_ex_backward[`TLB_TLBR_EX] ? `CSR_ECODE_TLBR :
                    ws_ex_backward[`TLB_PIF_EX] ? `CSR_ECODE_PIF :
                    ws_ex_backward[`TLB_PIL_EX] ? `CSR_ECODE_PIL :
                    ws_ex_backward[`TLB_PIS_EX] ? `CSR_ECODE_PIS :
                    ws_ex_backward[`TLB_PPI_EX] ? `CSR_ECODE_PPI ://
                    ws_ex_backward[`TLB_PME_EX] ? `CSR_ECODE_PME ://
                    ws_ex_backward[`TLB_ADEF_EX] ? `CSR_ECODE_ADE :
                    ws_ex_backward[`TLB_ADEM_EX] ? `CSR_ECODE_ADE :
                    ws_ex_backward[9] ? `CSR_ECODE_INT :
                  ws_ex_backward[10] ? `CSR_ECODE_INE :
                  ws_ex_backward[11] ? `CSR_ECODE_BRK :
                  ws_ex_backward[12] ? `CSR_ECODE_SYS :
                /*ws_ex_backward[13]*/ `CSR_ECODE_ALE ;
//                  ws_ex_backward[0] ? `CSR_ECODE_ADE :
//                   ws_ex_backward[1] ? `CSR_ECODE_INT :
//                   ws_ex_backward[2] ? `CSR_ECODE_INE :
//                   ws_ex_backward[3] ? `CSR_ECODE_BRK :
//                   ws_ex_backward[4] ? `CSR_ECODE_SYS :
//                 /*ws_ex_backward[5]*/ `CSR_ECODE_ALE ;
assign ws_esubcode = ws_ex_backward[`TLB_ADEM_EX];//`CSR_ESUBCODE_ADEF;
assign ws_csr_we = ws_csr_op[1];

wire        rf_we;
wire [4 :0] rf_waddr;
wire [31:0] rf_wdata;
assign ws_to_rf_bus = {rf_we   ,  //37:37
                       rf_waddr,  //36:32
                       rf_wdata   //31:0
                      };

assign ws_ready_go = 1'b1;
assign ws_allowin  = !ws_valid || ws_ready_go;
assign ws_related_bus = {ws_tlb_op,
                         ws_csr_op[0],
                         ws_valid & ws_gr_we}; // check whether data valid 
                         
always @(posedge clk) begin
    if (reset) begin
        ws_valid <= 1'b0;
    end
    else if (ws_allowin) begin
        ws_valid <= ms_to_ws_valid;
    end
    else if (ws_ex)
         ws_valid <= 1'b0;//环路？//!try bug1,没用 
    if (ms_to_ws_valid && ws_allowin) begin
        ms_to_ws_bus_r <= ms_to_ws_bus;
    end
end

assign rf_we    = ws_gr_we&&ws_valid;
assign rf_waddr = ws_dest;
assign rf_wdata = ws_csr_op[0]? ws_csr_rvalue : ws_final_result;

// debug info generate
assign debug_wb_pc       = ws_pc;
assign debug_wb_rf_wen   = {4{rf_we}};
assign debug_wb_rf_wnum  = rf_waddr;
assign debug_wb_rf_wdata = rf_wdata;

endmodule
