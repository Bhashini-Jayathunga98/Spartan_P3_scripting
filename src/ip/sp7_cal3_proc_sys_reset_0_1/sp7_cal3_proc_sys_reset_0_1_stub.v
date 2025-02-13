// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 11 14:40:29 2025
// Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_proc_sys_reset_0_1/sp7_cal3_proc_sys_reset_0_1_stub.v
// Design      : sp7_cal3_proc_sys_reset_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "proc_sys_reset,Vivado 2020.1" *)
module sp7_cal3_proc_sys_reset_0_1(slowest_sync_clk, ext_reset_in, aux_reset_in, 
  mb_debug_sys_rst, dcm_locked, mb_reset, bus_struct_reset, peripheral_reset, 
  interconnect_aresetn, peripheral_aresetn)
/* synthesis syn_black_box black_box_pad_pin="slowest_sync_clk,ext_reset_in,aux_reset_in,mb_debug_sys_rst,dcm_locked,mb_reset,bus_struct_reset[0:0],peripheral_reset[0:0],interconnect_aresetn[0:0],peripheral_aresetn[0:0]" */;
  input slowest_sync_clk;
  input ext_reset_in;
  input aux_reset_in;
  input mb_debug_sys_rst;
  input dcm_locked;
  output mb_reset;
  output [0:0]bus_struct_reset;
  output [0:0]peripheral_reset;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;
endmodule
