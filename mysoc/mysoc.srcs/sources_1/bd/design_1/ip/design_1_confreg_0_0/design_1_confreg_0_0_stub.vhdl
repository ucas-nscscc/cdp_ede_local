-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Thu Nov  3 20:21:17 2022
-- Host        : haooops-ThinkPad-P15v-Gen-1 running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/haooops/Documents/cdp_ede_local/mysoc/mysoc.srcs/sources_1/bd/design_1/ip/design_1_confreg_0_0/design_1_confreg_0_0_stub.vhdl
-- Design      : design_1_confreg_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_confreg_0_0 is
  Port ( 
    aclk : in STD_LOGIC;
    timer_clk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    arlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    arsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    arburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    arlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    arcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    arvalid : in STD_LOGIC;
    arready : out STD_LOGIC;
    rid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    rlast : out STD_LOGIC;
    rvalid : out STD_LOGIC;
    rready : in STD_LOGIC;
    awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    awlen : in STD_LOGIC_VECTOR ( 7 downto 0 );
    awsize : in STD_LOGIC_VECTOR ( 2 downto 0 );
    awburst : in STD_LOGIC_VECTOR ( 1 downto 0 );
    awlock : in STD_LOGIC_VECTOR ( 1 downto 0 );
    awcache : in STD_LOGIC_VECTOR ( 3 downto 0 );
    awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    awvalid : in STD_LOGIC;
    awready : out STD_LOGIC;
    wid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    wlast : in STD_LOGIC;
    wvalid : in STD_LOGIC;
    wready : out STD_LOGIC;
    bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    bvalid : out STD_LOGIC;
    bready : in STD_LOGIC;
    ram_random_mask : out STD_LOGIC_VECTOR ( 4 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    led_rg0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    led_rg1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    num_csn : out STD_LOGIC_VECTOR ( 7 downto 0 );
    num_a_g : out STD_LOGIC_VECTOR ( 6 downto 0 );
    num_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    switch : in STD_LOGIC_VECTOR ( 7 downto 0 );
    btn_key_col : out STD_LOGIC_VECTOR ( 3 downto 0 );
    btn_key_row : in STD_LOGIC_VECTOR ( 3 downto 0 );
    btn_step : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end design_1_confreg_0_0;

architecture stub of design_1_confreg_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,timer_clk,aresetn,arid[3:0],araddr[31:0],arlen[7:0],arsize[2:0],arburst[1:0],arlock[1:0],arcache[3:0],arprot[2:0],arvalid,arready,rid[3:0],rdata[31:0],rresp[1:0],rlast,rvalid,rready,awid[3:0],awaddr[31:0],awlen[7:0],awsize[2:0],awburst[1:0],awlock[1:0],awcache[3:0],awprot[2:0],awvalid,awready,wid[3:0],wdata[31:0],wstrb[3:0],wlast,wvalid,wready,bid[3:0],bresp[1:0],bvalid,bready,ram_random_mask[4:0],led[15:0],led_rg0[1:0],led_rg1[1:0],num_csn[7:0],num_a_g[6:0],num_data[31:0],switch[7:0],btn_key_col[3:0],btn_key_row[3:0],btn_step[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "confreg,Vivado 2019.2";
begin
end;
