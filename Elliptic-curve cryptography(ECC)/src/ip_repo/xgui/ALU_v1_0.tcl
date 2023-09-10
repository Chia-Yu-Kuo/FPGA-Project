# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "finish" -parent ${Page_0}
  ipgui::add_param $IPINST -name "idle" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment10" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment11" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment12" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment13" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment14" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment15" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment16" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment5" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment6" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment7" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment8" -parent ${Page_0}
  ipgui::add_param $IPINST -name "segment9" -parent ${Page_0}


}

proc update_PARAM_VALUE.finish { PARAM_VALUE.finish } {
	# Procedure called to update finish when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.finish { PARAM_VALUE.finish } {
	# Procedure called to validate finish
	return true
}

proc update_PARAM_VALUE.idle { PARAM_VALUE.idle } {
	# Procedure called to update idle when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.idle { PARAM_VALUE.idle } {
	# Procedure called to validate idle
	return true
}

proc update_PARAM_VALUE.segment1 { PARAM_VALUE.segment1 } {
	# Procedure called to update segment1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment1 { PARAM_VALUE.segment1 } {
	# Procedure called to validate segment1
	return true
}

proc update_PARAM_VALUE.segment10 { PARAM_VALUE.segment10 } {
	# Procedure called to update segment10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment10 { PARAM_VALUE.segment10 } {
	# Procedure called to validate segment10
	return true
}

proc update_PARAM_VALUE.segment11 { PARAM_VALUE.segment11 } {
	# Procedure called to update segment11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment11 { PARAM_VALUE.segment11 } {
	# Procedure called to validate segment11
	return true
}

proc update_PARAM_VALUE.segment12 { PARAM_VALUE.segment12 } {
	# Procedure called to update segment12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment12 { PARAM_VALUE.segment12 } {
	# Procedure called to validate segment12
	return true
}

proc update_PARAM_VALUE.segment13 { PARAM_VALUE.segment13 } {
	# Procedure called to update segment13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment13 { PARAM_VALUE.segment13 } {
	# Procedure called to validate segment13
	return true
}

proc update_PARAM_VALUE.segment14 { PARAM_VALUE.segment14 } {
	# Procedure called to update segment14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment14 { PARAM_VALUE.segment14 } {
	# Procedure called to validate segment14
	return true
}

proc update_PARAM_VALUE.segment15 { PARAM_VALUE.segment15 } {
	# Procedure called to update segment15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment15 { PARAM_VALUE.segment15 } {
	# Procedure called to validate segment15
	return true
}

proc update_PARAM_VALUE.segment16 { PARAM_VALUE.segment16 } {
	# Procedure called to update segment16 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment16 { PARAM_VALUE.segment16 } {
	# Procedure called to validate segment16
	return true
}

proc update_PARAM_VALUE.segment2 { PARAM_VALUE.segment2 } {
	# Procedure called to update segment2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment2 { PARAM_VALUE.segment2 } {
	# Procedure called to validate segment2
	return true
}

proc update_PARAM_VALUE.segment3 { PARAM_VALUE.segment3 } {
	# Procedure called to update segment3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment3 { PARAM_VALUE.segment3 } {
	# Procedure called to validate segment3
	return true
}

proc update_PARAM_VALUE.segment4 { PARAM_VALUE.segment4 } {
	# Procedure called to update segment4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment4 { PARAM_VALUE.segment4 } {
	# Procedure called to validate segment4
	return true
}

proc update_PARAM_VALUE.segment5 { PARAM_VALUE.segment5 } {
	# Procedure called to update segment5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment5 { PARAM_VALUE.segment5 } {
	# Procedure called to validate segment5
	return true
}

proc update_PARAM_VALUE.segment6 { PARAM_VALUE.segment6 } {
	# Procedure called to update segment6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment6 { PARAM_VALUE.segment6 } {
	# Procedure called to validate segment6
	return true
}

proc update_PARAM_VALUE.segment7 { PARAM_VALUE.segment7 } {
	# Procedure called to update segment7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment7 { PARAM_VALUE.segment7 } {
	# Procedure called to validate segment7
	return true
}

