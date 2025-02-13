// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 11 14:39:53 2025
// Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_ila_0_0/sp7_cal3_ila_0_0_stub.v
// Design      : sp7_cal3_ila_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2020.1" *)
module sp7_cal3_ila_0_0(clk, probe0, probe1, probe2, probe3, probe4)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[0:0],probe2[0:0],probe3[0:0],probe4[0:0]" */;
  input clk;
  input [0:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [0:0]probe4;
endmodule
