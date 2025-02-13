library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity pll_obut is
  port (
    AFEPLL_CLKSEL : out STD_LOGIC;
    AFEPLL_CLKSEL_i : in STD_LOGIC;
    DIGPLL_CLKSEL : out STD_LOGIC;
    DIGPLL_CLKSEL_i : in STD_LOGIC;
    SP7_AFEPLL_RESETB : out STD_LOGIC;
    SP7_AFEPLL_RESETB_i : in STD_LOGIC;
    SP7_AFEPLL_SYNC : out STD_LOGIC;
    SP7_AFEPLL_SYNC_i : in STD_LOGIC;
    SP7_DIGPLL_RESETB : out STD_LOGIC;
    SP7_DIGPLL_RESETB_i : in STD_LOGIC;
    SP7_DIGPLL_SYNC : out STD_LOGIC;
    SP7_DIGPLL_SYNC_i : in STD_LOGIC;
    board_power_done_inv : in STD_LOGIC
  );
end pll_obut;

architecture STRUCTURE of pll_obut is
  component o_buft is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC
  );
  end component ;
 
  signal I2_1 : STD_LOGIC;
  signal I3_1 : STD_LOGIC;
  signal I3_2 : STD_LOGIC;
  signal I_2 : STD_LOGIC;
  signal T_1 : STD_LOGIC;
  signal hier_pll_AFE_PLL3_CLKSEL0 : STD_LOGIC;
  signal hier_pll_FPGA_PLL2_CLKSEL1 : STD_LOGIC;
  signal o_buft_11_O : STD_LOGIC;
  signal o_buft_2_O : STD_LOGIC;
  signal o_buft_4_O : STD_LOGIC;
  signal o_buft_6_O : STD_LOGIC;
  signal o_buft_8_O : STD_LOGIC;
  signal o_buft_9_O : STD_LOGIC; 
  
begin

  AFEPLL_CLKSEL <= o_buft_2_O;
  DIGPLL_CLKSEL <= o_buft_4_O;
  I2_1 <= SP7_DIGPLL_RESETB_i;
  I3_1 <= SP7_AFEPLL_RESETB_i;
  I3_2 <= SP7_AFEPLL_SYNC_i;
  I_2 <= SP7_DIGPLL_SYNC_i;
  SP7_AFEPLL_RESETB <= o_buft_8_O;
  SP7_AFEPLL_SYNC <= o_buft_11_O;
  SP7_DIGPLL_RESETB <= o_buft_6_O;
  SP7_DIGPLL_SYNC <= o_buft_9_O;
  T_1 <= board_power_done_inv;
  hier_pll_AFE_PLL3_CLKSEL0 <= AFEPLL_CLKSEL_i;
  hier_pll_FPGA_PLL2_CLKSEL1 <= DIGPLL_CLKSEL_i;
  
o_buft_11: component o_buft
     port map (
      I => I3_2,
      O => o_buft_11_O,
      T => T_1
    );
o_buft_2: component o_buft
     port map (
      I => hier_pll_AFE_PLL3_CLKSEL0,
      O => o_buft_2_O,
      T => T_1
    );
o_buft_4: component o_buft
     port map (
      I => hier_pll_FPGA_PLL2_CLKSEL1,
      O => o_buft_4_O,
      T => T_1
    );
o_buft_6: component o_buft
     port map (
      I => I2_1,
      O => o_buft_6_O,
      T => T_1
    );
o_buft_8: component o_buft
     port map (
      I => I3_1,
      O => o_buft_8_O,
      T => T_1
    );
o_buft_9: component o_buft
     port map (
      I => I_2,
      O => o_buft_9_O,
      T => T_1
    );
end STRUCTURE;