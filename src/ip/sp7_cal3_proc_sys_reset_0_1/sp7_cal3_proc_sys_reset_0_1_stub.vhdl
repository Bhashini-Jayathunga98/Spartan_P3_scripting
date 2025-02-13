-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Tue Feb 11 14:40:29 2025
-- Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_proc_sys_reset_0_1/sp7_cal3_proc_sys_reset_0_1_stub.vhdl
-- Design      : sp7_cal3_proc_sys_reset_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s25csga324-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sp7_cal3_proc_sys_reset_0_1 is
  Port ( 
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );

end sp7_cal3_proc_sys_reset_0_1;

architecture stub of sp7_cal3_proc_sys_reset_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "slowest_sync_clk,ext_reset_in,aux_reset_in,mb_debug_sys_rst,dcm_locked,mb_reset,bus_struct_reset[0:0],peripheral_reset[0:0],interconnect_aresetn[0:0],peripheral_aresetn[0:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "proc_sys_reset,Vivado 2020.1";
begin
end;
