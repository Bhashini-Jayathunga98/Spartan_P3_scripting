############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project parallel_to_AXI
set_top parallel_to_AXI
add_files parallel_to_AXI/src/parallel_to_AXI.cpp
add_files -tb parallel_to_AXI/src/main.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7s25-csga324-2}
create_clock -period 5 -name default
config_interface -clock_enable=0 -default_slave_interface none -m_axi_addr64=0 -m_axi_alignment_byte_size 4 -m_axi_auto_max_ports=0 -m_axi_latency 0 -m_axi_max_bitwidth 1024 -m_axi_max_read_burst_length 16 -m_axi_max_widen_bitwidth 0 -m_axi_max_write_burst_length 16 -m_axi_min_bitwidth 8 -m_axi_num_read_outstanding 16 -m_axi_num_write_outstanding 16 -m_axi_offset off -register_io off -s_axilite_data64=0
config_export -format ip_catalog -rtl vhdl
source "./parallel_to_AXI/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all -rtl vhdl
export_design -rtl vhdl -format ip_catalog
