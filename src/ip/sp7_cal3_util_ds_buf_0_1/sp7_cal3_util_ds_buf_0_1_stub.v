// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Tue Feb 11 14:41:04 2025
// Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_util_ds_buf_0_1/sp7_cal3_util_ds_buf_0_1_stub.v
// Design      : sp7_cal3_util_ds_buf_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s25csga324-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "util_ds_buf,Vivado 2020.1" *)
module sp7_cal3_util_ds_buf_0_1(BUFGCE_I, BUFGCE_CE, BUFGCE_O)
/* synthesis syn_black_box black_box_pad_pin="BUFGCE_I[0:0],BUFGCE_CE[0:0],BUFGCE_O[0:0]" */;
  input [0:0]BUFGCE_I;
  input [0:0]BUFGCE_CE;
  output [0:0]BUFGCE_O;
endmodule
