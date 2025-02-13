library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hier_synchronizers_ldo is
  port (
    LOC_10M_OSC_SP7_ENABLE_i : in STD_LOGIC;
    LOC_10M_OSC_SP7_ENABLE_syn : out STD_LOGIC;
    MCU_MAIN_CLK_EN : in STD_LOGIC;
    MCU_MAIN_CLK_EN_syn : out STD_LOGIC;
    SP7_AFE_VCXO_ENABLE_i : in STD_LOGIC;
    SP7_AFE_VCXO_ENABLE_syn : out STD_LOGIC;
    clk10 : in STD_LOGIC;
    config_OCXO_EN : in STD_LOGIC;
    config_VCTCXO_EN : in STD_LOGIC;
    config_VCTCXO_EN_syn : out STD_LOGIC;
    config_VCXO_EN_syn : out STD_LOGIC;
    rst_10 : in STD_LOGIC
  );
end hier_synchronizers_ldo;

architecture STRUCTURE of hier_synchronizers_ldo is
  signal LOC_10M_OSC_SP7_ENABLE : STD_LOGIC;
  signal LOC_10M_OSC_SP7_ENABLE_i_1 : STD_LOGIC;
  signal \^mcu_main_clk_en\ : STD_LOGIC;
  signal MCU_MAIN_CLK_EN_1 : STD_LOGIC;
  signal SP7_AFE_VCXO_ENABLE : STD_LOGIC;
  signal SP7_AFE_VCXO_ENABLE_i_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal config_OCXO_EN_1 : STD_LOGIC;
  signal \^config_vctcxo_en\ : STD_LOGIC;
  signal config_VCTCXO_EN_1 : STD_LOGIC;
  signal config_VCXO_EN : STD_LOGIC;
  signal rst_10_1 : STD_LOGIC;
begin
  LOC_10M_OSC_SP7_ENABLE_i_1 <= LOC_10M_OSC_SP7_ENABLE_i;
  LOC_10M_OSC_SP7_ENABLE_syn <= LOC_10M_OSC_SP7_ENABLE;
  MCU_MAIN_CLK_EN_1 <= MCU_MAIN_CLK_EN;
  MCU_MAIN_CLK_EN_syn <= \^mcu_main_clk_en\;
  SP7_AFE_VCXO_ENABLE_i_1 <= SP7_AFE_VCXO_ENABLE_i;
  SP7_AFE_VCXO_ENABLE_syn <= SP7_AFE_VCXO_ENABLE;
  clk_1 <= clk10;
  config_OCXO_EN_1 <= config_OCXO_EN;
  config_VCTCXO_EN_1 <= config_VCTCXO_EN;
  config_VCTCXO_EN_syn <= \^config_vctcxo_en\;
  config_VCXO_EN_syn <= config_VCXO_EN;
  rst_10_1 <= rst_10;
hier_sync: entity work.hier_sync_ldo
     port map (
      D => MCU_MAIN_CLK_EN_1,
      Q => \^mcu_main_clk_en\,
      clk => clk_1,
      rst_10 => rst_10_1
    );
hier_sync1: entity work.hier_sync_ldo
     port map (
      D => LOC_10M_OSC_SP7_ENABLE_i_1,
      Q => LOC_10M_OSC_SP7_ENABLE,
      clk => clk_1,
      rst_10 => rst_10_1
    );
hier_sync2: entity work.hier_sync_ldo
     port map (
      D => SP7_AFE_VCXO_ENABLE_i_1,
      Q => SP7_AFE_VCXO_ENABLE,
      clk => clk_1,
      rst_10 => rst_10_1
    );
hier_sync3: entity work.hier_sync_ldo
     port map (
      D => config_OCXO_EN_1,
      Q => config_VCXO_EN,
      clk => clk_1,
      rst_10 => rst_10_1
    );
hier_sync4: entity work.hier_sync_ldo
     port map (
      D => config_VCTCXO_EN_1,
      Q => \^config_vctcxo_en\,
      clk => clk_1,
      rst_10 => rst_10_1
    );
end STRUCTURE;