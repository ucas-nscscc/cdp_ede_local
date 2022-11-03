-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
-- Date        : Thu Nov  3 20:21:18 2022
-- Host        : haooops-ThinkPad-P15v-Gen-1 running 64-bit Ubuntu 20.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/haooops/Documents/cdp_ede_local/mysoc/mysoc.srcs/sources_1/bd/design_1/ip/design_1_confreg_0_0/design_1_confreg_0_0_sim_netlist.vhdl
-- Design      : design_1_confreg_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tfbg676-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_confreg_0_0_confreg is
  port (
    rlast : out STD_LOGIC;
    bid : out STD_LOGIC_VECTOR ( 3 downto 0 );
    led : out STD_LOGIC_VECTOR ( 15 downto 0 );
    led_rg0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    led_rg1 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    num_data : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    num_csn : out STD_LOGIC_VECTOR ( 7 downto 0 );
    num_a_g : out STD_LOGIC_VECTOR ( 6 downto 0 );
    conf_wready_reg_reg_0 : out STD_LOGIC;
    awready : out STD_LOGIC;
    conf_rvalid_reg_reg_0 : out STD_LOGIC;
    arready : out STD_LOGIC;
    btn_key_col : out STD_LOGIC_VECTOR ( 3 downto 0 );
    ram_random_mask : out STD_LOGIC_VECTOR ( 4 downto 0 );
    bvalid : out STD_LOGIC;
    aclk : in STD_LOGIC;
    wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    timer_clk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    wlast : in STD_LOGIC;
    wvalid : in STD_LOGIC;
    arvalid : in STD_LOGIC;
    awvalid : in STD_LOGIC;
    rready : in STD_LOGIC;
    btn_key_row : in STD_LOGIC_VECTOR ( 3 downto 0 );
    btn_step : in STD_LOGIC_VECTOR ( 1 downto 0 );
    switch : in STD_LOGIC_VECTOR ( 7 downto 0 );
    arid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    awid : in STD_LOGIC_VECTOR ( 3 downto 0 );
    araddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    awaddr : in STD_LOGIC_VECTOR ( 15 downto 0 );
    bready : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_confreg_0_0_confreg : entity is "confreg";
end design_1_confreg_0_0_confreg;

architecture STRUCTURE of design_1_confreg_0_0_confreg is
  signal \FSM_onehot_state[0]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[1]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[3]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[4]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state[5]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[0]\ : STD_LOGIC;
  signal \FSM_onehot_state_reg_n_0_[1]\ : STD_LOGIC;
  signal R_or_W : STD_LOGIC;
  signal ar_enter : STD_LOGIC;
  signal aw_enter : STD_LOGIC;
  signal btn_key_r : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal btn_key_r0 : STD_LOGIC;
  signal \btn_key_r[0]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[10]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[10]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[10]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[10]_i_5_n_0\ : STD_LOGIC;
  signal \btn_key_r[10]_i_6_n_0\ : STD_LOGIC;
  signal \btn_key_r[11]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[11]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[11]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[11]_i_4_n_0\ : STD_LOGIC;
  signal \btn_key_r[12]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[12]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[13]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[13]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[13]_i_5_n_0\ : STD_LOGIC;
  signal \btn_key_r[13]_i_6_n_0\ : STD_LOGIC;
  signal \btn_key_r[14]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[14]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[14]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[14]_i_4_n_0\ : STD_LOGIC;
  signal \btn_key_r[14]_i_5_n_0\ : STD_LOGIC;
  signal \btn_key_r[14]_i_6_n_0\ : STD_LOGIC;
  signal \btn_key_r[14]_i_7_n_0\ : STD_LOGIC;
  signal \btn_key_r[15]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[15]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[15]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[15]_i_4_n_0\ : STD_LOGIC;
  signal \btn_key_r[15]_i_6_n_0\ : STD_LOGIC;
  signal \btn_key_r[15]_i_7_n_0\ : STD_LOGIC;
  signal \btn_key_r[15]_i_8_n_0\ : STD_LOGIC;
  signal \btn_key_r[1]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[1]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[2]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[2]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[3]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[3]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[3]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[3]_i_4_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_10_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_11_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_4_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_5_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_6_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_7_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_8_n_0\ : STD_LOGIC;
  signal \btn_key_r[4]_i_9_n_0\ : STD_LOGIC;
  signal \btn_key_r[5]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[6]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[6]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[6]_i_4_n_0\ : STD_LOGIC;
  signal \btn_key_r[7]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[7]_i_2_n_0\ : STD_LOGIC;
  signal \btn_key_r[7]_i_3_n_0\ : STD_LOGIC;
  signal \btn_key_r[7]_i_4_n_0\ : STD_LOGIC;
  signal \btn_key_r[7]_i_5_n_0\ : STD_LOGIC;
  signal \btn_key_r[8]_i_1_n_0\ : STD_LOGIC;
  signal \btn_key_r[9]_i_1_n_0\ : STD_LOGIC;
  signal btn_key_tmp1 : STD_LOGIC;
  signal btn_key_tmp13 : STD_LOGIC;
  signal btn_key_tmp14 : STD_LOGIC;
  signal btn_key_tmp2 : STD_LOGIC;
  signal btn_key_tmp6 : STD_LOGIC;
  signal btn_key_tmp7 : STD_LOGIC;
  signal btn_key_tmp8 : STD_LOGIC;
  signal btn_step0_r : STD_LOGIC;
  signal btn_step0_r_i_1_n_0 : STD_LOGIC;
  signal btn_step1_r : STD_LOGIC;
  signal btn_step1_r_i_1_n_0 : STD_LOGIC;
  signal buf_addr : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \buf_id[0]_i_1_n_0\ : STD_LOGIC;
  signal \buf_id[1]_i_1_n_0\ : STD_LOGIC;
  signal \buf_id[2]_i_1_n_0\ : STD_LOGIC;
  signal \buf_id[3]_i_1_n_0\ : STD_LOGIC;
  signal \buf_id[3]_i_3_n_0\ : STD_LOGIC;
  signal busy : STD_LOGIC;
  signal busy01_out : STD_LOGIC;
  signal busy_i_1_n_0 : STD_LOGIC;
  signal busy_i_2_n_0 : STD_LOGIC;
  signal \^bvalid\ : STD_LOGIC;
  signal conf_bvalid_reg_i_1_n_0 : STD_LOGIC;
  signal conf_rdata_reg0 : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_10_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_11_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_12_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_13_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_14_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[0]_i_9_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[10]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[10]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[10]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[10]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[10]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[10]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[10]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[11]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[12]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[12]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[12]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[12]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[12]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[12]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[13]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[14]_i_9_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_10_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_11_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_12_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[15]_i_9_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[16]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[16]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[16]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[16]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[17]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[17]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[17]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[17]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[17]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[17]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[18]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[18]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[18]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[18]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[18]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[18]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[19]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[19]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[19]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[19]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[19]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[19]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_10_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[1]_i_9_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[20]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[20]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[20]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[20]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[20]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[21]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[21]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[21]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[21]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[21]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[21]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[22]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[22]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[22]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[22]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[22]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[22]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[23]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[23]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[23]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[23]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[23]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[24]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[24]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[24]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[24]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[25]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[25]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[25]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[25]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[25]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[25]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[26]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[26]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[26]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[26]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[26]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[26]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[27]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[27]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[27]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[27]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[27]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[27]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[28]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[28]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[28]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[28]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[29]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[29]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[29]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[29]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[29]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[29]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[2]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[30]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[30]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[30]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[30]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[30]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[30]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_10_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_11_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_12_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[31]_i_9_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[3]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[4]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[5]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_10_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_11_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[6]_i_9_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_10_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_11_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_12_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_8_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[7]_i_9_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[8]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[8]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[8]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[8]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_1_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_2_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_3_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_4_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_5_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_6_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_7_n_0\ : STD_LOGIC;
  signal \conf_rdata_reg[9]_i_8_n_0\ : STD_LOGIC;
  signal conf_rvalid_reg_i_1_n_0 : STD_LOGIC;
  signal \^conf_rvalid_reg_reg_0\ : STD_LOGIC;
  signal conf_wdata_r : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal conf_wdata_r1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \conf_wdata_r[31]_i_3_n_0\ : STD_LOGIC;
  signal conf_wdata_r_3 : STD_LOGIC;
  signal conf_wready_reg_i_1_n_0 : STD_LOGIC;
  signal \^conf_wready_reg_reg_0\ : STD_LOGIC;
  signal \count[0]_i_2_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \count_reg_n_0_[0]\ : STD_LOGIC;
  signal \count_reg_n_0_[10]\ : STD_LOGIC;
  signal \count_reg_n_0_[11]\ : STD_LOGIC;
  signal \count_reg_n_0_[12]\ : STD_LOGIC;
  signal \count_reg_n_0_[13]\ : STD_LOGIC;
  signal \count_reg_n_0_[14]\ : STD_LOGIC;
  signal \count_reg_n_0_[15]\ : STD_LOGIC;
  signal \count_reg_n_0_[16]\ : STD_LOGIC;
  signal \count_reg_n_0_[1]\ : STD_LOGIC;
  signal \count_reg_n_0_[2]\ : STD_LOGIC;
  signal \count_reg_n_0_[3]\ : STD_LOGIC;
  signal \count_reg_n_0_[4]\ : STD_LOGIC;
  signal \count_reg_n_0_[5]\ : STD_LOGIC;
  signal \count_reg_n_0_[6]\ : STD_LOGIC;
  signal \count_reg_n_0_[7]\ : STD_LOGIC;
  signal \count_reg_n_0_[8]\ : STD_LOGIC;
  signal \count_reg_n_0_[9]\ : STD_LOGIC;
  signal cr0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cr0[31]_i_2_n_0\ : STD_LOGIC;
  signal cr1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cr2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cr3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cr4 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cr5 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cr6 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal cr7 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \cr7[31]_i_2_n_0\ : STD_LOGIC;
  signal \cr7[31]_i_3_n_0\ : STD_LOGIC;
  signal data : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal io_simu : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \io_simu[31]_i_2_n_0\ : STD_LOGIC;
  signal \io_simu[31]_i_3_n_0\ : STD_LOGIC;
  signal key_count0 : STD_LOGIC;
  signal \key_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \key_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \key_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \key_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \key_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \key_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \key_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \key_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \key_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \key_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \key_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \key_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \key_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[10]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[11]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[12]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[13]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[14]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[15]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[16]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[17]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[18]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[5]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[6]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[7]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[8]\ : STD_LOGIC;
  signal \key_count_reg_n_0_[9]\ : STD_LOGIC;
  signal key_flag : STD_LOGIC;
  signal key_flag_i_1_n_0 : STD_LOGIC;
  signal key_flag_i_2_n_0 : STD_LOGIC;
  signal key_sample : STD_LOGIC;
  signal \key_start1__1\ : STD_LOGIC;
  signal \^led\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \led_data[0]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[10]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[11]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[12]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[13]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[14]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[15]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[15]_i_2_n_0\ : STD_LOGIC;
  signal \led_data[15]_i_3_n_0\ : STD_LOGIC;
  signal \led_data[15]_i_4_n_0\ : STD_LOGIC;
  signal \led_data[15]_i_5_n_0\ : STD_LOGIC;
  signal \led_data[1]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[2]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[3]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[4]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[5]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[6]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[7]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[8]_i_1_n_0\ : STD_LOGIC;
  signal \led_data[9]_i_1_n_0\ : STD_LOGIC;
  signal \led_data_reg_n_0_[16]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[17]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[18]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[19]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[20]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[21]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[22]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[23]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[24]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[25]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[26]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[27]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[28]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[29]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[30]\ : STD_LOGIC;
  signal \led_data_reg_n_0_[31]\ : STD_LOGIC;
  signal \^led_rg0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \led_rg0_data_reg_n_0_[10]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[11]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[14]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[15]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[16]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[17]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[18]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[19]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[20]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[21]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[22]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[23]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[24]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[25]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[26]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[27]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[28]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[29]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[30]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[31]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[7]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[8]\ : STD_LOGIC;
  signal \led_rg0_data_reg_n_0_[9]\ : STD_LOGIC;
  signal \^led_rg1\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \led_rg1_data[1]_i_2_n_0\ : STD_LOGIC;
  signal \led_rg1_data[1]_i_3_n_0\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[10]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[11]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[12]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[13]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[14]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[15]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[16]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[17]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[18]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[19]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[20]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[21]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[22]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[23]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[24]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[25]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[26]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[27]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[28]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[29]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[2]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[30]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[31]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[3]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[4]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[5]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[6]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[7]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[8]\ : STD_LOGIC;
  signal \led_rg1_data_reg_n_0_[9]\ : STD_LOGIC;
  signal no_mask : STD_LOGIC;
  signal no_mask_i_1_n_0 : STD_LOGIC;
  signal no_mask_i_2_n_0 : STD_LOGIC;
  signal no_mask_i_3_n_0 : STD_LOGIC;
  signal num_a_g_2 : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \num_csn[0]_i_1_n_0\ : STD_LOGIC;
  signal \num_csn[1]_i_1_n_0\ : STD_LOGIC;
  signal \num_csn[2]_i_1_n_0\ : STD_LOGIC;
  signal \num_csn[3]_i_1_n_0\ : STD_LOGIC;
  signal \num_csn[4]_i_1_n_0\ : STD_LOGIC;
  signal \num_csn[5]_i_1_n_0\ : STD_LOGIC;
  signal \num_csn[6]_i_1_n_0\ : STD_LOGIC;
  signal \num_csn[7]_i_1_n_0\ : STD_LOGIC;
  signal \^num_data\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal num_monitor : STD_LOGIC;
  signal num_monitor_i_1_n_0 : STD_LOGIC;
  signal num_monitor_i_2_n_0 : STD_LOGIC;
  signal open_trace : STD_LOGIC;
  signal open_trace_i_10_n_0 : STD_LOGIC;
  signal open_trace_i_11_n_0 : STD_LOGIC;
  signal open_trace_i_1_n_0 : STD_LOGIC;
  signal open_trace_i_2_n_0 : STD_LOGIC;
  signal open_trace_i_3_n_0 : STD_LOGIC;
  signal open_trace_i_4_n_0 : STD_LOGIC;
  signal open_trace_i_5_n_0 : STD_LOGIC;
  signal open_trace_i_6_n_0 : STD_LOGIC;
  signal open_trace_i_7_n_0 : STD_LOGIC;
  signal open_trace_i_8_n_0 : STD_LOGIC;
  signal open_trace_i_9_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal p_0_in0_in : STD_LOGIC;
  signal p_0_in8_in : STD_LOGIC;
  signal p_0_in_1 : STD_LOGIC;
  signal p_11_in : STD_LOGIC;
  signal p_12_in : STD_LOGIC;
  signal p_13_in : STD_LOGIC;
  signal p_14_in38_in : STD_LOGIC;
  signal p_15_in40_in : STD_LOGIC;
  signal p_16_in : STD_LOGIC;
  signal p_17_in : STD_LOGIC;
  signal p_18_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal p_1_in10_in : STD_LOGIC;
  signal p_1_in11_in : STD_LOGIC;
  signal p_1_in12_in : STD_LOGIC;
  signal p_1_in1_in : STD_LOGIC;
  signal p_1_in7_in : STD_LOGIC;
  signal p_1_in_0 : STD_LOGIC;
  signal p_2_in31_in : STD_LOGIC;
  signal p_3_in : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal p_5_in : STD_LOGIC;
  signal p_7_in : STD_LOGIC;
  signal p_8_in : STD_LOGIC;
  signal p_9_in : STD_LOGIC;
  signal \pseudo_random_23[0]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[10]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[11]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[12]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[13]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[14]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[15]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[1]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[2]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[3]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[4]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[5]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[6]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[7]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[8]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23[9]_i_1_n_0\ : STD_LOGIC;
  signal \pseudo_random_23_reg_n_0_[0]\ : STD_LOGIC;
  signal \pseudo_random_23_reg_n_0_[18]\ : STD_LOGIC;
  signal \pseudo_random_23_reg_n_0_[21]\ : STD_LOGIC;
  signal \pseudo_random_23_reg_n_0_[6]\ : STD_LOGIC;
  signal \^rlast\ : STD_LOGIC;
  signal scan_data : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \scan_data[0]_i_2_n_0\ : STD_LOGIC;
  signal \scan_data[0]_i_3_n_0\ : STD_LOGIC;
  signal \scan_data[0]_i_4_n_0\ : STD_LOGIC;
  signal \scan_data[1]_i_2_n_0\ : STD_LOGIC;
  signal \scan_data[1]_i_3_n_0\ : STD_LOGIC;
  signal \scan_data[1]_i_4_n_0\ : STD_LOGIC;
  signal \scan_data[2]_i_2_n_0\ : STD_LOGIC;
  signal \scan_data[2]_i_3_n_0\ : STD_LOGIC;
  signal \scan_data[2]_i_4_n_0\ : STD_LOGIC;
  signal \scan_data[3]_i_2_n_0\ : STD_LOGIC;
  signal \scan_data[3]_i_3_n_0\ : STD_LOGIC;
  signal \scan_data[3]_i_4_n_0\ : STD_LOGIC;
  signal scan_data_4 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal sel0 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal short_delay : STD_LOGIC;
  signal short_delay_i_1_n_0 : STD_LOGIC;
  signal short_delay_i_2_n_0 : STD_LOGIC;
  signal short_delay_i_3_n_0 : STD_LOGIC;
  signal state_count0 : STD_LOGIC;
  signal state_count_reg : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \state_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \state_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \state_count_reg_n_0_[2]\ : STD_LOGIC;
  signal step0_count0 : STD_LOGIC;
  signal \step0_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \step0_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \step0_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \step0_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \step0_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \step0_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \step0_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \step0_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \step0_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \step0_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \step0_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \step0_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[10]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[11]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[12]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[13]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[14]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[15]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[16]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[17]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[18]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[5]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[6]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[7]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[8]\ : STD_LOGIC;
  signal \step0_count_reg_n_0_[9]\ : STD_LOGIC;
  signal step0_flag : STD_LOGIC;
  signal step0_flag_i_1_n_0 : STD_LOGIC;
  signal step0_sample : STD_LOGIC;
  signal step1_count0 : STD_LOGIC;
  signal \step1_count[0]_i_3_n_0\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \step1_count_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \step1_count_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \step1_count_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \step1_count_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \step1_count_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \step1_count_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \step1_count_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \step1_count_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \step1_count_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \step1_count_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \step1_count_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[0]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[10]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[11]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[12]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[13]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[14]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[15]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[16]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[17]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[18]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[1]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[2]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[3]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[4]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[5]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[6]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[7]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[8]\ : STD_LOGIC;
  signal \step1_count_reg_n_0_[9]\ : STD_LOGIC;
  signal step1_flag : STD_LOGIC;
  signal step1_flag_i_1_n_0 : STD_LOGIC;
  signal step1_sample : STD_LOGIC;
  signal \timer[0]_i_2_n_0\ : STD_LOGIC;
  signal \timer[0]_i_3_n_0\ : STD_LOGIC;
  signal \timer[0]_i_4_n_0\ : STD_LOGIC;
  signal \timer[0]_i_5_n_0\ : STD_LOGIC;
  signal \timer[0]_i_6_n_0\ : STD_LOGIC;
  signal \timer[12]_i_2_n_0\ : STD_LOGIC;
  signal \timer[12]_i_3_n_0\ : STD_LOGIC;
  signal \timer[12]_i_4_n_0\ : STD_LOGIC;
  signal \timer[12]_i_5_n_0\ : STD_LOGIC;
  signal \timer[16]_i_2_n_0\ : STD_LOGIC;
  signal \timer[16]_i_3_n_0\ : STD_LOGIC;
  signal \timer[16]_i_4_n_0\ : STD_LOGIC;
  signal \timer[16]_i_5_n_0\ : STD_LOGIC;
  signal \timer[20]_i_2_n_0\ : STD_LOGIC;
  signal \timer[20]_i_3_n_0\ : STD_LOGIC;
  signal \timer[20]_i_4_n_0\ : STD_LOGIC;
  signal \timer[20]_i_5_n_0\ : STD_LOGIC;
  signal \timer[24]_i_2_n_0\ : STD_LOGIC;
  signal \timer[24]_i_3_n_0\ : STD_LOGIC;
  signal \timer[24]_i_4_n_0\ : STD_LOGIC;
  signal \timer[24]_i_5_n_0\ : STD_LOGIC;
  signal \timer[28]_i_2_n_0\ : STD_LOGIC;
  signal \timer[28]_i_3_n_0\ : STD_LOGIC;
  signal \timer[28]_i_4_n_0\ : STD_LOGIC;
  signal \timer[28]_i_5_n_0\ : STD_LOGIC;
  signal \timer[4]_i_2_n_0\ : STD_LOGIC;
  signal \timer[4]_i_3_n_0\ : STD_LOGIC;
  signal \timer[4]_i_4_n_0\ : STD_LOGIC;
  signal \timer[4]_i_5_n_0\ : STD_LOGIC;
  signal \timer[8]_i_2_n_0\ : STD_LOGIC;
  signal \timer[8]_i_3_n_0\ : STD_LOGIC;
  signal \timer[8]_i_4_n_0\ : STD_LOGIC;
  signal \timer[8]_i_5_n_0\ : STD_LOGIC;
  signal timer_r1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal timer_r2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal timer_reg : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \timer_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \timer_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \timer_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[28]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[28]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[28]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[28]_i_1_n_7\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \timer_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal virtual_uart_data : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \virtual_uart_data[7]_i_2_n_0\ : STD_LOGIC;
  signal write_cr0 : STD_LOGIC;
  signal write_cr1 : STD_LOGIC;
  signal write_cr2 : STD_LOGIC;
  signal write_cr3 : STD_LOGIC;
  signal write_cr4 : STD_LOGIC;
  signal write_cr5 : STD_LOGIC;
  signal write_cr6 : STD_LOGIC;
  signal write_cr7 : STD_LOGIC;
  signal write_io_simu : STD_LOGIC;
  signal write_led_rg0 : STD_LOGIC;
  signal write_led_rg1 : STD_LOGIC;
  signal write_num : STD_LOGIC;
  signal write_timer : STD_LOGIC;
  signal write_timer_begin : STD_LOGIC;
  signal write_timer_begin_i_1_n_0 : STD_LOGIC;
  signal write_timer_begin_r1 : STD_LOGIC;
  signal write_timer_begin_r2 : STD_LOGIC;
  signal write_timer_begin_r3 : STD_LOGIC;
  signal write_timer_end_r1 : STD_LOGIC;
  signal write_timer_end_r2 : STD_LOGIC;
  signal write_uart_valid : STD_LOGIC;
  signal \NLW_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_key_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_step0_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_step1_count_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_timer_reg[28]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_onehot_state[0]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \FSM_onehot_state[1]_i_3\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \FSM_onehot_state[2]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \FSM_onehot_state[3]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \FSM_onehot_state[4]_i_1\ : label is "soft_lutpair23";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[0]\ : label is "iSTATE:100000,iSTATE0:010000,iSTATE1:001000,iSTATE2:000100,iSTATE3:000010,iSTATE4:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[1]\ : label is "iSTATE:100000,iSTATE0:010000,iSTATE1:001000,iSTATE2:000100,iSTATE3:000010,iSTATE4:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[2]\ : label is "iSTATE:100000,iSTATE0:010000,iSTATE1:001000,iSTATE2:000100,iSTATE3:000010,iSTATE4:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[3]\ : label is "iSTATE:100000,iSTATE0:010000,iSTATE1:001000,iSTATE2:000100,iSTATE3:000010,iSTATE4:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[4]\ : label is "iSTATE:100000,iSTATE0:010000,iSTATE1:001000,iSTATE2:000100,iSTATE3:000010,iSTATE4:000001";
  attribute FSM_ENCODED_STATES of \FSM_onehot_state_reg[5]\ : label is "iSTATE:100000,iSTATE0:010000,iSTATE1:001000,iSTATE2:000100,iSTATE3:000010,iSTATE4:000001";
  attribute SOFT_HLUTNM of R_or_W_i_1 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of arready_INST_0 : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of awready_INST_0 : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \btn_key_col[0]_INST_0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \btn_key_col[1]_INST_0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \btn_key_col[2]_INST_0\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \btn_key_col[3]_INST_0\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \btn_key_r[10]_i_4\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \btn_key_r[10]_i_5\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \btn_key_r[12]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \btn_key_r[13]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \btn_key_r[13]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \btn_key_r[14]_i_5\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \btn_key_r[15]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \btn_key_r[15]_i_5\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \btn_key_r[15]_i_9\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \btn_key_r[1]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \btn_key_r[3]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \btn_key_r[3]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \btn_key_r[4]_i_10\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \btn_key_r[4]_i_12\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \btn_key_r[4]_i_6\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \btn_key_r[4]_i_7\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \btn_key_r[4]_i_8\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \btn_key_r[4]_i_9\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \btn_key_r[5]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \btn_key_r[6]_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \btn_key_r[7]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of busy_i_2 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \conf_rdata_reg[0]_i_13\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \conf_rdata_reg[0]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \conf_rdata_reg[0]_i_6\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \conf_rdata_reg[0]_i_9\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \conf_rdata_reg[13]_i_4\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \conf_rdata_reg[14]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \conf_rdata_reg[14]_i_6\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \conf_rdata_reg[15]_i_3\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \conf_rdata_reg[15]_i_7\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \conf_rdata_reg[16]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \conf_rdata_reg[17]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \conf_rdata_reg[18]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \conf_rdata_reg[19]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \conf_rdata_reg[1]_i_4\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \conf_rdata_reg[20]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \conf_rdata_reg[21]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \conf_rdata_reg[22]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \conf_rdata_reg[23]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \conf_rdata_reg[24]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \conf_rdata_reg[25]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \conf_rdata_reg[26]_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \conf_rdata_reg[27]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \conf_rdata_reg[28]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \conf_rdata_reg[29]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \conf_rdata_reg[2]_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \conf_rdata_reg[30]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \conf_rdata_reg[31]_i_10\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \conf_rdata_reg[31]_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \conf_rdata_reg[31]_i_5\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \conf_rdata_reg[7]_i_2\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \conf_rdata_reg[7]_i_4\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \conf_rdata_reg[9]_i_4\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of conf_rvalid_reg_i_1 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \conf_wdata_r[31]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of conf_wready_reg_i_2 : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \cr0[31]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cr7[31]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cr7[31]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \io_simu[31]_i_3\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \led_data[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \led_data[10]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \led_data[11]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \led_data[12]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \led_data[13]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \led_data[14]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \led_data[15]_i_2\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \led_data[1]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \led_data[2]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \led_data[3]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \led_data[4]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \led_data[5]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \led_data[6]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \led_data[7]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \led_data[8]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \led_data[9]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \led_rg1_data[1]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \num_a_g[0]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \num_a_g[1]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \num_a_g[2]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \num_a_g[4]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \num_a_g[5]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \num_a_g[6]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \num_csn[0]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \num_csn[1]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \num_csn[2]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \num_csn[3]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \num_csn[4]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \num_csn[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \num_csn[6]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \num_csn[7]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of num_monitor_i_2 : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of open_trace_i_3 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of open_trace_i_4 : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \pseudo_random_23[0]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \pseudo_random_23[10]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \pseudo_random_23[11]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \pseudo_random_23[12]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \pseudo_random_23[13]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \pseudo_random_23[14]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \pseudo_random_23[15]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \pseudo_random_23[1]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \pseudo_random_23[2]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \pseudo_random_23[3]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \pseudo_random_23[4]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \pseudo_random_23[5]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \pseudo_random_23[6]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \pseudo_random_23[7]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \pseudo_random_23[8]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \pseudo_random_23[9]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \scan_data[0]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \scan_data[0]_i_4\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \scan_data[1]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \scan_data[1]_i_4\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \scan_data[2]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \scan_data[2]_i_4\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \scan_data[3]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \scan_data[3]_i_4\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \state_count[0]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \state_count[1]_i_1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \state_count[2]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \state_count[3]_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \virtual_uart_data[7]_i_2\ : label is "soft_lutpair66";
begin
  bvalid <= \^bvalid\;
  conf_rvalid_reg_reg_0 <= \^conf_rvalid_reg_reg_0\;
  conf_wready_reg_reg_0 <= \^conf_wready_reg_reg_0\;
  led(15 downto 0) <= \^led\(15 downto 0);
  led_rg0(1 downto 0) <= \^led_rg0\(1 downto 0);
  led_rg1(1 downto 0) <= \^led_rg1\(1 downto 0);
  num_data(31 downto 0) <= \^num_data\(31 downto 0);
  rlast <= \^rlast\;
\FSM_onehot_state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0E0EAEA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => p_1_in7_in,
      I2 => \key_start1__1\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => key_sample,
      O => \FSM_onehot_state[0]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0FFF0F0F0EFF0E"
    )
        port map (
      I0 => \FSM_onehot_state[1]_i_2_n_0\,
      I1 => p_1_in7_in,
      I2 => \key_start1__1\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => key_sample,
      I5 => p_1_in10_in,
      O => \FSM_onehot_state[1]_i_1_n_0\
    );
\FSM_onehot_state[1]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_1_in12_in,
      I1 => p_1_in11_in,
      O => \FSM_onehot_state[1]_i_2_n_0\
    );
\FSM_onehot_state[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => btn_key_row(3),
      I1 => btn_key_row(2),
      I2 => btn_key_row(0),
      I3 => btn_key_row(1),
      O => \key_start1__1\
    );
\FSM_onehot_state[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => p_1_in10_in,
      I1 => btn_key_row(1),
      I2 => btn_key_row(0),
      I3 => btn_key_row(2),
      I4 => btn_key_row(3),
      O => \FSM_onehot_state[2]_i_1_n_0\
    );
\FSM_onehot_state[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => btn_key_row(1),
      I2 => btn_key_row(0),
      I3 => btn_key_row(2),
      I4 => btn_key_row(3),
      O => \FSM_onehot_state[3]_i_1_n_0\
    );
\FSM_onehot_state[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => p_1_in12_in,
      I1 => btn_key_row(1),
      I2 => btn_key_row(0),
      I3 => btn_key_row(2),
      I4 => btn_key_row(3),
      O => \FSM_onehot_state[4]_i_1_n_0\
    );
\FSM_onehot_state[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0888888888888888"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => key_sample,
      I2 => btn_key_row(3),
      I3 => btn_key_row(2),
      I4 => btn_key_row(0),
      I5 => btn_key_row(1),
      O => \FSM_onehot_state[5]_i_1_n_0\
    );
\FSM_onehot_state_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => aclk,
      CE => state_count_reg(3),
      D => \FSM_onehot_state[0]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[0]\,
      S => \buf_id[3]_i_1_n_0\
    );
