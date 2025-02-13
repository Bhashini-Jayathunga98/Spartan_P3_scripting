-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Tue Feb 11 14:41:04 2025
-- Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_util_ds_buf_0_1/sp7_cal3_util_ds_buf_0_1_stub.vhdl
-- Design      : sp7_cal3_util_ds_buf_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s25csga324-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sp7_cal3_util_ds_buf_0_1 is
  Port ( 
    BUFGCE_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFGCE_CE : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFGCE_O : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end sp7_cal3_util_ds_buf_0_1;

architecture stub of sp7_cal3_util_ds_buf_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "BUFGCE_I[0:0],BUFGCE_CE[0:0],BUFGCE_O[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "util_ds_buf,Vivado 2020.1";
begin
end;
