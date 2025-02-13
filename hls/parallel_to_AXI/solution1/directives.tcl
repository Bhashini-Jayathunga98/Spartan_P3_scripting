############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_interface -mode ap_none "parallel_to_AXI" wdata
set_directive_interface -mode ap_none "parallel_to_AXI" wadd
set_directive_interface -mode ap_ovld "parallel_to_AXI" rdata
set_directive_interface -mode ap_none "parallel_to_AXI" radd
set_directive_interface "parallel_to_AXI" cmd
set_directive_interface -mode ap_ovld "parallel_to_AXI" sta
set_directive_interface -mode m_axi -depth 1024 -offset direct "parallel_to_AXI" AXI
set_directive_top -name parallel_to_AXI "parallel_to_AXI"
set_directive_pipeline -enable_flush "parallel_to_AXI"
