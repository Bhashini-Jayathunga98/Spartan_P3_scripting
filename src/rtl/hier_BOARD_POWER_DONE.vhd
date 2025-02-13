library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_BOARD_POWER_DONE is
  port (
    MCU_OCXO_CLK_BUF_EN : in STD_LOGIC_VECTOR ( 0 to 0 );
    board_power_done : out STD_LOGIC;
    board_power_done_inv : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk50 : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end hier_BOARD_POWER_DONE;

architecture STRUCTURE of hier_BOARD_POWER_DONE is

  component utility_dff is
  port (
    Q : out STD_LOGIC;
    C : in STD_LOGIC;
    CE : in STD_LOGIC;
    D : in STD_LOGIC;
    R : in STD_LOGIC
  );
  end component;
  
  signal MCU_OCXO_CLK_BUF_EN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^board_power_done\ : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal rst_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal utility_dff_0_Q : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  
begin

  MCU_OCXO_CLK_BUF_EN_1(0) <= MCU_OCXO_CLK_BUF_EN(0);
  board_power_done <= \^board_power_done\;
  board_power_done_inv(0) <= util_vector_logic_0_Res(0);
  clk_1 <= clk50;
  rst_1 <= rst;
  
    
util_vector_logic_0_Res(0) <= NOT \^board_power_done\;
    
utility_dff_0: component utility_dff
     port map (
      C => clk_1,
      CE => xlconstant_0_dout(0),
      D => MCU_OCXO_CLK_BUF_EN_1(0),
      Q => utility_dff_0_Q,
      R => rst_1
    );
    
utility_dff_1: component utility_dff
     port map (
      C => clk_1,
      CE => xlconstant_0_dout(0),
      D => utility_dff_0_Q,
      Q => \^board_power_done\,
      R => rst_1
    );

end STRUCTURE;