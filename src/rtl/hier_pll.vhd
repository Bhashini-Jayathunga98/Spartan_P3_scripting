library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity hier_pll is
  port (
    AFEPLL_CLKSEL : out STD_LOGIC_VECTOR ( 0 to 0 );
    AFE_PLL3_LOCK_STAT : in STD_LOGIC;
    DIGPLL_CLKSEL : out STD_LOGIC_VECTOR ( 0 to 0 );
    DIGPLL_LOCK_STAT : in STD_LOGIC;
    MCU_PLL_RESETB : in STD_LOGIC;
    MCU_PLL_SYNC : in STD_LOGIC;
    SP7_AFEPLL_RESETB : out STD_LOGIC;
    SP7_AFEPLL_SYNC : out STD_LOGIC;
    SP7_DIGPLL_RESETB : out STD_LOGIC;
    SP7_DIGPLL_SYNC : out STD_LOGIC;
    SP7_PLL_STATUS : out STD_LOGIC;
    STA_REG_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_50mhz : in STD_LOGIC;
    clk_lkd : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_pwr_pg_i : in STD_LOGIC;
    rstn_50mhz : in STD_LOGIC
  );
end hier_pll;

architecture STRUCTURE of hier_pll is

  component sp7_cal3_vio_PLL_config_0 is
  port (
    clk : in STD_LOGIC;
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_vio_PLL_config_0;
  
  component PLL_lock_stat is
  port (
    clk_50mhz : in STD_LOGIC;
    rstn_50mhz : in STD_LOGIC;
    LS_PLL1_LOCK_STAT : in STD_LOGIC;
    FPGA_PLL2_LOCK_STAT : in STD_LOGIC;
    AFE_PLL3_LOCK_STAT : in STD_LOGIC;
    SP7_PLL4_SPI_SDO_MUXOUT_2V5 : in STD_LOGIC;
    SP7_PLL_STATUS : out STD_LOGIC;
    STA_REG_o : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component;
  
  component PLLSync is
  port (
    MCU_PLL_SYNC_i : in STD_LOGIC;
    clk_50mhz : in STD_LOGIC;
    rstn_50mhz : in STD_LOGIC;
    LS_PLL1_SYNC_o : out STD_LOGIC;
    FPGA_PLL2_SYNC_o : out STD_LOGIC;
    AFE_PLL3_SYNC_o : out STD_LOGIC;
    SYNTH_PLL4_SYNC_o : out STD_LOGIC
  );
  end component;
  
  component PLL_reset is
  port (
    clk_50mhz : in STD_LOGIC;
    rstn_50mhz : in STD_LOGIC;
    MCU_PLL_RESETB : in STD_LOGIC;
    SP7_LS_PLL1_RESETB : out STD_LOGIC;
    SP7_FPGA_PLL2_RESETB : out STD_LOGIC;
    SP7_AFE_PLL3_RESETB : out STD_LOGIC;
    SP7_SYNTH_PLL4_CE : out STD_LOGIC
  );
  end component;
  
  signal AFE_PLL3_CLKSEL : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FPGA_PLL2_CLKSEL : STD_LOGIC_VECTOR ( 0 to 0 );
  signal FPGA_PLL2_LOCK_STAT : STD_LOGIC;
  signal PLLSync_0_AFE_PLL3_SYNC : STD_LOGIC;
  signal PLLSync_0_FPGA_PLL2_SYNC : STD_LOGIC;
  signal PLL_lock_stat_0_STA_REG_o : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal SP7_AFE_PLL3_RESETB : STD_LOGIC;
  signal SP7_FPGA_PLL2_RESETB : STD_LOGIC;
  signal SP7_PLL4_SPI_SDO_MUXOUT_2V5 : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  signal mmcm_50Mhz_clk_50 : STD_LOGIC;
  signal resetn : STD_LOGIC;
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_PLLSync_0_LS_PLL1_SYNC_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PLLSync_0_SYNTH_PLL4_SYNC_o_UNCONNECTED : STD_LOGIC;
  signal NLW_PLL_reset_0_SP7_LS_PLL1_RESETB_UNCONNECTED : STD_LOGIC;
  signal NLW_PLL_reset_0_SP7_SYNTH_PLL4_CE_UNCONNECTED : STD_LOGIC;
  signal NLW_vio_PLL_config_probe_out0_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_vio_PLL_config_probe_out3_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  
begin

  AFEPLL_CLKSEL(0) <= AFE_PLL3_CLKSEL(0);
  DIGPLL_CLKSEL(0) <= FPGA_PLL2_CLKSEL(0);
  FPGA_PLL2_LOCK_STAT <= DIGPLL_LOCK_STAT;
  SP7_AFEPLL_RESETB <= SP7_AFE_PLL3_RESETB;
  SP7_AFEPLL_SYNC <= PLLSync_0_AFE_PLL3_SYNC;
  SP7_DIGPLL_RESETB <= SP7_FPGA_PLL2_RESETB;
  SP7_DIGPLL_SYNC <= PLLSync_0_FPGA_PLL2_SYNC;
  STA_REG_o(3 downto 0) <= PLL_lock_stat_0_STA_REG_o(3 downto 0);
  clk_lkd(3 downto 0) <= xlconcat_0_dout(3 downto 0);
  mmcm_50Mhz_clk_50 <= clk_50mhz;
  resetn <= rstn_50mhz;
  
PLLSync_0: component PLLSync
     port map (
      AFE_PLL3_SYNC_o => PLLSync_0_AFE_PLL3_SYNC,
      FPGA_PLL2_SYNC_o => PLLSync_0_FPGA_PLL2_SYNC,
      LS_PLL1_SYNC_o => NLW_PLLSync_0_LS_PLL1_SYNC_o_UNCONNECTED,
      MCU_PLL_SYNC_i => MCU_PLL_SYNC,
      SYNTH_PLL4_SYNC_o => NLW_PLLSync_0_SYNTH_PLL4_SYNC_o_UNCONNECTED,
      clk_50mhz => mmcm_50Mhz_clk_50,
      rstn_50mhz => resetn
    );
PLL_lock_stat_0: component PLL_lock_stat
     port map (
      AFE_PLL3_LOCK_STAT => AFE_PLL3_LOCK_STAT,
      FPGA_PLL2_LOCK_STAT => FPGA_PLL2_LOCK_STAT,
      LS_PLL1_LOCK_STAT => SP7_PLL4_SPI_SDO_MUXOUT_2V5(0),
      SP7_PLL4_SPI_SDO_MUXOUT_2V5 => SP7_PLL4_SPI_SDO_MUXOUT_2V5(0),
      SP7_PLL_STATUS => SP7_PLL_STATUS,
      STA_REG_o(3 downto 0) => PLL_lock_stat_0_STA_REG_o(3 downto 0),
      clk_50mhz => mmcm_50Mhz_clk_50,
      rstn_50mhz => resetn
    );
PLL_reset_0: component PLL_reset
     port map (
      MCU_PLL_RESETB => MCU_PLL_RESETB,
      SP7_AFE_PLL3_RESETB => SP7_AFE_PLL3_RESETB,
      SP7_FPGA_PLL2_RESETB => SP7_FPGA_PLL2_RESETB,
      SP7_LS_PLL1_RESETB => NLW_PLL_reset_0_SP7_LS_PLL1_RESETB_UNCONNECTED,
      SP7_SYNTH_PLL4_CE => NLW_PLL_reset_0_SP7_SYNTH_PLL4_CE_UNCONNECTED,
      clk_50mhz => mmcm_50Mhz_clk_50,
      rstn_50mhz => resetn
    );
vio_PLL_config: component sp7_cal3_vio_PLL_config_0
     port map (
      clk => mmcm_50Mhz_clk_50,
      probe_out0(0) => NLW_vio_PLL_config_probe_out0_UNCONNECTED(0),
      probe_out1(0) => FPGA_PLL2_CLKSEL(0),
      probe_out2(0) => AFE_PLL3_CLKSEL(0),
      probe_out3(0) => NLW_vio_PLL_config_probe_out3_UNCONNECTED(0)
    );

xlconcat_0_dout(3 downto 0) <= 
    SP7_PLL4_SPI_SDO_MUXOUT_2V5(0) & 
    AFE_PLL3_LOCK_STAT & 
    FPGA_PLL2_LOCK_STAT & 
    SP7_PLL4_SPI_SDO_MUXOUT_2V5(0);

end STRUCTURE;