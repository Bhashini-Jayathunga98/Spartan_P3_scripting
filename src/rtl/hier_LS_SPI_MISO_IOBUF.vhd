library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_LS_SPI_MISO_IOBUF is
  port (
    LS_SP7_SPI_CS1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    LS_SPI_MISO : inout STD_LOGIC;
    LS_SPI_MISO_I : in STD_LOGIC
  );
end hier_LS_SPI_MISO_IOBUF;

architecture STRUCTURE of hier_LS_SPI_MISO_IOBUF is

  component io_buf is
  port (
    IO : inout STD_LOGIC;
    O : out STD_LOGIC;
    I : in STD_LOGIC;
    T : in STD_LOGIC
  );
  end component;
  
  component sp7_cal3_util_ds_buf_0_2 is
  port (
    BUFG_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFG_O : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_util_ds_buf_0_2;
  
  signal LS_SP7_SPI_CS1_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal Net : STD_LOGIC;
  signal o_buft_0_O : STD_LOGIC;
  signal util_ds_buf_0_BUFG_O : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_io_buf_0_O_UNCONNECTED : STD_LOGIC;
  
begin

  LS_SP7_SPI_CS1_1(0) <= LS_SP7_SPI_CS1(0);
  o_buft_0_O <= LS_SPI_MISO_I;
  
io_buf_0: component io_buf
     port map (
      I => o_buft_0_O,
      IO => LS_SPI_MISO,
      O => NLW_io_buf_0_O_UNCONNECTED,
      T => util_ds_buf_0_BUFG_O(0)
    );
    
util_ds_buf_0: component sp7_cal3_util_ds_buf_0_2
     port map (
      BUFG_I(0) => LS_SP7_SPI_CS1_1(0),
      BUFG_O(0) => util_ds_buf_0_BUFG_O(0)
    );
    
end STRUCTURE;