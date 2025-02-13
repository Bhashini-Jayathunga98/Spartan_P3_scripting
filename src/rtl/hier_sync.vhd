library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_sync is
  port (
    D : in STD_LOGIC;
    Q : out STD_LOGIC;
    clk : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end hier_sync;

architecture STRUCTURE of hier_sync is

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
  signal Net : STD_LOGIC;
  signal Net1 : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  signal Net2 : STD_LOGIC;
  signal utility_dff_1_Q : STD_LOGIC;
  signal utility_dff_2_Q : STD_LOGIC;
  
begin

  D_1 <= D;
  Net <= clk;
  Net2 <= rst;
  Q <= utility_dff_2_Q;
  
utility_dff_1: component utility_dff
     port map (
      C => Net,
      CE => Net1(0),
      D => D_1,
      Q => utility_dff_1_Q,
      R => Net2
    );
utility_dff_2: component utility_dff
     port map (
      C => Net,
      CE => Net1(0),
      D => utility_dff_1_Q,
      Q => utility_dff_2_Q,
      R => Net2
    );

end STRUCTURE;