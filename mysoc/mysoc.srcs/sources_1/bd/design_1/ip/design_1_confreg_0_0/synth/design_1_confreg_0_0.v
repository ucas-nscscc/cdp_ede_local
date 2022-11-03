// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: user.org:user:confreg:1.0
// IP Revision: 2

(* X_CORE_INFO = "confreg,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "design_1_confreg_0_0,confreg,{}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_confreg_0_0 (
  aclk,
  timer_clk,
  aresetn,
  arid,
  araddr,
  arlen,
  arsize,
  arburst,
  arlock,
  arcache,
  arprot,
  arvalid,
  arready,
  rid,
  rdata,
  rresp,
  rlast,
  rvalid,
  rready,
  awid,
  awaddr,
  awlen,
  awsize,
  awburst,
  awlock,
  awcache,
  awprot,
  awvalid,
  awready,
  wid,
  wdata,
  wstrb,
  wlast,
  wvalid,
  wready,
  bid,
  bresp,
  bvalid,
  bready,
  ram_random_mask,
  led,
  led_rg0,
  led_rg1,
  num_csn,
  num_a_g,
  num_data,
  switch,
  btn_key_col,
  btn_key_row,
  btn_step
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF interface_aximm, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME timer_clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 timer_clk CLK" *)
input wire timer_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARID" *)
input wire [3 : 0] arid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR" *)
input wire [31 : 0] araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARLEN" *)
input wire [7 : 0] arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARSIZE" *)
input wire [2 : 0] arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARBURST" *)
input wire [1 : 0] arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARLOCK" *)
input wire [1 : 0] arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARCACHE" *)
input wire [3 : 0] arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARPROT" *)
input wire [2 : 0] arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID" *)
input wire arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY" *)
output wire arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RID" *)
output wire [3 : 0] rid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RDATA" *)
output wire [31 : 0] rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RRESP" *)
output wire [1 : 0] rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RLAST" *)
output wire rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RVALID" *)
output wire rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm RREADY" *)
input wire rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWID" *)
input wire [3 : 0] awid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR" *)
input wire [31 : 0] awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWLEN" *)
input wire [7 : 0] awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWSIZE" *)
input wire [2 : 0] awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWBURST" *)
input wire [1 : 0] awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWLOCK" *)
input wire [1 : 0] awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWCACHE" *)
input wire [3 : 0] awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWPROT" *)
input wire [2 : 0] awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID" *)
input wire awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY" *)
output wire awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WID" *)
input wire [3 : 0] wid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WDATA" *)
input wire [31 : 0] wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB" *)
input wire [3 : 0] wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WLAST" *)
input wire wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WVALID" *)
input wire wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm WREADY" *)
output wire wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BID" *)
output wire [3 : 0] bid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BRESP" *)
output wire [1 : 0] bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BVALID" *)
output wire bvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interface_aximm, FREQ_HZ 50000000, DATA_WIDTH 32, PROTOCOL AXI4, ID_WIDTH 4, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THRE\
ADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 interface_aximm BREADY" *)
input wire bready;
output wire [4 : 0] ram_random_mask;
output wire [15 : 0] led;
output wire [1 : 0] led_rg0;
output wire [1 : 0] led_rg1;
output wire [7 : 0] num_csn;
output wire [6 : 0] num_a_g;
output wire [31 : 0] num_data;
input wire [7 : 0] switch;
output wire [3 : 0] btn_key_col;
input wire [3 : 0] btn_key_row;
input wire [1 : 0] btn_step;

  confreg #(
    .SIMULATION(1'B0)
  ) inst (
    .aclk(aclk),
    .timer_clk(timer_clk),
    .aresetn(aresetn),
    .arid(arid),
    .araddr(araddr),
    .arlen(arlen),
    .arsize(arsize),
    .arburst(arburst),
    .arlock(arlock),
    .arcache(arcache),
    .arprot(arprot),
    .arvalid(arvalid),
    .arready(arready),
    .rid(rid),
    .rdata(rdata),
    .rresp(rresp),
    .rlast(rlast),
    .rvalid(rvalid),
    .rready(rready),
    .awid(awid),
    .awaddr(awaddr),
    .awlen(awlen),
    .awsize(awsize),
    .awburst(awburst),
    .awlock(awlock),
    .awcache(awcache),
    .awprot(awprot),
    .awvalid(awvalid),
    .awready(awready),
    .wid(wid),
    .wdata(wdata),
    .wstrb(wstrb),
    .wlast(wlast),
    .wvalid(wvalid),
    .wready(wready),
    .bid(bid),
    .bresp(bresp),
    .bvalid(bvalid),
    .bready(bready),
    .ram_random_mask(ram_random_mask),
    .led(led),
    .led_rg0(led_rg0),
    .led_rg1(led_rg1),
    .num_csn(num_csn),
    .num_a_g(num_a_g),
    .num_data(num_data),
    .switch(switch),
    .btn_key_col(btn_key_col),
    .btn_key_row(btn_key_row),
    .btn_step(btn_step)
  );
endmodule