\FSM_onehot_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => state_count_reg(3),
      D => \FSM_onehot_state[1]_i_1_n_0\,
      Q => \FSM_onehot_state_reg_n_0_[1]\,
      R => \buf_id[3]_i_1_n_0\
    );
\FSM_onehot_state_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => state_count_reg(3),
      D => \FSM_onehot_state[2]_i_1_n_0\,
      Q => p_1_in7_in,
      R => \buf_id[3]_i_1_n_0\
    );
\FSM_onehot_state_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => state_count_reg(3),
      D => \FSM_onehot_state[3]_i_1_n_0\,
      Q => p_1_in10_in,
      R => \buf_id[3]_i_1_n_0\
    );
\FSM_onehot_state_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => state_count_reg(3),
      D => \FSM_onehot_state[4]_i_1_n_0\,
      Q => p_1_in11_in,
      R => \buf_id[3]_i_1_n_0\
    );
\FSM_onehot_state_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => aclk,
      CE => state_count_reg(3),
      D => \FSM_onehot_state[5]_i_1_n_0\,
      Q => p_1_in12_in,
      R => \buf_id[3]_i_1_n_0\
    );
R_or_W_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1030"
    )
        port map (
      I0 => R_or_W,
      I1 => busy,
      I2 => arvalid,
      I3 => awvalid,
      O => ar_enter
    );
R_or_W_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => ar_enter,
      Q => R_or_W,
      R => \buf_id[3]_i_1_n_0\
    );
arready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => R_or_W,
      I1 => awvalid,
      I2 => busy,
      O => arready
    );
awready_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0D"
    )
        port map (
      I0 => arvalid,
      I1 => R_or_W,
      I2 => busy,
      O => awready
    );
\btn_key_col[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_1_in7_in,
      I1 => p_1_in11_in,
      I2 => p_1_in10_in,
      O => btn_key_col(0)
    );
\btn_key_col[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_1_in7_in,
      I1 => p_1_in12_in,
      I2 => p_1_in10_in,
      O => btn_key_col(1)
    );
\btn_key_col[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => p_1_in12_in,
      I2 => p_1_in7_in,
      O => btn_key_col(2)
    );
\btn_key_col[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => p_1_in12_in,
      I2 => p_1_in10_in,
      O => btn_key_col(3)
    );
\btn_key_r[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => btn_key_r(0),
      I1 => btn_key_r0,
      I2 => btn_key_tmp1,
      I3 => \btn_key_r[13]_i_3_n_0\,
      O => \btn_key_r[0]_i_1_n_0\
    );
\btn_key_r[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002FFFF00000000"
    )
        port map (
      I0 => \btn_key_r[10]_i_2_n_0\,
      I1 => \btn_key_r[10]_i_3_n_0\,
      I2 => btn_key_tmp7,
      I3 => \btn_key_r[10]_i_5_n_0\,
      I4 => \btn_key_r[14]_i_3_n_0\,
      I5 => \btn_key_r[10]_i_6_n_0\,
      O => \btn_key_r[10]_i_1_n_0\
    );
\btn_key_r[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000033301110333"
    )
        port map (
      I0 => \btn_key_r[1]_i_2_n_0\,
      I1 => \btn_key_r[13]_i_3_n_0\,
      I2 => p_1_in11_in,
      I3 => \btn_key_r[12]_i_2_n_0\,
      I4 => p_1_in10_in,
      I5 => \btn_key_r[14]_i_5_n_0\,
      O => \btn_key_r[10]_i_2_n_0\
    );
\btn_key_r[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0AA0C000C0000000"
    )
        port map (
      I0 => p_1_in12_in,
      I1 => p_1_in11_in,
      I2 => btn_key_row(3),
      I3 => btn_key_row(2),
      I4 => btn_key_row(0),
      I5 => btn_key_row(1),
      O => \btn_key_r[10]_i_3_n_0\
    );
\btn_key_r[10]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => btn_key_row(3),
      I2 => btn_key_row(1),
      I3 => btn_key_row(0),
      I4 => btn_key_row(2),
      O => btn_key_tmp7
    );
\btn_key_r[10]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20800000"
    )
        port map (
      I0 => p_1_in12_in,
      I1 => btn_key_row(0),
      I2 => btn_key_row(2),
      I3 => btn_key_row(1),
      I4 => btn_key_row(3),
      O => \btn_key_r[10]_i_5_n_0\
    );
\btn_key_r[10]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => p_1_in10_in,
      I1 => p_0_in8_in,
      I2 => btn_key_r0,
      I3 => btn_key_r(10),
      O => \btn_key_r[10]_i_6_n_0\
    );
\btn_key_r[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0800FFFF08000800"
    )
        port map (
      I0 => \btn_key_r[15]_i_2_n_0\,
      I1 => \btn_key_r[11]_i_2_n_0\,
      I2 => btn_key_tmp14,
      I3 => \btn_key_r[11]_i_3_n_0\,
      I4 => \btn_key_r[14]_i_3_n_0\,
      I5 => \btn_key_r[11]_i_4_n_0\,
      O => \btn_key_r[11]_i_1_n_0\
    );
\btn_key_r[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"977F977F9FFFFFFF"
    )
        port map (
      I0 => btn_key_row(1),
      I1 => btn_key_row(0),
      I2 => btn_key_row(2),
      I3 => btn_key_row(3),
      I4 => p_1_in11_in,
      I5 => p_1_in12_in,
      O => \btn_key_r[11]_i_2_n_0\
    );
\btn_key_r[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000040774000"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => p_0_in8_in,
      I2 => p_1_in7_in,
      I3 => btn_key_r0,
      I4 => btn_key_r(11),
      I5 => btn_key_tmp13,
      O => \btn_key_r[11]_i_3_n_0\
    );
\btn_key_r[11]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => p_1_in7_in,
      I1 => p_0_in8_in,
      I2 => btn_key_r0,
      I3 => btn_key_r(11),
      O => \btn_key_r[11]_i_4_n_0\
    );
\btn_key_r[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0703030304000000"
    )
        port map (
      I0 => \btn_key_r[15]_i_3_n_0\,
      I1 => btn_key_r0,
      I2 => \btn_key_r[13]_i_3_n_0\,
      I3 => \btn_key_r[12]_i_2_n_0\,
      I4 => p_1_in12_in,
      I5 => btn_key_r(12),
      O => \btn_key_r[12]_i_1_n_0\
    );
\btn_key_r[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => btn_key_row(3),
      I1 => btn_key_row(1),
      I2 => btn_key_row(0),
      I3 => btn_key_row(2),
      O => \btn_key_r[12]_i_2_n_0\
    );
\btn_key_r[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001F000F00100000"
    )
        port map (
      I0 => \btn_key_r[15]_i_3_n_0\,
      I1 => \btn_key_r[15]_i_6_n_0\,
      I2 => btn_key_r0,
      I3 => \btn_key_r[13]_i_3_n_0\,
      I4 => btn_key_tmp8,
      I5 => btn_key_r(13),
      O => \btn_key_r[13]_i_1_n_0\
    );
\btn_key_r[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2020200000000000"
    )
        port map (
      I0 => \btn_key_r[4]_i_3_n_0\,
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => state_count_reg(3),
      I3 => \FSM_onehot_state[1]_i_2_n_0\,
      I4 => \btn_key_r[13]_i_5_n_0\,
      I5 => \btn_key_r[14]_i_6_n_0\,
      O => btn_key_r0
    );
\btn_key_r[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00001101FFFFFFFF"
    )
        port map (
      I0 => \btn_key_r[13]_i_6_n_0\,
      I1 => p_1_in11_in,
      I2 => p_1_in12_in,
      I3 => \key_start1__1\,
      I4 => \btn_key_r[4]_i_4_n_0\,
      I5 => aresetn,
      O => \btn_key_r[13]_i_3_n_0\
    );
\btn_key_r[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => btn_key_row(2),
      I1 => btn_key_row(0),
      I2 => btn_key_row(1),
      I3 => btn_key_row(3),
      I4 => p_1_in11_in,
      O => btn_key_tmp8
    );
\btn_key_r[13]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30FF30FA"
    )
        port map (
      I0 => p_1_in10_in,
      I1 => key_sample,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => \key_start1__1\,
      I4 => p_1_in7_in,
      O => \btn_key_r[13]_i_5_n_0\
    );
\btn_key_r[13]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F0FFF0F0F0EFF0C"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[0]\,
      I1 => p_1_in7_in,
      I2 => \key_start1__1\,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => key_sample,
      I5 => p_1_in10_in,
      O => \btn_key_r[13]_i_6_n_0\
    );
\btn_key_r[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FF0000"
    )
        port map (
      I0 => \btn_key_r[14]_i_2_n_0\,
      I1 => \btn_key_r[15]_i_3_n_0\,
      I2 => \btn_key_r[15]_i_6_n_0\,
      I3 => \btn_key_r[14]_i_3_n_0\,
      I4 => \btn_key_r[14]_i_4_n_0\,
      O => \btn_key_r[14]_i_1_n_0\
    );
\btn_key_r[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000103030303"
    )
        port map (
      I0 => \btn_key_r[14]_i_5_n_0\,
      I1 => btn_key_tmp8,
      I2 => \btn_key_r[13]_i_3_n_0\,
      I3 => \btn_key_r[1]_i_2_n_0\,
      I4 => p_0_in8_in,
      I5 => p_1_in10_in,
      O => \btn_key_r[14]_i_2_n_0\
    );
\btn_key_r[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F0F0F0F0F0F0FFF"
    )
        port map (
      I0 => state_count_reg(3),
      I1 => \FSM_onehot_state_reg_n_0_[1]\,
      I2 => aresetn,
      I3 => \btn_key_r[14]_i_6_n_0\,
      I4 => \btn_key_r[14]_i_7_n_0\,
      I5 => \btn_key_r[4]_i_3_n_0\,
      O => \btn_key_r[14]_i_3_n_0\
    );
\btn_key_r[14]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => \btn_key_r[12]_i_2_n_0\,
      I1 => p_1_in10_in,
      I2 => btn_key_r0,
      I3 => btn_key_r(14),
      O => \btn_key_r[14]_i_4_n_0\
    );
\btn_key_r[14]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => btn_key_row(3),
      I1 => btn_key_row(2),
      I2 => btn_key_row(0),
      I3 => btn_key_row(1),
      O => \btn_key_r[14]_i_5_n_0\
    );
\btn_key_r[14]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFAAFFFFAFAAFFEE"
    )
        port map (
      I0 => p_1_in10_in,
      I1 => \FSM_onehot_state[1]_i_2_n_0\,
      I2 => key_sample,
      I3 => \FSM_onehot_state_reg_n_0_[1]\,
      I4 => \key_start1__1\,
      I5 => p_1_in7_in,
      O => \btn_key_r[14]_i_6_n_0\
    );
\btn_key_r[14]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF33F332F2"
    )
        port map (
      I0 => p_1_in7_in,
      I1 => \key_start1__1\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => key_sample,
      I4 => p_1_in10_in,
      I5 => \FSM_onehot_state[1]_i_2_n_0\,
      O => \btn_key_r[14]_i_7_n_0\
    );
\btn_key_r[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00000020"
    )
        port map (
      I0 => \btn_key_r[15]_i_2_n_0\,
      I1 => \btn_key_r[15]_i_3_n_0\,
      I2 => \btn_key_r[15]_i_4_n_0\,
      I3 => btn_key_tmp14,
      I4 => \btn_key_r[15]_i_6_n_0\,
      I5 => \btn_key_r[15]_i_7_n_0\,
      O => \btn_key_r[15]_i_1_n_0\
    );
\btn_key_r[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A22A2AAA2AAAAAAA"
    )
        port map (
      I0 => \btn_key_r[15]_i_8_n_0\,
      I1 => p_1_in10_in,
      I2 => btn_key_row(3),
      I3 => btn_key_row(1),
      I4 => btn_key_row(0),
      I5 => btn_key_row(2),
      O => \btn_key_r[15]_i_2_n_0\
    );
\btn_key_r[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08808000"
    )
        port map (
      I0 => p_1_in12_in,
      I1 => btn_key_row(3),
      I2 => btn_key_row(2),
      I3 => btn_key_row(0),
      I4 => btn_key_row(1),
      O => \btn_key_r[15]_i_3_n_0\
    );
\btn_key_r[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000050045400500"
    )
        port map (
      I0 => btn_key_tmp13,
      I1 => \btn_key_r[12]_i_2_n_0\,
      I2 => btn_key_r0,
      I3 => btn_key_r(15),
      I4 => p_1_in7_in,
      I5 => p_0_in8_in,
      O => \btn_key_r[15]_i_4_n_0\
    );
\btn_key_r[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => btn_key_row(1),
      I1 => btn_key_row(0),
      I2 => btn_key_row(2),
      I3 => btn_key_row(3),
      I4 => p_1_in7_in,
      O => btn_key_tmp14
    );
\btn_key_r[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2CC0C00020000000"
    )
        port map (
      I0 => p_1_in12_in,
      I1 => btn_key_row(3),
      I2 => btn_key_row(1),
      I3 => btn_key_row(2),
      I4 => btn_key_row(0),
      I5 => p_1_in11_in,
      O => \btn_key_r[15]_i_6_n_0\
    );
\btn_key_r[15]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000E222"
    )
        port map (
      I0 => btn_key_r(15),
      I1 => btn_key_r0,
      I2 => p_1_in7_in,
      I3 => \btn_key_r[12]_i_2_n_0\,
      I4 => \btn_key_r[14]_i_3_n_0\,
      O => \btn_key_r[15]_i_7_n_0\
    );
\btn_key_r[15]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00A8A8A8"
    )
        port map (
      I0 => aresetn,
      I1 => \btn_key_r[4]_i_4_n_0\,
      I2 => \btn_key_r[4]_i_3_n_0\,
      I3 => p_1_in11_in,
      I4 => \btn_key_r[12]_i_2_n_0\,
      O => \btn_key_r[15]_i_8_n_0\
    );
\btn_key_r[15]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => btn_key_row(3),
      I1 => btn_key_row(1),
      I2 => btn_key_row(2),
      I3 => btn_key_row(0),
      I4 => p_1_in7_in,
      O => btn_key_tmp13
    );
\btn_key_r[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0703030304000000"
    )
        port map (
      I0 => \btn_key_r[3]_i_3_n_0\,
      I1 => btn_key_r0,
      I2 => \btn_key_r[13]_i_3_n_0\,
      I3 => \btn_key_r[1]_i_2_n_0\,
      I4 => p_1_in11_in,
      I5 => btn_key_r(1),
      O => \btn_key_r[1]_i_1_n_0\
    );
\btn_key_r[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => btn_key_row(0),
      I1 => btn_key_row(2),
      I2 => btn_key_row(1),
      I3 => btn_key_row(3),
      O => \btn_key_r[1]_i_2_n_0\
    );
\btn_key_r[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000001FF00000000"
    )
        port map (
      I0 => btn_key_tmp8,
      I1 => \btn_key_r[3]_i_2_n_0\,
      I2 => \btn_key_r[3]_i_3_n_0\,
      I3 => btn_key_r0,
      I4 => \btn_key_r[13]_i_3_n_0\,
      I5 => \btn_key_r[2]_i_2_n_0\,
      O => \btn_key_r[2]_i_1_n_0\
    );
\btn_key_r[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => \btn_key_r[1]_i_2_n_0\,
      I1 => p_1_in10_in,
      I2 => btn_key_r0,
      I3 => btn_key_r(2),
      O => \btn_key_r[2]_i_2_n_0\
    );
\btn_key_r[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FF0000"
    )
        port map (
      I0 => \btn_key_r[15]_i_2_n_0\,
      I1 => \btn_key_r[3]_i_2_n_0\,
      I2 => \btn_key_r[3]_i_3_n_0\,
      I3 => \btn_key_r[14]_i_3_n_0\,
      I4 => \btn_key_r[3]_i_4_n_0\,
      O => \btn_key_r[3]_i_1_n_0\
    );
\btn_key_r[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"28800000"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => btn_key_row(0),
      I2 => btn_key_row(2),
      I3 => btn_key_row(1),
      I4 => btn_key_row(3),
      O => \btn_key_r[3]_i_2_n_0\
    );
\btn_key_r[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"68800000"
    )
        port map (
      I0 => btn_key_row(3),
      I1 => btn_key_row(1),
      I2 => btn_key_row(2),
      I3 => btn_key_row(0),
      I4 => p_1_in12_in,
      O => \btn_key_r[3]_i_3_n_0\
    );
\btn_key_r[3]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => btn_key_tmp13,
      I1 => btn_key_r0,
      I2 => btn_key_r(3),
      O => \btn_key_r[3]_i_4_n_0\
    );
\btn_key_r[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFB00000"
    )
        port map (
      I0 => \btn_key_r[4]_i_2_n_0\,
      I1 => btn_key_tmp1,
      I2 => \btn_key_r[4]_i_3_n_0\,
      I3 => \btn_key_r[4]_i_4_n_0\,
      I4 => \btn_key_r[4]_i_5_n_0\,
      O => \btn_key_r[4]_i_1_n_0\
    );
\btn_key_r[4]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => btn_key_row(1),
      I2 => btn_key_row(0),
      I3 => btn_key_row(2),
      I4 => btn_key_row(3),
      O => \btn_key_r[4]_i_10_n_0\
    );
\btn_key_r[4]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFF0000"
    )
        port map (
      I0 => btn_key_row(3),
      I1 => btn_key_row(2),
      I2 => btn_key_row(0),
      I3 => btn_key_row(1),
      I4 => p_1_in12_in,
      I5 => p_1_in11_in,
      O => \btn_key_r[4]_i_11_n_0\
    );
\btn_key_r[4]_i_12\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => btn_key_row(1),
      I1 => btn_key_row(0),
      I2 => btn_key_row(2),
      I3 => btn_key_row(3),
      I4 => p_1_in12_in,
      O => btn_key_tmp2
    );
\btn_key_r[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0071FFFF"
    )
        port map (
      I0 => p_1_in10_in,
      I1 => \FSM_onehot_state[1]_i_2_n_0\,
      I2 => \key_start1__1\,
      I3 => \btn_key_r[4]_i_6_n_0\,
      I4 => state_count_reg(3),
      I5 => \FSM_onehot_state_reg_n_0_[1]\,
      O => \btn_key_r[4]_i_2_n_0\
    );
\btn_key_r[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \btn_key_r[4]_i_7_n_0\,
      I1 => \btn_key_r[4]_i_8_n_0\,
      I2 => \btn_key_r[4]_i_9_n_0\,
      I3 => \btn_key_r[4]_i_10_n_0\,
      I4 => \FSM_onehot_state[5]_i_1_n_0\,
      I5 => \btn_key_r[4]_i_11_n_0\,
      O => \btn_key_r[4]_i_3_n_0\
    );
\btn_key_r[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF32F2"
    )
        port map (
      I0 => p_1_in7_in,
      I1 => \key_start1__1\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => key_sample,
      I4 => \FSM_onehot_state[1]_i_2_n_0\,
      I5 => p_1_in10_in,
      O => \btn_key_r[4]_i_4_n_0\
    );
\btn_key_r[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => btn_key_r(4),
      I1 => btn_key_r0,
      I2 => btn_key_tmp2,
      I3 => aresetn,
      O => \btn_key_r[4]_i_5_n_0\
    );
\btn_key_r[4]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"32F2"
    )
        port map (
      I0 => p_1_in7_in,
      I1 => \key_start1__1\,
      I2 => \FSM_onehot_state_reg_n_0_[1]\,
      I3 => key_sample,
      O => \btn_key_r[4]_i_6_n_0\
    );
\btn_key_r[4]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => p_1_in10_in,
      I1 => btn_key_row(1),
      I2 => btn_key_row(0),
      I3 => btn_key_row(2),
      I4 => btn_key_row(3),
      O => \btn_key_r[4]_i_7_n_0\
    );
\btn_key_r[4]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => key_sample,
      O => \btn_key_r[4]_i_8_n_0\
    );
\btn_key_r[4]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2AAAAAAA"
    )
        port map (
      I0 => p_1_in7_in,
      I1 => btn_key_row(1),
      I2 => btn_key_row(0),
      I3 => btn_key_row(2),
      I4 => btn_key_row(3),
      O => \btn_key_r[4]_i_9_n_0\
    );
\btn_key_r[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001F000F00100000"
    )
        port map (
      I0 => btn_key_tmp1,
      I1 => \btn_key_r[7]_i_4_n_0\,
      I2 => btn_key_r0,
      I3 => \btn_key_r[13]_i_3_n_0\,
      I4 => btn_key_tmp6,
      I5 => btn_key_r(5),
      O => \btn_key_r[5]_i_1_n_0\
    );
\btn_key_r[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => btn_key_row(1),
      I1 => btn_key_row(0),
      I2 => btn_key_row(2),
      I3 => btn_key_row(3),
      I4 => p_1_in11_in,
      O => btn_key_tmp6
    );
\btn_key_r[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0002FFFF00000000"
    )
        port map (
      I0 => \btn_key_r[6]_i_2_n_0\,
      I1 => \btn_key_r[7]_i_2_n_0\,
      I2 => btn_key_tmp1,
      I3 => \btn_key_r[7]_i_4_n_0\,
      I4 => \btn_key_r[14]_i_3_n_0\,
      I5 => \btn_key_r[6]_i_4_n_0\,
      O => \btn_key_r[6]_i_1_n_0\
    );
\btn_key_r[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00070707"
    )
        port map (
      I0 => \btn_key_r[12]_i_2_n_0\,
      I1 => p_1_in11_in,
      I2 => \btn_key_r[13]_i_3_n_0\,
      I3 => p_1_in10_in,
      I4 => \btn_key_r[1]_i_2_n_0\,
      O => \btn_key_r[6]_i_2_n_0\
    );
\btn_key_r[6]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => btn_key_row(3),
      I1 => btn_key_row(1),
      I2 => btn_key_row(2),
      I3 => btn_key_row(0),
      I4 => p_1_in12_in,
      O => btn_key_tmp1
    );
\btn_key_r[6]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => \btn_key_r[14]_i_5_n_0\,
      I1 => p_1_in10_in,
      I2 => btn_key_r0,
      I3 => btn_key_r(6),
      O => \btn_key_r[6]_i_4_n_0\
    );
\btn_key_r[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020FFFF00200020"
    )
        port map (
      I0 => \btn_key_r[15]_i_2_n_0\,
      I1 => \btn_key_r[7]_i_2_n_0\,
      I2 => \btn_key_r[7]_i_3_n_0\,
      I3 => \btn_key_r[7]_i_4_n_0\,
      I4 => \btn_key_r[14]_i_3_n_0\,
      I5 => \btn_key_r[7]_i_5_n_0\,
      O => \btn_key_r[7]_i_1_n_0\
    );
\btn_key_r[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08008000"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => btn_key_row(3),
      I2 => btn_key_row(2),
      I3 => btn_key_row(0),
      I4 => btn_key_row(1),
      O => \btn_key_r[7]_i_2_n_0\
    );
\btn_key_r[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000500CFC00F00"
    )
        port map (
      I0 => p_1_in12_in,
      I1 => \btn_key_r[14]_i_5_n_0\,
      I2 => btn_key_r0,
      I3 => btn_key_r(7),
      I4 => p_1_in7_in,
      I5 => \btn_key_r[1]_i_2_n_0\,
      O => \btn_key_r[7]_i_3_n_0\
    );
\btn_key_r[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0CC0A000C0000000"
    )
        port map (
      I0 => p_1_in11_in,
      I1 => p_1_in12_in,
      I2 => btn_key_row(3),
      I3 => btn_key_row(2),
      I4 => btn_key_row(0),
      I5 => btn_key_row(1),
      O => \btn_key_r[7]_i_4_n_0\
    );
\btn_key_r[7]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => \btn_key_r[14]_i_5_n_0\,
      I1 => p_1_in7_in,
      I2 => btn_key_r0,
      I3 => btn_key_r(7),
      O => \btn_key_r[7]_i_5_n_0\
    );
\btn_key_r[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0703030304000000"
    )
        port map (
      I0 => \btn_key_r[10]_i_5_n_0\,
      I1 => btn_key_r0,
      I2 => \btn_key_r[13]_i_3_n_0\,
      I3 => p_1_in12_in,
      I4 => p_0_in8_in,
      I5 => btn_key_r(8),
      O => \btn_key_r[8]_i_1_n_0\
    );
\btn_key_r[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4000"
    )
        port map (
      I0 => btn_key_row(2),
      I1 => btn_key_row(0),
      I2 => btn_key_row(1),
      I3 => btn_key_row(3),
      O => p_0_in8_in
    );
\btn_key_r[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"001F000F00100000"
    )
        port map (
      I0 => \btn_key_r[10]_i_3_n_0\,
      I1 => \btn_key_r[10]_i_5_n_0\,
      I2 => btn_key_r0,
      I3 => \btn_key_r[13]_i_3_n_0\,
      I4 => btn_key_tmp7,
      I5 => btn_key_r(9),
      O => \btn_key_r[9]_i_1_n_0\
    );
\btn_key_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[0]_i_1_n_0\,
      Q => btn_key_r(0),
      R => '0'
    );
\btn_key_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[10]_i_1_n_0\,
      Q => btn_key_r(10),
      R => '0'
    );
\btn_key_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[11]_i_1_n_0\,
      Q => btn_key_r(11),
      R => '0'
    );
\btn_key_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[12]_i_1_n_0\,
      Q => btn_key_r(12),
      R => '0'
    );
\btn_key_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[13]_i_1_n_0\,
      Q => btn_key_r(13),
      R => '0'
    );
\btn_key_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[14]_i_1_n_0\,
      Q => btn_key_r(14),
      R => '0'
    );
\btn_key_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[15]_i_1_n_0\,
      Q => btn_key_r(15),
      R => '0'
    );
\btn_key_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[1]_i_1_n_0\,
      Q => btn_key_r(1),
      R => '0'
    );
\btn_key_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[2]_i_1_n_0\,
      Q => btn_key_r(2),
      R => '0'
    );
\btn_key_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[3]_i_1_n_0\,
      Q => btn_key_r(3),
      R => '0'
    );
