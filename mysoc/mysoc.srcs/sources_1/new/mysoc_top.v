//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Tue Aug  9 08:15:31 2022
//Host        : ooooops running 64-bit Ubuntu 20.04.4 LTS
//Command     : generate_target design_2_wrapper.bd
//Design      : mysoc_top
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mysoc_top(
  clk,
  resetn,

  //------gpio----------------
  led,
  led_rg0,
  led_rg1,
  num_csn,
  num_a_g,
  num_data,
  switch, 
  btn_key_col,
  btn_key_row,
  btn_step,

  //------uart-------
  UART_RX,
  UART_TX
);
  input clk;
  input resetn;

  //------gpio----------------
  output [15:0] led;
  output [1 :0] led_rg0;
  output [1 :0] led_rg1;
  output [7 :0] num_csn;
  output [6 :0] num_a_g;
  output [31:0] num_data;
  input  [7 :0] switch;
  output [3 :0] btn_key_col;
  input  [3 :0] btn_key_row;
  input  [1 :0] btn_step;

  //------uart-------
  input         UART_RX;
  output        UART_TX;


  design_1 design_1_i(
    .clk_in1_0   (clk),
    .resetn_0    (resetn),

    // confreg
    .btn_key_col_0      (btn_key_col),
    .btn_key_row_0      (btn_key_row),
    .btn_step_0         (btn_step   ),
    .led_0              (led        ),
    .led_rg0_0          (led_rg0    ),
    .led_rg1_0          (led_rg1    ),
    .num_a_g_0          (num_a_g    ),
    .num_csn_0          (num_csn    ),
    .num_data_0         (num_data   ),
    .switch_0           (switch     ),

    // uart
    .uart_rtl_0_baudoutn(),
    .uart_rtl_0_ctsn    (1'b1),
    .uart_rtl_0_dcdn    (1'b0),
    .uart_rtl_0_ddis    (),
    .uart_rtl_0_dsrn    (1'b0),
    .uart_rtl_0_dtrn    (),
    .uart_rtl_0_out1n   (),
    .uart_rtl_0_out2n   (),
    .uart_rtl_0_ri      (1'd1),
    .uart_rtl_0_rtsn    (),
    .uart_rtl_0_rxd     (UART_RX),
    .uart_rtl_0_rxrdyn  (),
    .uart_rtl_0_txd     (UART_TX),
    .uart_rtl_0_txrdyn  (),
    .freeze_0           (1'b0)
  );
endmodule
