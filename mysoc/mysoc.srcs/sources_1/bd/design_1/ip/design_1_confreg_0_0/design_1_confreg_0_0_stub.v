// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
// Date        : Thu Nov  3 20:21:17 2022
// Host        : haooops-ThinkPad-P15v-Gen-1 running 64-bit Ubuntu 20.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/haooops/Documents/cdp_ede_local/mysoc/mysoc.srcs/sources_1/bd/design_1/ip/design_1_confreg_0_0/design_1_confreg_0_0_stub.v
// Design      : design_1_confreg_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "confreg,Vivado 2019.2" *)
module design_1_confreg_0_0(aclk, timer_clk, aresetn, arid, araddr, arlen, 
  arsize, arburst, arlock, arcache, arprot, arvalid, arready, rid, rdata, rresp, rlast, rvalid, rready, awid, 
  awaddr, awlen, awsize, awburst, awlock, awcache, awprot, awvalid, awready, wid, wdata, wstrb, wlast, 
  wvalid, wready, bid, bresp, bvalid, bready, ram_random_mask, led, led_rg0, led_rg1, num_csn, num_a_g, 
  num_data, switch, btn_key_col, btn_key_row, btn_step)
/* synthesis syn_black_box black_box_pad_pin="aclk,timer_clk,aresetn,arid[3:0],araddr[31:0],arlen[7:0],arsize[2:0],arburst[1:0],arlock[1:0],arcache[3:0],arprot[2:0],arvalid,arready,rid[3:0],rdata[31:0],rresp[1:0],rlast,rvalid,rready,awid[3:0],awaddr[31:0],awlen[7:0],awsize[2:0],awburst[1:0],awlock[1:0],awcache[3:0],awprot[2:0],awvalid,awready,wid[3:0],wdata[31:0],wstrb[3:0],wlast,wvalid,wready,bid[3:0],bresp[1:0],bvalid,bready,ram_random_mask[4:0],led[15:0],led_rg0[1:0],led_rg1[1:0],num_csn[7:0],num_a_g[6:0],num_data[31:0],switch[7:0],btn_key_col[3:0],btn_key_row[3:0],btn_step[1:0]" */;
  input aclk;
  input timer_clk;
  input aresetn;
  input [3:0]arid;
  input [31:0]araddr;
  input [7:0]arlen;
  input [2:0]arsize;
  input [1:0]arburst;
  input [1:0]arlock;
  input [3:0]arcache;
  input [2:0]arprot;
  input arvalid;
  output arready;
  output [3:0]rid;
  output [31:0]rdata;
  output [1:0]rresp;
  output rlast;
  output rvalid;
  input rready;
  input [3:0]awid;
  input [31:0]awaddr;
  input [7:0]awlen;
  input [2:0]awsize;
  input [1:0]awburst;
  input [1:0]awlock;
  input [3:0]awcache;
  input [2:0]awprot;
  input awvalid;
  output awready;
  input [3:0]wid;
  input [31:0]wdata;
  input [3:0]wstrb;
  input wlast;
  input wvalid;
  output wready;
  output [3:0]bid;
  output [1:0]bresp;
  output bvalid;
  input bready;
  output [4:0]ram_random_mask;
  output [15:0]led;
  output [1:0]led_rg0;
  output [1:0]led_rg1;
  output [7:0]num_csn;
  output [6:0]num_a_g;
  output [31:0]num_data;
  input [7:0]switch;
  output [3:0]btn_key_col;
  input [3:0]btn_key_row;
  input [1:0]btn_step;
endmodule
