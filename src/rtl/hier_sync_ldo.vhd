library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hier_sync_ldo is
  port (
    D : in STD_LOGIC;
    Q : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst_10 : in STD_LOGIC
  );
end hier_sync_ldo;

architecture STRUCTURE of hier_sync_ldo is

  component utility_dff is
  port (
    Q : out STD_LOGIC;
    C : in STD_LOGIC;
    CE : in STD_LOGIC;
    D : in STD_LOGIC;
    R : in STD_LOGIC
  );
  end component;

  signal D_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal rst_10_1 : STD_LOGIC;
  signal utility_dff_0_Q : STD_LOGIC;
  signal utility_dff_1_Q : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  
begin

  D_1 <= D;
  Q <= utility_dff_0_Q;
  clk_1 <= clk;
  rst_10_1 <= rst_10;
  
utility_dff_0: component utility_dff
     port map (
      C => clk_1,
      CE => xlconstant_0_dout(0),
      D => utility_dff_1_Q,
      Q => utility_dff_0_Q,
      R => rst_10_1
    );
utility_dff_1: component utility_dff
     port map (
      C => clk_1,
      CE => xlconstant_0_dout(0),
      D => D_1,
      Q => utility_dff_1_Q,
      R => rst_10_1
    );

end STRUCTURE;