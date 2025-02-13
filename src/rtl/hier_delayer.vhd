library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_delayer is
  port (
    LOC_10M_OSC_SP7_ENABLE_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    LOC_10M_OSC_SP7_ENABLE_inv_ff : out STD_LOGIC;
    SP7_AFE_VCXO_ENABLE_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AFE_VCXO_ENABLE_inv_ff : out STD_LOGIC;
    clk_10 : in STD_LOGIC;
    rst_10 : in STD_LOGIC
  );
end hier_delayer;

architecture STRUCTURE of hier_delayer is

  component utility_dff is
  port (
    Q : out STD_LOGIC;
    C : in STD_LOGIC;
    CE : in STD_LOGIC;
    D : in STD_LOGIC;
    R : in STD_LOGIC
  );
  end component;

  signal LOC_10M_OSC_SP7_ENABLE_i_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SP7_AFE_VCXO_ENABLE_i_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clk_i_1 : STD_LOGIC;
  signal rst_10_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal utility_dff_0_Q : STD_LOGIC;
  signal utility_dff_1_Q : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  
begin

  LOC_10M_OSC_SP7_ENABLE_i_1(0) <= LOC_10M_OSC_SP7_ENABLE_i(0);
  LOC_10M_OSC_SP7_ENABLE_inv_ff <= utility_dff_0_Q;
  SP7_AFE_VCXO_ENABLE_i_1(0) <= SP7_AFE_VCXO_ENABLE_i(0);
  SP7_AFE_VCXO_ENABLE_inv_ff <= utility_dff_1_Q;
  clk_i_1 <= clk_10;
  rst_10_1 <= rst_10;

util_vector_logic_0_Res(0) <= NOT LOC_10M_OSC_SP7_ENABLE_i_1(0);

util_vector_logic_1_Res(0) <= NOT SP7_AFE_VCXO_ENABLE_i_1(0);

utility_dff_0: component utility_dff
     port map (
      C => clk_i_1,
      CE => xlconstant_0_dout(0),
      D => util_vector_logic_0_Res(0),
      Q => utility_dff_0_Q,
      R => rst_10_1
    );
    
utility_dff_1: component utility_dff
     port map (
      C => clk_i_1,
      CE => xlconstant_0_dout(0),
      D => util_vector_logic_1_Res(0),
      Q => utility_dff_1_Q,
      R => rst_10_1
    );

end STRUCTURE;