library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_clken_obuft is
  port (
    LOC_10M_OSC_SP7_ENABLE : out STD_LOGIC;
    LOC_10M_OSC_SP7_ENABLE_i : in STD_LOGIC;
    LOC_10M_OSC_SP7_ENABLE_inv : in STD_LOGIC;
    OCXO_CLK_BUF_ENB : out STD_LOGIC;
    SP7_AFE_VCXO_ENABLE : out STD_LOGIC;
    SP7_AFE_VCXO_ENABLE_i : in STD_LOGIC;
    SP7_AFE_VCXO_ENABLE_inv : in STD_LOGIC;
    VCTCXO_BUFFER_SP7_ENB : out STD_LOGIC;
    main_clk_en_inv : in STD_LOGIC
  );
end hier_clken_obuft;

architecture STRUCTURE of hier_clken_obuft is
  component o_buft is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC
  );
  end component;
 
  signal LOC_10M_OSC_SP7_ENABLE_inv_r : STD_LOGIC;
  signal SP7_AFE_VCXO_ENABLE_inv_r : STD_LOGIC;
  signal o_buft_3_O1 : STD_LOGIC;
  signal o_buft_4_O1 : STD_LOGIC;
  signal o_buft_5_O : STD_LOGIC;
  signal o_buft_6_O : STD_LOGIC;
  
begin

  LOC_10M_OSC_SP7_ENABLE <= o_buft_3_O1;
  LOC_10M_OSC_SP7_ENABLE_inv_r <= LOC_10M_OSC_SP7_ENABLE_inv;
  OCXO_CLK_BUF_ENB <= o_buft_5_O;
  SP7_AFE_VCXO_ENABLE <= o_buft_4_O1;
  SP7_AFE_VCXO_ENABLE_inv_r <= SP7_AFE_VCXO_ENABLE_inv;
  VCTCXO_BUFFER_SP7_ENB <= o_buft_6_O;
  
o_buft_3: component o_buft
     port map (
      I => LOC_10M_OSC_SP7_ENABLE_i,
      O => o_buft_3_O1,
      T => main_clk_en_inv
    );
    
o_buft_4: component o_buft
     port map (
      I => SP7_AFE_VCXO_ENABLE_i,
      O => o_buft_4_O1,
      T => main_clk_en_inv
    );
    
o_buft_5: component o_buft
     port map (
      I => LOC_10M_OSC_SP7_ENABLE_inv_r,
      O => o_buft_5_O,
      T => main_clk_en_inv
    );
    
o_buft_6: component o_buft
     port map (
      I => SP7_AFE_VCXO_ENABLE_inv_r,
      O => o_buft_6_O,
      T => main_clk_en_inv
    );
    
end STRUCTURE;