\btn_key_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[4]_i_1_n_0\,
      Q => btn_key_r(4),
      R => '0'
    );
\btn_key_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[5]_i_1_n_0\,
      Q => btn_key_r(5),
      R => '0'
    );
\btn_key_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[6]_i_1_n_0\,
      Q => btn_key_r(6),
      R => '0'
    );
\btn_key_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[7]_i_1_n_0\,
      Q => btn_key_r(7),
      R => '0'
    );
\btn_key_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[8]_i_1_n_0\,
      Q => btn_key_r(8),
      R => '0'
    );
\btn_key_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \btn_key_r[9]_i_1_n_0\,
      Q => btn_key_r(9),
      R => '0'
    );
btn_step0_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => btn_step(0),
      I1 => step0_sample,
      I2 => btn_step0_r,
      O => btn_step0_r_i_1_n_0
    );
btn_step0_r_reg: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => btn_step0_r_i_1_n_0,
      Q => btn_step0_r,
      S => \buf_id[3]_i_1_n_0\
    );
btn_step1_r_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => btn_step(1),
      I1 => step1_sample,
      I2 => btn_step1_r,
      O => btn_step1_r_i_1_n_0
    );
btn_step1_r_reg: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => btn_step1_r_i_1_n_0,
      Q => btn_step1_r,
      S => \buf_id[3]_i_1_n_0\
    );
\buf_addr[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(0),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(0),
      O => p_1_in(0)
    );
\buf_addr[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(10),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(10),
      O => p_1_in(10)
    );
\buf_addr[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(11),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(11),
      O => p_1_in(11)
    );
\buf_addr[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(12),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(12),
      O => p_1_in(12)
    );
\buf_addr[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(13),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(13),
      O => p_1_in(13)
    );
\buf_addr[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(14),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(14),
      O => p_1_in(14)
    );
\buf_addr[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(15),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(15),
      O => p_1_in(15)
    );
\buf_addr[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(1),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(1),
      O => p_1_in(1)
    );
\buf_addr[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(2),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(2),
      O => p_1_in(2)
    );
\buf_addr[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(3),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(3),
      O => p_1_in(3)
    );
\buf_addr[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(4),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(4),
      O => p_1_in(4)
    );
\buf_addr[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(5),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(5),
      O => p_1_in(5)
    );
\buf_addr[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(6),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(6),
      O => p_1_in(6)
    );
\buf_addr[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(7),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(7),
      O => p_1_in(7)
    );
\buf_addr[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(8),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(8),
      O => p_1_in(8)
    );
\buf_addr[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => araddr(9),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awaddr(9),
      O => p_1_in(9)
    );
\buf_addr_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(0),
      Q => buf_addr(0),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(10),
      Q => buf_addr(10),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(11),
      Q => buf_addr(11),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(12),
      Q => buf_addr(12),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(13),
      Q => buf_addr(13),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(14),
      Q => buf_addr(14),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(15),
      Q => buf_addr(15),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(1),
      Q => buf_addr(1),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(2),
      Q => buf_addr(2),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(3),
      Q => buf_addr(3),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(4),
      Q => buf_addr(4),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(5),
      Q => buf_addr(5),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(6),
      Q => buf_addr(6),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(7),
      Q => buf_addr(7),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(8),
      Q => buf_addr(8),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_addr_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => p_1_in(9),
      Q => buf_addr(9),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_id[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => arid(0),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awid(0),
      O => \buf_id[0]_i_1_n_0\
    );
\buf_id[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => arid(1),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awid(1),
      O => \buf_id[1]_i_1_n_0\
    );
\buf_id[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => arid(2),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awid(2),
      O => \buf_id[2]_i_1_n_0\
    );
\buf_id[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => \buf_id[3]_i_1_n_0\
    );
\buf_id[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => awvalid,
      I1 => arvalid,
      I2 => busy,
      O => busy01_out
    );
\buf_id[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFAF20A0"
    )
        port map (
      I0 => arid(3),
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      I4 => awid(3),
      O => \buf_id[3]_i_3_n_0\
    );
\buf_id_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => \buf_id[0]_i_1_n_0\,
      Q => bid(0),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_id_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => \buf_id[1]_i_1_n_0\,
      Q => bid(1),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_id_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => \buf_id[2]_i_1_n_0\,
      Q => bid(2),
      R => \buf_id[3]_i_1_n_0\
    );
\buf_id_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => busy01_out,
      D => \buf_id[3]_i_3_n_0\,
      Q => bid(3),
      R => \buf_id[3]_i_1_n_0\
    );
busy_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFBFAAFFFFAAAA"
    )
        port map (
      I0 => aw_enter,
      I1 => \^bvalid\,
      I2 => bready,
      I3 => busy_i_2_n_0,
      I4 => ar_enter,
      I5 => busy,
      O => busy_i_1_n_0
    );
busy_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => rready,
      I1 => \^rlast\,
      I2 => \^conf_rvalid_reg_reg_0\,
      O => busy_i_2_n_0
    );
busy_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => busy_i_1_n_0,
      Q => busy,
      R => \buf_id[3]_i_1_n_0\
    );
conf_bvalid_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4444444"
    )
        port map (
      I0 => bready,
      I1 => \^bvalid\,
      I2 => wvalid,
      I3 => \^conf_wready_reg_reg_0\,
      I4 => wlast,
      O => conf_bvalid_reg_i_1_n_0
    );
conf_bvalid_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => conf_bvalid_reg_i_1_n_0,
      Q => \^bvalid\,
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFEEEAAAAAAAA"
    )
        port map (
      I0 => \conf_rdata_reg[0]_i_2_n_0\,
      I1 => \conf_rdata_reg[0]_i_3_n_0\,
      I2 => \conf_rdata_reg[0]_i_4_n_0\,
      I3 => \conf_rdata_reg[0]_i_5_n_0\,
      I4 => \conf_rdata_reg[0]_i_6_n_0\,
      I5 => \conf_rdata_reg[7]_i_5_n_0\,
      O => \conf_rdata_reg[0]_i_1_n_0\
    );
\conf_rdata_reg[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => buf_addr(6),
      I1 => buf_addr(5),
      I2 => buf_addr(14),
      I3 => buf_addr(13),
      I4 => buf_addr(12),
      I5 => buf_addr(4),
      O => \conf_rdata_reg[0]_i_10_n_0\
    );
\conf_rdata_reg[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(0),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(0),
      I4 => \conf_rdata_reg[0]_i_14_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[0]_i_11_n_0\
    );
\conf_rdata_reg[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(0),
      I1 => cr3(0),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(0),
      I5 => cr2(0),
      O => \conf_rdata_reg[0]_i_12_n_0\
    );
\conf_rdata_reg[0]_i_13\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(13),
      I2 => buf_addr(14),
      O => \conf_rdata_reg[0]_i_13_n_0\
    );
\conf_rdata_reg[0]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(0),
      I1 => cr7(0),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(0),
      I5 => cr6(0),
      O => \conf_rdata_reg[0]_i_14_n_0\
    );
\conf_rdata_reg[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \conf_rdata_reg[15]_i_9_n_0\,
      I1 => buf_addr(5),
      I2 => buf_addr(4),
      I3 => buf_addr(6),
      I4 => btn_step1_r,
      I5 => \conf_rdata_reg[15]_i_4_n_0\,
      O => \conf_rdata_reg[0]_i_2_n_0\
    );
\conf_rdata_reg[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F000C0A00000C0A0"
    )
        port map (
      I0 => io_simu(0),
      I1 => virtual_uart_data(0),
      I2 => \conf_rdata_reg[7]_i_8_n_0\,
      I3 => buf_addr(4),
      I4 => buf_addr(5),
      I5 => open_trace,
      O => \conf_rdata_reg[0]_i_3_n_0\
    );
\conf_rdata_reg[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => buf_addr(8),
      I1 => buf_addr(10),
      I2 => buf_addr(9),
      I3 => buf_addr(11),
      O => \conf_rdata_reg[0]_i_4_n_0\
    );
\conf_rdata_reg[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[0]_i_7_n_0\,
      I1 => btn_key_r(0),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => \^num_data\(0),
      I4 => \conf_rdata_reg[31]_i_6_n_0\,
      I5 => \conf_rdata_reg[0]_i_8_n_0\,
      O => \conf_rdata_reg[0]_i_5_n_0\
    );
\conf_rdata_reg[0]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => buf_addr(5),
      I1 => buf_addr(4),
      I2 => buf_addr(6),
      I3 => num_monitor,
      I4 => \conf_rdata_reg[0]_i_9_n_0\,
      O => \conf_rdata_reg[0]_i_6_n_0\
    );
\conf_rdata_reg[0]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(0),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \^led_rg1\(0),
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[0]_i_7_n_0\
    );
\conf_rdata_reg[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[0]_i_11_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \^led_rg0\(0),
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[0]_i_12_n_0\,
      O => \conf_rdata_reg[0]_i_8_n_0\
    );
\conf_rdata_reg[0]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \conf_rdata_reg[0]_i_13_n_0\,
      I1 => buf_addr(11),
      I2 => buf_addr(10),
      I3 => buf_addr(8),
      I4 => buf_addr(9),
      O => \conf_rdata_reg[0]_i_9_n_0\
    );
\conf_rdata_reg[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => io_simu(10),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[10]_i_2_n_0\,
      I3 => \conf_rdata_reg[14]_i_3_n_0\,
      O => \conf_rdata_reg[10]_i_1_n_0\
    );
\conf_rdata_reg[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[10]_i_3_n_0\,
      I1 => \conf_rdata_reg[10]_i_4_n_0\,
      I2 => \conf_rdata_reg[14]_i_6_n_0\,
      I3 => btn_key_r(10),
      I4 => \conf_rdata_reg[15]_i_6_n_0\,
      I5 => \conf_rdata_reg[10]_i_5_n_0\,
      O => \conf_rdata_reg[10]_i_2_n_0\
    );
\conf_rdata_reg[10]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(10),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[10]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[10]_i_3_n_0\
    );
\conf_rdata_reg[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(10),
      I1 => cr7(10),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(10),
      I5 => cr6(10),
      O => \conf_rdata_reg[10]_i_4_n_0\
    );
\conf_rdata_reg[10]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[10]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[10]_i_6_n_0\,
      I4 => \conf_rdata_reg[10]_i_7_n_0\,
      O => \conf_rdata_reg[10]_i_5_n_0\
    );
\conf_rdata_reg[10]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(10),
      I1 => cr3(10),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(10),
      I5 => cr2(10),
      O => \conf_rdata_reg[10]_i_6_n_0\
    );
\conf_rdata_reg[10]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(10),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(10),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[10]_i_7_n_0\
    );
\conf_rdata_reg[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[11]_i_2_n_0\,
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => io_simu(11),
      I3 => \conf_rdata_reg[15]_i_3_n_0\,
      I4 => switch(5),
      I5 => \conf_rdata_reg[15]_i_4_n_0\,
      O => \conf_rdata_reg[11]_i_1_n_0\
    );
\conf_rdata_reg[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA888"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \conf_rdata_reg[11]_i_3_n_0\,
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(11),
      I4 => \conf_rdata_reg[11]_i_4_n_0\,
      I5 => \conf_rdata_reg[11]_i_5_n_0\,
      O => \conf_rdata_reg[11]_i_2_n_0\
    );
\conf_rdata_reg[11]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[11]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[11]_i_6_n_0\,
      I4 => \conf_rdata_reg[11]_i_7_n_0\,
      O => \conf_rdata_reg[11]_i_3_n_0\
    );
\conf_rdata_reg[11]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(6),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => \conf_rdata_reg[11]_i_8_n_0\,
      O => \conf_rdata_reg[11]_i_4_n_0\
    );
\conf_rdata_reg[11]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(11),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[11]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[11]_i_5_n_0\
    );
\conf_rdata_reg[11]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(11),
      I1 => cr3(11),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(11),
      I5 => cr2(11),
      O => \conf_rdata_reg[11]_i_6_n_0\
    );
\conf_rdata_reg[11]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(11),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(11),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[11]_i_7_n_0\
    );
\conf_rdata_reg[11]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(11),
      I1 => cr7(11),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(11),
      I5 => cr6(11),
      O => \conf_rdata_reg[11]_i_8_n_0\
    );
\conf_rdata_reg[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => io_simu(12),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[12]_i_2_n_0\,
      I3 => \conf_rdata_reg[14]_i_3_n_0\,
      O => \conf_rdata_reg[12]_i_1_n_0\
    );
\conf_rdata_reg[12]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[12]_i_3_n_0\,
      I1 => \conf_rdata_reg[12]_i_4_n_0\,
      I2 => \conf_rdata_reg[14]_i_6_n_0\,
      I3 => btn_key_r(12),
      I4 => \conf_rdata_reg[15]_i_6_n_0\,
      I5 => \conf_rdata_reg[12]_i_5_n_0\,
      O => \conf_rdata_reg[12]_i_2_n_0\
    );
\conf_rdata_reg[12]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(12),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[12]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[12]_i_3_n_0\
    );
\conf_rdata_reg[12]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(12),
      I1 => cr7(12),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(12),
      I5 => cr6(12),
      O => \conf_rdata_reg[12]_i_4_n_0\
    );
\conf_rdata_reg[12]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[12]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[12]_i_6_n_0\,
      I4 => \conf_rdata_reg[12]_i_7_n_0\,
      O => \conf_rdata_reg[12]_i_5_n_0\
    );
\conf_rdata_reg[12]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(12),
      I1 => cr3(12),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(12),
      I5 => cr2(12),
      O => \conf_rdata_reg[12]_i_6_n_0\
    );
\conf_rdata_reg[12]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(12),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(12),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[12]_i_7_n_0\
    );
\conf_rdata_reg[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[13]_i_2_n_0\,
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => io_simu(13),
      I3 => \conf_rdata_reg[15]_i_3_n_0\,
      I4 => switch(6),
      I5 => \conf_rdata_reg[15]_i_4_n_0\,
      O => \conf_rdata_reg[13]_i_1_n_0\
    );
\conf_rdata_reg[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA888"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \conf_rdata_reg[13]_i_3_n_0\,
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(13),
      I4 => \conf_rdata_reg[13]_i_4_n_0\,
      I5 => \conf_rdata_reg[13]_i_5_n_0\,
      O => \conf_rdata_reg[13]_i_2_n_0\
    );
\conf_rdata_reg[13]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[13]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[13]_i_6_n_0\,
      I4 => \conf_rdata_reg[13]_i_7_n_0\,
      O => \conf_rdata_reg[13]_i_3_n_0\
    );
\conf_rdata_reg[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(6),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => \conf_rdata_reg[13]_i_8_n_0\,
      O => \conf_rdata_reg[13]_i_4_n_0\
    );
\conf_rdata_reg[13]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(13),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[13]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[13]_i_5_n_0\
    );
\conf_rdata_reg[13]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(13),
      I1 => cr3(13),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(13),
      I5 => cr2(13),
      O => \conf_rdata_reg[13]_i_6_n_0\
    );
\conf_rdata_reg[13]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(13),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(13),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[13]_i_7_n_0\
    );
\conf_rdata_reg[13]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(13),
      I1 => cr7(13),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(13),
      I5 => cr6(13),
      O => \conf_rdata_reg[13]_i_8_n_0\
    );
\conf_rdata_reg[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => io_simu(14),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[14]_i_2_n_0\,
      I3 => \conf_rdata_reg[14]_i_3_n_0\,
      O => \conf_rdata_reg[14]_i_1_n_0\
    );
\conf_rdata_reg[14]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_4_n_0\,
      I1 => \conf_rdata_reg[14]_i_5_n_0\,
      I2 => \conf_rdata_reg[14]_i_6_n_0\,
      I3 => btn_key_r(14),
      I4 => \conf_rdata_reg[15]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_7_n_0\,
      O => \conf_rdata_reg[14]_i_2_n_0\
    );
\conf_rdata_reg[14]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => buf_addr(11),
      I1 => buf_addr(9),
      I2 => buf_addr(10),
      I3 => buf_addr(8),
      I4 => \conf_rdata_reg[7]_i_5_n_0\,
      O => \conf_rdata_reg[14]_i_3_n_0\
    );
\conf_rdata_reg[14]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(14),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[14]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[14]_i_4_n_0\
    );
\conf_rdata_reg[14]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(14),
      I1 => cr7(14),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(14),
      I5 => cr6(14),
      O => \conf_rdata_reg[14]_i_5_n_0\
    );
\conf_rdata_reg[14]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => buf_addr(14),
      I1 => buf_addr(13),
      I2 => buf_addr(6),
      I3 => buf_addr(12),
      O => \conf_rdata_reg[14]_i_6_n_0\
    );
\conf_rdata_reg[14]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[14]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[14]_i_8_n_0\,
      I4 => \conf_rdata_reg[14]_i_9_n_0\,
      O => \conf_rdata_reg[14]_i_7_n_0\
    );
\conf_rdata_reg[14]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(14),
      I1 => cr3(14),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(14),
      I5 => cr2(14),
      O => \conf_rdata_reg[14]_i_8_n_0\
    );
\conf_rdata_reg[14]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(14),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(14),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[14]_i_9_n_0\
    );
\conf_rdata_reg[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[15]_i_2_n_0\,
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => io_simu(15),
      I3 => \conf_rdata_reg[15]_i_3_n_0\,
      I4 => switch(7),
      I5 => \conf_rdata_reg[15]_i_4_n_0\,
      O => \conf_rdata_reg[15]_i_1_n_0\
    );
\conf_rdata_reg[15]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(15),
      I1 => cr3(15),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(15),
      I5 => cr2(15),
      O => \conf_rdata_reg[15]_i_10_n_0\
    );
\conf_rdata_reg[15]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(15),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(15),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[15]_i_11_n_0\
    );
\conf_rdata_reg[15]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(15),
      I1 => cr7(15),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(15),
      I5 => cr6(15),
      O => \conf_rdata_reg[15]_i_12_n_0\
    );
\conf_rdata_reg[15]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA888"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \conf_rdata_reg[15]_i_5_n_0\,
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(15),
      I4 => \conf_rdata_reg[15]_i_7_n_0\,
      I5 => \conf_rdata_reg[15]_i_8_n_0\,
      O => \conf_rdata_reg[15]_i_2_n_0\
    );
\conf_rdata_reg[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => buf_addr(5),
      I1 => buf_addr(4),
      I2 => buf_addr(6),
      I3 => \conf_rdata_reg[15]_i_9_n_0\,
      O => \conf_rdata_reg[15]_i_3_n_0\
    );
\conf_rdata_reg[15]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => buf_addr(0),
      I1 => buf_addr(2),
      I2 => buf_addr(1),
      I3 => buf_addr(3),
      I4 => buf_addr(15),
      I5 => buf_addr(7),
      O => \conf_rdata_reg[15]_i_4_n_0\
    );
\conf_rdata_reg[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[15]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[15]_i_10_n_0\,
      I4 => \conf_rdata_reg[15]_i_11_n_0\,
      O => \conf_rdata_reg[15]_i_5_n_0\
    );
\conf_rdata_reg[15]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => buf_addr(6),
      I1 => buf_addr(5),
      I2 => buf_addr(14),
      I3 => buf_addr(13),
      I4 => buf_addr(12),
      I5 => buf_addr(4),
      O => \conf_rdata_reg[15]_i_6_n_0\
    );
\conf_rdata_reg[15]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(6),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => \conf_rdata_reg[15]_i_12_n_0\,
      O => \conf_rdata_reg[15]_i_7_n_0\
    );
\conf_rdata_reg[15]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(15),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[15]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[15]_i_8_n_0\
    );
\conf_rdata_reg[15]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \conf_rdata_reg[0]_i_4_n_0\,
      I1 => buf_addr(14),
      I2 => buf_addr(13),
      I3 => buf_addr(12),
      O => \conf_rdata_reg[15]_i_9_n_0\
    );
\conf_rdata_reg[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(16),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[16]_i_2_n_0\,
      O => \conf_rdata_reg[16]_i_1_n_0\
    );
\conf_rdata_reg[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(16),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[16]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[16]_i_3_n_0\,
      O => \conf_rdata_reg[16]_i_2_n_0\
    );
\conf_rdata_reg[16]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[16]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[16]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[16]_i_5_n_0\,
      O => \conf_rdata_reg[16]_i_3_n_0\
    );
\conf_rdata_reg[16]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(16),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[16]\,
      I4 => \conf_rdata_reg[16]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[16]_i_4_n_0\
    );
\conf_rdata_reg[16]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(16),
      I1 => cr3(16),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(16),
      I5 => cr2(16),
      O => \conf_rdata_reg[16]_i_5_n_0\
    );
\conf_rdata_reg[16]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(16),
      I1 => cr7(16),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(16),
      I5 => cr6(16),
      O => \conf_rdata_reg[16]_i_6_n_0\
    );
\conf_rdata_reg[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(17),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[17]_i_2_n_0\,
      O => \conf_rdata_reg[17]_i_1_n_0\
    );
\conf_rdata_reg[17]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(17),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[17]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[17]_i_3_n_0\,
      O => \conf_rdata_reg[17]_i_2_n_0\
    );
\conf_rdata_reg[17]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[17]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[17]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[17]_i_5_n_0\,
      O => \conf_rdata_reg[17]_i_3_n_0\
    );
\conf_rdata_reg[17]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(17),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[17]\,
      I4 => \conf_rdata_reg[17]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[17]_i_4_n_0\
    );
\conf_rdata_reg[17]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(17),
      I1 => cr3(17),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(17),
      I5 => cr2(17),
      O => \conf_rdata_reg[17]_i_5_n_0\
    );
\conf_rdata_reg[17]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(17),
      I1 => cr7(17),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(17),
      I5 => cr6(17),
      O => \conf_rdata_reg[17]_i_6_n_0\
    );
\conf_rdata_reg[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(18),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[18]_i_2_n_0\,
      O => \conf_rdata_reg[18]_i_1_n_0\
    );
\conf_rdata_reg[18]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(18),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[18]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[18]_i_3_n_0\,
      O => \conf_rdata_reg[18]_i_2_n_0\
    );
\conf_rdata_reg[18]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[18]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[18]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[18]_i_5_n_0\,
      O => \conf_rdata_reg[18]_i_3_n_0\
    );
\conf_rdata_reg[18]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(18),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[18]\,
      I4 => \conf_rdata_reg[18]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[18]_i_4_n_0\
    );
\conf_rdata_reg[18]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(18),
      I1 => cr3(18),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(18),
      I5 => cr2(18),
      O => \conf_rdata_reg[18]_i_5_n_0\
    );
\conf_rdata_reg[18]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(18),
      I1 => cr7(18),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(18),
      I5 => cr6(18),
      O => \conf_rdata_reg[18]_i_6_n_0\
    );
\conf_rdata_reg[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(19),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[19]_i_2_n_0\,
      O => \conf_rdata_reg[19]_i_1_n_0\
    );
\conf_rdata_reg[19]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(19),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[19]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[19]_i_3_n_0\,
      O => \conf_rdata_reg[19]_i_2_n_0\
    );
\conf_rdata_reg[19]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[19]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[19]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[19]_i_5_n_0\,
      O => \conf_rdata_reg[19]_i_3_n_0\
    );
\conf_rdata_reg[19]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(19),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[19]\,
      I4 => \conf_rdata_reg[19]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[19]_i_4_n_0\
    );
\conf_rdata_reg[19]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(19),
      I1 => cr3(19),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(19),
      I5 => cr2(19),
      O => \conf_rdata_reg[19]_i_5_n_0\
    );
\conf_rdata_reg[19]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(19),
      I1 => cr7(19),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(19),
      I5 => cr6(19),
      O => \conf_rdata_reg[19]_i_6_n_0\
    );
\conf_rdata_reg[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAA80"
    )
        port map (
      I0 => \conf_rdata_reg[7]_i_5_n_0\,
      I1 => \conf_rdata_reg[7]_i_4_n_0\,
      I2 => virtual_uart_data(1),
      I3 => \conf_rdata_reg[1]_i_2_n_0\,
      I4 => \conf_rdata_reg[1]_i_3_n_0\,
      I5 => \conf_rdata_reg[1]_i_4_n_0\,
      O => \conf_rdata_reg[1]_i_1_n_0\
    );
\conf_rdata_reg[1]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(1),
      I1 => cr7(1),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(1),
      I5 => cr6(1),
      O => \conf_rdata_reg[1]_i_10_n_0\
    );
\conf_rdata_reg[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF88888"
    )
        port map (
      I0 => io_simu(1),
      I1 => \conf_rdata_reg[31]_i_5_n_0\,
      I2 => \conf_rdata_reg[1]_i_5_n_0\,
      I3 => \conf_rdata_reg[1]_i_6_n_0\,
      I4 => \conf_rdata_reg[0]_i_4_n_0\,
      O => \conf_rdata_reg[1]_i_2_n_0\
    );
\conf_rdata_reg[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000200000000"
    )
        port map (
      I0 => \conf_rdata_reg[15]_i_9_n_0\,
      I1 => buf_addr(5),
      I2 => buf_addr(4),
      I3 => buf_addr(6),
      I4 => btn_step0_r,
      I5 => \conf_rdata_reg[15]_i_4_n_0\,
      O => \conf_rdata_reg[1]_i_3_n_0\
    );
\conf_rdata_reg[1]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \conf_rdata_reg[15]_i_4_n_0\,
      I1 => \conf_rdata_reg[15]_i_3_n_0\,
      I2 => switch(0),
      O => \conf_rdata_reg[1]_i_4_n_0\
    );
\conf_rdata_reg[1]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_6_n_0\,
      I1 => \^num_data\(1),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(1),
      I4 => \conf_rdata_reg[1]_i_7_n_0\,
      O => \conf_rdata_reg[1]_i_5_n_0\
    );
\conf_rdata_reg[1]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[1]_i_8_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \^led_rg0\(1),
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[1]_i_9_n_0\,
      O => \conf_rdata_reg[1]_i_6_n_0\
    );
\conf_rdata_reg[1]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(1),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \^led_rg1\(1),
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[1]_i_7_n_0\
    );
\conf_rdata_reg[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(1),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(1),
      I4 => \conf_rdata_reg[1]_i_10_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[1]_i_8_n_0\
    );
\conf_rdata_reg[1]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(1),
      I1 => cr3(1),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(1),
      I5 => cr2(1),
      O => \conf_rdata_reg[1]_i_9_n_0\
    );
\conf_rdata_reg[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(20),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[20]_i_2_n_0\,
      O => \conf_rdata_reg[20]_i_1_n_0\
    );
\conf_rdata_reg[20]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(20),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[20]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[20]_i_3_n_0\,
      O => \conf_rdata_reg[20]_i_2_n_0\
    );
\conf_rdata_reg[20]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[20]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[20]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[20]_i_5_n_0\,
      O => \conf_rdata_reg[20]_i_3_n_0\
    );
\conf_rdata_reg[20]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(20),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[20]\,
      I4 => \conf_rdata_reg[20]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[20]_i_4_n_0\
    );
\conf_rdata_reg[20]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(20),
      I1 => cr3(20),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(20),
      I5 => cr2(20),
      O => \conf_rdata_reg[20]_i_5_n_0\
    );
\conf_rdata_reg[20]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(20),
      I1 => cr7(20),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(20),
      I5 => cr6(20),
      O => \conf_rdata_reg[20]_i_6_n_0\
    );
\conf_rdata_reg[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(21),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[21]_i_2_n_0\,
      O => \conf_rdata_reg[21]_i_1_n_0\
    );
\conf_rdata_reg[21]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(21),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[21]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[21]_i_3_n_0\,
      O => \conf_rdata_reg[21]_i_2_n_0\
    );
\conf_rdata_reg[21]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[21]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[21]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[21]_i_5_n_0\,
      O => \conf_rdata_reg[21]_i_3_n_0\
    );
\conf_rdata_reg[21]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(21),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[21]\,
      I4 => \conf_rdata_reg[21]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[21]_i_4_n_0\
    );
\conf_rdata_reg[21]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(21),
      I1 => cr3(21),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(21),
      I5 => cr2(21),
      O => \conf_rdata_reg[21]_i_5_n_0\
    );
\conf_rdata_reg[21]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(21),
      I1 => cr7(21),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(21),
      I5 => cr6(21),
      O => \conf_rdata_reg[21]_i_6_n_0\
    );
\conf_rdata_reg[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(22),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[22]_i_2_n_0\,
      O => \conf_rdata_reg[22]_i_1_n_0\
    );
