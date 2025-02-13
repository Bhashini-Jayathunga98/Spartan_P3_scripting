library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_clock_measurments is
  port (
    SP7_10MHZ_LVDS_CLK_IN_N : in STD_LOGIC;
    SP7_10MHZ_LVDS_CLK_IN_P : in STD_LOGIC;
    SP7_AFE_VCXO_LVDS_CLK_IN_N : in STD_LOGIC;
    SP7_AFE_VCXO_LVDS_CLK_IN_P : in STD_LOGIC;
    clk50 : in STD_LOGIC;
    clk_10m : out STD_LOGIC_VECTOR ( 0 to 0 );
    ocxo_ld : out STD_LOGIC;
    rstn_50 : in STD_LOGIC;
    vcxo_ld : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end hier_clock_measurments;

architecture STRUCTURE of hier_clock_measurments is

  component sp7_cal3_clk_wiz_10_OCXO_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component sp7_cal3_clk_wiz_10_OCXO_0;
  
  component sp7_cal3_vio_clock_measures_0 is
  port (
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 25 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 25 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_vio_clock_measures_0;
  
  component clock_counter is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    trigger : in STD_LOGIC;
    clk_10Mhz : in STD_LOGIC;
    clk_4096Mhz : in STD_LOGIC;
    running_count_4096Mhz_o : out STD_LOGIC_VECTOR ( 25 downto 0 );
    running_count_10Mhz_o : out STD_LOGIC_VECTOR ( 25 downto 0 )
  );
  end component;
  
  component sp7_cal3_util_gnss_clk_buf_0_0 is
  port (
    IBUF_DS_P : in STD_LOGIC_VECTOR ( 0 to 0 );
    IBUF_DS_N : in STD_LOGIC_VECTOR ( 0 to 0 );
    IBUF_OUT : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_util_gnss_clk_buf_0_0;
  
  component sp7_cal3_util_ds_buf_0_0 is
  port (
    IBUF_DS_P : in STD_LOGIC_VECTOR ( 0 to 0 );
    IBUF_DS_N : in STD_LOGIC_VECTOR ( 0 to 0 );
    IBUF_OUT : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_util_ds_buf_0_0;
  
  signal SP7_10MHZ_LVDS_CLK_IN_N_1 : STD_LOGIC;
  signal SP7_10MHZ_LVDS_CLK_IN_P_1 : STD_LOGIC;
  signal SP7_AFE_VCXO_LVDS_CLK_IN_N_1 : STD_LOGIC;
  signal SP7_AFE_VCXO_LVDS_CLK_IN_P_1 : STD_LOGIC;
  signal clk_wiz_10_OCXO_locked : STD_LOGIC;
  signal clk_wiz_10_clk_out1 : STD_LOGIC;
  signal clock_counter_0_running_count_10Mhz_o : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal clock_counter_0_running_count_4096Mhz_o : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal mmcm_50Mhz_clk_50 : STD_LOGIC;
  signal rstn : STD_LOGIC;
  signal trigger : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_ds_buf_0_IBUF_OUT : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_ds_buf_0_IBUF_OUT1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_3_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  
begin

  SP7_10MHZ_LVDS_CLK_IN_N_1 <= SP7_10MHZ_LVDS_CLK_IN_N;
  SP7_10MHZ_LVDS_CLK_IN_P_1 <= SP7_10MHZ_LVDS_CLK_IN_P;
  SP7_AFE_VCXO_LVDS_CLK_IN_N_1 <= SP7_AFE_VCXO_LVDS_CLK_IN_N;
  SP7_AFE_VCXO_LVDS_CLK_IN_P_1 <= SP7_AFE_VCXO_LVDS_CLK_IN_P;
  clk_10m(0) <= util_ds_buf_0_IBUF_OUT(0);
  mmcm_50Mhz_clk_50 <= clk50;
  ocxo_ld <= clk_wiz_10_OCXO_locked;
  rstn <= rstn_50;
  vcxo_ld(0) <= xlconstant_3_dout(0);
  
clk_wiz_10_OCXO: component sp7_cal3_clk_wiz_10_OCXO_0
     port map (
      clk_in1 => util_ds_buf_0_IBUF_OUT(0),
      clk_out1 => clk_wiz_10_clk_out1,
      locked => clk_wiz_10_OCXO_locked
    );
    
clock_counter_0: component clock_counter
     port map (
      clk => mmcm_50Mhz_clk_50,
      clk_10Mhz => clk_wiz_10_clk_out1,
      clk_4096Mhz => util_ds_buf_0_IBUF_OUT1(0),
      rstn => rstn,
      running_count_10Mhz_o(25 downto 0) => clock_counter_0_running_count_10Mhz_o(25 downto 0),
      running_count_4096Mhz_o(25 downto 0) => clock_counter_0_running_count_4096Mhz_o(25 downto 0),
      trigger => trigger(0)
    );
    
util_ds_buf_0: component sp7_cal3_util_ds_buf_0_0
     port map (
      IBUF_DS_N(0) => SP7_AFE_VCXO_LVDS_CLK_IN_N_1,
      IBUF_DS_P(0) => SP7_AFE_VCXO_LVDS_CLK_IN_P_1,
      IBUF_OUT(0) => util_ds_buf_0_IBUF_OUT1(0)
    );
    
util_gnss_clk_buf_0: component sp7_cal3_util_gnss_clk_buf_0_0
     port map (
      IBUF_DS_N(0) => SP7_10MHZ_LVDS_CLK_IN_N_1,
      IBUF_DS_P(0) => SP7_10MHZ_LVDS_CLK_IN_P_1,
      IBUF_OUT(0) => util_ds_buf_0_IBUF_OUT(0)
    );
    
vio_clock_measures: component sp7_cal3_vio_clock_measures_0
     port map (
      clk => mmcm_50Mhz_clk_50,
      probe_in0(25 downto 0) => clock_counter_0_running_count_4096Mhz_o(25 downto 0),
      probe_in1(25 downto 0) => clock_counter_0_running_count_10Mhz_o(25 downto 0),
      probe_out0(0) => trigger(0)
    );
    
end STRUCTURE;