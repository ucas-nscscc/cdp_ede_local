`include "mycpu.h"

module mem_stage(
    input                          clk              ,
    input                          reset            ,
    //allowin
    input                          ws_allowin       ,
    output                         ms_allowin       ,
    //from es
    input                          es_to_ms_valid   ,
    input  [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus     ,
    //to ws
    output                         ms_to_ws_valid   ,
    output [`MS_TO_WS_BUS_WD -1:0] ms_to_ws_bus     ,
    // to ds check related
    output [`MS_REL_BUS_WD   -1:0] ms_related_bus   ,
    //mul_result
    input  [                 63:0] mul_result       ,
    //exception handling
    input                          ws_ex            ,
    output                         ms_ex            
);

reg         ms_valid;
wire        ms_ready_go;

reg [`ES_TO_MS_BUS_WD -1:0] es_to_ms_bus_r;

wire        ms_res_from_mem;
wire [31:0] data_sram_rdata;
wire        ms_mul_op;
wire        ms_mul_horl;
wire        ms_gr_we;
wire [ 4:0] ms_load_sel;
wire [ 4:0] ms_dest;
wire [31:0] ms_alu_result;
wire [ 1:0] ms_csr_op;
wire [13:0] ms_csr_rnum;
wire [31:0] ms_csr_wmask;
wire [31:0] ms_csr_wvalue;
wire [31:0] ms_pc;
wire [13:0] ms_ex_backward;//+8
wire        ms_ertn;
wire        ms_ertn_flush;
wire [4:0] ms_tlb_op;
wire [31:0] ms_vaddr;
assign {ms_vaddr,
        ms_tlb_op,        //170:166
        ms_ex_backward ,  //165:159
        ms_ertn        ,  //158:158
        ms_csr_op      ,  //157:156
        ms_csr_rnum    ,  //155:142
        ms_csr_wmask   ,  //141:110
        ms_csr_wvalue  ,  //109:78
        ms_mul_horl    ,  //77:77
        ms_mul_op      ,  //76:76
        ms_load_sel    ,  //75:71
        data_sram_rdata,  //71:71
        ms_res_from_mem,  //70:70
        ms_gr_we       ,  //69:69
        ms_dest        ,  //68:64
        ms_alu_result  ,  //63:32
        ms_pc             //31:0
       } = es_to_ms_bus_r;
assign ms_ertn_flush = ms_ertn & ms_valid;
assign ms_ex = |ms_ex_backward & ms_valid | ms_ertn_flush;

wire [31:0] ms_mem_result;
wire [31:0] ms_mul_result;
wire [31:0] ms_final_result;

wire [15:0] data_sram_rdata_h;
wire [ 7:0] data_sram_rdata_b;

assign ms_to_ws_bus = {ms_tlb_op,        //193:189
                       ms_ex_backward ,  //188:183
                       ms_ertn        ,  //182:182
                       ms_vaddr,//ms_alu_result  ,  //181:150 for vaddr: load-store addr error
                       ms_csr_op      ,  //149:148
                       ms_csr_rnum    ,  //147:134
                       ms_csr_wmask   ,  //133:102
                       ms_csr_wvalue  ,  //101:70
                       ms_gr_we       ,  //69:69
                       ms_dest        ,  //68:64
                       ms_final_result,  //63:32
                       ms_pc             //31:0
                      };//+8


assign ms_ready_go    = 1'b1;
assign ms_allowin     = !ms_valid || ms_ready_go && ws_allowin;
assign ms_to_ws_valid = ms_valid && ms_ready_go && ~ws_ex;
assign ms_related_bus = {ms_tlb_op,           //tlb_op
                         ms_csr_op[0],        // if csr writing, then block
                         ms_to_ws_valid & ms_gr_we, // check whether data valid 
                         ms_dest,             // dest_addr
                         ms_final_result};    // dest_value
always @(posedge clk) begin
    if (reset) begin
        ms_valid <= 1'b0;
    end
    else if (ws_ex)
        ms_valid <= 1'b0;
    else if (ms_allowin) begin
        ms_valid <= es_to_ms_valid;
    end

    if (es_to_ms_valid && ms_allowin) begin
        es_to_ms_bus_r  <= es_to_ms_bus;
    end
end

assign data_sram_rdata_h = (ms_alu_result[1] == 1'b1) ? data_sram_rdata[31:16]:
                                                        data_sram_rdata[15:0];
                                                        
assign data_sram_rdata_b = (ms_alu_result[1:0] == 2'b11) ? data_sram_rdata[31:24]:
                           (ms_alu_result[1:0] == 2'b10) ? data_sram_rdata[23:16]:
                           (ms_alu_result[1:0] == 2'b01) ? data_sram_rdata[15: 8]:
                                                           data_sram_rdata[ 7: 0];

assign ms_mem_result = ms_load_sel[0] ? {{24{data_sram_rdata_b[7]}},data_sram_rdata_b}:     
                    ms_load_sel[1] ? {24'b0,data_sram_rdata_b}:
                    ms_load_sel[2] ? {{16{data_sram_rdata_h[15]}},data_sram_rdata_h}:
                    ms_load_sel[3] ? {16'b0, data_sram_rdata_h}:
                    data_sram_rdata;
assign ms_mul_result =  ms_mul_horl ? mul_result[63:32] :
                                      mul_result[31: 0] ;

assign ms_final_result = ms_res_from_mem ? ms_mem_result :
                         ms_mul_op       ? ms_mul_result :
                                           ms_alu_result ;

endmodule
