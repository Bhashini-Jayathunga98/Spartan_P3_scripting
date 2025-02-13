library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_50MHz_OUT is
  port (
    SP7_KU_SPARE1N_CLKN_LVDS : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_ZU_SPARE1N_CLKN_LVDS : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk100 : in STD_LOGIC_VECTOR ( 0 to 0 );
    enable : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
end hier_50MHz_OUT;

architecture STRUCTURE of hier_50MHz_OUT is

  component sp7_cal3_util_ds_buf_0_1 is
  port (
    BUFGCE_I : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFGCE_CE : in STD_LOGIC_VECTOR ( 0 to 0 );
    BUFGCE_O : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_util_ds_buf_0_1;
  
  signal clk100_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal enable_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_ds_buf_0_BUFGCE_O : STD_LOGIC_VECTOR ( 0 to 0 );
  
begin

  SP7_KU_SPARE1N_CLKN_LVDS(0) <= util_ds_buf_0_BUFGCE_O(0);
  SP7_ZU_SPARE1N_CLKN_LVDS(0) <= util_ds_buf_0_BUFGCE_O(0);
  clk100_1(0) <= clk100(0);
  enable_1(0) <= enable(0);
  
util_ds_buf_0: component sp7_cal3_util_ds_buf_0_1
     port map (
      BUFGCE_CE(0) => enable_1(0),
      BUFGCE_I(0) => clk100_1(0),
      BUFGCE_O(0) => util_ds_buf_0_BUFGCE_O(0)
    );
    
end STRUCTURE;