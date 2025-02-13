# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S_AXI_ACLK_FREQ_HZ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_IS_A_16550" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_HAS_EXTERNAL_XIN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_HAS_EXTERNAL_RCLK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_EXTERNAL_XIN_CLK_HZ" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_INSTANCE" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ { PARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ } {
	# Procedure called to update C_EXTERNAL_XIN_CLK_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ { PARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ } {
	# Procedure called to validate C_EXTERNAL_XIN_CLK_HZ
	return true
}

proc update_PARAM_VALUE.C_HAS_EXTERNAL_RCLK { PARAM_VALUE.C_HAS_EXTERNAL_RCLK } {
	# Procedure called to update C_HAS_EXTERNAL_RCLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_HAS_EXTERNAL_RCLK { PARAM_VALUE.C_HAS_EXTERNAL_RCLK } {
	# Procedure called to validate C_HAS_EXTERNAL_RCLK
	return true
}

proc update_PARAM_VALUE.C_HAS_EXTERNAL_XIN { PARAM_VALUE.C_HAS_EXTERNAL_XIN } {
	# Procedure called to update C_HAS_EXTERNAL_XIN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_HAS_EXTERNAL_XIN { PARAM_VALUE.C_HAS_EXTERNAL_XIN } {
	# Procedure called to validate C_HAS_EXTERNAL_XIN
	return true
}

proc update_PARAM_VALUE.C_INSTANCE { PARAM_VALUE.C_INSTANCE } {
	# Procedure called to update C_INSTANCE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_INSTANCE { PARAM_VALUE.C_INSTANCE } {
	# Procedure called to validate C_INSTANCE
	return true
}

proc update_PARAM_VALUE.C_IS_A_16550 { PARAM_VALUE.C_IS_A_16550 } {
	# Procedure called to update C_IS_A_16550 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_IS_A_16550 { PARAM_VALUE.C_IS_A_16550 } {
	# Procedure called to validate C_IS_A_16550
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ { PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ } {
	# Procedure called to update C_S_AXI_ACLK_FREQ_HZ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ { PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ } {
	# Procedure called to validate C_S_AXI_ACLK_FREQ_HZ
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ { MODELPARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ}] ${MODELPARAM_VALUE.C_S_AXI_ACLK_FREQ_HZ}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_IS_A_16550 { MODELPARAM_VALUE.C_IS_A_16550 PARAM_VALUE.C_IS_A_16550 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_IS_A_16550}] ${MODELPARAM_VALUE.C_IS_A_16550}
}

proc update_MODELPARAM_VALUE.C_HAS_EXTERNAL_XIN { MODELPARAM_VALUE.C_HAS_EXTERNAL_XIN PARAM_VALUE.C_HAS_EXTERNAL_XIN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_HAS_EXTERNAL_XIN}] ${MODELPARAM_VALUE.C_HAS_EXTERNAL_XIN}
}

proc update_MODELPARAM_VALUE.C_HAS_EXTERNAL_RCLK { MODELPARAM_VALUE.C_HAS_EXTERNAL_RCLK PARAM_VALUE.C_HAS_EXTERNAL_RCLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_HAS_EXTERNAL_RCLK}] ${MODELPARAM_VALUE.C_HAS_EXTERNAL_RCLK}
}

proc update_MODELPARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ { MODELPARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ PARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ}] ${MODELPARAM_VALUE.C_EXTERNAL_XIN_CLK_HZ}
}

proc update_MODELPARAM_VALUE.C_INSTANCE { MODELPARAM_VALUE.C_INSTANCE PARAM_VALUE.C_INSTANCE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_INSTANCE}] ${MODELPARAM_VALUE.C_INSTANCE}
}

