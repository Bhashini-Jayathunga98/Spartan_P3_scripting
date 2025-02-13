// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 11 14:40:06 2025
// Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_mmcm_50Mhz_0/sp7_cal3_mmcm_50Mhz_0_stub.v
// Design      : sp7_cal3_mmcm_50Mhz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module sp7_cal3_mmcm_50Mhz_0(clkfb_in, clk_50, clk_10, clk_100, clk_6p4, 
  clkfb_out, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clkfb_in,clk_50,clk_10,clk_100,clk_6p4,clkfb_out,locked,clk_in1" */;
  input clkfb_in;
  output clk_50;
  output clk_10;
  output clk_100;
  output clk_6p4;
  output clkfb_out;
  output locked;
  input clk_in1;
endmodule
