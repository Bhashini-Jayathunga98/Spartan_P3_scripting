library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_Zynq_mode_pin is
  port (
    CLK50 : in STD_LOGIC;
    RST50 : in STD_LOGIC;
    SP7_DIP_SW : in STD_LOGIC;
    dip_sync : out STD_LOGIC
  );
end hier_Zynq_mode_pin;

architecture STRUCTURE of hier_Zynq_mode_pin is

  component utility_dff is
  port (
    Q : out STD_LOGIC;
    C : in STD_LOGIC;
    CE : in STD_LOGIC;
    D : in STD_LOGIC;
    R : in STD_LOGIC
  );
  end component;

  signal SP7_DIP_SW_11_1 : STD_LOGIC;
  signal SP7_LS_QSPI_CFG_MAP_2V5 : STD_LOGIC;
  signal dip_sw_11_dff_Q : STD_LOGIC;
  signal mmcm_50Mhz_clk_50 : STD_LOGIC;
  signal rstn : STD_LOGIC;
  signal xlconstant_0_dout1 : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  
begin

  SP7_DIP_SW_11_1 <= SP7_DIP_SW;
  dip_sync <= SP7_LS_QSPI_CFG_MAP_2V5;
  mmcm_50Mhz_clk_50 <= CLK50;
  rstn <= RST50;
     
dip_sw_dff: component utility_dff
     port map (
      C => mmcm_50Mhz_clk_50,
      CE => xlconstant_0_dout1(0),
      D => SP7_DIP_SW_11_1,
      Q => dip_sw_11_dff_Q,
      R => rstn
    );
    
dip_sw_dff1: component utility_dff
     port map (
      C => mmcm_50Mhz_clk_50,
      CE => xlconstant_0_dout1(0),
      D => dip_sw_11_dff_Q,
      Q => SP7_LS_QSPI_CFG_MAP_2V5,
      R => rstn
    );
    
end STRUCTURE;