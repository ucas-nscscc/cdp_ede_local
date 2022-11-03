//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Thu Nov  3 21:52:26 2022
//Host        : haooops-ThinkPad-P15v-Gen-1 running 64-bit Ubuntu 20.04.5 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (btn_key_col_0,
    btn_key_row_0,
    btn_step_0,
    clk_in1_0,
    freeze_0,
    led_0,
    led_rg0_0,
    led_rg1_0,
    num_a_g_0,
    num_csn_0,
    num_data_0,
    resetn_0,
    switch_0,
    uart_rtl_0_baudoutn,
    uart_rtl_0_ctsn,
    uart_rtl_0_dcdn,
    uart_rtl_0_ddis,
    uart_rtl_0_dsrn,
    uart_rtl_0_dtrn,
    uart_rtl_0_out1n,
    uart_rtl_0_out2n,
    uart_rtl_0_ri,
    uart_rtl_0_rtsn,
    uart_rtl_0_rxd,
    uart_rtl_0_rxrdyn,
    uart_rtl_0_txd,
    uart_rtl_0_txrdyn);
  output [3:0]btn_key_col_0;
  input [3:0]btn_key_row_0;
  input [1:0]btn_step_0;
  input clk_in1_0;
  input freeze_0;
  output [15:0]led_0;
  output [1:0]led_rg0_0;
  output [1:0]led_rg1_0;
  output [6:0]num_a_g_0;
  output [7:0]num_csn_0;
  output [31:0]num_data_0;
  input resetn_0;
  input [7:0]switch_0;
  output uart_rtl_0_baudoutn;
  input uart_rtl_0_ctsn;
  input uart_rtl_0_dcdn;
  output uart_rtl_0_ddis;
  input uart_rtl_0_dsrn;
  output uart_rtl_0_dtrn;
  output uart_rtl_0_out1n;
  output uart_rtl_0_out2n;
  input uart_rtl_0_ri;
  output uart_rtl_0_rtsn;
  input uart_rtl_0_rxd;
  output uart_rtl_0_rxrdyn;
  output uart_rtl_0_txd;
  output uart_rtl_0_txrdyn;

  wire [3:0]btn_key_col_0;
  wire [3:0]btn_key_row_0;
  wire [1:0]btn_step_0;
  wire clk_in1_0;
  wire freeze_0;
  wire [15:0]led_0;
  wire [1:0]led_rg0_0;
  wire [1:0]led_rg1_0;
  wire [6:0]num_a_g_0;
  wire [7:0]num_csn_0;
  wire [31:0]num_data_0;
  wire resetn_0;
  wire [7:0]switch_0;
  wire uart_rtl_0_baudoutn;
  wire uart_rtl_0_ctsn;
  wire uart_rtl_0_dcdn;
  wire uart_rtl_0_ddis;
  wire uart_rtl_0_dsrn;
  wire uart_rtl_0_dtrn;
  wire uart_rtl_0_out1n;
  wire uart_rtl_0_out2n;
  wire uart_rtl_0_ri;
  wire uart_rtl_0_rtsn;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_rxrdyn;
  wire uart_rtl_0_txd;
  wire uart_rtl_0_txrdyn;

  design_1 design_1_i
       (.btn_key_col_0(btn_key_col_0),
        .btn_key_row_0(btn_key_row_0),
        .btn_step_0(btn_step_0),
        .clk_in1_0(clk_in1_0),
        .freeze_0(freeze_0),
        .led_0(led_0),
        .led_rg0_0(led_rg0_0),
        .led_rg1_0(led_rg1_0),
        .num_a_g_0(num_a_g_0),
        .num_csn_0(num_csn_0),
        .num_data_0(num_data_0),
        .resetn_0(resetn_0),
        .switch_0(switch_0),
        .uart_rtl_0_baudoutn(uart_rtl_0_baudoutn),
        .uart_rtl_0_ctsn(uart_rtl_0_ctsn),
        .uart_rtl_0_dcdn(uart_rtl_0_dcdn),
        .uart_rtl_0_ddis(uart_rtl_0_ddis),
        .uart_rtl_0_dsrn(uart_rtl_0_dsrn),
        .uart_rtl_0_dtrn(uart_rtl_0_dtrn),
        .uart_rtl_0_out1n(uart_rtl_0_out1n),
        .uart_rtl_0_out2n(uart_rtl_0_out2n),
        .uart_rtl_0_ri(uart_rtl_0_ri),
        .uart_rtl_0_rtsn(uart_rtl_0_rtsn),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_rxrdyn(uart_rtl_0_rxrdyn),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .uart_rtl_0_txrdyn(uart_rtl_0_txrdyn));
endmodule
