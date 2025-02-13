-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Tue Feb 11 14:38:59 2025
-- Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_clk_wiz_10_OCXO_0/sp7_cal3_clk_wiz_10_OCXO_0_stub.vhdl
-- Design      : sp7_cal3_clk_wiz_10_OCXO_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s25csga324-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sp7_cal3_clk_wiz_10_OCXO_0 is
  Port ( 
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end sp7_cal3_clk_wiz_10_OCXO_0;

architecture stub of sp7_cal3_clk_wiz_10_OCXO_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,locked,clk_in1";
begin
end;
