// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 11 14:42:21 2025
// Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_vio_main_config_0/sp7_cal3_vio_main_config_0_stub.v
// Design      : sp7_cal3_vio_main_config_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2020.1" *)
module sp7_cal3_vio_main_config_0(clk, probe_out0, probe_out1, probe_out2, 
  probe_out3, probe_out4, probe_out5, probe_out6, probe_out7, probe_out8, probe_out9, 
  probe_out10, probe_out11, probe_out12)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_out0[0:0],probe_out1[0:0],probe_out2[0:0],probe_out3[0:0],probe_out4[0:0],probe_out5[0:0],probe_out6[0:0],probe_out7[0:0],probe_out8[0:0],probe_out9[0:0],probe_out10[0:0],probe_out11[0:0],probe_out12[0:0]" */;
  input clk;
  output [0:0]probe_out0;
  output [0:0]probe_out1;
  output [0:0]probe_out2;
  output [0:0]probe_out3;
  output [0:0]probe_out4;
  output [0:0]probe_out5;
  output [0:0]probe_out6;
  output [0:0]probe_out7;
  output [0:0]probe_out8;
  output [0:0]probe_out9;
  output [0:0]probe_out10;
  output [0:0]probe_out11;
  output [0:0]probe_out12;
endmodule
