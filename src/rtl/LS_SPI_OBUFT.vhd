library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity LS_SPI_OBUFT is
  port (
    LS_SPI_MISO : out STD_LOGIC;
    LS_SPI_MISO_I : in STD_LOGIC;
    board_power_done_inv : in STD_LOGIC
  );
end LS_SPI_OBUFT;

architecture STRUCTURE of LS_SPI_OBUFT is

  component o_buft is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC
  );
  end component o_buft;
  
  signal hier_CLK_PG_CLK_PWR_PG_inv : STD_LOGIC;
  signal hier_LS_SPI_LS_SPI_MISO : STD_LOGIC;
  signal o_buft_0_O : STD_LOGIC;
  
begin

  LS_SPI_MISO <= o_buft_0_O;
  hier_CLK_PG_CLK_PWR_PG_inv <= board_power_done_inv;
  hier_LS_SPI_LS_SPI_MISO <= LS_SPI_MISO_I;
  
o_buft_0: component o_buft
     port map (
      I => hier_LS_SPI_LS_SPI_MISO,
      O => o_buft_0_O,
      T => hier_CLK_PG_CLK_PWR_PG_inv
    );
    
end STRUCTURE;