library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_CLK_PG is
  port (
    CLK_PWR_PG : out STD_LOGIC;
    CLK_PWR_PG_inv : out STD_LOGIC_VECTOR ( 0 to 0 );
    P1_P2_P3_P4_O_V_OLD_VLD : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SP7_3V3_AFEPLL_PG : in STD_LOGIC;
    SP7_3V3_DIGPLL_PG : in STD_LOGIC;
    SP7_3V3_OCXO_PG : in STD_LOGIC;
    SP7_3V3_VCXO_PG : in STD_LOGIC;
    clk_50mhz : in STD_LOGIC;
    config_OCXO_EN : in STD_LOGIC_VECTOR ( 0 to 0 );
    config_VCXO_EN : in STD_LOGIC_VECTOR ( 0 to 0 );
    locked_ocxo : in STD_LOGIC_VECTOR ( 0 to 0 );
    locked_vctcxo : in STD_LOGIC_VECTOR ( 0 to 0 );
    rstn_50mhz : in STD_LOGIC
  );
end hier_CLK_PG;

architecture STRUCTURE of hier_CLK_PG is

  component ClockPowerGood is
  port (
    CONFIG_OCXO_VCTCXO_i : in STD_LOGIC_VECTOR ( 1 downto 0 );
    PLL1_3V3_PG_i : in STD_LOGIC;
    PLL2_3V3_PG_i : in STD_LOGIC;
    PLL3_3V3_PG_i : in STD_LOGIC;
    PLL4_3V3_PG_i : in STD_LOGIC;
    OCXO_3V3_PG_i : in STD_LOGIC;
    VCTCXO_3V3_PG_i : in STD_LOGIC;
    ocxo_clk_ld_i : in STD_LOGIC;
    vctcxo_clk_ld_i : in STD_LOGIC;
    PLL1_3V3_PG_o : out STD_LOGIC;
    PLL2_3V3_PG_o : out STD_LOGIC;
    PLL3_3V3_PG_o : out STD_LOGIC;
    PLL4_3V3_PG_o : out STD_LOGIC;
    OCXO_3V3_PG_o : out STD_LOGIC;
    VCTCXO_3V3_PG_o : out STD_LOGIC;
    ocxo_clk_ld_o : out STD_LOGIC;
    vctcxo_clk_ld_o : out STD_LOGIC;
    clk_50mhz : in STD_LOGIC;
    rstn_50mhz : in STD_LOGIC;
    CLK_PWR_PG_o : out STD_LOGIC;
    STA_REG_o : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component;
  

  signal \^clk_pwr_pg\ : STD_LOGIC;
  signal ClockPowerGood_0_OCXO_3V3_PG_o : STD_LOGIC;
  signal ClockPowerGood_0_PLL2_3V3_PG_o : STD_LOGIC;
  signal ClockPowerGood_0_PLL3_3V3_PG_o : STD_LOGIC;
  signal ClockPowerGood_0_PLL4_3V3_PG_o : STD_LOGIC;
  signal ClockPowerGood_0_SP7_3V3_DIGPLL_PG_o : STD_LOGIC;
  signal ClockPowerGood_0_VCTCXO_3V3_PG_o : STD_LOGIC;
  signal ClockPowerGood_0_ocxo_clk_ld_o : STD_LOGIC;
  signal ClockPowerGood_0_vctcxo_clk_ld_o : STD_LOGIC;
  signal OCXO_3V3_PG : STD_LOGIC;
  signal PLL2_3V3_PG : STD_LOGIC;
  signal VCTCXO_3V3_PG : STD_LOGIC;
  signal VIO_VCXO_EN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal config_ocxo_vctcxo : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hier_0_vio_VCTCXO_EN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal locked_ocxo_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal locked_vctcxo_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mmcm_50Mhz_clk_50 : STD_LOGIC;
  signal rstn : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  signal NLW_ClockPowerGood_0_STA_REG_o_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  
begin

  CLK_PWR_PG <= \^clk_pwr_pg\;
  CLK_PWR_PG_inv(0) <= util_vector_logic_0_Res(0);
  OCXO_3V3_PG <= SP7_3V3_OCXO_PG;
  P1_P2_P3_P4_O_V_OLD_VLD(7 downto 0) <= xlconcat_1_dout(7 downto 0);
  PLL2_3V3_PG <= SP7_3V3_AFEPLL_PG;
  VCTCXO_3V3_PG <= SP7_3V3_VCXO_PG;
  VIO_VCXO_EN_1(0) <= config_OCXO_EN(0);
  hier_0_vio_VCTCXO_EN(0) <= config_VCXO_EN(0);
  locked_ocxo_1(0) <= locked_ocxo(0);
  locked_vctcxo_1(0) <= locked_vctcxo(0);
  mmcm_50Mhz_clk_50 <= clk_50mhz;
  rstn <= rstn_50mhz;
  
ClockPowerGood_0: component ClockPowerGood
     port map (
      CLK_PWR_PG_o => \^clk_pwr_pg\,
      CONFIG_OCXO_VCTCXO_i(1 downto 0) => config_ocxo_vctcxo(1 downto 0),
      OCXO_3V3_PG_i => OCXO_3V3_PG,
      OCXO_3V3_PG_o => ClockPowerGood_0_OCXO_3V3_PG_o,
      PLL1_3V3_PG_i => SP7_3V3_DIGPLL_PG,
      PLL1_3V3_PG_o => ClockPowerGood_0_SP7_3V3_DIGPLL_PG_o,
      PLL2_3V3_PG_i => PLL2_3V3_PG,
      PLL2_3V3_PG_o => ClockPowerGood_0_PLL2_3V3_PG_o,
      PLL3_3V3_PG_i => xlconstant_0_dout(0),
      PLL3_3V3_PG_o => ClockPowerGood_0_PLL3_3V3_PG_o,
      PLL4_3V3_PG_i => xlconstant_0_dout(0),
      PLL4_3V3_PG_o => ClockPowerGood_0_PLL4_3V3_PG_o,
      STA_REG_o(7 downto 0) => NLW_ClockPowerGood_0_STA_REG_o_UNCONNECTED(7 downto 0),
      VCTCXO_3V3_PG_i => VCTCXO_3V3_PG,
      VCTCXO_3V3_PG_o => ClockPowerGood_0_VCTCXO_3V3_PG_o,
      clk_50mhz => mmcm_50Mhz_clk_50,
      ocxo_clk_ld_i => locked_ocxo_1(0),
      ocxo_clk_ld_o => ClockPowerGood_0_ocxo_clk_ld_o,
      rstn_50mhz => rstn,
      vctcxo_clk_ld_i => locked_vctcxo_1(0),
      vctcxo_clk_ld_o => ClockPowerGood_0_vctcxo_clk_ld_o
    );
    
util_vector_logic_0_Res(0) <= NOT \^clk_pwr_pg\;
    
config_ocxo_vctcxo(1 downto 0) <= VIO_VCXO_EN_1(0) & hier_0_vio_VCTCXO_EN(0);

xlconcat_1_dout(7 downto 0) <= 
    ClockPowerGood_0_vctcxo_clk_ld_o & 
    ClockPowerGood_0_ocxo_clk_ld_o & 
    ClockPowerGood_0_VCTCXO_3V3_PG_o & 
    ClockPowerGood_0_OCXO_3V3_PG_o & 
    ClockPowerGood_0_PLL4_3V3_PG_o & 
    ClockPowerGood_0_PLL3_3V3_PG_o & 
    ClockPowerGood_0_PLL2_3V3_PG_o & 
    ClockPowerGood_0_SP7_3V3_DIGPLL_PG_o;
   
end STRUCTURE;