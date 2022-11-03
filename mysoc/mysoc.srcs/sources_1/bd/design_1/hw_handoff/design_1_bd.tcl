
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a200tfbg676-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set uart_rtl_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 uart_rtl_0 ]


  # Create ports
  set btn_key_col_0 [ create_bd_port -dir O -from 3 -to 0 btn_key_col_0 ]
  set btn_key_row_0 [ create_bd_port -dir I -from 3 -to 0 btn_key_row_0 ]
  set btn_step_0 [ create_bd_port -dir I -from 1 -to 0 btn_step_0 ]
  set clk_in1_0 [ create_bd_port -dir I -type clk clk_in1_0 ]
  set freeze_0 [ create_bd_port -dir I freeze_0 ]
  set led_0 [ create_bd_port -dir O -from 15 -to 0 led_0 ]
  set led_rg0_0 [ create_bd_port -dir O -from 1 -to 0 led_rg0_0 ]
  set led_rg1_0 [ create_bd_port -dir O -from 1 -to 0 led_rg1_0 ]
  set num_a_g_0 [ create_bd_port -dir O -from 6 -to 0 num_a_g_0 ]
  set num_csn_0 [ create_bd_port -dir O -from 7 -to 0 num_csn_0 ]
  set num_data_0 [ create_bd_port -dir O -from 31 -to 0 num_data_0 ]
  set resetn_0 [ create_bd_port -dir I -type rst resetn_0 ]
  set switch_0 [ create_bd_port -dir I -from 7 -to 0 switch_0 ]

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_1, and set properties
  set axi_bram_ctrl_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_1 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_1

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.ENABLE_ADVANCED_OPTIONS {0} \
   CONFIG.NUM_MI {2} \
 ] $axi_interconnect_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]

  # Create instance: axi_interconnect_2, and set properties
  set axi_interconnect_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_2 ]

  # Create instance: axi_uart16550_0, and set properties
  set axi_uart16550_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_0 ]
  set_property -dict [ list \
   CONFIG.C_HAS_EXTERNAL_XIN {0} \
 ] $axi_uart16550_0

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.Coe_File {../../../../../../../../nscscc-2023/bare-metal/build/inst_ram.coe} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Memory_Type {Single_Port_ROM} \
   CONFIG.Operating_Mode_A {WRITE_FIRST} \
   CONFIG.Port_A_Write_Rate {0} \
   CONFIG.Read_Width_A {32} \
   CONFIG.Read_Width_B {32} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Write_Width_A {32} \
   CONFIG.Write_Width_B {32} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_1 ]
  set_property -dict [ list \
   CONFIG.Byte_Size {8} \
   CONFIG.EN_SAFETY_CKT {true} \
   CONFIG.Enable_32bit_Address {true} \
   CONFIG.Enable_B {Always_Enabled} \
   CONFIG.Memory_Type {Single_Port_RAM} \
   CONFIG.Port_B_Clock {0} \
   CONFIG.Port_B_Enable_Rate {0} \
   CONFIG.Port_B_Write_Rate {0} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
   CONFIG.Use_Byte_Write_Enable {true} \
   CONFIG.Use_RSTA_Pin {true} \
   CONFIG.Use_RSTB_Pin {false} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $blk_mem_gen_1

  # Create instance: clk_wiz, and set properties
  set clk_wiz [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {151.636} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
   CONFIG.CLKOUT2_JITTER {130.958} \
   CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLK_OUT1_PORT {cpu_clk} \
   CONFIG.CLK_OUT2_PORT {timer_clk} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {10} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz

  # Create instance: confreg_0, and set properties
  set confreg_0 [ create_bd_cell -type ip -vlnv user.org:user:confreg:1.0 confreg_0 ]

  # Create instance: mycpu_top_0, and set properties
  set mycpu_top_0 [ create_bd_cell -type ip -vlnv user.org:user:mycpu_top:1.0 mycpu_top_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_1_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_1/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins axi_interconnect_2/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_interconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M01_AXI [get_bd_intf_pins axi_bram_ctrl_1/S_AXI] [get_bd_intf_pins axi_interconnect_1/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_2_M00_AXI [get_bd_intf_pins axi_interconnect_2/M00_AXI] [get_bd_intf_pins confreg_0/interface_aximm]
  connect_bd_intf_net -intf_net axi_interconnect_2_M01_AXI [get_bd_intf_pins axi_interconnect_2/M01_AXI] [get_bd_intf_pins axi_uart16550_0/S_AXI]
  connect_bd_intf_net -intf_net axi_uart16550_0_UART [get_bd_intf_ports uart_rtl_0] [get_bd_intf_pins axi_uart16550_0/UART]
  connect_bd_intf_net -intf_net mycpu_top_0_interface_aximm [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins mycpu_top_0/interface_aximm]

  # Create port connections
  connect_bd_net -net btn_key_row_0_1 [get_bd_ports btn_key_row_0] [get_bd_pins confreg_0/btn_key_row]
  connect_bd_net -net btn_step_0_1 [get_bd_ports btn_step_0] [get_bd_pins confreg_0/btn_step]
  connect_bd_net -net clk_in1_0_1 [get_bd_ports clk_in1_0] [get_bd_pins clk_wiz/clk_in1]
  connect_bd_net -net clk_wiz_clk_out1 [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_bram_ctrl_1/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/M01_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axi_interconnect_2/ACLK] [get_bd_pins axi_interconnect_2/M00_ACLK] [get_bd_pins axi_interconnect_2/M01_ACLK] [get_bd_pins axi_interconnect_2/S00_ACLK] [get_bd_pins axi_uart16550_0/s_axi_aclk] [get_bd_pins clk_wiz/cpu_clk] [get_bd_pins confreg_0/aclk] [get_bd_pins mycpu_top_0/aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net clk_wiz_locked [get_bd_pins clk_wiz/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]
  connect_bd_net -net clk_wiz_timer_clk [get_bd_pins clk_wiz/timer_clk] [get_bd_pins confreg_0/timer_clk]
  connect_bd_net -net confreg_0_btn_key_col [get_bd_ports btn_key_col_0] [get_bd_pins confreg_0/btn_key_col]
  connect_bd_net -net confreg_0_led [get_bd_ports led_0] [get_bd_pins confreg_0/led]
  connect_bd_net -net confreg_0_led_rg0 [get_bd_ports led_rg0_0] [get_bd_pins confreg_0/led_rg0]
  connect_bd_net -net confreg_0_led_rg1 [get_bd_ports led_rg1_0] [get_bd_pins confreg_0/led_rg1]
  connect_bd_net -net confreg_0_num_a_g [get_bd_ports num_a_g_0] [get_bd_pins confreg_0/num_a_g]
  connect_bd_net -net confreg_0_num_csn [get_bd_ports num_csn_0] [get_bd_pins confreg_0/num_csn]
  connect_bd_net -net confreg_0_num_data [get_bd_ports num_data_0] [get_bd_pins confreg_0/num_data]
  connect_bd_net -net freeze_0_1 [get_bd_ports freeze_0] [get_bd_pins axi_uart16550_0/freeze]
  connect_bd_net -net resetn_0_1 [get_bd_ports resetn_0] [get_bd_pins clk_wiz/resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_100M_peripheral_aresetn [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_1/s_axi_aresetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/M01_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axi_interconnect_2/ARESETN] [get_bd_pins axi_interconnect_2/M00_ARESETN] [get_bd_pins axi_interconnect_2/M01_ARESETN] [get_bd_pins axi_interconnect_2/S00_ARESETN] [get_bd_pins axi_uart16550_0/s_axi_aresetn] [get_bd_pins confreg_0/aresetn] [get_bd_pins mycpu_top_0/aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net switch_0_1 [get_bd_ports switch_0] [get_bd_pins confreg_0/switch]

  # Create address segments
  assign_bd_address -offset 0x1C000000 -range 0x00008000 -target_address_space [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] -force
  assign_bd_address -offset 0x1C008000 -range 0x00008000 -target_address_space [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_bram_ctrl_1/S_AXI/Mem0] -force
  assign_bd_address -offset 0x1FE00000 -range 0x00004000 -target_address_space [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs axi_uart16550_0/S_AXI/Reg] -force
  assign_bd_address -offset 0xBFAF0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces mycpu_top_0/interface_aximm] [get_bd_addr_segs confreg_0/interface_aximm/reg0] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


