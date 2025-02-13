set_property SRC_FILE_INFO {cfile:/home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_mmcm_50Mhz_0/sp7_cal3_mmcm_50Mhz_0.xdc rfile:../../src/ip/sp7_cal3_mmcm_50Mhz_0/sp7_cal3_mmcm_50Mhz_0.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.2
