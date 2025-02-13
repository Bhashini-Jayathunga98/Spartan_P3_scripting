
set PATH=
call C:/Xilinx/Vivado/2020.1/bin/xelab xil_defaultlib.apatb_parallel_to_AXI_top glbl -prj parallel_to_AXI.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims -L unisims_ver -L xpm  --lib "ieee_proposed=./ieee_proposed" -s parallel_to_AXI -debug wave
call C:/Xilinx/Vivado/2020.1/bin/xsim --noieeewarnings parallel_to_AXI -tclbatch parallel_to_AXI.tcl

