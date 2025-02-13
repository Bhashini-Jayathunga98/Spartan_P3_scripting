library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity DMCU_SPI_OBUFT is
  port (
    DMCU_SP7_ZU_SPI_MISO : out STD_LOGIC;
    I : in STD_LOGIC;
    T : in STD_LOGIC
  );
end DMCU_SPI_OBUFT;

architecture STRUCTURE of DMCU_SPI_OBUFT is

  component o_buft is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC
  );
  end component o_buft;
  
  signal I_1 : STD_LOGIC;
  signal T_1 : STD_LOGIC;
  signal o_buft_0_O : STD_LOGIC;
  
begin

  DMCU_SP7_ZU_SPI_MISO <= o_buft_0_O;
  I_1 <= I;
  T_1 <= T;
  
o_buft_0: component o_buft
     port map (
      I => I_1,
      O => o_buft_0_O,
      T => T_1
    );
    
end STRUCTURE;