proc update_PARAM_VALUE.segment8 { PARAM_VALUE.segment8 } {
	# Procedure called to update segment8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment8 { PARAM_VALUE.segment8 } {
	# Procedure called to validate segment8
	return true
}

proc update_PARAM_VALUE.segment9 { PARAM_VALUE.segment9 } {
	# Procedure called to update segment9 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.segment9 { PARAM_VALUE.segment9 } {
	# Procedure called to validate segment9
	return true
}


proc update_MODELPARAM_VALUE.idle { MODELPARAM_VALUE.idle PARAM_VALUE.idle } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.idle}] ${MODELPARAM_VALUE.idle}
}

proc update_MODELPARAM_VALUE.segment1 { MODELPARAM_VALUE.segment1 PARAM_VALUE.segment1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment1}] ${MODELPARAM_VALUE.segment1}
}

proc update_MODELPARAM_VALUE.segment2 { MODELPARAM_VALUE.segment2 PARAM_VALUE.segment2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment2}] ${MODELPARAM_VALUE.segment2}
}

proc update_MODELPARAM_VALUE.segment3 { MODELPARAM_VALUE.segment3 PARAM_VALUE.segment3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment3}] ${MODELPARAM_VALUE.segment3}
}

proc update_MODELPARAM_VALUE.segment4 { MODELPARAM_VALUE.segment4 PARAM_VALUE.segment4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment4}] ${MODELPARAM_VALUE.segment4}
}

proc update_MODELPARAM_VALUE.segment5 { MODELPARAM_VALUE.segment5 PARAM_VALUE.segment5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment5}] ${MODELPARAM_VALUE.segment5}
}

proc update_MODELPARAM_VALUE.segment6 { MODELPARAM_VALUE.segment6 PARAM_VALUE.segment6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment6}] ${MODELPARAM_VALUE.segment6}
}

proc update_MODELPARAM_VALUE.segment7 { MODELPARAM_VALUE.segment7 PARAM_VALUE.segment7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment7}] ${MODELPARAM_VALUE.segment7}
}

proc update_MODELPARAM_VALUE.segment8 { MODELPARAM_VALUE.segment8 PARAM_VALUE.segment8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment8}] ${MODELPARAM_VALUE.segment8}
}

proc update_MODELPARAM_VALUE.segment9 { MODELPARAM_VALUE.segment9 PARAM_VALUE.segment9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment9}] ${MODELPARAM_VALUE.segment9}
}

proc update_MODELPARAM_VALUE.segment10 { MODELPARAM_VALUE.segment10 PARAM_VALUE.segment10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment10}] ${MODELPARAM_VALUE.segment10}
}

proc update_MODELPARAM_VALUE.segment11 { MODELPARAM_VALUE.segment11 PARAM_VALUE.segment11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment11}] ${MODELPARAM_VALUE.segment11}
}

proc update_MODELPARAM_VALUE.segment12 { MODELPARAM_VALUE.segment12 PARAM_VALUE.segment12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment12}] ${MODELPARAM_VALUE.segment12}
}

proc update_MODELPARAM_VALUE.segment13 { MODELPARAM_VALUE.segment13 PARAM_VALUE.segment13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment13}] ${MODELPARAM_VALUE.segment13}
}

proc update_MODELPARAM_VALUE.segment14 { MODELPARAM_VALUE.segment14 PARAM_VALUE.segment14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment14}] ${MODELPARAM_VALUE.segment14}
}

proc update_MODELPARAM_VALUE.segment15 { MODELPARAM_VALUE.segment15 PARAM_VALUE.segment15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment15}] ${MODELPARAM_VALUE.segment15}
}

proc update_MODELPARAM_VALUE.segment16 { MODELPARAM_VALUE.segment16 PARAM_VALUE.segment16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.segment16}] ${MODELPARAM_VALUE.segment16}
}

proc update_MODELPARAM_VALUE.finish { MODELPARAM_VALUE.finish PARAM_VALUE.finish } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.finish}] ${MODELPARAM_VALUE.finish}
}