\conf_rdata_reg[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(22),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[22]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[22]_i_3_n_0\,
      O => \conf_rdata_reg[22]_i_2_n_0\
    );
\conf_rdata_reg[22]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[22]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[22]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[22]_i_5_n_0\,
      O => \conf_rdata_reg[22]_i_3_n_0\
    );
\conf_rdata_reg[22]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(22),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[22]\,
      I4 => \conf_rdata_reg[22]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[22]_i_4_n_0\
    );
\conf_rdata_reg[22]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(22),
      I1 => cr3(22),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(22),
      I5 => cr2(22),
      O => \conf_rdata_reg[22]_i_5_n_0\
    );
\conf_rdata_reg[22]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(22),
      I1 => cr7(22),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(22),
      I5 => cr6(22),
      O => \conf_rdata_reg[22]_i_6_n_0\
    );
\conf_rdata_reg[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(23),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[23]_i_2_n_0\,
      O => \conf_rdata_reg[23]_i_1_n_0\
    );
\conf_rdata_reg[23]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(23),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[23]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[23]_i_3_n_0\,
      O => \conf_rdata_reg[23]_i_2_n_0\
    );
\conf_rdata_reg[23]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[23]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[23]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[23]_i_5_n_0\,
      O => \conf_rdata_reg[23]_i_3_n_0\
    );
\conf_rdata_reg[23]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(23),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[23]\,
      I4 => \conf_rdata_reg[23]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[23]_i_4_n_0\
    );
\conf_rdata_reg[23]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(23),
      I1 => cr3(23),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(23),
      I5 => cr2(23),
      O => \conf_rdata_reg[23]_i_5_n_0\
    );
\conf_rdata_reg[23]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(23),
      I1 => cr7(23),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(23),
      I5 => cr6(23),
      O => \conf_rdata_reg[23]_i_6_n_0\
    );
\conf_rdata_reg[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(24),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[24]_i_2_n_0\,
      O => \conf_rdata_reg[24]_i_1_n_0\
    );
\conf_rdata_reg[24]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(24),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[24]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[24]_i_3_n_0\,
      O => \conf_rdata_reg[24]_i_2_n_0\
    );
\conf_rdata_reg[24]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[24]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[24]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[24]_i_5_n_0\,
      O => \conf_rdata_reg[24]_i_3_n_0\
    );
\conf_rdata_reg[24]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(24),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[24]\,
      I4 => \conf_rdata_reg[24]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[24]_i_4_n_0\
    );
\conf_rdata_reg[24]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(24),
      I1 => cr3(24),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(24),
      I5 => cr2(24),
      O => \conf_rdata_reg[24]_i_5_n_0\
    );
\conf_rdata_reg[24]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(24),
      I1 => cr7(24),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(24),
      I5 => cr6(24),
      O => \conf_rdata_reg[24]_i_6_n_0\
    );
\conf_rdata_reg[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(25),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[25]_i_2_n_0\,
      O => \conf_rdata_reg[25]_i_1_n_0\
    );
\conf_rdata_reg[25]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(25),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[25]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[25]_i_3_n_0\,
      O => \conf_rdata_reg[25]_i_2_n_0\
    );
\conf_rdata_reg[25]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[25]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[25]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[25]_i_5_n_0\,
      O => \conf_rdata_reg[25]_i_3_n_0\
    );
\conf_rdata_reg[25]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(25),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[25]\,
      I4 => \conf_rdata_reg[25]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[25]_i_4_n_0\
    );
\conf_rdata_reg[25]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(25),
      I1 => cr3(25),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(25),
      I5 => cr2(25),
      O => \conf_rdata_reg[25]_i_5_n_0\
    );
\conf_rdata_reg[25]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(25),
      I1 => cr7(25),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(25),
      I5 => cr6(25),
      O => \conf_rdata_reg[25]_i_6_n_0\
    );
\conf_rdata_reg[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(26),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[26]_i_2_n_0\,
      O => \conf_rdata_reg[26]_i_1_n_0\
    );
\conf_rdata_reg[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(26),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[26]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[26]_i_3_n_0\,
      O => \conf_rdata_reg[26]_i_2_n_0\
    );
\conf_rdata_reg[26]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[26]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[26]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[26]_i_5_n_0\,
      O => \conf_rdata_reg[26]_i_3_n_0\
    );
\conf_rdata_reg[26]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(26),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[26]\,
      I4 => \conf_rdata_reg[26]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[26]_i_4_n_0\
    );
\conf_rdata_reg[26]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(26),
      I1 => cr3(26),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(26),
      I5 => cr2(26),
      O => \conf_rdata_reg[26]_i_5_n_0\
    );
\conf_rdata_reg[26]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(26),
      I1 => cr7(26),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(26),
      I5 => cr6(26),
      O => \conf_rdata_reg[26]_i_6_n_0\
    );
\conf_rdata_reg[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(27),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[27]_i_2_n_0\,
      O => \conf_rdata_reg[27]_i_1_n_0\
    );
\conf_rdata_reg[27]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(27),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[27]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[27]_i_3_n_0\,
      O => \conf_rdata_reg[27]_i_2_n_0\
    );
\conf_rdata_reg[27]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[27]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[27]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[27]_i_5_n_0\,
      O => \conf_rdata_reg[27]_i_3_n_0\
    );
\conf_rdata_reg[27]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(27),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[27]\,
      I4 => \conf_rdata_reg[27]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[27]_i_4_n_0\
    );
\conf_rdata_reg[27]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(27),
      I1 => cr3(27),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(27),
      I5 => cr2(27),
      O => \conf_rdata_reg[27]_i_5_n_0\
    );
\conf_rdata_reg[27]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(27),
      I1 => cr7(27),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(27),
      I5 => cr6(27),
      O => \conf_rdata_reg[27]_i_6_n_0\
    );
\conf_rdata_reg[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(28),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[28]_i_2_n_0\,
      O => \conf_rdata_reg[28]_i_1_n_0\
    );
\conf_rdata_reg[28]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(28),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[28]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[28]_i_3_n_0\,
      O => \conf_rdata_reg[28]_i_2_n_0\
    );
\conf_rdata_reg[28]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[28]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[28]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[28]_i_5_n_0\,
      O => \conf_rdata_reg[28]_i_3_n_0\
    );
\conf_rdata_reg[28]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(28),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[28]\,
      I4 => \conf_rdata_reg[28]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[28]_i_4_n_0\
    );
\conf_rdata_reg[28]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(28),
      I1 => cr3(28),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(28),
      I5 => cr2(28),
      O => \conf_rdata_reg[28]_i_5_n_0\
    );
\conf_rdata_reg[28]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(28),
      I1 => cr7(28),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(28),
      I5 => cr6(28),
      O => \conf_rdata_reg[28]_i_6_n_0\
    );
\conf_rdata_reg[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(29),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[29]_i_2_n_0\,
      O => \conf_rdata_reg[29]_i_1_n_0\
    );
\conf_rdata_reg[29]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(29),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[29]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[29]_i_3_n_0\,
      O => \conf_rdata_reg[29]_i_2_n_0\
    );
\conf_rdata_reg[29]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[29]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[29]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[29]_i_5_n_0\,
      O => \conf_rdata_reg[29]_i_3_n_0\
    );
\conf_rdata_reg[29]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(29),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[29]\,
      I4 => \conf_rdata_reg[29]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[29]_i_4_n_0\
    );
\conf_rdata_reg[29]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(29),
      I1 => cr3(29),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(29),
      I5 => cr2(29),
      O => \conf_rdata_reg[29]_i_5_n_0\
    );
\conf_rdata_reg[29]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(29),
      I1 => cr7(29),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(29),
      I5 => cr6(29),
      O => \conf_rdata_reg[29]_i_6_n_0\
    );
\conf_rdata_reg[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[2]_i_2_n_0\,
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => io_simu(2),
      I3 => \conf_rdata_reg[7]_i_4_n_0\,
      I4 => \conf_rdata_reg[7]_i_5_n_0\,
      I5 => virtual_uart_data(2),
      O => \conf_rdata_reg[2]_i_1_n_0\
    );
\conf_rdata_reg[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA888"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \conf_rdata_reg[2]_i_3_n_0\,
      I2 => \conf_rdata_reg[6]_i_4_n_0\,
      I3 => \led_rg0_data_reg_n_0_[2]\,
      I4 => \conf_rdata_reg[2]_i_4_n_0\,
      I5 => \conf_rdata_reg[2]_i_5_n_0\,
      O => \conf_rdata_reg[2]_i_2_n_0\
    );
\conf_rdata_reg[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(2),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(2),
      I4 => \conf_rdata_reg[2]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[2]_i_3_n_0\
    );
\conf_rdata_reg[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(6),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => \conf_rdata_reg[2]_i_7_n_0\,
      O => \conf_rdata_reg[2]_i_4_n_0\
    );
\conf_rdata_reg[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_6_n_0\,
      I1 => \^num_data\(2),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(2),
      I4 => \conf_rdata_reg[2]_i_8_n_0\,
      O => \conf_rdata_reg[2]_i_5_n_0\
    );
\conf_rdata_reg[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(2),
      I1 => cr7(2),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(2),
      I5 => cr6(2),
      O => \conf_rdata_reg[2]_i_6_n_0\
    );
\conf_rdata_reg[2]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(2),
      I1 => cr3(2),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(2),
      I5 => cr2(2),
      O => \conf_rdata_reg[2]_i_7_n_0\
    );
\conf_rdata_reg[2]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(2),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \led_rg1_data_reg_n_0_[2]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[2]_i_8_n_0\
    );
\conf_rdata_reg[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(30),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[30]_i_2_n_0\,
      O => \conf_rdata_reg[30]_i_1_n_0\
    );
\conf_rdata_reg[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(30),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[30]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[30]_i_3_n_0\,
      O => \conf_rdata_reg[30]_i_2_n_0\
    );
\conf_rdata_reg[30]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[30]_i_4_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[30]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[30]_i_5_n_0\,
      O => \conf_rdata_reg[30]_i_3_n_0\
    );
\conf_rdata_reg[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(30),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[30]\,
      I4 => \conf_rdata_reg[30]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[30]_i_4_n_0\
    );
\conf_rdata_reg[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(30),
      I1 => cr3(30),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(30),
      I5 => cr2(30),
      O => \conf_rdata_reg[30]_i_5_n_0\
    );
\conf_rdata_reg[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(30),
      I1 => cr7(30),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(30),
      I5 => cr6(30),
      O => \conf_rdata_reg[30]_i_6_n_0\
    );
\conf_rdata_reg[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08888888"
    )
        port map (
      I0 => busy,
      I1 => R_or_W,
      I2 => \^conf_rvalid_reg_reg_0\,
      I3 => \^rlast\,
      I4 => rready,
      O => conf_rdata_reg0
    );
\conf_rdata_reg[31]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => buf_addr(14),
      I1 => buf_addr(13),
      I2 => buf_addr(6),
      I3 => buf_addr(12),
      O => \conf_rdata_reg[31]_i_10_n_0\
    );
\conf_rdata_reg[31]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(31),
      I1 => cr3(31),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(31),
      I5 => cr2(31),
      O => \conf_rdata_reg[31]_i_11_n_0\
    );
\conf_rdata_reg[31]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(31),
      I1 => cr7(31),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(31),
      I5 => cr6(31),
      O => \conf_rdata_reg[31]_i_12_n_0\
    );
\conf_rdata_reg[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => io_simu(31),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[31]_i_4_n_0\,
      O => \conf_rdata_reg[31]_i_2_n_0\
    );
\conf_rdata_reg[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_5_n_0\,
      I1 => \conf_rdata_reg[7]_i_5_n_0\,
      O => \conf_rdata_reg[31]_i_3_n_0\
    );
\conf_rdata_reg[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAA808080"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \^num_data\(31),
      I2 => \conf_rdata_reg[31]_i_6_n_0\,
      I3 => \led_rg1_data_reg_n_0_[31]\,
      I4 => \conf_rdata_reg[31]_i_7_n_0\,
      I5 => \conf_rdata_reg[31]_i_8_n_0\,
      O => \conf_rdata_reg[31]_i_4_n_0\
    );
\conf_rdata_reg[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \conf_rdata_reg[0]_i_9_n_0\,
      I1 => buf_addr(6),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      O => \conf_rdata_reg[31]_i_5_n_0\
    );
\conf_rdata_reg[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => buf_addr(6),
      I1 => buf_addr(14),
      I2 => buf_addr(13),
      I3 => buf_addr(12),
      I4 => buf_addr(5),
      I5 => buf_addr(4),
      O => \conf_rdata_reg[31]_i_6_n_0\
    );
\conf_rdata_reg[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000008000"
    )
        port map (
      I0 => buf_addr(6),
      I1 => buf_addr(14),
      I2 => buf_addr(13),
      I3 => buf_addr(12),
      I4 => buf_addr(4),
      I5 => buf_addr(5),
      O => \conf_rdata_reg[31]_i_7_n_0\
    );
\conf_rdata_reg[31]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_9_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[31]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[31]_i_11_n_0\,
      O => \conf_rdata_reg[31]_i_8_n_0\
    );
\conf_rdata_reg[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(31),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \led_data_reg_n_0_[31]\,
      I4 => \conf_rdata_reg[31]_i_12_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[31]_i_9_n_0\
    );
\conf_rdata_reg[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF8F8F888888888"
    )
        port map (
      I0 => switch(1),
      I1 => \conf_rdata_reg[7]_i_2_n_0\,
      I2 => \conf_rdata_reg[3]_i_2_n_0\,
      I3 => virtual_uart_data(3),
      I4 => \conf_rdata_reg[7]_i_4_n_0\,
      I5 => \conf_rdata_reg[7]_i_5_n_0\,
      O => \conf_rdata_reg[3]_i_1_n_0\
    );
\conf_rdata_reg[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF88888"
    )
        port map (
      I0 => io_simu(3),
      I1 => \conf_rdata_reg[31]_i_5_n_0\,
      I2 => \conf_rdata_reg[3]_i_3_n_0\,
      I3 => \conf_rdata_reg[3]_i_4_n_0\,
      I4 => \conf_rdata_reg[0]_i_4_n_0\,
      O => \conf_rdata_reg[3]_i_2_n_0\
    );
\conf_rdata_reg[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_6_n_0\,
      I1 => \^num_data\(3),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(3),
      I4 => \conf_rdata_reg[3]_i_5_n_0\,
      O => \conf_rdata_reg[3]_i_3_n_0\
    );
\conf_rdata_reg[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[3]_i_6_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[3]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[3]_i_7_n_0\,
      O => \conf_rdata_reg[3]_i_4_n_0\
    );
\conf_rdata_reg[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(3),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \led_rg1_data_reg_n_0_[3]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[3]_i_5_n_0\
    );
\conf_rdata_reg[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(3),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(3),
      I4 => \conf_rdata_reg[3]_i_8_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[3]_i_6_n_0\
    );
\conf_rdata_reg[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(3),
      I1 => cr3(3),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(3),
      I5 => cr2(3),
      O => \conf_rdata_reg[3]_i_7_n_0\
    );
\conf_rdata_reg[3]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(3),
      I1 => cr7(3),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(3),
      I5 => cr6(3),
      O => \conf_rdata_reg[3]_i_8_n_0\
    );
\conf_rdata_reg[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[4]_i_2_n_0\,
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => io_simu(4),
      I3 => \conf_rdata_reg[7]_i_4_n_0\,
      I4 => \conf_rdata_reg[7]_i_5_n_0\,
      I5 => virtual_uart_data(4),
      O => \conf_rdata_reg[4]_i_1_n_0\
    );
\conf_rdata_reg[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA888"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \conf_rdata_reg[4]_i_3_n_0\,
      I2 => \conf_rdata_reg[6]_i_4_n_0\,
      I3 => \led_rg0_data_reg_n_0_[4]\,
      I4 => \conf_rdata_reg[4]_i_4_n_0\,
      I5 => \conf_rdata_reg[4]_i_5_n_0\,
      O => \conf_rdata_reg[4]_i_2_n_0\
    );
\conf_rdata_reg[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(4),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(4),
      I4 => \conf_rdata_reg[4]_i_6_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[4]_i_3_n_0\
    );
\conf_rdata_reg[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(6),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => \conf_rdata_reg[4]_i_7_n_0\,
      O => \conf_rdata_reg[4]_i_4_n_0\
    );
\conf_rdata_reg[4]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_6_n_0\,
      I1 => \^num_data\(4),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(4),
      I4 => \conf_rdata_reg[4]_i_8_n_0\,
      O => \conf_rdata_reg[4]_i_5_n_0\
    );
\conf_rdata_reg[4]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(4),
      I1 => cr7(4),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(4),
      I5 => cr6(4),
      O => \conf_rdata_reg[4]_i_6_n_0\
    );
\conf_rdata_reg[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(4),
      I1 => cr3(4),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(4),
      I5 => cr2(4),
      O => \conf_rdata_reg[4]_i_7_n_0\
    );
\conf_rdata_reg[4]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(4),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \led_rg1_data_reg_n_0_[4]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[4]_i_8_n_0\
    );
\conf_rdata_reg[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF8F8F888888888"
    )
        port map (
      I0 => switch(2),
      I1 => \conf_rdata_reg[7]_i_2_n_0\,
      I2 => \conf_rdata_reg[5]_i_2_n_0\,
      I3 => virtual_uart_data(5),
      I4 => \conf_rdata_reg[7]_i_4_n_0\,
      I5 => \conf_rdata_reg[7]_i_5_n_0\,
      O => \conf_rdata_reg[5]_i_1_n_0\
    );
\conf_rdata_reg[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF88888"
    )
        port map (
      I0 => io_simu(5),
      I1 => \conf_rdata_reg[31]_i_5_n_0\,
      I2 => \conf_rdata_reg[5]_i_3_n_0\,
      I3 => \conf_rdata_reg[5]_i_4_n_0\,
      I4 => \conf_rdata_reg[0]_i_4_n_0\,
      O => \conf_rdata_reg[5]_i_2_n_0\
    );
\conf_rdata_reg[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_6_n_0\,
      I1 => \^num_data\(5),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(5),
      I4 => \conf_rdata_reg[5]_i_5_n_0\,
      O => \conf_rdata_reg[5]_i_3_n_0\
    );
\conf_rdata_reg[5]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[5]_i_6_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[5]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[5]_i_7_n_0\,
      O => \conf_rdata_reg[5]_i_4_n_0\
    );
\conf_rdata_reg[5]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(5),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \led_rg1_data_reg_n_0_[5]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[5]_i_5_n_0\
    );
\conf_rdata_reg[5]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(5),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(5),
      I4 => \conf_rdata_reg[5]_i_8_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[5]_i_6_n_0\
    );
\conf_rdata_reg[5]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(5),
      I1 => cr3(5),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(5),
      I5 => cr2(5),
      O => \conf_rdata_reg[5]_i_7_n_0\
    );
\conf_rdata_reg[5]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(5),
      I1 => cr7(5),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(5),
      I5 => cr6(5),
      O => \conf_rdata_reg[5]_i_8_n_0\
    );
\conf_rdata_reg[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_2_n_0\,
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => io_simu(6),
      I3 => \conf_rdata_reg[7]_i_4_n_0\,
      I4 => \conf_rdata_reg[7]_i_5_n_0\,
      I5 => virtual_uart_data(6),
      O => \conf_rdata_reg[6]_i_1_n_0\
    );
\conf_rdata_reg[6]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(6),
      I1 => cr3(6),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(6),
      I5 => cr2(6),
      O => \conf_rdata_reg[6]_i_10_n_0\
    );
\conf_rdata_reg[6]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(6),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \led_rg1_data_reg_n_0_[6]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[6]_i_11_n_0\
    );
\conf_rdata_reg[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA888"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \conf_rdata_reg[6]_i_3_n_0\,
      I2 => \conf_rdata_reg[6]_i_4_n_0\,
      I3 => \led_rg0_data_reg_n_0_[6]\,
      I4 => \conf_rdata_reg[6]_i_5_n_0\,
      I5 => \conf_rdata_reg[6]_i_6_n_0\,
      O => \conf_rdata_reg[6]_i_2_n_0\
    );
\conf_rdata_reg[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(6),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(6),
      I4 => \conf_rdata_reg[6]_i_9_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[6]_i_3_n_0\
    );
\conf_rdata_reg[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => buf_addr(4),
      I1 => buf_addr(12),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => buf_addr(5),
      I5 => buf_addr(6),
      O => \conf_rdata_reg[6]_i_4_n_0\
    );
\conf_rdata_reg[6]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(6),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => \conf_rdata_reg[6]_i_10_n_0\,
      O => \conf_rdata_reg[6]_i_5_n_0\
    );
\conf_rdata_reg[6]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_6_n_0\,
      I1 => \^num_data\(6),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(6),
      I4 => \conf_rdata_reg[6]_i_11_n_0\,
      O => \conf_rdata_reg[6]_i_6_n_0\
    );
\conf_rdata_reg[6]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000020"
    )
        port map (
      I0 => buf_addr(13),
      I1 => buf_addr(12),
      I2 => buf_addr(14),
      I3 => buf_addr(5),
      I4 => buf_addr(4),
      I5 => buf_addr(6),
      O => \conf_rdata_reg[6]_i_7_n_0\
    );
\conf_rdata_reg[6]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000000000000"
    )
        port map (
      I0 => buf_addr(4),
      I1 => buf_addr(5),
      I2 => buf_addr(6),
      I3 => buf_addr(14),
      I4 => buf_addr(13),
      I5 => buf_addr(12),
      O => \conf_rdata_reg[6]_i_8_n_0\
    );
\conf_rdata_reg[6]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(6),
      I1 => cr7(6),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(6),
      I5 => cr6(6),
      O => \conf_rdata_reg[6]_i_9_n_0\
    );
\conf_rdata_reg[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF8F8F888888888"
    )
        port map (
      I0 => switch(3),
      I1 => \conf_rdata_reg[7]_i_2_n_0\,
      I2 => \conf_rdata_reg[7]_i_3_n_0\,
      I3 => virtual_uart_data(7),
      I4 => \conf_rdata_reg[7]_i_4_n_0\,
      I5 => \conf_rdata_reg[7]_i_5_n_0\,
      O => \conf_rdata_reg[7]_i_1_n_0\
    );
\conf_rdata_reg[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF888F888F888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_7_n_0\,
      I1 => timer_r2(7),
      I2 => \conf_rdata_reg[6]_i_8_n_0\,
      I3 => \^led\(7),
      I4 => \conf_rdata_reg[7]_i_12_n_0\,
      I5 => \conf_rdata_reg[14]_i_6_n_0\,
      O => \conf_rdata_reg[7]_i_10_n_0\
    );
\conf_rdata_reg[7]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(7),
      I1 => cr3(7),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(7),
      I5 => cr2(7),
      O => \conf_rdata_reg[7]_i_11_n_0\
    );
\conf_rdata_reg[7]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(7),
      I1 => cr7(7),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(7),
      I5 => cr6(7),
      O => \conf_rdata_reg[7]_i_12_n_0\
    );
\conf_rdata_reg[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \conf_rdata_reg[15]_i_3_n_0\,
      I1 => \conf_rdata_reg[15]_i_4_n_0\,
      O => \conf_rdata_reg[7]_i_2_n_0\
    );
\conf_rdata_reg[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF88888"
    )
        port map (
      I0 => io_simu(7),
      I1 => \conf_rdata_reg[31]_i_5_n_0\,
      I2 => \conf_rdata_reg[7]_i_6_n_0\,
      I3 => \conf_rdata_reg[7]_i_7_n_0\,
      I4 => \conf_rdata_reg[0]_i_4_n_0\,
      O => \conf_rdata_reg[7]_i_3_n_0\
    );
\conf_rdata_reg[7]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \conf_rdata_reg[7]_i_8_n_0\,
      I1 => buf_addr(5),
      I2 => buf_addr(4),
      O => \conf_rdata_reg[7]_i_4_n_0\
    );
\conf_rdata_reg[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => buf_addr(0),
      I1 => buf_addr(2),
      I2 => buf_addr(1),
      I3 => buf_addr(3),
      I4 => buf_addr(15),
      I5 => buf_addr(7),
      O => \conf_rdata_reg[7]_i_5_n_0\
    );
\conf_rdata_reg[7]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[31]_i_6_n_0\,
      I1 => \^num_data\(7),
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(7),
      I4 => \conf_rdata_reg[7]_i_9_n_0\,
      O => \conf_rdata_reg[7]_i_6_n_0\
    );
\conf_rdata_reg[7]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[7]_i_10_n_0\,
      I1 => \conf_rdata_reg[6]_i_4_n_0\,
      I2 => \led_rg0_data_reg_n_0_[7]\,
      I3 => \conf_rdata_reg[31]_i_10_n_0\,
      I4 => \conf_rdata_reg[7]_i_11_n_0\,
      O => \conf_rdata_reg[7]_i_7_n_0\
    );
\conf_rdata_reg[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"4"
    )
        port map (
      I0 => buf_addr(6),
      I1 => \conf_rdata_reg[0]_i_9_n_0\,
      O => \conf_rdata_reg[7]_i_8_n_0\
    );
\conf_rdata_reg[7]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => switch(7),
      I1 => \conf_rdata_reg[0]_i_10_n_0\,
      I2 => \led_rg1_data_reg_n_0_[7]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[7]_i_9_n_0\
    );
\conf_rdata_reg[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => io_simu(8),
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => \conf_rdata_reg[8]_i_2_n_0\,
      I3 => \conf_rdata_reg[14]_i_3_n_0\,
      O => \conf_rdata_reg[8]_i_1_n_0\
    );
\conf_rdata_reg[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[8]_i_3_n_0\,
      I1 => \conf_rdata_reg[8]_i_4_n_0\,
      I2 => \conf_rdata_reg[14]_i_6_n_0\,
      I3 => btn_key_r(8),
      I4 => \conf_rdata_reg[15]_i_6_n_0\,
      I5 => \conf_rdata_reg[8]_i_5_n_0\,
      O => \conf_rdata_reg[8]_i_2_n_0\
    );
\conf_rdata_reg[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(8),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[8]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[8]_i_3_n_0\
    );
\conf_rdata_reg[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(8),
      I1 => cr7(8),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(8),
      I5 => cr6(8),
      O => \conf_rdata_reg[8]_i_4_n_0\
    );
\conf_rdata_reg[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[8]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[8]_i_6_n_0\,
      I4 => \conf_rdata_reg[8]_i_7_n_0\,
      O => \conf_rdata_reg[8]_i_5_n_0\
    );
\conf_rdata_reg[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(8),
      I1 => cr3(8),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(8),
      I5 => cr2(8),
      O => \conf_rdata_reg[8]_i_6_n_0\
    );
\conf_rdata_reg[8]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(8),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(8),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[8]_i_7_n_0\
    );
\conf_rdata_reg[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEAEAEAEAEAEAEA"
    )
        port map (
      I0 => \conf_rdata_reg[9]_i_2_n_0\,
      I1 => \conf_rdata_reg[31]_i_3_n_0\,
      I2 => io_simu(9),
      I3 => \conf_rdata_reg[15]_i_3_n_0\,
      I4 => switch(4),
      I5 => \conf_rdata_reg[15]_i_4_n_0\,
      O => \conf_rdata_reg[9]_i_1_n_0\
    );
\conf_rdata_reg[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAA888"
    )
        port map (
      I0 => \conf_rdata_reg[14]_i_3_n_0\,
      I1 => \conf_rdata_reg[9]_i_3_n_0\,
      I2 => \conf_rdata_reg[15]_i_6_n_0\,
      I3 => btn_key_r(9),
      I4 => \conf_rdata_reg[9]_i_4_n_0\,
      I5 => \conf_rdata_reg[9]_i_5_n_0\,
      O => \conf_rdata_reg[9]_i_2_n_0\
    );
\conf_rdata_reg[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFF888"
    )
        port map (
      I0 => \conf_rdata_reg[6]_i_4_n_0\,
      I1 => \led_rg0_data_reg_n_0_[9]\,
      I2 => \conf_rdata_reg[31]_i_10_n_0\,
      I3 => \conf_rdata_reg[9]_i_6_n_0\,
      I4 => \conf_rdata_reg[9]_i_7_n_0\,
      O => \conf_rdata_reg[9]_i_3_n_0\
    );
\conf_rdata_reg[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00040000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => buf_addr(6),
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => \conf_rdata_reg[9]_i_8_n_0\,
      O => \conf_rdata_reg[9]_i_4_n_0\
    );
