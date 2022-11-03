module div(
  input clk, //!bug: 忘记加入clk
  input  reset, //!bug: 忘记加入reset
  input  [ 3:0] div_op,
  input  [31:0] div_src1,
  input  [31:0] div_src2,
  output [31:0] div_final_result,
  output div_running
);

wire op_div;   //
wire op_divu;  //
wire op_mod;   //
wire op_modu;  //

assign op_div  = div_op[0];
assign op_divu = div_op[1];
assign op_mod  = div_op[2];
assign op_modu = div_op[3];

wire [63:0] div_result;
wire [63:0] div_u_result;

wire div_src_ready;
wire div_ans_valid;
wire div_divisor_ready;
wire div_dividend_ready;
wire div_work;
wire div_u_src_ready;
wire div_u_ans_valid;
wire div_u_divisor_ready;
wire div_u_dividend_ready;
wire div_u_work;

reg div_src_valid;
reg div_u_src_valid;
reg div_state;

assign div_work = op_div | op_mod;
assign div_src_ready = div_divisor_ready & div_dividend_ready;
assign div_u_work = op_divu | op_modu;
assign div_u_src_ready = div_u_divisor_ready & div_u_dividend_ready;
assign div_running = div_work & ~div_ans_valid | div_u_work & ~div_u_ans_valid;

always @ (posedge clk) begin
  if(reset) begin
    div_src_valid <= 1'b0;
  end
  else if (~div_state & div_work) begin
    div_src_valid <= 1'b1;
  end
  else if (div_src_valid & div_src_ready) begin
    div_src_valid <= 1'b0;
  end
end

always @ (posedge clk) begin
  if(reset) begin
    div_u_src_valid <= 1'b0;
  end
  else if (~div_state & div_u_work) begin
    div_u_src_valid <= 1'b1;
  end
  else if (div_u_src_valid & div_u_src_ready) begin
    div_u_src_valid <= 1'b0;
  end
end

always @ (posedge clk) begin
  if(reset) begin
    div_state <= 1'b0;
  end
  else if (~div_state & (div_work | div_u_work)) begin
    div_state <= 1'b1; //!bug: 误写为div_src_valid
  end
  else if (div_ans_valid | div_u_ans_valid) begin
    div_state <= 1'b0; //!bug: 误写为div_src_valid
  end
end

mydiv div_signed(
  .s_axis_divisor_tdata(div_src2),
  .s_axis_dividend_tdata(div_src1),
  .s_axis_divisor_tvalid(div_src_valid),
  .s_axis_dividend_tvalid(div_src_valid),
  .s_axis_divisor_tready(div_divisor_ready),
  .s_axis_dividend_tready(div_dividend_ready),
  .aclk(clk),
  .m_axis_dout_tdata(div_result),
  .m_axis_dout_tvalid(div_ans_valid)
);

mydiv_u div_unsigned(
  .s_axis_divisor_tdata(div_src2),
  .s_axis_dividend_tdata(div_src1),
  .s_axis_divisor_tvalid(div_u_src_valid),
  .s_axis_dividend_tvalid(div_u_src_valid),
  .s_axis_divisor_tready(div_u_divisor_ready),
  .s_axis_dividend_tready(div_u_dividend_ready),
  .aclk(clk),
  .m_axis_dout_tdata(div_u_result),
  .m_axis_dout_tvalid(div_u_ans_valid)
);

assign div_final_result =  ({32{op_div          }} & div_result[63:32])
                         | ({32{op_divu         }} & div_u_result[63:32])
                         | ({32{op_mod          }} & div_result[31:0])
                         | ({32{op_modu         }} & div_u_result[31:0]);

endmodule