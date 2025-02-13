library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_clken is
  port (
    LOC_10M_OSC_SP7_ENABLE : out STD_LOGIC;
    LOC_10M_OSC_SP7_ENABLE_i : in STD_LOGIC;
    OCXO_CLK_BUF_ENB : out STD_LOGIC;
    Op1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AFE_VCXO_ENABLE : out STD_LOGIC;
    SP7_AFE_VCXO_ENABLE_i : in STD_LOGIC;
    VCTCXO_BUFFER_SP7_ENB : out STD_LOGIC;
    clk_10 : in STD_LOGIC;
    rst_10 : in STD_LOGIC
  );
end hier_clken;

architecture STRUCTURE of hier_clken is

  signal LOC_10M_OSC_SP7_ENABLE_inv_ff : STD_LOGIC;
  signal Op1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clk_i_1 : STD_LOGIC;
  signal hier_clken_obuft_LOC_10M_OSC_SP7_ENABLE : STD_LOGIC;
  signal hier_clken_obuft_OCXO_CLK_BUF_ENB : STD_LOGIC;
  signal hier_clken_obuft_SP7_AFE_VCXO_ENABLE : STD_LOGIC;
  signal hier_clken_obuft_VCTCXO_BUFFER_SP7_ENB : STD_LOGIC;
  signal hier_delayer_SP7_AFE_VCXO_ENABLE_inv_ff : STD_LOGIC;
  signal rst_10_1 : STD_LOGIC;
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  
begin

  LOC_10M_OSC_SP7_ENABLE <= hier_clken_obuft_LOC_10M_OSC_SP7_ENABLE;
  OCXO_CLK_BUF_ENB <= hier_clken_obuft_OCXO_CLK_BUF_ENB;
  Op1_1(0) <= Op1(0);
  SP7_AFE_VCXO_ENABLE <= hier_clken_obuft_SP7_AFE_VCXO_ENABLE;
  VCTCXO_BUFFER_SP7_ENB <= hier_clken_obuft_VCTCXO_BUFFER_SP7_ENB;
  clk_i_1 <= clk_10;
  rst_10_1 <= rst_10;
  
hier_clken_obuft: entity work.hier_clken_obuft
     port map (
      LOC_10M_OSC_SP7_ENABLE => hier_clken_obuft_LOC_10M_OSC_SP7_ENABLE,
      LOC_10M_OSC_SP7_ENABLE_i => LOC_10M_OSC_SP7_ENABLE_i,
      LOC_10M_OSC_SP7_ENABLE_inv => LOC_10M_OSC_SP7_ENABLE_inv_ff,
      OCXO_CLK_BUF_ENB => hier_clken_obuft_OCXO_CLK_BUF_ENB,
      SP7_AFE_VCXO_ENABLE => hier_clken_obuft_SP7_AFE_VCXO_ENABLE,
      SP7_AFE_VCXO_ENABLE_i => SP7_AFE_VCXO_ENABLE_i,
      SP7_AFE_VCXO_ENABLE_inv => hier_delayer_SP7_AFE_VCXO_ENABLE_inv_ff,
      VCTCXO_BUFFER_SP7_ENB => hier_clken_obuft_VCTCXO_BUFFER_SP7_ENB,
      main_clk_en_inv => util_vector_logic_2_Res(0)
    );
    
hier_delayer: entity work.hier_delayer
     port map (
      LOC_10M_OSC_SP7_ENABLE_i(0) => LOC_10M_OSC_SP7_ENABLE_i,
      LOC_10M_OSC_SP7_ENABLE_inv_ff => LOC_10M_OSC_SP7_ENABLE_inv_ff,
      SP7_AFE_VCXO_ENABLE_i(0) => SP7_AFE_VCXO_ENABLE_i,
      SP7_AFE_VCXO_ENABLE_inv_ff => hier_delayer_SP7_AFE_VCXO_ENABLE_inv_ff,
      clk_10 => clk_i_1,
      rst_10 => rst_10_1
    );
   
util_vector_logic_2_Res(0) <= NOT Op1_1(0);

end STRUCTURE;