\conf_rdata_reg[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^num_data\(9),
      I1 => \conf_rdata_reg[31]_i_6_n_0\,
      I2 => \led_rg1_data_reg_n_0_[9]\,
      I3 => \conf_rdata_reg[31]_i_7_n_0\,
      O => \conf_rdata_reg[9]_i_5_n_0\
    );
\conf_rdata_reg[9]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr1(9),
      I1 => cr3(9),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr0(9),
      I5 => cr2(9),
      O => \conf_rdata_reg[9]_i_6_n_0\
    );
\conf_rdata_reg[9]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => \^led\(9),
      I1 => \conf_rdata_reg[6]_i_8_n_0\,
      I2 => timer_r2(9),
      I3 => \conf_rdata_reg[6]_i_7_n_0\,
      O => \conf_rdata_reg[9]_i_7_n_0\
    );
\conf_rdata_reg[9]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CFAFCFA0C0AFC0A0"
    )
        port map (
      I0 => cr5(9),
      I1 => cr7(9),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => cr4(9),
      I5 => cr6(9),
      O => \conf_rdata_reg[9]_i_8_n_0\
    );
\conf_rdata_reg_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[0]_i_1_n_0\,
      Q => rdata(0),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[10]_i_1_n_0\,
      Q => rdata(10),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[11]_i_1_n_0\,
      Q => rdata(11),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[12]_i_1_n_0\,
      Q => rdata(12),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[13]_i_1_n_0\,
      Q => rdata(13),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[14]_i_1_n_0\,
      Q => rdata(14),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[15]_i_1_n_0\,
      Q => rdata(15),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[16]_i_1_n_0\,
      Q => rdata(16),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[17]_i_1_n_0\,
      Q => rdata(17),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[18]_i_1_n_0\,
      Q => rdata(18),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[19]_i_1_n_0\,
      Q => rdata(19),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[1]_i_1_n_0\,
      Q => rdata(1),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[20]_i_1_n_0\,
      Q => rdata(20),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[21]_i_1_n_0\,
      Q => rdata(21),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[22]_i_1_n_0\,
      Q => rdata(22),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[23]_i_1_n_0\,
      Q => rdata(23),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[24]_i_1_n_0\,
      Q => rdata(24),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[25]_i_1_n_0\,
      Q => rdata(25),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[26]_i_1_n_0\,
      Q => rdata(26),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[27]_i_1_n_0\,
      Q => rdata(27),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[28]_i_1_n_0\,
      Q => rdata(28),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[29]_i_1_n_0\,
      Q => rdata(29),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[2]_i_1_n_0\,
      Q => rdata(2),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[30]_i_1_n_0\,
      Q => rdata(30),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[31]_i_2_n_0\,
      Q => rdata(31),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[3]_i_1_n_0\,
      Q => rdata(3),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[4]_i_1_n_0\,
      Q => rdata(4),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[5]_i_1_n_0\,
      Q => rdata(5),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[6]_i_1_n_0\,
      Q => rdata(6),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[7]_i_1_n_0\,
      Q => rdata(7),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[8]_i_1_n_0\,
      Q => rdata(8),
      R => \buf_id[3]_i_1_n_0\
    );
\conf_rdata_reg_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => \conf_rdata_reg[9]_i_1_n_0\,
      Q => rdata(9),
      R => \buf_id[3]_i_1_n_0\
    );
conf_rlast_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_rdata_reg0,
      D => conf_rdata_reg0,
      Q => \^rlast\,
      R => \buf_id[3]_i_1_n_0\
    );
conf_rvalid_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08F8F8F8"
    )
        port map (
      I0 => busy,
      I1 => R_or_W,
      I2 => \^conf_rvalid_reg_reg_0\,
      I3 => \^rlast\,
      I4 => rready,
      O => conf_rvalid_reg_i_1_n_0
    );
conf_rvalid_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => conf_rvalid_reg_i_1_n_0,
      Q => \^conf_rvalid_reg_reg_0\,
      R => \buf_id[3]_i_1_n_0\
    );
\conf_wdata_r1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(0),
      Q => conf_wdata_r1(0),
      R => '0'
    );
\conf_wdata_r1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(10),
      Q => conf_wdata_r1(10),
      R => '0'
    );
\conf_wdata_r1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(11),
      Q => conf_wdata_r1(11),
      R => '0'
    );
\conf_wdata_r1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(12),
      Q => conf_wdata_r1(12),
      R => '0'
    );
\conf_wdata_r1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(13),
      Q => conf_wdata_r1(13),
      R => '0'
    );
\conf_wdata_r1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(14),
      Q => conf_wdata_r1(14),
      R => '0'
    );
\conf_wdata_r1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(15),
      Q => conf_wdata_r1(15),
      R => '0'
    );
\conf_wdata_r1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(16),
      Q => conf_wdata_r1(16),
      R => '0'
    );
\conf_wdata_r1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(17),
      Q => conf_wdata_r1(17),
      R => '0'
    );
\conf_wdata_r1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(18),
      Q => conf_wdata_r1(18),
      R => '0'
    );
\conf_wdata_r1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(19),
      Q => conf_wdata_r1(19),
      R => '0'
    );
\conf_wdata_r1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(1),
      Q => conf_wdata_r1(1),
      R => '0'
    );
\conf_wdata_r1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(20),
      Q => conf_wdata_r1(20),
      R => '0'
    );
\conf_wdata_r1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(21),
      Q => conf_wdata_r1(21),
      R => '0'
    );
\conf_wdata_r1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(22),
      Q => conf_wdata_r1(22),
      R => '0'
    );
\conf_wdata_r1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(23),
      Q => conf_wdata_r1(23),
      R => '0'
    );
\conf_wdata_r1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(24),
      Q => conf_wdata_r1(24),
      R => '0'
    );
\conf_wdata_r1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(25),
      Q => conf_wdata_r1(25),
      R => '0'
    );
\conf_wdata_r1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(26),
      Q => conf_wdata_r1(26),
      R => '0'
    );
\conf_wdata_r1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(27),
      Q => conf_wdata_r1(27),
      R => '0'
    );
\conf_wdata_r1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(28),
      Q => conf_wdata_r1(28),
      R => '0'
    );
\conf_wdata_r1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(29),
      Q => conf_wdata_r1(29),
      R => '0'
    );
\conf_wdata_r1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(2),
      Q => conf_wdata_r1(2),
      R => '0'
    );
\conf_wdata_r1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(30),
      Q => conf_wdata_r1(30),
      R => '0'
    );
\conf_wdata_r1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(31),
      Q => conf_wdata_r1(31),
      R => '0'
    );
\conf_wdata_r1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(3),
      Q => conf_wdata_r1(3),
      R => '0'
    );
\conf_wdata_r1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(4),
      Q => conf_wdata_r1(4),
      R => '0'
    );
\conf_wdata_r1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(5),
      Q => conf_wdata_r1(5),
      R => '0'
    );
\conf_wdata_r1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(6),
      Q => conf_wdata_r1(6),
      R => '0'
    );
\conf_wdata_r1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(7),
      Q => conf_wdata_r1(7),
      R => '0'
    );
\conf_wdata_r1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(8),
      Q => conf_wdata_r1(8),
      R => '0'
    );
\conf_wdata_r1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r(9),
      Q => conf_wdata_r1(9),
      R => '0'
    );
\conf_wdata_r2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(0),
      Q => data(0),
      R => '0'
    );
\conf_wdata_r2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(10),
      Q => data(10),
      R => '0'
    );
\conf_wdata_r2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(11),
      Q => data(11),
      R => '0'
    );
\conf_wdata_r2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(12),
      Q => data(12),
      R => '0'
    );
\conf_wdata_r2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(13),
      Q => data(13),
      R => '0'
    );
\conf_wdata_r2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(14),
      Q => data(14),
      R => '0'
    );
\conf_wdata_r2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(15),
      Q => data(15),
      R => '0'
    );
\conf_wdata_r2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(16),
      Q => data(16),
      R => '0'
    );
\conf_wdata_r2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(17),
      Q => data(17),
      R => '0'
    );
\conf_wdata_r2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(18),
      Q => data(18),
      R => '0'
    );
\conf_wdata_r2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(19),
      Q => data(19),
      R => '0'
    );
\conf_wdata_r2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(1),
      Q => data(1),
      R => '0'
    );
\conf_wdata_r2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(20),
      Q => data(20),
      R => '0'
    );
\conf_wdata_r2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(21),
      Q => data(21),
      R => '0'
    );
\conf_wdata_r2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(22),
      Q => data(22),
      R => '0'
    );
\conf_wdata_r2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(23),
      Q => data(23),
      R => '0'
    );
\conf_wdata_r2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(24),
      Q => data(24),
      R => '0'
    );
\conf_wdata_r2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(25),
      Q => data(25),
      R => '0'
    );
\conf_wdata_r2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(26),
      Q => data(26),
      R => '0'
    );
\conf_wdata_r2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(27),
      Q => data(27),
      R => '0'
    );
\conf_wdata_r2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(28),
      Q => data(28),
      R => '0'
    );
\conf_wdata_r2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(29),
      Q => data(29),
      R => '0'
    );
\conf_wdata_r2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(2),
      Q => data(2),
      R => '0'
    );
\conf_wdata_r2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(30),
      Q => data(30),
      R => '0'
    );
\conf_wdata_r2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(31),
      Q => data(31),
      R => '0'
    );
\conf_wdata_r2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(3),
      Q => data(3),
      R => '0'
    );
\conf_wdata_r2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(4),
      Q => data(4),
      R => '0'
    );
\conf_wdata_r2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(5),
      Q => data(5),
      R => '0'
    );
\conf_wdata_r2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(6),
      Q => data(6),
      R => '0'
    );
\conf_wdata_r2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(7),
      Q => data(7),
      R => '0'
    );
\conf_wdata_r2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(8),
      Q => data(8),
      R => '0'
    );
\conf_wdata_r2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => conf_wdata_r1(9),
      Q => data(9),
      R => '0'
    );
\conf_wdata_r[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => aresetn,
      I1 => write_timer,
      O => conf_wdata_r_3
    );
\conf_wdata_r[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008000000000000"
    )
        port map (
      I0 => buf_addr(14),
      I1 => buf_addr(13),
      I2 => buf_addr(12),
      I3 => buf_addr(6),
      I4 => \io_simu[31]_i_3_n_0\,
      I5 => \conf_wdata_r[31]_i_3_n_0\,
      O => write_timer
    );
\conf_wdata_r[31]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00100000"
    )
        port map (
      I0 => buf_addr(1),
      I1 => buf_addr(2),
      I2 => buf_addr(15),
      I3 => buf_addr(3),
      I4 => \led_data[15]_i_4_n_0\,
      O => \conf_wdata_r[31]_i_3_n_0\
    );
\conf_wdata_r_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(0),
      Q => conf_wdata_r(0),
      R => '0'
    );
\conf_wdata_r_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(10),
      Q => conf_wdata_r(10),
      R => '0'
    );
\conf_wdata_r_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(11),
      Q => conf_wdata_r(11),
      R => '0'
    );
\conf_wdata_r_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(12),
      Q => conf_wdata_r(12),
      R => '0'
    );
\conf_wdata_r_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(13),
      Q => conf_wdata_r(13),
      R => '0'
    );
\conf_wdata_r_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(14),
      Q => conf_wdata_r(14),
      R => '0'
    );
\conf_wdata_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(15),
      Q => conf_wdata_r(15),
      R => '0'
    );
\conf_wdata_r_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(16),
      Q => conf_wdata_r(16),
      R => '0'
    );
\conf_wdata_r_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(17),
      Q => conf_wdata_r(17),
      R => '0'
    );
\conf_wdata_r_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(18),
      Q => conf_wdata_r(18),
      R => '0'
    );
\conf_wdata_r_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(19),
      Q => conf_wdata_r(19),
      R => '0'
    );
\conf_wdata_r_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(1),
      Q => conf_wdata_r(1),
      R => '0'
    );
\conf_wdata_r_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(20),
      Q => conf_wdata_r(20),
      R => '0'
    );
\conf_wdata_r_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(21),
      Q => conf_wdata_r(21),
      R => '0'
    );
\conf_wdata_r_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(22),
      Q => conf_wdata_r(22),
      R => '0'
    );
\conf_wdata_r_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(23),
      Q => conf_wdata_r(23),
      R => '0'
    );
\conf_wdata_r_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(24),
      Q => conf_wdata_r(24),
      R => '0'
    );
\conf_wdata_r_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(25),
      Q => conf_wdata_r(25),
      R => '0'
    );
\conf_wdata_r_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(26),
      Q => conf_wdata_r(26),
      R => '0'
    );
\conf_wdata_r_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(27),
      Q => conf_wdata_r(27),
      R => '0'
    );
\conf_wdata_r_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(28),
      Q => conf_wdata_r(28),
      R => '0'
    );
\conf_wdata_r_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(29),
      Q => conf_wdata_r(29),
      R => '0'
    );
\conf_wdata_r_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(2),
      Q => conf_wdata_r(2),
      R => '0'
    );
\conf_wdata_r_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(30),
      Q => conf_wdata_r(30),
      R => '0'
    );
\conf_wdata_r_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(31),
      Q => conf_wdata_r(31),
      R => '0'
    );
\conf_wdata_r_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(3),
      Q => conf_wdata_r(3),
      R => '0'
    );
\conf_wdata_r_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(4),
      Q => conf_wdata_r(4),
      R => '0'
    );
\conf_wdata_r_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(5),
      Q => conf_wdata_r(5),
      R => '0'
    );
\conf_wdata_r_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(6),
      Q => conf_wdata_r(6),
      R => '0'
    );
\conf_wdata_r_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(7),
      Q => conf_wdata_r(7),
      R => '0'
    );
\conf_wdata_r_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(8),
      Q => conf_wdata_r(8),
      R => '0'
    );
\conf_wdata_r_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => conf_wdata_r_3,
      D => wdata(9),
      Q => conf_wdata_r(9),
      R => '0'
    );
conf_wready_reg_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF4C"
    )
        port map (
      I0 => wlast,
      I1 => \^conf_wready_reg_reg_0\,
      I2 => wvalid,
      I3 => aw_enter,
      O => conf_wready_reg_i_1_n_0
    );
conf_wready_reg_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4500"
    )
        port map (
      I0 => busy,
      I1 => R_or_W,
      I2 => arvalid,
      I3 => awvalid,
      O => aw_enter
    );
conf_wready_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => conf_wready_reg_i_1_n_0,
      Q => \^conf_wready_reg_reg_0\,
      R => \buf_id[3]_i_1_n_0\
    );
\count[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \count_reg_n_0_[0]\,
      O => \count[0]_i_2_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[0]_i_1_n_7\,
      Q => \count_reg_n_0_[0]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \count_reg[0]_i_1_n_0\,
      CO(2) => \count_reg[0]_i_1_n_1\,
      CO(1) => \count_reg[0]_i_1_n_2\,
      CO(0) => \count_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \count_reg[0]_i_1_n_4\,
      O(2) => \count_reg[0]_i_1_n_5\,
      O(1) => \count_reg[0]_i_1_n_6\,
      O(0) => \count_reg[0]_i_1_n_7\,
      S(3) => \count_reg_n_0_[3]\,
      S(2) => \count_reg_n_0_[2]\,
      S(1) => \count_reg_n_0_[1]\,
      S(0) => \count[0]_i_2_n_0\
    );
\count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[8]_i_1_n_5\,
      Q => \count_reg_n_0_[10]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[8]_i_1_n_4\,
      Q => \count_reg_n_0_[11]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[12]_i_1_n_7\,
      Q => \count_reg_n_0_[12]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[8]_i_1_n_0\,
      CO(3) => \count_reg[12]_i_1_n_0\,
      CO(2) => \count_reg[12]_i_1_n_1\,
      CO(1) => \count_reg[12]_i_1_n_2\,
      CO(0) => \count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[12]_i_1_n_4\,
      O(2) => \count_reg[12]_i_1_n_5\,
      O(1) => \count_reg[12]_i_1_n_6\,
      O(0) => \count_reg[12]_i_1_n_7\,
      S(3) => \count_reg_n_0_[15]\,
      S(2) => \count_reg_n_0_[14]\,
      S(1) => \count_reg_n_0_[13]\,
      S(0) => \count_reg_n_0_[12]\
    );
\count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[12]_i_1_n_6\,
      Q => \count_reg_n_0_[13]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[12]_i_1_n_5\,
      Q => \count_reg_n_0_[14]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[12]_i_1_n_4\,
      Q => \count_reg_n_0_[15]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[16]_i_1_n_7\,
      Q => \count_reg_n_0_[16]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[12]_i_1_n_0\,
      CO(3) => \NLW_count_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \count_reg[16]_i_1_n_1\,
      CO(1) => \count_reg[16]_i_1_n_2\,
      CO(0) => \count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[16]_i_1_n_4\,
      O(2) => \count_reg[16]_i_1_n_5\,
      O(1) => \count_reg[16]_i_1_n_6\,
      O(0) => \count_reg[16]_i_1_n_7\,
      S(3 downto 1) => sel0(2 downto 0),
      S(0) => \count_reg_n_0_[16]\
    );
\count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[16]_i_1_n_6\,
      Q => sel0(0),
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[16]_i_1_n_5\,
      Q => sel0(1),
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[16]_i_1_n_4\,
      Q => sel0(2),
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[0]_i_1_n_6\,
      Q => \count_reg_n_0_[1]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[0]_i_1_n_5\,
      Q => \count_reg_n_0_[2]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[0]_i_1_n_4\,
      Q => \count_reg_n_0_[3]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[4]_i_1_n_7\,
      Q => \count_reg_n_0_[4]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[0]_i_1_n_0\,
      CO(3) => \count_reg[4]_i_1_n_0\,
      CO(2) => \count_reg[4]_i_1_n_1\,
      CO(1) => \count_reg[4]_i_1_n_2\,
      CO(0) => \count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[4]_i_1_n_4\,
      O(2) => \count_reg[4]_i_1_n_5\,
      O(1) => \count_reg[4]_i_1_n_6\,
      O(0) => \count_reg[4]_i_1_n_7\,
      S(3) => \count_reg_n_0_[7]\,
      S(2) => \count_reg_n_0_[6]\,
      S(1) => \count_reg_n_0_[5]\,
      S(0) => \count_reg_n_0_[4]\
    );
\count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[4]_i_1_n_6\,
      Q => \count_reg_n_0_[5]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[4]_i_1_n_5\,
      Q => \count_reg_n_0_[6]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[4]_i_1_n_4\,
      Q => \count_reg_n_0_[7]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[8]_i_1_n_7\,
      Q => \count_reg_n_0_[8]\,
      R => \buf_id[3]_i_1_n_0\
    );
\count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \count_reg[4]_i_1_n_0\,
      CO(3) => \count_reg[8]_i_1_n_0\,
      CO(2) => \count_reg[8]_i_1_n_1\,
      CO(1) => \count_reg[8]_i_1_n_2\,
      CO(0) => \count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \count_reg[8]_i_1_n_4\,
      O(2) => \count_reg[8]_i_1_n_5\,
      O(1) => \count_reg[8]_i_1_n_6\,
      O(0) => \count_reg[8]_i_1_n_7\,
      S(3) => \count_reg_n_0_[11]\,
      S(2) => \count_reg_n_0_[10]\,
      S(1) => \count_reg_n_0_[9]\,
      S(0) => \count_reg_n_0_[8]\
    );
\count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \count_reg[8]_i_1_n_6\,
      Q => \count_reg_n_0_[9]\,
      R => \buf_id[3]_i_1_n_0\
    );
\cr0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \cr0[31]_i_2_n_0\,
      I1 => buf_addr(6),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      O => write_cr0
    );
\cr0[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => \led_data[15]_i_4_n_0\,
      I1 => \cr7[31]_i_3_n_0\,
      I2 => buf_addr(14),
      I3 => buf_addr(12),
      I4 => buf_addr(13),
      O => \cr0[31]_i_2_n_0\
    );
