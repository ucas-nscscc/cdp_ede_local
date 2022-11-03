// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Thu Nov  3 20:21:08 2022
// Host        : haooops-ThinkPad-P15v-Gen-1 running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/haooops/Documents/cdp_ede_local/mysoc/mysoc.srcs/sources_1/bd/design_1/ip/design_1_clk_wiz_0/design_1_clk_wiz_0_stub.v
// Design      : design_1_clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module design_1_clk_wiz_0(cpu_clk, timer_clk, resetn, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="cpu_clk,timer_clk,resetn,locked,clk_in1" */;
  output cpu_clk;
  output timer_clk;
  input resetn;
  output locked;
  input clk_in1;
endmodule
