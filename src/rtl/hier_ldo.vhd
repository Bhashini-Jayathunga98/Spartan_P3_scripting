library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_ldo is
  port (
    LOC_10M_OSC_SP7_ENABLE1 : out STD_LOGIC;
    LOC_10M_OSC_SP7_ENABLE_i : in STD_LOGIC;
    MCU_MAIN_CLK_EN : in STD_LOGIC;
    OCXO_3V3_EN : out STD_LOGIC;
    OCXO_CLK_BUF_ENB : out STD_LOGIC;
    SP7_AFE_VCXO_ENABLE : out STD_LOGIC;
    SP7_AFE_VCXO_ENABLE_i : in STD_LOGIC;
    clk10 : in STD_LOGIC;
    config_OCXO_EN : in STD_LOGIC;
    config_VCTCXO_EN : in STD_LOGIC;
    rst_10 : in STD_LOGIC;
    rstn_10 : in STD_LOGIC
  );
end hier_ldo;

architecture STRUCTURE of hier_ldo is

  component sp7_cal3_vio_clk_pwr_enable_0 is
  port (
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in6 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_vio_clk_pwr_enable_0;
  
  component ldo_enable is
  port (
    clk : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    mcu_main_clk_en_i : in STD_LOGIC;
    config_ocxo_i : in STD_LOGIC;
    config_vctcxo_i : in STD_LOGIC;
    ocxo_3v3_en_o : out STD_LOGIC;
    vctcxo_3v3_en_o : out STD_LOGIC;
    STA_REG_o : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );
  end component;
  
  signal LOC_10M_OSC_SP7_ENABLE : STD_LOGIC;
  signal LOC_10M_OSC_SP7_ENABLE_i_1 : STD_LOGIC;
  signal \^mcu_main_clk_en\ : STD_LOGIC;
  signal MCU_MAIN_CLK_EN_1 : STD_LOGIC;
  signal \^sp7_afe_vcxo_enable\ : STD_LOGIC;
  signal SP7_AFE_VCXO_ENABLE_i_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal config_OCXO_EN_1 : STD_LOGIC;
  signal \^config_vctcxo_en\ : STD_LOGIC;
  signal config_VCTCXO_EN_1 : STD_LOGIC;
  signal config_VCXO_EN : STD_LOGIC;
  signal hier_clken_LOC_10M_OSC_SP7_ENABLE : STD_LOGIC;
  signal hier_clken_OCXO_CLK_BUF_ENB : STD_LOGIC;
  signal hier_clken_SP7_AFE_VCXO_ENABLE : STD_LOGIC;
  signal \^ocxo_3v3_en\ : STD_LOGIC;
  signal rst_10_1 : STD_LOGIC;
  signal rst_n : STD_LOGIC;
  signal vctcxo_3v3_en : STD_LOGIC;
  signal NLW_clk_pwr_enable_STA_REG_o_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_hier_clken_VCTCXO_BUFFER_SP7_ENB_UNCONNECTED : STD_LOGIC;
  
begin

  LOC_10M_OSC_SP7_ENABLE1 <= hier_clken_LOC_10M_OSC_SP7_ENABLE;
  LOC_10M_OSC_SP7_ENABLE_i_1 <= LOC_10M_OSC_SP7_ENABLE_i;
  MCU_MAIN_CLK_EN_1 <= MCU_MAIN_CLK_EN;
  OCXO_3V3_EN <= \^ocxo_3v3_en\;
  OCXO_CLK_BUF_ENB <= hier_clken_OCXO_CLK_BUF_ENB;
  SP7_AFE_VCXO_ENABLE <= hier_clken_SP7_AFE_VCXO_ENABLE;
  SP7_AFE_VCXO_ENABLE_i_1 <= SP7_AFE_VCXO_ENABLE_i;
  clk_1 <= clk10;
  config_OCXO_EN_1 <= config_OCXO_EN;
  config_VCTCXO_EN_1 <= config_VCTCXO_EN;
  rst_10_1 <= rst_10;
  rst_n <= rstn_10;
  
clk_pwr_enable: component ldo_enable
     port map (
      STA_REG_o(1 downto 0) => NLW_clk_pwr_enable_STA_REG_o_UNCONNECTED(1 downto 0),
      clk => clk_1,
      config_ocxo_i => config_VCXO_EN,
      config_vctcxo_i => \^config_vctcxo_en\,
      mcu_main_clk_en_i => \^mcu_main_clk_en\,
      ocxo_3v3_en_o => \^ocxo_3v3_en\,
      rst_n => rst_n,
      vctcxo_3v3_en_o => vctcxo_3v3_en
    );
    
hier_clken: entity work.hier_clken
     port map (
      LOC_10M_OSC_SP7_ENABLE => hier_clken_LOC_10M_OSC_SP7_ENABLE,
      LOC_10M_OSC_SP7_ENABLE_i => LOC_10M_OSC_SP7_ENABLE,
      OCXO_CLK_BUF_ENB => hier_clken_OCXO_CLK_BUF_ENB,
      Op1(0) => \^mcu_main_clk_en\,
      SP7_AFE_VCXO_ENABLE => hier_clken_SP7_AFE_VCXO_ENABLE,
      SP7_AFE_VCXO_ENABLE_i => \^sp7_afe_vcxo_enable\,
      VCTCXO_BUFFER_SP7_ENB => NLW_hier_clken_VCTCXO_BUFFER_SP7_ENB_UNCONNECTED,
      clk_10 => clk_1,
      rst_10 => rst_10_1
    );
    
hier_synchronizers: entity work.hier_synchronizers_ldo
     port map (
      LOC_10M_OSC_SP7_ENABLE_i => LOC_10M_OSC_SP7_ENABLE_i_1,
      LOC_10M_OSC_SP7_ENABLE_syn => LOC_10M_OSC_SP7_ENABLE,
      MCU_MAIN_CLK_EN => MCU_MAIN_CLK_EN_1,
      MCU_MAIN_CLK_EN_syn => \^mcu_main_clk_en\,
      SP7_AFE_VCXO_ENABLE_i => SP7_AFE_VCXO_ENABLE_i_1,
      SP7_AFE_VCXO_ENABLE_syn => \^sp7_afe_vcxo_enable\,
      clk10 => clk_1,
      config_OCXO_EN => config_OCXO_EN_1,
      config_VCTCXO_EN => config_VCTCXO_EN_1,
      config_VCTCXO_EN_syn => \^config_vctcxo_en\,
      config_VCXO_EN_syn => config_VCXO_EN,
      rst_10 => rst_10_1
    );
    
vio_clk_pwr_enable: component sp7_cal3_vio_clk_pwr_enable_0
     port map (
      clk => clk_1,
      probe_in0(0) => \^mcu_main_clk_en\,
      probe_in1(0) => rst_n,
      probe_in2(0) => config_VCXO_EN,
      probe_in3(0) => \^config_vctcxo_en\,
      probe_in4(0) => \^ocxo_3v3_en\,
      probe_in5(0) => vctcxo_3v3_en,
      probe_in6(0) => rst_10_1
    );
    
end STRUCTURE;