\cr0_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(0),
      Q => cr0(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(10),
      Q => cr0(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(11),
      Q => cr0(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(12),
      Q => cr0(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(13),
      Q => cr0(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(14),
      Q => cr0(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(15),
      Q => cr0(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(16),
      Q => cr0(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(17),
      Q => cr0(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(18),
      Q => cr0(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(19),
      Q => cr0(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(1),
      Q => cr0(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(20),
      Q => cr0(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(21),
      Q => cr0(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(22),
      Q => cr0(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(23),
      Q => cr0(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(24),
      Q => cr0(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(25),
      Q => cr0(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(26),
      Q => cr0(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(27),
      Q => cr0(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(28),
      Q => cr0(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(29),
      Q => cr0(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(2),
      Q => cr0(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(30),
      Q => cr0(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(31),
      Q => cr0(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(3),
      Q => cr0(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(4),
      Q => cr0(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(5),
      Q => cr0(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(6),
      Q => cr0(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(7),
      Q => cr0(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(8),
      Q => cr0(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr0_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr0,
      D => wdata(9),
      Q => cr0(9),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \cr0[31]_i_2_n_0\,
      I1 => buf_addr(6),
      I2 => buf_addr(5),
      I3 => buf_addr(4),
      O => write_cr1
    );
\cr1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(0),
      Q => cr1(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(10),
      Q => cr1(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(11),
      Q => cr1(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(12),
      Q => cr1(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(13),
      Q => cr1(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(14),
      Q => cr1(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(15),
      Q => cr1(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(16),
      Q => cr1(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(17),
      Q => cr1(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(18),
      Q => cr1(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(19),
      Q => cr1(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(1),
      Q => cr1(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(20),
      Q => cr1(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(21),
      Q => cr1(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(22),
      Q => cr1(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(23),
      Q => cr1(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(24),
      Q => cr1(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(25),
      Q => cr1(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(26),
      Q => cr1(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(27),
      Q => cr1(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(28),
      Q => cr1(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(29),
      Q => cr1(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(2),
      Q => cr1(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(30),
      Q => cr1(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(31),
      Q => cr1(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(3),
      Q => cr1(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(4),
      Q => cr1(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(5),
      Q => cr1(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(6),
      Q => cr1(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(7),
      Q => cr1(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(8),
      Q => cr1(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr1,
      D => wdata(9),
      Q => cr1(9),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \cr0[31]_i_2_n_0\,
      I1 => buf_addr(6),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      O => write_cr2
    );
\cr2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(0),
      Q => cr2(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(10),
      Q => cr2(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(11),
      Q => cr2(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(12),
      Q => cr2(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(13),
      Q => cr2(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(14),
      Q => cr2(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(15),
      Q => cr2(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(16),
      Q => cr2(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(17),
      Q => cr2(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(18),
      Q => cr2(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(19),
      Q => cr2(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(1),
      Q => cr2(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(20),
      Q => cr2(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(21),
      Q => cr2(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(22),
      Q => cr2(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(23),
      Q => cr2(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(24),
      Q => cr2(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(25),
      Q => cr2(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(26),
      Q => cr2(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(27),
      Q => cr2(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(28),
      Q => cr2(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(29),
      Q => cr2(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(2),
      Q => cr2(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(30),
      Q => cr2(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(31),
      Q => cr2(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(3),
      Q => cr2(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(4),
      Q => cr2(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(5),
      Q => cr2(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(6),
      Q => cr2(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(7),
      Q => cr2(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(8),
      Q => cr2(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr2,
      D => wdata(9),
      Q => cr2(9),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \cr0[31]_i_2_n_0\,
      I1 => buf_addr(6),
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      O => write_cr3
    );
\cr3_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(0),
      Q => cr3(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(10),
      Q => cr3(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(11),
      Q => cr3(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(12),
      Q => cr3(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(13),
      Q => cr3(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(14),
      Q => cr3(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(15),
      Q => cr3(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(16),
      Q => cr3(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(17),
      Q => cr3(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(18),
      Q => cr3(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(19),
      Q => cr3(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(1),
      Q => cr3(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(20),
      Q => cr3(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(21),
      Q => cr3(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(22),
      Q => cr3(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(23),
      Q => cr3(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(24),
      Q => cr3(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(25),
      Q => cr3(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(26),
      Q => cr3(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(27),
      Q => cr3(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(28),
      Q => cr3(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(29),
      Q => cr3(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(2),
      Q => cr3(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(30),
      Q => cr3(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(31),
      Q => cr3(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(3),
      Q => cr3(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(4),
      Q => cr3(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(5),
      Q => cr3(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(6),
      Q => cr3(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(7),
      Q => cr3(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(8),
      Q => cr3(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr3_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr3,
      D => wdata(9),
      Q => cr3(9),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => buf_addr(6),
      I1 => buf_addr(5),
      I2 => buf_addr(4),
      I3 => \cr0[31]_i_2_n_0\,
      O => write_cr4
    );
\cr4_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(0),
      Q => cr4(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(10),
      Q => cr4(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(11),
      Q => cr4(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(12),
      Q => cr4(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(13),
      Q => cr4(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(14),
      Q => cr4(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(15),
      Q => cr4(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(16),
      Q => cr4(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(17),
      Q => cr4(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(18),
      Q => cr4(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(19),
      Q => cr4(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(1),
      Q => cr4(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(20),
      Q => cr4(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(21),
      Q => cr4(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(22),
      Q => cr4(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(23),
      Q => cr4(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(24),
      Q => cr4(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(25),
      Q => cr4(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(26),
      Q => cr4(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(27),
      Q => cr4(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(28),
      Q => cr4(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(29),
      Q => cr4(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(2),
      Q => cr4(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(30),
      Q => cr4(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(31),
      Q => cr4(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(3),
      Q => cr4(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(4),
      Q => cr4(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(5),
      Q => cr4(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(6),
      Q => cr4(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(7),
      Q => cr4(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(8),
      Q => cr4(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr4_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr4,
      D => wdata(9),
      Q => cr4(9),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => buf_addr(6),
      I1 => buf_addr(4),
      I2 => buf_addr(5),
      I3 => \cr0[31]_i_2_n_0\,
      O => write_cr5
    );
\cr5_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(0),
      Q => cr5(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(10),
      Q => cr5(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(11),
      Q => cr5(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(12),
      Q => cr5(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(13),
      Q => cr5(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(14),
      Q => cr5(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(15),
      Q => cr5(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(16),
      Q => cr5(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(17),
      Q => cr5(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(18),
      Q => cr5(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(19),
      Q => cr5(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(1),
      Q => cr5(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(20),
      Q => cr5(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(21),
      Q => cr5(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(22),
      Q => cr5(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(23),
      Q => cr5(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(24),
      Q => cr5(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(25),
      Q => cr5(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(26),
      Q => cr5(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(27),
      Q => cr5(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(28),
      Q => cr5(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(29),
      Q => cr5(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(2),
      Q => cr5(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(30),
      Q => cr5(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(31),
      Q => cr5(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(3),
      Q => cr5(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(4),
      Q => cr5(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(5),
      Q => cr5(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(6),
      Q => cr5(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(7),
      Q => cr5(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(8),
      Q => cr5(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr5_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr5,
      D => wdata(9),
      Q => cr5(9),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => buf_addr(6),
      I1 => buf_addr(5),
      I2 => buf_addr(4),
      I3 => \cr0[31]_i_2_n_0\,
      O => write_cr6
    );
\cr6_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(0),
      Q => cr6(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(10),
      Q => cr6(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(11),
      Q => cr6(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(12),
      Q => cr6(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(13),
      Q => cr6(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(14),
      Q => cr6(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(15),
      Q => cr6(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(16),
      Q => cr6(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(17),
      Q => cr6(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(18),
      Q => cr6(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(19),
      Q => cr6(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(1),
      Q => cr6(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(20),
      Q => cr6(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(21),
      Q => cr6(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(22),
      Q => cr6(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(23),
      Q => cr6(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(24),
      Q => cr6(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(25),
      Q => cr6(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(26),
      Q => cr6(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(27),
      Q => cr6(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(28),
      Q => cr6(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(29),
      Q => cr6(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(2),
      Q => cr6(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(30),
      Q => cr6(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(31),
      Q => cr6(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(3),
      Q => cr6(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(4),
      Q => cr6(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(5),
      Q => cr6(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(6),
      Q => cr6(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(7),
      Q => cr6(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(8),
      Q => cr6(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr6_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr6,
      D => wdata(9),
      Q => cr6(9),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \led_data[15]_i_4_n_0\,
      I1 => buf_addr(6),
      I2 => buf_addr(5),
      I3 => buf_addr(4),
      I4 => \cr7[31]_i_2_n_0\,
      I5 => \cr7[31]_i_3_n_0\,
      O => write_cr7
    );
\cr7[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => buf_addr(13),
      I1 => buf_addr(12),
      I2 => buf_addr(14),
      O => \cr7[31]_i_2_n_0\
    );
\cr7[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => buf_addr(3),
      I1 => buf_addr(15),
      I2 => buf_addr(2),
      I3 => buf_addr(1),
      O => \cr7[31]_i_3_n_0\
    );
\cr7_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(0),
      Q => cr7(0),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(10),
      Q => cr7(10),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(11),
      Q => cr7(11),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(12),
      Q => cr7(12),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(13),
      Q => cr7(13),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(14),
      Q => cr7(14),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(15),
      Q => cr7(15),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(16),
      Q => cr7(16),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(17),
      Q => cr7(17),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(18),
      Q => cr7(18),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(19),
      Q => cr7(19),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(1),
      Q => cr7(1),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(20),
      Q => cr7(20),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(21),
      Q => cr7(21),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(22),
      Q => cr7(22),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(23),
      Q => cr7(23),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(24),
      Q => cr7(24),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(25),
      Q => cr7(25),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(26),
      Q => cr7(26),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(27),
      Q => cr7(27),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(28),
      Q => cr7(28),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(29),
      Q => cr7(29),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(2),
      Q => cr7(2),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(30),
      Q => cr7(30),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(31),
      Q => cr7(31),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(3),
      Q => cr7(3),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(4),
      Q => cr7(4),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(5),
      Q => cr7(5),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(6),
      Q => cr7(6),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(7),
      Q => cr7(7),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(8),
      Q => cr7(8),
      R => \buf_id[3]_i_1_n_0\
    );
\cr7_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_cr7,
      D => wdata(9),
      Q => cr7(9),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \io_simu[31]_i_2_n_0\,
      I1 => buf_addr(9),
      I2 => buf_addr(10),
      I3 => buf_addr(11),
      I4 => \io_simu[31]_i_3_n_0\,
      I5 => \led_data[15]_i_3_n_0\,
      O => write_io_simu
    );
\io_simu[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000008000000000"
    )
        port map (
      I0 => wlast,
      I1 => \^conf_wready_reg_reg_0\,
      I2 => wvalid,
      I3 => buf_addr(0),
      I4 => buf_addr(7),
      I5 => buf_addr(8),
      O => \io_simu[31]_i_2_n_0\
    );
\io_simu[31]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => buf_addr(5),
      I1 => buf_addr(4),
      O => \io_simu[31]_i_3_n_0\
    );
\io_simu_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(16),
      Q => io_simu(0),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(26),
      Q => io_simu(10),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(27),
      Q => io_simu(11),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(28),
      Q => io_simu(12),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(29),
      Q => io_simu(13),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(30),
      Q => io_simu(14),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(31),
      Q => io_simu(15),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(0),
      Q => io_simu(16),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(1),
      Q => io_simu(17),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(2),
      Q => io_simu(18),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(3),
      Q => io_simu(19),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(17),
      Q => io_simu(1),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(4),
      Q => io_simu(20),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(5),
      Q => io_simu(21),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(6),
      Q => io_simu(22),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(7),
      Q => io_simu(23),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(8),
      Q => io_simu(24),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(9),
      Q => io_simu(25),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(10),
      Q => io_simu(26),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(11),
      Q => io_simu(27),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(12),
      Q => io_simu(28),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(13),
      Q => io_simu(29),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(18),
      Q => io_simu(2),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(14),
      Q => io_simu(30),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(15),
      Q => io_simu(31),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(19),
      Q => io_simu(3),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(20),
      Q => io_simu(4),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(21),
      Q => io_simu(5),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(22),
      Q => io_simu(6),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(23),
      Q => io_simu(7),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(24),
      Q => io_simu(8),
      R => \buf_id[3]_i_1_n_0\
    );
\io_simu_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_io_simu,
      D => wdata(25),
      Q => io_simu(9),
      R => \buf_id[3]_i_1_n_0\
    );
\key_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => key_flag,
      I1 => aresetn,
      O => key_count0
    );
\key_count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \key_count_reg_n_0_[0]\,
      O => \key_count[0]_i_3_n_0\
    );
\key_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[0]_i_2_n_7\,
      Q => \key_count_reg_n_0_[0]\,
      R => key_count0
    );
\key_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \key_count_reg[0]_i_2_n_0\,
      CO(2) => \key_count_reg[0]_i_2_n_1\,
      CO(1) => \key_count_reg[0]_i_2_n_2\,
      CO(0) => \key_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \key_count_reg[0]_i_2_n_4\,
      O(2) => \key_count_reg[0]_i_2_n_5\,
      O(1) => \key_count_reg[0]_i_2_n_6\,
      O(0) => \key_count_reg[0]_i_2_n_7\,
      S(3) => \key_count_reg_n_0_[3]\,
      S(2) => \key_count_reg_n_0_[2]\,
      S(1) => \key_count_reg_n_0_[1]\,
      S(0) => \key_count[0]_i_3_n_0\
    );
\key_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[8]_i_1_n_5\,
      Q => \key_count_reg_n_0_[10]\,
      R => key_count0
    );
\key_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[8]_i_1_n_4\,
      Q => \key_count_reg_n_0_[11]\,
      R => key_count0
    );
\key_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[12]_i_1_n_7\,
      Q => \key_count_reg_n_0_[12]\,
      R => key_count0
    );
\key_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \key_count_reg[8]_i_1_n_0\,
      CO(3) => \key_count_reg[12]_i_1_n_0\,
      CO(2) => \key_count_reg[12]_i_1_n_1\,
      CO(1) => \key_count_reg[12]_i_1_n_2\,
      CO(0) => \key_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \key_count_reg[12]_i_1_n_4\,
      O(2) => \key_count_reg[12]_i_1_n_5\,
      O(1) => \key_count_reg[12]_i_1_n_6\,
      O(0) => \key_count_reg[12]_i_1_n_7\,
      S(3) => \key_count_reg_n_0_[15]\,
      S(2) => \key_count_reg_n_0_[14]\,
      S(1) => \key_count_reg_n_0_[13]\,
      S(0) => \key_count_reg_n_0_[12]\
    );
\key_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[12]_i_1_n_6\,
      Q => \key_count_reg_n_0_[13]\,
      R => key_count0
    );
\key_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[12]_i_1_n_5\,
      Q => \key_count_reg_n_0_[14]\,
      R => key_count0
    );
\key_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[12]_i_1_n_4\,
      Q => \key_count_reg_n_0_[15]\,
      R => key_count0
    );
\key_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[16]_i_1_n_7\,
      Q => \key_count_reg_n_0_[16]\,
      R => key_count0
    );
\key_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \key_count_reg[12]_i_1_n_0\,
      CO(3) => \NLW_key_count_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \key_count_reg[16]_i_1_n_1\,
      CO(1) => \key_count_reg[16]_i_1_n_2\,
      CO(0) => \key_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \key_count_reg[16]_i_1_n_4\,
      O(2) => \key_count_reg[16]_i_1_n_5\,
      O(1) => \key_count_reg[16]_i_1_n_6\,
      O(0) => \key_count_reg[16]_i_1_n_7\,
      S(3) => key_sample,
      S(2) => \key_count_reg_n_0_[18]\,
      S(1) => \key_count_reg_n_0_[17]\,
      S(0) => \key_count_reg_n_0_[16]\
    );
\key_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[16]_i_1_n_6\,
      Q => \key_count_reg_n_0_[17]\,
      R => key_count0
    );
\key_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[16]_i_1_n_5\,
      Q => \key_count_reg_n_0_[18]\,
      R => key_count0
    );
\key_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[16]_i_1_n_4\,
      Q => key_sample,
      R => key_count0
    );
\key_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[0]_i_2_n_6\,
      Q => \key_count_reg_n_0_[1]\,
      R => key_count0
    );
\key_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[0]_i_2_n_5\,
      Q => \key_count_reg_n_0_[2]\,
      R => key_count0
    );
\key_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[0]_i_2_n_4\,
      Q => \key_count_reg_n_0_[3]\,
      R => key_count0
    );
\key_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[4]_i_1_n_7\,
      Q => \key_count_reg_n_0_[4]\,
      R => key_count0
    );
\key_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \key_count_reg[0]_i_2_n_0\,
      CO(3) => \key_count_reg[4]_i_1_n_0\,
      CO(2) => \key_count_reg[4]_i_1_n_1\,
      CO(1) => \key_count_reg[4]_i_1_n_2\,
      CO(0) => \key_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \key_count_reg[4]_i_1_n_4\,
      O(2) => \key_count_reg[4]_i_1_n_5\,
      O(1) => \key_count_reg[4]_i_1_n_6\,
      O(0) => \key_count_reg[4]_i_1_n_7\,
      S(3) => \key_count_reg_n_0_[7]\,
      S(2) => \key_count_reg_n_0_[6]\,
      S(1) => \key_count_reg_n_0_[5]\,
      S(0) => \key_count_reg_n_0_[4]\
    );
\key_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[4]_i_1_n_6\,
      Q => \key_count_reg_n_0_[5]\,
      R => key_count0
    );
\key_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[4]_i_1_n_5\,
      Q => \key_count_reg_n_0_[6]\,
      R => key_count0
    );
\key_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[4]_i_1_n_4\,
      Q => \key_count_reg_n_0_[7]\,
      R => key_count0
    );
\key_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[8]_i_1_n_7\,
      Q => \key_count_reg_n_0_[8]\,
      R => key_count0
    );
\key_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \key_count_reg[4]_i_1_n_0\,
      CO(3) => \key_count_reg[8]_i_1_n_0\,
      CO(2) => \key_count_reg[8]_i_1_n_1\,
      CO(1) => \key_count_reg[8]_i_1_n_2\,
      CO(0) => \key_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \key_count_reg[8]_i_1_n_4\,
      O(2) => \key_count_reg[8]_i_1_n_5\,
      O(1) => \key_count_reg[8]_i_1_n_6\,
      O(0) => \key_count_reg[8]_i_1_n_7\,
      S(3) => \key_count_reg_n_0_[11]\,
      S(2) => \key_count_reg_n_0_[10]\,
      S(1) => \key_count_reg_n_0_[9]\,
      S(0) => \key_count_reg_n_0_[8]\
    );
\key_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \key_count_reg[8]_i_1_n_6\,
      Q => \key_count_reg_n_0_[9]\,
      R => key_count0
    );
key_flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00A8A8A8"
    )
        port map (
      I0 => aresetn,
      I1 => key_flag_i_2_n_0,
      I2 => key_flag,
      I3 => state_count_reg(3),
      I4 => key_sample,
      O => key_flag_i_1_n_0
    );
key_flag_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => \FSM_onehot_state_reg_n_0_[1]\,
      I1 => btn_key_row(3),
      I2 => btn_key_row(2),
      I3 => btn_key_row(0),
      I4 => btn_key_row(1),
      I5 => \FSM_onehot_state_reg_n_0_[0]\,
      O => key_flag_i_2_n_0
    );
key_flag_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => key_flag_i_1_n_0,
      Q => key_flag,
      R => '0'
    );
\led_data[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(0),
      I1 => aresetn,
      I2 => switch(0),
      O => \led_data[0]_i_1_n_0\
    );
\led_data[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(10),
      I1 => aresetn,
      I2 => switch(5),
      O => \led_data[10]_i_1_n_0\
    );
\led_data[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(11),
      I1 => aresetn,
      I2 => switch(5),
      O => \led_data[11]_i_1_n_0\
    );
\led_data[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(12),
      I1 => aresetn,
      I2 => switch(6),
      O => \led_data[12]_i_1_n_0\
    );
\led_data[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(13),
      I1 => aresetn,
      I2 => switch(6),
      O => \led_data[13]_i_1_n_0\
    );
\led_data[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(14),
      I1 => aresetn,
      I2 => switch(7),
      O => \led_data[14]_i_1_n_0\
    );
\led_data[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0800FFFF"
    )
        port map (
      I0 => \led_data[15]_i_3_n_0\,
      I1 => \led_data[15]_i_4_n_0\,
      I2 => buf_addr(4),
      I3 => buf_addr(5),
      I4 => aresetn,
      O => \led_data[15]_i_1_n_0\
    );
\led_data[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(15),
      I1 => aresetn,
      I2 => switch(7),
      O => \led_data[15]_i_2_n_0\
    );
\led_data[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => buf_addr(12),
      I1 => \cr7[31]_i_3_n_0\,
      I2 => buf_addr(13),
      I3 => buf_addr(14),
      I4 => buf_addr(6),
      O => \led_data[15]_i_3_n_0\
    );
\led_data[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \led_data[15]_i_5_n_0\,
      I1 => buf_addr(11),
      I2 => buf_addr(10),
      I3 => buf_addr(9),
      I4 => buf_addr(8),
      O => \led_data[15]_i_4_n_0\
    );
\led_data[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => buf_addr(7),
      I1 => buf_addr(0),
      I2 => wvalid,
      I3 => \^conf_wready_reg_reg_0\,
      I4 => wlast,
      O => \led_data[15]_i_5_n_0\
    );
\led_data[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(1),
      I1 => aresetn,
      I2 => switch(0),
      O => \led_data[1]_i_1_n_0\
    );
\led_data[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(2),
      I1 => aresetn,
      I2 => switch(1),
      O => \led_data[2]_i_1_n_0\
    );
\led_data[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(3),
      I1 => aresetn,
      I2 => switch(1),
      O => \led_data[3]_i_1_n_0\
    );
\led_data[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(4),
      I1 => aresetn,
      I2 => switch(2),
      O => \led_data[4]_i_1_n_0\
    );
\led_data[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(5),
      I1 => aresetn,
      I2 => switch(2),
      O => \led_data[5]_i_1_n_0\
    );
\led_data[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(6),
      I1 => aresetn,
      I2 => switch(3),
      O => \led_data[6]_i_1_n_0\
    );
\led_data[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(7),
      I1 => aresetn,
      I2 => switch(3),
      O => \led_data[7]_i_1_n_0\
    );
\led_data[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(8),
      I1 => aresetn,
      I2 => switch(4),
      O => \led_data[8]_i_1_n_0\
    );
\led_data[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => wdata(9),
      I1 => aresetn,
      I2 => switch(4),
      O => \led_data[9]_i_1_n_0\
    );
\led_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[0]_i_1_n_0\,
      Q => \^led\(0),
      R => '0'
    );
\led_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[10]_i_1_n_0\,
      Q => \^led\(10),
      R => '0'
    );
\led_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[11]_i_1_n_0\,
      Q => \^led\(11),
      R => '0'
    );
\led_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[12]_i_1_n_0\,
      Q => \^led\(12),
      R => '0'
    );
\led_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[13]_i_1_n_0\,
      Q => \^led\(13),
      R => '0'
    );
\led_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[14]_i_1_n_0\,
      Q => \^led\(14),
      R => '0'
    );
\led_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[15]_i_2_n_0\,
      Q => \^led\(15),
      R => '0'
    );
\led_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(16),
      Q => \led_data_reg_n_0_[16]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(17),
      Q => \led_data_reg_n_0_[17]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(18),
      Q => \led_data_reg_n_0_[18]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(19),
      Q => \led_data_reg_n_0_[19]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[1]_i_1_n_0\,
      Q => \^led\(1),
      R => '0'
    );
\led_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(20),
      Q => \led_data_reg_n_0_[20]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(21),
      Q => \led_data_reg_n_0_[21]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(22),
      Q => \led_data_reg_n_0_[22]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(23),
      Q => \led_data_reg_n_0_[23]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(24),
      Q => \led_data_reg_n_0_[24]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(25),
      Q => \led_data_reg_n_0_[25]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(26),
      Q => \led_data_reg_n_0_[26]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(27),
      Q => \led_data_reg_n_0_[27]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(28),
      Q => \led_data_reg_n_0_[28]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(29),
      Q => \led_data_reg_n_0_[29]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[2]_i_1_n_0\,
      Q => \^led\(2),
      R => '0'
    );
\led_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(30),
      Q => \led_data_reg_n_0_[30]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => wdata(31),
      Q => \led_data_reg_n_0_[31]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[3]_i_1_n_0\,
      Q => \^led\(3),
      R => '0'
    );
\led_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[4]_i_1_n_0\,
      Q => \^led\(4),
      R => '0'
    );
\led_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[5]_i_1_n_0\,
      Q => \^led\(5),
      R => '0'
    );
\led_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[6]_i_1_n_0\,
      Q => \^led\(6),
      R => '0'
    );
\led_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[7]_i_1_n_0\,
      Q => \^led\(7),
      R => '0'
    );
\led_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[8]_i_1_n_0\,
      Q => \^led\(8),
      R => '0'
    );
\led_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => \led_data[15]_i_1_n_0\,
      D => \led_data[9]_i_1_n_0\,
      Q => \^led\(9),
      R => '0'
    );
\led_rg0_data[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => buf_addr(5),
      I1 => buf_addr(4),
      I2 => \led_data[15]_i_4_n_0\,
      I3 => \led_data[15]_i_3_n_0\,
      O => write_led_rg0
    );
\led_rg0_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(0),
      Q => \^led_rg0\(0),
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(10),
      Q => \led_rg0_data_reg_n_0_[10]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(11),
      Q => \led_rg0_data_reg_n_0_[11]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(12),
      Q => \led_rg0_data_reg_n_0_[12]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(13),
      Q => \led_rg0_data_reg_n_0_[13]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(14),
      Q => \led_rg0_data_reg_n_0_[14]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(15),
      Q => \led_rg0_data_reg_n_0_[15]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(16),
      Q => \led_rg0_data_reg_n_0_[16]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(17),
      Q => \led_rg0_data_reg_n_0_[17]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(18),
      Q => \led_rg0_data_reg_n_0_[18]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(19),
      Q => \led_rg0_data_reg_n_0_[19]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(1),
      Q => \^led_rg0\(1),
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(20),
      Q => \led_rg0_data_reg_n_0_[20]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(21),
      Q => \led_rg0_data_reg_n_0_[21]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(22),
      Q => \led_rg0_data_reg_n_0_[22]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(23),
      Q => \led_rg0_data_reg_n_0_[23]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(24),
      Q => \led_rg0_data_reg_n_0_[24]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(25),
      Q => \led_rg0_data_reg_n_0_[25]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(26),
      Q => \led_rg0_data_reg_n_0_[26]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(27),
      Q => \led_rg0_data_reg_n_0_[27]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(28),
      Q => \led_rg0_data_reg_n_0_[28]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(29),
      Q => \led_rg0_data_reg_n_0_[29]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(2),
      Q => \led_rg0_data_reg_n_0_[2]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(30),
      Q => \led_rg0_data_reg_n_0_[30]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(31),
      Q => \led_rg0_data_reg_n_0_[31]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(3),
      Q => \led_rg0_data_reg_n_0_[3]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(4),
      Q => \led_rg0_data_reg_n_0_[4]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(5),
      Q => \led_rg0_data_reg_n_0_[5]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(6),
      Q => \led_rg0_data_reg_n_0_[6]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(7),
      Q => \led_rg0_data_reg_n_0_[7]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(8),
      Q => \led_rg0_data_reg_n_0_[8]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg0_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg0,
      D => wdata(9),
      Q => \led_rg0_data_reg_n_0_[9]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => \led_data[15]_i_4_n_0\,
      I1 => buf_addr(4),
      I2 => buf_addr(5),
      I3 => buf_addr(6),
      I4 => \led_rg1_data[1]_i_2_n_0\,
      O => write_led_rg1
    );
\led_rg1_data[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000001000000000"
    )
        port map (
      I0 => \led_rg1_data[1]_i_3_n_0\,
      I1 => buf_addr(3),
      I2 => buf_addr(15),
      I3 => buf_addr(2),
      I4 => buf_addr(1),
      I5 => buf_addr(12),
      O => \led_rg1_data[1]_i_2_n_0\
    );
\led_rg1_data[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => buf_addr(14),
      I1 => buf_addr(13),
      O => \led_rg1_data[1]_i_3_n_0\
    );
\led_rg1_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(0),
      Q => \^led_rg1\(0),
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(10),
      Q => \led_rg1_data_reg_n_0_[10]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(11),
      Q => \led_rg1_data_reg_n_0_[11]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(12),
      Q => \led_rg1_data_reg_n_0_[12]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(13),
      Q => \led_rg1_data_reg_n_0_[13]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(14),
      Q => \led_rg1_data_reg_n_0_[14]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(15),
      Q => \led_rg1_data_reg_n_0_[15]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(16),
      Q => \led_rg1_data_reg_n_0_[16]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(17),
      Q => \led_rg1_data_reg_n_0_[17]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(18),
      Q => \led_rg1_data_reg_n_0_[18]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(19),
      Q => \led_rg1_data_reg_n_0_[19]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(1),
      Q => \^led_rg1\(1),
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(20),
      Q => \led_rg1_data_reg_n_0_[20]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(21),
      Q => \led_rg1_data_reg_n_0_[21]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(22),
      Q => \led_rg1_data_reg_n_0_[22]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(23),
      Q => \led_rg1_data_reg_n_0_[23]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(24),
      Q => \led_rg1_data_reg_n_0_[24]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(25),
      Q => \led_rg1_data_reg_n_0_[25]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(26),
      Q => \led_rg1_data_reg_n_0_[26]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(27),
      Q => \led_rg1_data_reg_n_0_[27]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(28),
      Q => \led_rg1_data_reg_n_0_[28]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(29),
      Q => \led_rg1_data_reg_n_0_[29]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(2),
      Q => \led_rg1_data_reg_n_0_[2]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(30),
      Q => \led_rg1_data_reg_n_0_[30]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(31),
      Q => \led_rg1_data_reg_n_0_[31]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(3),
      Q => \led_rg1_data_reg_n_0_[3]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(4),
      Q => \led_rg1_data_reg_n_0_[4]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(5),
      Q => \led_rg1_data_reg_n_0_[5]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(6),
      Q => \led_rg1_data_reg_n_0_[6]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(7),
      Q => \led_rg1_data_reg_n_0_[7]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(8),
      Q => \led_rg1_data_reg_n_0_[8]\,
      R => \buf_id[3]_i_1_n_0\
    );
\led_rg1_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_led_rg1,
      D => wdata(9),
      Q => \led_rg1_data_reg_n_0_[9]\,
      R => \buf_id[3]_i_1_n_0\
    );
no_mask_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF800000008000"
    )
        port map (
      I0 => short_delay_i_2_n_0,
      I1 => short_delay_i_3_n_0,
      I2 => no_mask_i_2_n_0,
      I3 => no_mask_i_3_n_0,
      I4 => aresetn,
      I5 => no_mask,
      O => no_mask_i_1_n_0
    );
no_mask_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => p_1_in1_in,
      I1 => p_3_in,
      I2 => p_7_in,
      I3 => p_11_in,
      O => no_mask_i_2_n_0
    );
no_mask_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => p_17_in,
      I1 => p_13_in,
      I2 => p_9_in,
      I3 => p_5_in,
      O => no_mask_i_3_n_0
    );
no_mask_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => no_mask_i_1_n_0,
      Q => no_mask,
      R => '0'
    );
\num_a_g[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFDA"
    )
        port map (
      I0 => scan_data(3),
      I1 => scan_data(0),
      I2 => scan_data(2),
      I3 => scan_data(1),
      O => num_a_g_2(0)
    );
\num_a_g[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AE6F"
    )
        port map (
      I0 => scan_data(3),
      I1 => scan_data(2),
      I2 => scan_data(0),
      I3 => scan_data(1),
      O => num_a_g_2(1)
    );
\num_a_g[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A8EF"
    )
        port map (
      I0 => scan_data(3),
      I1 => scan_data(1),
      I2 => scan_data(2),
      I3 => scan_data(0),
      O => num_a_g_2(2)
    );
\num_a_g[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3EDB"
    )
        port map (
      I0 => scan_data(3),
      I1 => scan_data(2),
      I2 => scan_data(1),
      I3 => scan_data(0),
      O => num_a_g_2(3)
    );
\num_a_g[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F67"
    )
        port map (
      I0 => scan_data(3),
      I1 => scan_data(2),
      I2 => scan_data(1),
      I3 => scan_data(0),
      O => num_a_g_2(4)
    );
\num_a_g[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"497F"
    )
        port map (
      I0 => scan_data(3),
      I1 => scan_data(0),
      I2 => scan_data(1),
      I3 => scan_data(2),
      O => num_a_g_2(5)
    );
\num_a_g[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D6FB"
    )
        port map (
      I0 => scan_data(3),
      I1 => scan_data(2),
      I2 => scan_data(1),
      I3 => scan_data(0),
      O => num_a_g_2(6)
    );
\num_a_g_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => num_a_g_2(0),
      Q => num_a_g(0),
      R => \buf_id[3]_i_1_n_0\
    );
\num_a_g_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => num_a_g_2(1),
      Q => num_a_g(1),
      R => \buf_id[3]_i_1_n_0\
    );
\num_a_g_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => num_a_g_2(2),
      Q => num_a_g(2),
      R => \buf_id[3]_i_1_n_0\
    );
\num_a_g_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => num_a_g_2(3),
      Q => num_a_g(3),
      R => \buf_id[3]_i_1_n_0\
    );
\num_a_g_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => num_a_g_2(4),
      Q => num_a_g(4),
      R => \buf_id[3]_i_1_n_0\
    );
\num_a_g_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => num_a_g_2(5),
      Q => num_a_g(5),
      R => \buf_id[3]_i_1_n_0\
    );
\num_a_g_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => num_a_g_2(6),
      Q => num_a_g(6),
      R => \buf_id[3]_i_1_n_0\
    );
\num_csn[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => sel0(1),
      O => \num_csn[0]_i_1_n_0\
    );
\num_csn[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => sel0(1),
      O => \num_csn[1]_i_1_n_0\
    );
\num_csn[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => sel0(1),
      O => \num_csn[2]_i_1_n_0\
    );
\num_csn[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => sel0(1),
      O => \num_csn[3]_i_1_n_0\
    );
\num_csn[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => sel0(0),
      I1 => sel0(2),
      I2 => sel0(1),
      O => \num_csn[4]_i_1_n_0\
    );
\num_csn[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => sel0(1),
      O => \num_csn[5]_i_1_n_0\
    );
\num_csn[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => sel0(0),
      I1 => sel0(2),
      I2 => sel0(1),
      O => \num_csn[6]_i_1_n_0\
    );
\num_csn[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => sel0(2),
      I1 => sel0(0),
      I2 => sel0(1),
      O => \num_csn[7]_i_1_n_0\
    );
\num_csn_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[0]_i_1_n_0\,
      Q => num_csn(0),
      S => \buf_id[3]_i_1_n_0\
    );
\num_csn_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[1]_i_1_n_0\,
      Q => num_csn(1),
      S => \buf_id[3]_i_1_n_0\
    );
\num_csn_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[2]_i_1_n_0\,
      Q => num_csn(2),
      S => \buf_id[3]_i_1_n_0\
    );
\num_csn_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[3]_i_1_n_0\,
      Q => num_csn(3),
      S => \buf_id[3]_i_1_n_0\
    );
\num_csn_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[4]_i_1_n_0\,
      Q => num_csn(4),
      S => \buf_id[3]_i_1_n_0\
    );
\num_csn_reg[5]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[5]_i_1_n_0\,
      Q => num_csn(5),
      S => \buf_id[3]_i_1_n_0\
    );
\num_csn_reg[6]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[6]_i_1_n_0\,
      Q => num_csn(6),
      S => \buf_id[3]_i_1_n_0\
    );
\num_csn_reg[7]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \num_csn[7]_i_1_n_0\,
      Q => num_csn(7),
      S => \buf_id[3]_i_1_n_0\
    );
\num_data[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \led_data[15]_i_4_n_0\,
      I1 => buf_addr(5),
      I2 => buf_addr(4),
      I3 => buf_addr(6),
      I4 => \led_rg1_data[1]_i_2_n_0\,
      O => write_num
    );
\num_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(0),
      Q => \^num_data\(0),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(10),
      Q => \^num_data\(10),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(11),
      Q => \^num_data\(11),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(12),
      Q => \^num_data\(12),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(13),
      Q => \^num_data\(13),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(14),
      Q => \^num_data\(14),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(15),
      Q => \^num_data\(15),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(16),
      Q => \^num_data\(16),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(17),
      Q => \^num_data\(17),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(18),
      Q => \^num_data\(18),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(19),
      Q => \^num_data\(19),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(1),
      Q => \^num_data\(1),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(20),
      Q => \^num_data\(20),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(21),
      Q => \^num_data\(21),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(22),
      Q => \^num_data\(22),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(23),
      Q => \^num_data\(23),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(24),
      Q => \^num_data\(24),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(25),
      Q => \^num_data\(25),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(26),
      Q => \^num_data\(26),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(27),
      Q => \^num_data\(27),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(28),
      Q => \^num_data\(28),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(29),
      Q => \^num_data\(29),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(2),
      Q => \^num_data\(2),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(30),
      Q => \^num_data\(30),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(31),
      Q => \^num_data\(31),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(3),
      Q => \^num_data\(3),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(4),
      Q => \^num_data\(4),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(5),
      Q => \^num_data\(5),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(6),
      Q => \^num_data\(6),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(7),
      Q => \^num_data\(7),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(8),
      Q => \^num_data\(8),
      R => \buf_id[3]_i_1_n_0\
    );
\num_data_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_num,
      D => wdata(9),
      Q => \^num_data\(9),
      R => \buf_id[3]_i_1_n_0\
    );
num_monitor_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => wdata(0),
      I1 => \io_simu[31]_i_2_n_0\,
      I2 => num_monitor_i_2_n_0,
      I3 => open_trace_i_3_n_0,
      I4 => \led_rg1_data[1]_i_2_n_0\,
      I5 => num_monitor,
      O => num_monitor_i_1_n_0
    );
num_monitor_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => buf_addr(4),
      I1 => buf_addr(5),
      I2 => buf_addr(6),
      O => num_monitor_i_2_n_0
    );
num_monitor_reg: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => num_monitor_i_1_n_0,
      Q => num_monitor,
      S => \buf_id[3]_i_1_n_0\
    );
open_trace_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFF80000000"
    )
        port map (
      I0 => open_trace_i_2_n_0,
      I1 => \io_simu[31]_i_2_n_0\,
      I2 => open_trace_i_3_n_0,
      I3 => open_trace_i_4_n_0,
      I4 => \led_data[15]_i_3_n_0\,
      I5 => open_trace,
      O => open_trace_i_1_n_0
    );
open_trace_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wdata(15),
      I1 => wdata(14),
      I2 => wdata(13),
      I3 => wdata(12),
      O => open_trace_i_10_n_0
    );
open_trace_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wdata(11),
      I1 => wdata(10),
      I2 => wdata(9),
      I3 => wdata(8),
      O => open_trace_i_11_n_0
    );
open_trace_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => open_trace_i_5_n_0,
      I1 => open_trace_i_6_n_0,
      I2 => wdata(25),
      I3 => wdata(24),
      I4 => wdata(23),
      I5 => wdata(22),
      O => open_trace_i_2_n_0
    );
open_trace_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => buf_addr(11),
      I1 => buf_addr(10),
      I2 => buf_addr(9),
      O => open_trace_i_3_n_0
    );
open_trace_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => buf_addr(5),
      I1 => buf_addr(4),
      O => open_trace_i_4_n_0
    );
open_trace_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => open_trace_i_7_n_0,
      I1 => wdata(26),
      I2 => wdata(27),
      I3 => wdata(28),
      I4 => wdata(29),
      O => open_trace_i_5_n_0
    );
open_trace_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wdata(17),
      I1 => wdata(16),
      I2 => open_trace_i_8_n_0,
      I3 => open_trace_i_9_n_0,
      I4 => open_trace_i_10_n_0,
      I5 => open_trace_i_11_n_0,
      O => open_trace_i_6_n_0
    );
open_trace_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => wdata(18),
      I1 => wdata(19),
      I2 => wdata(20),
      I3 => wdata(21),
      I4 => wdata(31),
      I5 => wdata(30),
      O => open_trace_i_7_n_0
    );
open_trace_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wdata(7),
      I1 => wdata(6),
      I2 => wdata(5),
      I3 => wdata(4),
      O => open_trace_i_8_n_0
    );
open_trace_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => wdata(3),
      I1 => wdata(2),
      I2 => wdata(1),
      I3 => wdata(0),
      O => open_trace_i_9_n_0
    );
open_trace_reg: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => open_trace_i_1_n_0,
      Q => open_trace,
      S => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1DD1"
    )
        port map (
      I0 => switch(0),
      I1 => aresetn,
      I2 => p_1_in_0,
      I3 => p_0_in_1,
      O => \pseudo_random_23[0]_i_1_n_0\
    );
\pseudo_random_23[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_7_in,
      I1 => aresetn,
      I2 => switch(5),
      O => \pseudo_random_23[10]_i_1_n_0\
    );
\pseudo_random_23[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_3_in,
      I1 => aresetn,
      I2 => switch(5),
      O => \pseudo_random_23[11]_i_1_n_0\
    );
\pseudo_random_23[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_1_in1_in,
      I1 => aresetn,
      I2 => switch(6),
      O => \pseudo_random_23[12]_i_1_n_0\
    );
\pseudo_random_23[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_5_in,
      I1 => aresetn,
      I2 => switch(6),
      O => \pseudo_random_23[13]_i_1_n_0\
    );
\pseudo_random_23[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_9_in,
      I1 => aresetn,
      I2 => switch(7),
      O => \pseudo_random_23[14]_i_1_n_0\
    );
\pseudo_random_23[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_13_in,
      I1 => aresetn,
      I2 => switch(7),
      O => \pseudo_random_23[15]_i_1_n_0\
    );
\pseudo_random_23[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => \pseudo_random_23_reg_n_0_[0]\,
      I1 => aresetn,
      I2 => switch(0),
      O => \pseudo_random_23[1]_i_1_n_0\
    );
\pseudo_random_23[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_16_in,
      I1 => aresetn,
      I2 => switch(1),
      O => \pseudo_random_23[2]_i_1_n_0\
    );
\pseudo_random_23[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_12_in,
      I1 => aresetn,
      I2 => switch(1),
      O => \pseudo_random_23[3]_i_1_n_0\
    );
\pseudo_random_23[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_8_in,
      I1 => aresetn,
      I2 => switch(2),
      O => \pseudo_random_23[4]_i_1_n_0\
    );
\pseudo_random_23[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_4_in,
      I1 => aresetn,
      I2 => switch(2),
      O => \pseudo_random_23[5]_i_1_n_0\
    );
\pseudo_random_23[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_0_in0_in,
      I1 => aresetn,
      I2 => switch(3),
      O => \pseudo_random_23[6]_i_1_n_0\
    );
\pseudo_random_23[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => \pseudo_random_23_reg_n_0_[6]\,
      I1 => aresetn,
      I2 => switch(3),
      O => \pseudo_random_23[7]_i_1_n_0\
    );
\pseudo_random_23[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_15_in40_in,
      I1 => aresetn,
      I2 => switch(4),
      O => \pseudo_random_23[8]_i_1_n_0\
    );
\pseudo_random_23[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"8B"
    )
        port map (
      I0 => p_11_in,
      I1 => aresetn,
      I2 => switch(4),
      O => \pseudo_random_23[9]_i_1_n_0\
    );
\pseudo_random_23_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[0]_i_1_n_0\,
      Q => \pseudo_random_23_reg_n_0_[0]\,
      R => '0'
    );
\pseudo_random_23_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[10]_i_1_n_0\,
      Q => p_3_in,
      R => '0'
    );
\pseudo_random_23_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[11]_i_1_n_0\,
      Q => p_1_in1_in,
      R => '0'
    );
\pseudo_random_23_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[12]_i_1_n_0\,
      Q => p_5_in,
      R => '0'
    );
\pseudo_random_23_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[13]_i_1_n_0\,
      Q => p_9_in,
      R => '0'
    );
\pseudo_random_23_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[14]_i_1_n_0\,
      Q => p_13_in,
      R => '0'
    );
\pseudo_random_23_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[15]_i_1_n_0\,
      Q => p_17_in,
      R => '0'
    );
\pseudo_random_23_reg[16]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => p_17_in,
      Q => p_18_in,
      S => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_18_in,
      Q => p_0_in_1,
      R => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23_reg[18]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => p_0_in_1,
      Q => \pseudo_random_23_reg_n_0_[18]\,
      S => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23_reg_n_0_[18]\,
      Q => p_14_in38_in,
      R => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[1]_i_1_n_0\,
      Q => p_16_in,
      R => '0'
    );
\pseudo_random_23_reg[20]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => p_14_in38_in,
      Q => p_2_in31_in,
      S => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_2_in31_in,
      Q => \pseudo_random_23_reg_n_0_[21]\,
      R => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23_reg[22]\: unisim.vcomponents.FDSE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23_reg_n_0_[21]\,
      Q => p_1_in_0,
      S => \buf_id[3]_i_1_n_0\
    );
\pseudo_random_23_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[2]_i_1_n_0\,
      Q => p_12_in,
      R => '0'
    );
\pseudo_random_23_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[3]_i_1_n_0\,
      Q => p_8_in,
      R => '0'
    );
\pseudo_random_23_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[4]_i_1_n_0\,
      Q => p_4_in,
      R => '0'
    );
\pseudo_random_23_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[5]_i_1_n_0\,
      Q => p_0_in0_in,
      R => '0'
    );
\pseudo_random_23_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[6]_i_1_n_0\,
      Q => \pseudo_random_23_reg_n_0_[6]\,
      R => '0'
    );
\pseudo_random_23_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[7]_i_1_n_0\,
      Q => p_15_in40_in,
      R => '0'
    );
\pseudo_random_23_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[8]_i_1_n_0\,
      Q => p_11_in,
      R => '0'
    );
\pseudo_random_23_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \pseudo_random_23[9]_i_1_n_0\,
      Q => p_7_in,
      R => '0'
    );
\ram_random_mask[0]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF6000000"
    )
        port map (
      I0 => p_1_in1_in,
      I1 => p_0_in0_in,
      I2 => short_delay,
      I3 => p_3_in,
      I4 => p_2_in31_in,
      I5 => no_mask,
      O => ram_random_mask(0)
    );
\ram_random_mask[1]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF6000000"
    )
        port map (
      I0 => p_5_in,
      I1 => p_4_in,
      I2 => short_delay,
      I3 => p_7_in,
      I4 => p_0_in_1,
      I5 => no_mask,
      O => ram_random_mask(1)
    );
\ram_random_mask[2]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCEFFEEFFECCCC"
    )
        port map (
      I0 => short_delay,
      I1 => no_mask,
      I2 => p_9_in,
      I3 => p_8_in,
      I4 => p_11_in,
      I5 => p_1_in_0,
      O => ram_random_mask(2)
    );
\ram_random_mask[3]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF6000000"
    )
        port map (
      I0 => p_13_in,
      I1 => p_12_in,
      I2 => short_delay,
      I3 => p_15_in40_in,
      I4 => p_14_in38_in,
      I5 => no_mask,
      O => ram_random_mask(3)
    );
\ram_random_mask[4]_INST_0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCEFFEEFFECCCC"
    )
        port map (
      I0 => short_delay,
      I1 => no_mask,
      I2 => p_17_in,
      I3 => p_16_in,
      I4 => \pseudo_random_23_reg_n_0_[6]\,
      I5 => p_18_in,
      O => ram_random_mask(4)
    );
\scan_data[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBAFFBABA"
    )
        port map (
      I0 => \scan_data[0]_i_2_n_0\,
      I1 => \num_csn[0]_i_1_n_0\,
      I2 => \^num_data\(0),
      I3 => \num_csn[4]_i_1_n_0\,
      I4 => \^num_data\(16),
      I5 => \scan_data[0]_i_3_n_0\,
      O => scan_data_4(0)
    );
\scan_data[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008C0080"
    )
        port map (
      I0 => \^num_data\(8),
      I1 => sel0(0),
      I2 => sel0(2),
      I3 => sel0(1),
      I4 => \^num_data\(24),
      O => \scan_data[0]_i_2_n_0\
    );
\scan_data[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0C080008"
    )
        port map (
      I0 => \^num_data\(20),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => sel0(2),
      I4 => \^num_data\(4),
      I5 => \scan_data[0]_i_4_n_0\,
      O => \scan_data[0]_i_3_n_0\
    );
\scan_data[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \^num_data\(12),
      I1 => sel0(2),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => \^num_data\(28),
      O => \scan_data[0]_i_4_n_0\
    );
\scan_data[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBAFFBABA"
    )
        port map (
      I0 => \scan_data[1]_i_2_n_0\,
      I1 => \num_csn[0]_i_1_n_0\,
      I2 => \^num_data\(1),
      I3 => \num_csn[4]_i_1_n_0\,
      I4 => \^num_data\(17),
      I5 => \scan_data[1]_i_3_n_0\,
      O => scan_data_4(1)
    );
\scan_data[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008C0080"
    )
        port map (
      I0 => \^num_data\(9),
      I1 => sel0(0),
      I2 => sel0(2),
      I3 => sel0(1),
      I4 => \^num_data\(25),
      O => \scan_data[1]_i_2_n_0\
    );
\scan_data[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0C080008"
    )
        port map (
      I0 => \^num_data\(21),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => sel0(2),
      I4 => \^num_data\(5),
      I5 => \scan_data[1]_i_4_n_0\,
      O => \scan_data[1]_i_3_n_0\
    );
\scan_data[1]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \^num_data\(13),
      I1 => sel0(2),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => \^num_data\(29),
      O => \scan_data[1]_i_4_n_0\
    );
\scan_data[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBAFFBABA"
    )
        port map (
      I0 => \scan_data[2]_i_2_n_0\,
      I1 => \num_csn[0]_i_1_n_0\,
      I2 => \^num_data\(2),
      I3 => \num_csn[4]_i_1_n_0\,
      I4 => \^num_data\(18),
      I5 => \scan_data[2]_i_3_n_0\,
      O => scan_data_4(2)
    );
\scan_data[2]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008C0080"
    )
        port map (
      I0 => \^num_data\(10),
      I1 => sel0(0),
      I2 => sel0(2),
      I3 => sel0(1),
      I4 => \^num_data\(26),
      O => \scan_data[2]_i_2_n_0\
    );
\scan_data[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0C080008"
    )
        port map (
      I0 => \^num_data\(22),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => sel0(2),
      I4 => \^num_data\(6),
      I5 => \scan_data[2]_i_4_n_0\,
      O => \scan_data[2]_i_3_n_0\
    );
\scan_data[2]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \^num_data\(14),
      I1 => sel0(2),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => \^num_data\(30),
      O => \scan_data[2]_i_4_n_0\
    );
\scan_data[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBAFFBABA"
    )
        port map (
      I0 => \scan_data[3]_i_2_n_0\,
      I1 => \num_csn[0]_i_1_n_0\,
      I2 => \^num_data\(3),
      I3 => \num_csn[4]_i_1_n_0\,
      I4 => \^num_data\(19),
      I5 => \scan_data[3]_i_3_n_0\,
      O => scan_data_4(3)
    );
\scan_data[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"008C0080"
    )
        port map (
      I0 => \^num_data\(11),
      I1 => sel0(0),
      I2 => sel0(2),
      I3 => sel0(1),
      I4 => \^num_data\(27),
      O => \scan_data[3]_i_2_n_0\
    );
\scan_data[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0C080008"
    )
        port map (
      I0 => \^num_data\(23),
      I1 => sel0(1),
      I2 => sel0(0),
      I3 => sel0(2),
      I4 => \^num_data\(7),
      I5 => \scan_data[3]_i_4_n_0\,
      O => \scan_data[3]_i_3_n_0\
    );
\scan_data[3]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \^num_data\(15),
      I1 => sel0(2),
      I2 => sel0(0),
      I3 => sel0(1),
      I4 => \^num_data\(31),
      O => \scan_data[3]_i_4_n_0\
    );
\scan_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => scan_data_4(0),
      Q => scan_data(0),
      R => \buf_id[3]_i_1_n_0\
    );
\scan_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => scan_data_4(1),
      Q => scan_data(1),
      R => \buf_id[3]_i_1_n_0\
    );
\scan_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => scan_data_4(2),
      Q => scan_data(2),
      R => \buf_id[3]_i_1_n_0\
    );
\scan_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => scan_data_4(3),
      Q => scan_data(3),
      R => \buf_id[3]_i_1_n_0\
    );
short_delay_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F808"
    )
        port map (
      I0 => short_delay_i_2_n_0,
      I1 => short_delay_i_3_n_0,
      I2 => aresetn,
      I3 => short_delay,
      O => short_delay_i_1_n_0
    );
short_delay_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_15_in40_in,
      I1 => \pseudo_random_23_reg_n_0_[6]\,
      I2 => p_0_in0_in,
      I3 => p_4_in,
      O => short_delay_i_2_n_0
    );
short_delay_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => p_16_in,
      I1 => \pseudo_random_23_reg_n_0_[0]\,
      I2 => p_8_in,
      I3 => p_12_in,
      O => short_delay_i_3_n_0
    );
short_delay_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => short_delay_i_1_n_0,
      Q => short_delay,
      R => '0'
    );
\state_count[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \state_count_reg_n_0_[0]\,
      O => p_0_in(0)
    );
\state_count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \state_count_reg_n_0_[0]\,
      I1 => \state_count_reg_n_0_[1]\,
      O => p_0_in(1)
    );
\state_count[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \state_count_reg_n_0_[0]\,
      I1 => \state_count_reg_n_0_[1]\,
      I2 => \state_count_reg_n_0_[2]\,
      O => p_0_in(2)
    );
\state_count[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => state_count_reg(3),
      I1 => aresetn,
      O => state_count0
    );
\state_count[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \state_count_reg_n_0_[2]\,
      I1 => \state_count_reg_n_0_[1]\,
      I2 => \state_count_reg_n_0_[0]\,
      O => p_0_in(3)
    );
\state_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_0_in(0),
      Q => \state_count_reg_n_0_[0]\,
      R => state_count0
    );
\state_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_0_in(1),
      Q => \state_count_reg_n_0_[1]\,
      R => state_count0
    );
\state_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_0_in(2),
      Q => \state_count_reg_n_0_[2]\,
      R => state_count0
    );
\state_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => p_0_in(3),
      Q => state_count_reg(3),
      R => state_count0
    );
\step0_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => step0_flag,
      I1 => aresetn,
      O => step0_count0
    );
\step0_count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \step0_count_reg_n_0_[0]\,
      O => \step0_count[0]_i_3_n_0\
    );
\step0_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[0]_i_2_n_7\,
      Q => \step0_count_reg_n_0_[0]\,
      R => step0_count0
    );
\step0_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \step0_count_reg[0]_i_2_n_0\,
      CO(2) => \step0_count_reg[0]_i_2_n_1\,
      CO(1) => \step0_count_reg[0]_i_2_n_2\,
      CO(0) => \step0_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \step0_count_reg[0]_i_2_n_4\,
      O(2) => \step0_count_reg[0]_i_2_n_5\,
      O(1) => \step0_count_reg[0]_i_2_n_6\,
      O(0) => \step0_count_reg[0]_i_2_n_7\,
      S(3) => \step0_count_reg_n_0_[3]\,
      S(2) => \step0_count_reg_n_0_[2]\,
      S(1) => \step0_count_reg_n_0_[1]\,
      S(0) => \step0_count[0]_i_3_n_0\
    );
\step0_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[8]_i_1_n_5\,
      Q => \step0_count_reg_n_0_[10]\,
      R => step0_count0
    );
\step0_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[8]_i_1_n_4\,
      Q => \step0_count_reg_n_0_[11]\,
      R => step0_count0
    );
\step0_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[12]_i_1_n_7\,
      Q => \step0_count_reg_n_0_[12]\,
      R => step0_count0
    );
\step0_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step0_count_reg[8]_i_1_n_0\,
      CO(3) => \step0_count_reg[12]_i_1_n_0\,
      CO(2) => \step0_count_reg[12]_i_1_n_1\,
      CO(1) => \step0_count_reg[12]_i_1_n_2\,
      CO(0) => \step0_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step0_count_reg[12]_i_1_n_4\,
      O(2) => \step0_count_reg[12]_i_1_n_5\,
      O(1) => \step0_count_reg[12]_i_1_n_6\,
      O(0) => \step0_count_reg[12]_i_1_n_7\,
      S(3) => \step0_count_reg_n_0_[15]\,
      S(2) => \step0_count_reg_n_0_[14]\,
      S(1) => \step0_count_reg_n_0_[13]\,
      S(0) => \step0_count_reg_n_0_[12]\
    );
\step0_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[12]_i_1_n_6\,
      Q => \step0_count_reg_n_0_[13]\,
      R => step0_count0
    );
\step0_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[12]_i_1_n_5\,
      Q => \step0_count_reg_n_0_[14]\,
      R => step0_count0
    );
\step0_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[12]_i_1_n_4\,
      Q => \step0_count_reg_n_0_[15]\,
      R => step0_count0
    );
\step0_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[16]_i_1_n_7\,
      Q => \step0_count_reg_n_0_[16]\,
      R => step0_count0
    );
\step0_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step0_count_reg[12]_i_1_n_0\,
      CO(3) => \NLW_step0_count_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \step0_count_reg[16]_i_1_n_1\,
      CO(1) => \step0_count_reg[16]_i_1_n_2\,
      CO(0) => \step0_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step0_count_reg[16]_i_1_n_4\,
      O(2) => \step0_count_reg[16]_i_1_n_5\,
      O(1) => \step0_count_reg[16]_i_1_n_6\,
      O(0) => \step0_count_reg[16]_i_1_n_7\,
      S(3) => step0_sample,
      S(2) => \step0_count_reg_n_0_[18]\,
      S(1) => \step0_count_reg_n_0_[17]\,
      S(0) => \step0_count_reg_n_0_[16]\
    );
\step0_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[16]_i_1_n_6\,
      Q => \step0_count_reg_n_0_[17]\,
      R => step0_count0
    );
\step0_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[16]_i_1_n_5\,
      Q => \step0_count_reg_n_0_[18]\,
      R => step0_count0
    );
\step0_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[16]_i_1_n_4\,
      Q => step0_sample,
      R => step0_count0
    );
\step0_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[0]_i_2_n_6\,
      Q => \step0_count_reg_n_0_[1]\,
      R => step0_count0
    );
\step0_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[0]_i_2_n_5\,
      Q => \step0_count_reg_n_0_[2]\,
      R => step0_count0
    );
\step0_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[0]_i_2_n_4\,
      Q => \step0_count_reg_n_0_[3]\,
      R => step0_count0
    );
\step0_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[4]_i_1_n_7\,
      Q => \step0_count_reg_n_0_[4]\,
      R => step0_count0
    );
\step0_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step0_count_reg[0]_i_2_n_0\,
      CO(3) => \step0_count_reg[4]_i_1_n_0\,
      CO(2) => \step0_count_reg[4]_i_1_n_1\,
      CO(1) => \step0_count_reg[4]_i_1_n_2\,
      CO(0) => \step0_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step0_count_reg[4]_i_1_n_4\,
      O(2) => \step0_count_reg[4]_i_1_n_5\,
      O(1) => \step0_count_reg[4]_i_1_n_6\,
      O(0) => \step0_count_reg[4]_i_1_n_7\,
      S(3) => \step0_count_reg_n_0_[7]\,
      S(2) => \step0_count_reg_n_0_[6]\,
      S(1) => \step0_count_reg_n_0_[5]\,
      S(0) => \step0_count_reg_n_0_[4]\
    );
\step0_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[4]_i_1_n_6\,
      Q => \step0_count_reg_n_0_[5]\,
      R => step0_count0
    );
\step0_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[4]_i_1_n_5\,
      Q => \step0_count_reg_n_0_[6]\,
      R => step0_count0
    );
\step0_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[4]_i_1_n_4\,
      Q => \step0_count_reg_n_0_[7]\,
      R => step0_count0
    );
\step0_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[8]_i_1_n_7\,
      Q => \step0_count_reg_n_0_[8]\,
      R => step0_count0
    );
\step0_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step0_count_reg[4]_i_1_n_0\,
      CO(3) => \step0_count_reg[8]_i_1_n_0\,
      CO(2) => \step0_count_reg[8]_i_1_n_1\,
      CO(1) => \step0_count_reg[8]_i_1_n_2\,
      CO(0) => \step0_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step0_count_reg[8]_i_1_n_4\,
      O(2) => \step0_count_reg[8]_i_1_n_5\,
      O(1) => \step0_count_reg[8]_i_1_n_6\,
      O(0) => \step0_count_reg[8]_i_1_n_7\,
      S(3) => \step0_count_reg_n_0_[11]\,
      S(2) => \step0_count_reg_n_0_[10]\,
      S(1) => \step0_count_reg_n_0_[9]\,
      S(0) => \step0_count_reg_n_0_[8]\
    );
\step0_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step0_count_reg[8]_i_1_n_6\,
      Q => \step0_count_reg_n_0_[9]\,
      R => step0_count0
    );
step0_flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AA28"
    )
        port map (
      I0 => aresetn,
      I1 => btn_step0_r,
      I2 => btn_step(0),
      I3 => step0_flag,
      I4 => step0_sample,
      O => step0_flag_i_1_n_0
    );
step0_flag_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => step0_flag_i_1_n_0,
      Q => step0_flag,
      R => '0'
    );
\step1_count[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => step1_flag,
      I1 => aresetn,
      O => step1_count0
    );
\step1_count[0]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \step1_count_reg_n_0_[0]\,
      O => \step1_count[0]_i_3_n_0\
    );
\step1_count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[0]_i_2_n_7\,
      Q => \step1_count_reg_n_0_[0]\,
      R => step1_count0
    );
\step1_count_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \step1_count_reg[0]_i_2_n_0\,
      CO(2) => \step1_count_reg[0]_i_2_n_1\,
      CO(1) => \step1_count_reg[0]_i_2_n_2\,
      CO(0) => \step1_count_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \step1_count_reg[0]_i_2_n_4\,
      O(2) => \step1_count_reg[0]_i_2_n_5\,
      O(1) => \step1_count_reg[0]_i_2_n_6\,
      O(0) => \step1_count_reg[0]_i_2_n_7\,
      S(3) => \step1_count_reg_n_0_[3]\,
      S(2) => \step1_count_reg_n_0_[2]\,
      S(1) => \step1_count_reg_n_0_[1]\,
      S(0) => \step1_count[0]_i_3_n_0\
    );
\step1_count_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[8]_i_1_n_5\,
      Q => \step1_count_reg_n_0_[10]\,
      R => step1_count0
    );
\step1_count_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[8]_i_1_n_4\,
      Q => \step1_count_reg_n_0_[11]\,
      R => step1_count0
    );
\step1_count_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[12]_i_1_n_7\,
      Q => \step1_count_reg_n_0_[12]\,
      R => step1_count0
    );
\step1_count_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step1_count_reg[8]_i_1_n_0\,
      CO(3) => \step1_count_reg[12]_i_1_n_0\,
      CO(2) => \step1_count_reg[12]_i_1_n_1\,
      CO(1) => \step1_count_reg[12]_i_1_n_2\,
      CO(0) => \step1_count_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step1_count_reg[12]_i_1_n_4\,
      O(2) => \step1_count_reg[12]_i_1_n_5\,
      O(1) => \step1_count_reg[12]_i_1_n_6\,
      O(0) => \step1_count_reg[12]_i_1_n_7\,
      S(3) => \step1_count_reg_n_0_[15]\,
      S(2) => \step1_count_reg_n_0_[14]\,
      S(1) => \step1_count_reg_n_0_[13]\,
      S(0) => \step1_count_reg_n_0_[12]\
    );
\step1_count_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[12]_i_1_n_6\,
      Q => \step1_count_reg_n_0_[13]\,
      R => step1_count0
    );
\step1_count_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[12]_i_1_n_5\,
      Q => \step1_count_reg_n_0_[14]\,
      R => step1_count0
    );
\step1_count_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[12]_i_1_n_4\,
      Q => \step1_count_reg_n_0_[15]\,
      R => step1_count0
    );
\step1_count_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[16]_i_1_n_7\,
      Q => \step1_count_reg_n_0_[16]\,
      R => step1_count0
    );
\step1_count_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step1_count_reg[12]_i_1_n_0\,
      CO(3) => \NLW_step1_count_reg[16]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \step1_count_reg[16]_i_1_n_1\,
      CO(1) => \step1_count_reg[16]_i_1_n_2\,
      CO(0) => \step1_count_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step1_count_reg[16]_i_1_n_4\,
      O(2) => \step1_count_reg[16]_i_1_n_5\,
      O(1) => \step1_count_reg[16]_i_1_n_6\,
      O(0) => \step1_count_reg[16]_i_1_n_7\,
      S(3) => step1_sample,
      S(2) => \step1_count_reg_n_0_[18]\,
      S(1) => \step1_count_reg_n_0_[17]\,
      S(0) => \step1_count_reg_n_0_[16]\
    );
\step1_count_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[16]_i_1_n_6\,
      Q => \step1_count_reg_n_0_[17]\,
      R => step1_count0
    );
\step1_count_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[16]_i_1_n_5\,
      Q => \step1_count_reg_n_0_[18]\,
      R => step1_count0
    );
\step1_count_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[16]_i_1_n_4\,
      Q => step1_sample,
      R => step1_count0
    );
\step1_count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[0]_i_2_n_6\,
      Q => \step1_count_reg_n_0_[1]\,
      R => step1_count0
    );
\step1_count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[0]_i_2_n_5\,
      Q => \step1_count_reg_n_0_[2]\,
      R => step1_count0
    );
\step1_count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[0]_i_2_n_4\,
      Q => \step1_count_reg_n_0_[3]\,
      R => step1_count0
    );
\step1_count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[4]_i_1_n_7\,
      Q => \step1_count_reg_n_0_[4]\,
      R => step1_count0
    );
\step1_count_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step1_count_reg[0]_i_2_n_0\,
      CO(3) => \step1_count_reg[4]_i_1_n_0\,
      CO(2) => \step1_count_reg[4]_i_1_n_1\,
      CO(1) => \step1_count_reg[4]_i_1_n_2\,
      CO(0) => \step1_count_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step1_count_reg[4]_i_1_n_4\,
      O(2) => \step1_count_reg[4]_i_1_n_5\,
      O(1) => \step1_count_reg[4]_i_1_n_6\,
      O(0) => \step1_count_reg[4]_i_1_n_7\,
      S(3) => \step1_count_reg_n_0_[7]\,
      S(2) => \step1_count_reg_n_0_[6]\,
      S(1) => \step1_count_reg_n_0_[5]\,
      S(0) => \step1_count_reg_n_0_[4]\
    );
\step1_count_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[4]_i_1_n_6\,
      Q => \step1_count_reg_n_0_[5]\,
      R => step1_count0
    );
\step1_count_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[4]_i_1_n_5\,
      Q => \step1_count_reg_n_0_[6]\,
      R => step1_count0
    );
\step1_count_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[4]_i_1_n_4\,
      Q => \step1_count_reg_n_0_[7]\,
      R => step1_count0
    );
\step1_count_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[8]_i_1_n_7\,
      Q => \step1_count_reg_n_0_[8]\,
      R => step1_count0
    );
\step1_count_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \step1_count_reg[4]_i_1_n_0\,
      CO(3) => \step1_count_reg[8]_i_1_n_0\,
      CO(2) => \step1_count_reg[8]_i_1_n_1\,
      CO(1) => \step1_count_reg[8]_i_1_n_2\,
      CO(0) => \step1_count_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \step1_count_reg[8]_i_1_n_4\,
      O(2) => \step1_count_reg[8]_i_1_n_5\,
      O(1) => \step1_count_reg[8]_i_1_n_6\,
      O(0) => \step1_count_reg[8]_i_1_n_7\,
      S(3) => \step1_count_reg_n_0_[11]\,
      S(2) => \step1_count_reg_n_0_[10]\,
      S(1) => \step1_count_reg_n_0_[9]\,
      S(0) => \step1_count_reg_n_0_[8]\
    );
\step1_count_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => \step1_count_reg[8]_i_1_n_6\,
      Q => \step1_count_reg_n_0_[9]\,
      R => step1_count0
    );
step1_flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000AA28"
    )
        port map (
      I0 => aresetn,
      I1 => btn_step1_r,
      I2 => btn_step(1),
      I3 => step1_flag,
      I4 => step1_sample,
      O => step1_flag_i_1_n_0
    );
step1_flag_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => step1_flag_i_1_n_0,
      Q => step1_flag,
      R => '0'
    );
\timer[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(0),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(0),
      O => \timer[0]_i_2_n_0\
    );
\timer[0]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(3),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(3),
      O => \timer[0]_i_3_n_0\
    );
\timer[0]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(2),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(2),
      O => \timer[0]_i_4_n_0\
    );
\timer[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(1),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(1),
      O => \timer[0]_i_5_n_0\
    );
\timer[0]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5C55"
    )
        port map (
      I0 => timer_reg(0),
      I1 => data(0),
      I2 => write_timer_begin_r3,
      I3 => write_timer_begin_r2,
      O => \timer[0]_i_6_n_0\
    );
\timer[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(15),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(15),
      O => \timer[12]_i_2_n_0\
    );
\timer[12]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(14),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(14),
      O => \timer[12]_i_3_n_0\
    );
\timer[12]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(13),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(13),
      O => \timer[12]_i_4_n_0\
    );
\timer[12]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(12),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(12),
      O => \timer[12]_i_5_n_0\
    );
\timer[16]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(19),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(19),
      O => \timer[16]_i_2_n_0\
    );
\timer[16]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(18),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(18),
      O => \timer[16]_i_3_n_0\
    );
\timer[16]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(17),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(17),
      O => \timer[16]_i_4_n_0\
    );
\timer[16]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(16),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(16),
      O => \timer[16]_i_5_n_0\
    );
\timer[20]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(23),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(23),
      O => \timer[20]_i_2_n_0\
    );
\timer[20]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(22),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(22),
      O => \timer[20]_i_3_n_0\
    );
\timer[20]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(21),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(21),
      O => \timer[20]_i_4_n_0\
    );
\timer[20]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(20),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(20),
      O => \timer[20]_i_5_n_0\
    );
\timer[24]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(27),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(27),
      O => \timer[24]_i_2_n_0\
    );
\timer[24]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(26),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(26),
      O => \timer[24]_i_3_n_0\
    );
\timer[24]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(25),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(25),
      O => \timer[24]_i_4_n_0\
    );
\timer[24]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(24),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(24),
      O => \timer[24]_i_5_n_0\
    );
\timer[28]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(31),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(31),
      O => \timer[28]_i_2_n_0\
    );
\timer[28]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(30),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(30),
      O => \timer[28]_i_3_n_0\
    );
\timer[28]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(29),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(29),
      O => \timer[28]_i_4_n_0\
    );
\timer[28]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(28),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(28),
      O => \timer[28]_i_5_n_0\
    );
\timer[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(7),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(7),
      O => \timer[4]_i_2_n_0\
    );
\timer[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(6),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(6),
      O => \timer[4]_i_3_n_0\
    );
\timer[4]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(5),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(5),
      O => \timer[4]_i_4_n_0\
    );
\timer[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(4),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(4),
      O => \timer[4]_i_5_n_0\
    );
\timer[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(11),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(11),
      O => \timer[8]_i_2_n_0\
    );
\timer[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(10),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(10),
      O => \timer[8]_i_3_n_0\
    );
\timer[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(9),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(9),
      O => \timer[8]_i_4_n_0\
    );
\timer[8]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => data(8),
      I1 => write_timer_begin_r2,
      I2 => write_timer_begin_r3,
      I3 => timer_reg(8),
      O => \timer[8]_i_5_n_0\
    );
