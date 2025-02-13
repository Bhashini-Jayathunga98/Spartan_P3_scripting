library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_pll_spi_obuft is
  port (
    MCU_SP7_PMCU_SPI_AFE_PLL_CS2_2V5_i : in STD_LOGIC;
    MCU_SP7_PMCU_SPI_DIG_PLL_CS1_2V5_i : in STD_LOGIC;
    SP7_AFE_PLL_SPI_CS1 : out STD_LOGIC;
    SP7_DIG_PLL_SPI_CS0 : out STD_LOGIC;
    SP7_PLL_SPI_CLK : out STD_LOGIC;
    SP7_PLL_SPI_CLK_I : in STD_LOGIC;
    SP7_PLL_SPI_SDIO : out STD_LOGIC;
    SP7_PLL_SPI_SDIO_i : in STD_LOGIC;
    board_pwr_done_inv : in STD_LOGIC
  );
end hier_pll_spi_obuft;

architecture STRUCTURE of hier_pll_spi_obuft is
  component o_buft is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC
  );
  end component;
 
  signal ClockPowerGood_0_CLK_PWR_PG_o : STD_LOGIC;
  signal I_1 : STD_LOGIC;
  signal MCU_PLL_SPI_0_SP7_PLL1_SPI_CS1 : STD_LOGIC;
  signal MCU_PLL_SPI_0_SP7_PLL4_SPI_CS : STD_LOGIC;
  signal MCU_PLL_SPI_0_SP7_PLL_SPI_CLK : STD_LOGIC;
  signal o_buft_0_O : STD_LOGIC;
  signal o_buft_4_O : STD_LOGIC;
  signal o_buft_6_O : STD_LOGIC;
  signal o_buft_7_O : STD_LOGIC;
  
begin

  ClockPowerGood_0_CLK_PWR_PG_o <= board_pwr_done_inv;
  I_1 <= SP7_PLL_SPI_SDIO_i;
  MCU_PLL_SPI_0_SP7_PLL1_SPI_CS1 <= MCU_SP7_PMCU_SPI_AFE_PLL_CS2_2V5_i;
  MCU_PLL_SPI_0_SP7_PLL4_SPI_CS <= MCU_SP7_PMCU_SPI_DIG_PLL_CS1_2V5_i;
  MCU_PLL_SPI_0_SP7_PLL_SPI_CLK <= SP7_PLL_SPI_CLK_I;
  SP7_AFE_PLL_SPI_CS1 <= o_buft_0_O;
  SP7_DIG_PLL_SPI_CS0 <= o_buft_4_O;
  SP7_PLL_SPI_CLK <= o_buft_6_O;
  SP7_PLL_SPI_SDIO <= o_buft_7_O;
  
o_buft_0: component o_buft
     port map (
      I => MCU_PLL_SPI_0_SP7_PLL1_SPI_CS1,
      O => o_buft_0_O,
      T => ClockPowerGood_0_CLK_PWR_PG_o
    );
o_buft_4: component o_buft
     port map (
      I => MCU_PLL_SPI_0_SP7_PLL4_SPI_CS,
      O => o_buft_4_O,
      T => ClockPowerGood_0_CLK_PWR_PG_o
    );
o_buft_6: component o_buft
     port map (
      I => MCU_PLL_SPI_0_SP7_PLL_SPI_CLK,
      O => o_buft_6_O,
      T => ClockPowerGood_0_CLK_PWR_PG_o
    );
o_buft_7: component o_buft
     port map (
      I => I_1,
      O => o_buft_7_O,
      T => ClockPowerGood_0_CLK_PWR_PG_o
    );
end STRUCTURE;