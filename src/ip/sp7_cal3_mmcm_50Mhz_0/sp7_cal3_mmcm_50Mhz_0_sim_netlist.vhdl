-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Tue Feb 11 14:40:06 2025
-- Host        : bhashini-laptop running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/bhashini/Desktop/spartan_p3_new/scripting/src/ip/sp7_cal3_mmcm_50Mhz_0/sp7_cal3_mmcm_50Mhz_0_sim_netlist.vhdl
-- Design      : sp7_cal3_mmcm_50Mhz_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7s25csga324-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sp7_cal3_mmcm_50Mhz_0sp7_cal3_mmcm_50Mhz_0_clk_wiz is
  port (
    clkfb_in : in STD_LOGIC;
    clk_50 : out STD_LOGIC;
    clk_10 : out STD_LOGIC;
    clk_100 : out STD_LOGIC;
    clk_6p4 : out STD_LOGIC;
    clkfb_out : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of sp7_cal3_mmcm_50Mhz_0sp7_cal3_mmcm_50Mhz_0_clk_wiz : entity is "sp7_cal3_mmcm_50Mhz_0_clk_wiz";
end sp7_cal3_mmcm_50Mhz_0sp7_cal3_mmcm_50Mhz_0_clk_wiz;

architecture STRUCTURE of sp7_cal3_mmcm_50Mhz_0sp7_cal3_mmcm_50Mhz_0_clk_wiz is
  signal clk_10_sp7_cal3_mmcm_50Mhz_0 : STD_LOGIC;
  signal clk_50_sp7_cal3_mmcm_50Mhz_0 : STD_LOGIC;
  signal clk_6p4_sp7_cal3_mmcm_50Mhz_0 : STD_LOGIC;
  signal clk_in1_sp7_cal3_mmcm_50Mhz_0 : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkin1_ibufg : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of clkin1_ibufg : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of clkin1_ibufg : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of clkin1_ibufg : label is "AUTO";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout4_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkin1_ibufg: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1,
      O => clk_in1_sp7_cal3_mmcm_50Mhz_0
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_50_sp7_cal3_mmcm_50Mhz_0,
      O => clk_50
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_10_sp7_cal3_mmcm_50Mhz_0,
      O => clk_10
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => clk_6p4_sp7_cal3_mmcm_50Mhz_0,
      O => clk_6p4
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 16.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 20.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 16.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 80,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 8,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 125,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 1,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 1,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfb_in,
      CLKFBOUT => clkfb_out,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clk_in1_sp7_cal3_mmcm_50Mhz_0,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clk_50_sp7_cal3_mmcm_50Mhz_0,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => clk_10_sp7_cal3_mmcm_50Mhz_0,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => clk_100,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => clk_6p4_sp7_cal3_mmcm_50Mhz_0,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      PSCLK => '0',
      PSDONE => NLW_mmcm_adv_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity sp7_cal3_mmcm_50Mhz_0 is
  port (
    clkfb_in : in STD_LOGIC;
    clk_50 : out STD_LOGIC;
    clk_10 : out STD_LOGIC;
    clk_100 : out STD_LOGIC;
    clk_6p4 : out STD_LOGIC;
    clkfb_out : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of sp7_cal3_mmcm_50Mhz_0 : entity is true;
end sp7_cal3_mmcm_50Mhz_0;

architecture STRUCTURE of sp7_cal3_mmcm_50Mhz_0 is
begin
inst: entity work.sp7_cal3_mmcm_50Mhz_0sp7_cal3_mmcm_50Mhz_0_clk_wiz
     port map (
      clk_10 => clk_10,
      clk_100 => clk_100,
      clk_50 => clk_50,
      clk_6p4 => clk_6p4,
      clk_in1 => clk_in1,
      clkfb_in => clkfb_in,
      clkfb_out => clkfb_out,
      locked => locked
    );
end STRUCTURE;