\timer_r1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(0),
      Q => timer_r1(0),
      R => '0'
    );
\timer_r1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(10),
      Q => timer_r1(10),
      R => '0'
    );
\timer_r1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(11),
      Q => timer_r1(11),
      R => '0'
    );
\timer_r1_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(12),
      Q => timer_r1(12),
      R => '0'
    );
\timer_r1_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(13),
      Q => timer_r1(13),
      R => '0'
    );
\timer_r1_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(14),
      Q => timer_r1(14),
      R => '0'
    );
\timer_r1_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(15),
      Q => timer_r1(15),
      R => '0'
    );
\timer_r1_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(16),
      Q => timer_r1(16),
      R => '0'
    );
\timer_r1_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(17),
      Q => timer_r1(17),
      R => '0'
    );
\timer_r1_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(18),
      Q => timer_r1(18),
      R => '0'
    );
\timer_r1_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(19),
      Q => timer_r1(19),
      R => '0'
    );
\timer_r1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(1),
      Q => timer_r1(1),
      R => '0'
    );
\timer_r1_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(20),
      Q => timer_r1(20),
      R => '0'
    );
\timer_r1_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(21),
      Q => timer_r1(21),
      R => '0'
    );
\timer_r1_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(22),
      Q => timer_r1(22),
      R => '0'
    );
