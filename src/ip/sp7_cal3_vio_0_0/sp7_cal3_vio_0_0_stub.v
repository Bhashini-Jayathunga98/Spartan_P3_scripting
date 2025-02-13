// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 11 14:41:41 2025
// Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_vio_0_0/sp7_cal3_vio_0_0_stub.v
// Design      : sp7_cal3_vio_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2020.1" *)
module sp7_cal3_vio_0_0(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_in5, probe_in6, probe_in7, probe_out0, probe_out1, probe_out2, probe_out3, 
  probe_out4, probe_out5, probe_out6, probe_out7)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[7:0],probe_in1[7:0],probe_in2[7:0],probe_in3[7:0],probe_in4[7:0],probe_in5[7:0],probe_in6[7:0],probe_in7[7:0],probe_out0[7:0],probe_out1[7:0],probe_out2[7:0],probe_out3[7:0],probe_out4[7:0],probe_out5[7:0],probe_out6[7:0],probe_out7[7:0]" */;
  input clk;
  input [7:0]probe_in0;
  input [7:0]probe_in1;
  input [7:0]probe_in2;
  input [7:0]probe_in3;
  input [7:0]probe_in4;
  input [7:0]probe_in5;
  input [7:0]probe_in6;
  input [7:0]probe_in7;
  output [7:0]probe_out0;
  output [7:0]probe_out1;
  output [7:0]probe_out2;
  output [7:0]probe_out3;
  output [7:0]probe_out4;
  output [7:0]probe_out5;
  output [7:0]probe_out6;
  output [7:0]probe_out7;
endmodule