\timer_r1_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(23),
      Q => timer_r1(23),
      R => '0'
    );
\timer_r1_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(24),
      Q => timer_r1(24),
      R => '0'
    );
\timer_r1_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(25),
      Q => timer_r1(25),
      R => '0'
    );
\timer_r1_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(26),
      Q => timer_r1(26),
      R => '0'
    );
\timer_r1_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(27),
      Q => timer_r1(27),
      R => '0'
    );
\timer_r1_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(28),
      Q => timer_r1(28),
      R => '0'
    );
\timer_r1_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(29),
      Q => timer_r1(29),
      R => '0'
    );
\timer_r1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(2),
      Q => timer_r1(2),
      R => '0'
    );
\timer_r1_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(30),
      Q => timer_r1(30),
      R => '0'
    );
\timer_r1_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(31),
      Q => timer_r1(31),
      R => '0'
    );
\timer_r1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(3),
      Q => timer_r1(3),
      R => '0'
    );
\timer_r1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(4),
      Q => timer_r1(4),
      R => '0'
    );
\timer_r1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(5),
      Q => timer_r1(5),
      R => '0'
    );
\timer_r1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(6),
      Q => timer_r1(6),
      R => '0'
    );
\timer_r1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(7),
      Q => timer_r1(7),
      R => '0'
    );
\timer_r1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(8),
      Q => timer_r1(8),
      R => '0'
    );
\timer_r1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_reg(9),
      Q => timer_r1(9),
      R => '0'
    );
\timer_r2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(0),
      Q => timer_r2(0),
      R => '0'
    );
\timer_r2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(10),
      Q => timer_r2(10),
      R => '0'
    );
\timer_r2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(11),
      Q => timer_r2(11),
      R => '0'
    );
\timer_r2_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(12),
      Q => timer_r2(12),
      R => '0'
    );
\timer_r2_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(13),
      Q => timer_r2(13),
      R => '0'
    );
\timer_r2_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(14),
      Q => timer_r2(14),
      R => '0'
    );
\timer_r2_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(15),
      Q => timer_r2(15),
      R => '0'
    );
\timer_r2_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(16),
      Q => timer_r2(16),
      R => '0'
    );
\timer_r2_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(17),
      Q => timer_r2(17),
      R => '0'
    );
\timer_r2_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(18),
      Q => timer_r2(18),
      R => '0'
    );
\timer_r2_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(19),
      Q => timer_r2(19),
      R => '0'
    );
\timer_r2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(1),
      Q => timer_r2(1),
      R => '0'
    );
\timer_r2_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(20),
      Q => timer_r2(20),
      R => '0'
    );
\timer_r2_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(21),
      Q => timer_r2(21),
      R => '0'
    );
\timer_r2_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(22),
      Q => timer_r2(22),
      R => '0'
    );
\timer_r2_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(23),
      Q => timer_r2(23),
      R => '0'
    );
\timer_r2_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(24),
      Q => timer_r2(24),
      R => '0'
    );
\timer_r2_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(25),
      Q => timer_r2(25),
      R => '0'
    );
\timer_r2_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(26),
      Q => timer_r2(26),
      R => '0'
    );
\timer_r2_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(27),
      Q => timer_r2(27),
      R => '0'
    );
\timer_r2_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(28),
      Q => timer_r2(28),
      R => '0'
    );
\timer_r2_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(29),
      Q => timer_r2(29),
      R => '0'
    );
\timer_r2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(2),
      Q => timer_r2(2),
      R => '0'
    );
\timer_r2_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(30),
      Q => timer_r2(30),
      R => '0'
    );
\timer_r2_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(31),
      Q => timer_r2(31),
      R => '0'
    );
\timer_r2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(3),
      Q => timer_r2(3),
      R => '0'
    );
\timer_r2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(4),
      Q => timer_r2(4),
      R => '0'
    );
\timer_r2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(5),
      Q => timer_r2(5),
      R => '0'
    );
\timer_r2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(6),
      Q => timer_r2(6),
      R => '0'
    );
\timer_r2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(7),
      Q => timer_r2(7),
      R => '0'
    );
\timer_r2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(8),
      Q => timer_r2(8),
      R => '0'
    );
\timer_r2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => timer_r1(9),
      Q => timer_r2(9),
      R => '0'
    );
\timer_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[0]_i_1_n_7\,
      Q => timer_reg(0),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \timer_reg[0]_i_1_n_0\,
      CO(2) => \timer_reg[0]_i_1_n_1\,
      CO(1) => \timer_reg[0]_i_1_n_2\,
      CO(0) => \timer_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \timer[0]_i_2_n_0\,
      O(3) => \timer_reg[0]_i_1_n_4\,
      O(2) => \timer_reg[0]_i_1_n_5\,
      O(1) => \timer_reg[0]_i_1_n_6\,
      O(0) => \timer_reg[0]_i_1_n_7\,
      S(3) => \timer[0]_i_3_n_0\,
      S(2) => \timer[0]_i_4_n_0\,
      S(1) => \timer[0]_i_5_n_0\,
      S(0) => \timer[0]_i_6_n_0\
    );
\timer_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[8]_i_1_n_5\,
      Q => timer_reg(10),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[8]_i_1_n_4\,
      Q => timer_reg(11),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[12]_i_1_n_7\,
      Q => timer_reg(12),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_reg[8]_i_1_n_0\,
      CO(3) => \timer_reg[12]_i_1_n_0\,
      CO(2) => \timer_reg[12]_i_1_n_1\,
      CO(1) => \timer_reg[12]_i_1_n_2\,
      CO(0) => \timer_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \timer_reg[12]_i_1_n_4\,
      O(2) => \timer_reg[12]_i_1_n_5\,
      O(1) => \timer_reg[12]_i_1_n_6\,
      O(0) => \timer_reg[12]_i_1_n_7\,
      S(3) => \timer[12]_i_2_n_0\,
      S(2) => \timer[12]_i_3_n_0\,
      S(1) => \timer[12]_i_4_n_0\,
      S(0) => \timer[12]_i_5_n_0\
    );
\timer_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[12]_i_1_n_6\,
      Q => timer_reg(13),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[12]_i_1_n_5\,
      Q => timer_reg(14),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[12]_i_1_n_4\,
      Q => timer_reg(15),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[16]_i_1_n_7\,
      Q => timer_reg(16),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_reg[12]_i_1_n_0\,
      CO(3) => \timer_reg[16]_i_1_n_0\,
      CO(2) => \timer_reg[16]_i_1_n_1\,
      CO(1) => \timer_reg[16]_i_1_n_2\,
      CO(0) => \timer_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \timer_reg[16]_i_1_n_4\,
      O(2) => \timer_reg[16]_i_1_n_5\,
      O(1) => \timer_reg[16]_i_1_n_6\,
      O(0) => \timer_reg[16]_i_1_n_7\,
      S(3) => \timer[16]_i_2_n_0\,
      S(2) => \timer[16]_i_3_n_0\,
      S(1) => \timer[16]_i_4_n_0\,
      S(0) => \timer[16]_i_5_n_0\
    );
\timer_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[16]_i_1_n_6\,
      Q => timer_reg(17),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[16]_i_1_n_5\,
      Q => timer_reg(18),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[16]_i_1_n_4\,
      Q => timer_reg(19),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[0]_i_1_n_6\,
      Q => timer_reg(1),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[20]_i_1_n_7\,
      Q => timer_reg(20),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_reg[16]_i_1_n_0\,
      CO(3) => \timer_reg[20]_i_1_n_0\,
      CO(2) => \timer_reg[20]_i_1_n_1\,
      CO(1) => \timer_reg[20]_i_1_n_2\,
      CO(0) => \timer_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \timer_reg[20]_i_1_n_4\,
      O(2) => \timer_reg[20]_i_1_n_5\,
      O(1) => \timer_reg[20]_i_1_n_6\,
      O(0) => \timer_reg[20]_i_1_n_7\,
      S(3) => \timer[20]_i_2_n_0\,
      S(2) => \timer[20]_i_3_n_0\,
      S(1) => \timer[20]_i_4_n_0\,
      S(0) => \timer[20]_i_5_n_0\
    );
\timer_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[20]_i_1_n_6\,
      Q => timer_reg(21),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[20]_i_1_n_5\,
      Q => timer_reg(22),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[20]_i_1_n_4\,
      Q => timer_reg(23),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[24]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[24]_i_1_n_7\,
      Q => timer_reg(24),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_reg[20]_i_1_n_0\,
      CO(3) => \timer_reg[24]_i_1_n_0\,
      CO(2) => \timer_reg[24]_i_1_n_1\,
      CO(1) => \timer_reg[24]_i_1_n_2\,
      CO(0) => \timer_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \timer_reg[24]_i_1_n_4\,
      O(2) => \timer_reg[24]_i_1_n_5\,
      O(1) => \timer_reg[24]_i_1_n_6\,
      O(0) => \timer_reg[24]_i_1_n_7\,
      S(3) => \timer[24]_i_2_n_0\,
      S(2) => \timer[24]_i_3_n_0\,
      S(1) => \timer[24]_i_4_n_0\,
      S(0) => \timer[24]_i_5_n_0\
    );
\timer_reg[25]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[24]_i_1_n_6\,
      Q => timer_reg(25),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[26]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[24]_i_1_n_5\,
      Q => timer_reg(26),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[27]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[24]_i_1_n_4\,
      Q => timer_reg(27),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[28]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[28]_i_1_n_7\,
      Q => timer_reg(28),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_reg[24]_i_1_n_0\,
      CO(3) => \NLW_timer_reg[28]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \timer_reg[28]_i_1_n_1\,
      CO(1) => \timer_reg[28]_i_1_n_2\,
      CO(0) => \timer_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \timer_reg[28]_i_1_n_4\,
      O(2) => \timer_reg[28]_i_1_n_5\,
      O(1) => \timer_reg[28]_i_1_n_6\,
      O(0) => \timer_reg[28]_i_1_n_7\,
      S(3) => \timer[28]_i_2_n_0\,
      S(2) => \timer[28]_i_3_n_0\,
      S(1) => \timer[28]_i_4_n_0\,
      S(0) => \timer[28]_i_5_n_0\
    );
\timer_reg[29]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[28]_i_1_n_6\,
      Q => timer_reg(29),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[0]_i_1_n_5\,
      Q => timer_reg(2),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[30]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[28]_i_1_n_5\,
      Q => timer_reg(30),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[31]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[28]_i_1_n_4\,
      Q => timer_reg(31),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[0]_i_1_n_4\,
      Q => timer_reg(3),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[4]_i_1_n_7\,
      Q => timer_reg(4),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_reg[0]_i_1_n_0\,
      CO(3) => \timer_reg[4]_i_1_n_0\,
      CO(2) => \timer_reg[4]_i_1_n_1\,
      CO(1) => \timer_reg[4]_i_1_n_2\,
      CO(0) => \timer_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \timer_reg[4]_i_1_n_4\,
      O(2) => \timer_reg[4]_i_1_n_5\,
      O(1) => \timer_reg[4]_i_1_n_6\,
      O(0) => \timer_reg[4]_i_1_n_7\,
      S(3) => \timer[4]_i_2_n_0\,
      S(2) => \timer[4]_i_3_n_0\,
      S(1) => \timer[4]_i_4_n_0\,
      S(0) => \timer[4]_i_5_n_0\
    );
\timer_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[4]_i_1_n_6\,
      Q => timer_reg(5),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[4]_i_1_n_5\,
      Q => timer_reg(6),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[4]_i_1_n_4\,
      Q => timer_reg(7),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[8]_i_1_n_7\,
      Q => timer_reg(8),
      R => \buf_id[3]_i_1_n_0\
    );
\timer_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \timer_reg[4]_i_1_n_0\,
      CO(3) => \timer_reg[8]_i_1_n_0\,
      CO(2) => \timer_reg[8]_i_1_n_1\,
      CO(1) => \timer_reg[8]_i_1_n_2\,
      CO(0) => \timer_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \timer_reg[8]_i_1_n_4\,
      O(2) => \timer_reg[8]_i_1_n_5\,
      O(1) => \timer_reg[8]_i_1_n_6\,
      O(0) => \timer_reg[8]_i_1_n_7\,
      S(3) => \timer[8]_i_2_n_0\,
      S(2) => \timer[8]_i_3_n_0\,
      S(1) => \timer[8]_i_4_n_0\,
      S(0) => \timer[8]_i_5_n_0\
    );
\timer_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => \timer_reg[8]_i_1_n_6\,
      Q => timer_reg(9),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \io_simu[31]_i_2_n_0\,
      I1 => buf_addr(9),
      I2 => buf_addr(10),
      I3 => buf_addr(11),
      I4 => \virtual_uart_data[7]_i_2_n_0\,
      I5 => \led_data[15]_i_3_n_0\,
      O => write_uart_valid
    );
\virtual_uart_data[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => buf_addr(4),
      I1 => buf_addr(5),
      O => \virtual_uart_data[7]_i_2_n_0\
    );
\virtual_uart_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(0),
      Q => virtual_uart_data(0),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(1),
      Q => virtual_uart_data(1),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(2),
      Q => virtual_uart_data(2),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(3),
      Q => virtual_uart_data(3),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(4),
      Q => virtual_uart_data(4),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(5),
      Q => virtual_uart_data(5),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(6),
      Q => virtual_uart_data(6),
      R => \buf_id[3]_i_1_n_0\
    );
\virtual_uart_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => write_uart_valid,
      D => wdata(7),
      Q => virtual_uart_data(7),
      R => \buf_id[3]_i_1_n_0\
    );
write_timer_begin_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => write_timer,
      I1 => write_timer_end_r2,
      I2 => write_timer_begin,
      O => write_timer_begin_i_1_n_0
    );
write_timer_begin_r1_reg: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => write_timer_begin,
      Q => write_timer_begin_r1,
      R => '0'
    );
write_timer_begin_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => write_timer_begin_r1,
      Q => write_timer_begin_r2,
      R => '0'
    );
write_timer_begin_r3_reg: unisim.vcomponents.FDRE
     port map (
      C => timer_clk,
      CE => '1',
      D => write_timer_begin_r2,
      Q => write_timer_begin_r3,
      R => '0'
    );
write_timer_begin_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => write_timer_begin_i_1_n_0,
      Q => write_timer_begin,
      R => \buf_id[3]_i_1_n_0\
    );
write_timer_end_r1_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => write_timer_begin_r2,
      Q => write_timer_end_r1,
      R => '0'
    );
write_timer_end_r2_reg: unisim.vcomponents.FDRE
     port map (
      C => aclk,
      CE => '1',
      D => write_timer_end_r1,
      Q => write_timer_end_r2,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_confreg_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_confreg_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_confreg_0_0 : entity is "design_1_confreg_0_0,confreg,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_confreg_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_confreg_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_confreg_0_0 : entity is "confreg,Vivado 2019.2";
end design_1_confreg_0_0;

architecture STRUCTURE of design_1_confreg_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^bid\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal n_0_550 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF interface_aximm, FREQ_HZ 50000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of arready : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARREADY";
  attribute X_INTERFACE_INFO of arvalid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARVALID";
  attribute X_INTERFACE_INFO of awready : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWREADY";
  attribute X_INTERFACE_INFO of awvalid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWVALID";
  attribute X_INTERFACE_INFO of bready : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BREADY";
  attribute X_INTERFACE_PARAMETER of bready : signal is "XIL_INTERFACENAME interface_aximm, FREQ_HZ 50000000, DATA_WIDTH 32, PROTOCOL AXI4, ID_WIDTH 4, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of bvalid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BVALID";
  attribute X_INTERFACE_INFO of rlast : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RLAST";
  attribute X_INTERFACE_INFO of rready : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RREADY";
  attribute X_INTERFACE_INFO of rvalid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RVALID";
  attribute X_INTERFACE_INFO of timer_clk : signal is "xilinx.com:signal:clock:1.0 timer_clk CLK";
  attribute X_INTERFACE_PARAMETER of timer_clk : signal is "XIL_INTERFACENAME timer_clk, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of wlast : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WLAST";
  attribute X_INTERFACE_INFO of wready : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WREADY";
  attribute X_INTERFACE_INFO of wvalid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WVALID";
  attribute X_INTERFACE_INFO of araddr : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARADDR";
  attribute X_INTERFACE_INFO of arburst : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARBURST";
  attribute X_INTERFACE_INFO of arcache : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARCACHE";
  attribute X_INTERFACE_INFO of arid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARID";
  attribute X_INTERFACE_INFO of arlen : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARLEN";
  attribute X_INTERFACE_INFO of arlock : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARLOCK";
  attribute X_INTERFACE_INFO of arprot : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARPROT";
  attribute X_INTERFACE_INFO of arsize : signal is "xilinx.com:interface:aximm:1.0 interface_aximm ARSIZE";
  attribute X_INTERFACE_INFO of awaddr : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWADDR";
  attribute X_INTERFACE_INFO of awburst : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWBURST";
  attribute X_INTERFACE_INFO of awcache : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWCACHE";
  attribute X_INTERFACE_INFO of awid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWID";
  attribute X_INTERFACE_INFO of awlen : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWLEN";
  attribute X_INTERFACE_INFO of awlock : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWLOCK";
  attribute X_INTERFACE_INFO of awprot : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWPROT";
  attribute X_INTERFACE_INFO of awsize : signal is "xilinx.com:interface:aximm:1.0 interface_aximm AWSIZE";
  attribute X_INTERFACE_INFO of bid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BID";
  attribute X_INTERFACE_INFO of bresp : signal is "xilinx.com:interface:aximm:1.0 interface_aximm BRESP";
  attribute X_INTERFACE_INFO of rdata : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RDATA";
  attribute X_INTERFACE_INFO of rid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RID";
  attribute X_INTERFACE_INFO of rresp : signal is "xilinx.com:interface:aximm:1.0 interface_aximm RRESP";
  attribute X_INTERFACE_INFO of wdata : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WDATA";
  attribute X_INTERFACE_INFO of wid : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WID";
  attribute X_INTERFACE_INFO of wstrb : signal is "xilinx.com:interface:aximm:1.0 interface_aximm WSTRB";
begin
  bid(3 downto 0) <= \^bid\(3 downto 0);
  bresp(1) <= \<const0>\;
  bresp(0) <= \<const0>\;
  rid(3 downto 0) <= \^bid\(3 downto 0);
  rresp(1) <= \<const0>\;
  rresp(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
i_550: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aresetn,
      O => n_0_550
    );
inst: entity work.design_1_confreg_0_0_confreg
     port map (
      aclk => aclk,
      araddr(15 downto 0) => araddr(15 downto 0),
      aresetn => aresetn,
      arid(3 downto 0) => arid(3 downto 0),
      arready => arready,
      arvalid => arvalid,
      awaddr(15 downto 0) => awaddr(15 downto 0),
      awid(3 downto 0) => awid(3 downto 0),
      awready => awready,
      awvalid => awvalid,
      bid(3 downto 0) => \^bid\(3 downto 0),
      bready => bready,
      btn_key_col(3 downto 0) => btn_key_col(3 downto 0),
      btn_key_row(3 downto 0) => btn_key_row(3 downto 0),
      btn_step(1 downto 0) => btn_step(1 downto 0),
      bvalid => bvalid,
      conf_rvalid_reg_reg_0 => rvalid,
      conf_wready_reg_reg_0 => wready,
      led(15 downto 0) => led(15 downto 0),
      led_rg0(1 downto 0) => led_rg0(1 downto 0),
      led_rg1(1 downto 0) => led_rg1(1 downto 0),
      num_a_g(6 downto 0) => num_a_g(6 downto 0),
      num_csn(7 downto 0) => num_csn(7 downto 0),
      num_data(31 downto 0) => num_data(31 downto 0),
      ram_random_mask(4 downto 0) => ram_random_mask(4 downto 0),
      rdata(31 downto 0) => rdata(31 downto 0),
      rlast => rlast,
      rready => rready,
      switch(7 downto 0) => switch(7 downto 0),
      timer_clk => timer_clk,
      wdata(31 downto 0) => wdata(31 downto 0),
      wlast => wlast,
      wvalid => wvalid
    );
end STRUCTURE;
