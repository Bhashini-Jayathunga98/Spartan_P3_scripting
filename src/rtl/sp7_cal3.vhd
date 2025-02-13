library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity sp7_cal3 is
  port (
    AFE_PLL_SP7_CLKSEL0 : out STD_LOGIC;
    AFE_PLL_SP7_LOCK_STAT : in STD_LOGIC;
    AFE_VCXO_SP7_122M88_CLK_LVDS_N : in STD_LOGIC;
    AFE_VCXO_SP7_122M88_CLK_LVDS_P : in STD_LOGIC;
    DIG_PLL_SP7_CLKSEL0 : out STD_LOGIC;
    DIG_PLL_SP7_LOCK_STAT : in STD_LOGIC;
    DMCU_DEV_SPI_SP7_CS : in STD_LOGIC;
    DMCU_FAN_CTRL : in STD_LOGIC;
    DMCU_LS_PORESET_CMD : in STD_LOGIC;
    DMCU_MAIN_CLK_EN : in STD_LOGIC;
    DMCU_PLL_RESETB : in STD_LOGIC;
    DMCU_RX_SP7_TX_UART_GPIO : out STD_LOGIC_VECTOR ( 0 to 0 );
    DMCU_SP7_AUXB_CONFIG_CMD : out STD_LOGIC_VECTOR ( 0 to 0 );
    DMCU_SP7_PMCU_SPI_AFE_PLL_CS2 : in STD_LOGIC;
    DMCU_SP7_PMCU_SPI_CLK : in STD_LOGIC;
    DMCU_SP7_PMCU_SPI_DIG_PLL_CS1 : in STD_LOGIC;
    DMCU_SP7_PMCU_SPI_MOSI : in STD_LOGIC;
    DMCU_SP7_ZU_SPI_MISO : out STD_LOGIC;
    DMCU_SP7_ZU_SPI_MOSI : in STD_LOGIC;
    DMCU_SP7_ZU_SPI_SCK : in STD_LOGIC;
    DMCU_SYSTEM_READY : in STD_LOGIC;
    DMCU_TX_SP7_RX_UART_GPIO : in STD_LOGIC;
    FAN_SP7_TACH_SENSOR_1 : in STD_LOGIC;
    FAN_SP7_TACH_SENSOR_2 : in STD_LOGIC;
    FAN_SP7_TACH_SENSOR_3 : in STD_LOGIC;
    FAN_SP7_TACH_SENSOR_4 : in STD_LOGIC;
    FAN_SP7_TACH_SENSOR_5 : in STD_LOGIC;
    FAN_SP7_TACH_SENSOR_6 : in STD_LOGIC;
    GNSS_1PPS : in STD_LOGIC;
    GNSS_TP2 : in STD_LOGIC;
    GNSS_UART_RXD_SP7_TXD : out STD_LOGIC;
    GNSS_UART_TXD_SP7_RXD : in STD_LOGIC;
    J4124 : out STD_LOGIC_VECTOR ( 0 to 0 );
    J4142 : out STD_LOGIC_VECTOR ( 0 to 0 );
    KU_GNSS_1PPS : out STD_LOGIC;
    LOC_10M_OSC_SP7_ENABLE : out STD_LOGIC;
    LS_2V5_DDR_PG : in STD_LOGIC;
    LS_DDR4_TERM_PG : in STD_LOGIC;
    LS_GNSS_1PPS : out STD_LOGIC;
    LS_GNSS_TP2_GPIO : out STD_LOGIC;
    LS_PWRSEQ_RST_OUT_B_1V8 : in STD_LOGIC;
    LS_SP7_ASLEEP : in STD_LOGIC;
    LS_SP7_DMCU_RESET_STAT : out STD_LOGIC;
    LS_SP7_HRESET_B : in STD_LOGIC;
    LS_SP7_RESET_REQ_B : in STD_LOGIC;
    LS_SP7_SPI_CS1 : in STD_LOGIC;
    LS_SPI_CLK : in STD_LOGIC;
    LS_SPI_MISO : inout STD_LOGIC;
    LS_SPI_MOSI : in STD_LOGIC;
    LS_TA_PROG_SFP_PG : in STD_LOGIC;
    OCXO_CLK_BUF_ENB : out STD_LOGIC;
    OCXO_SP7_10M_DET_N : in STD_LOGIC;
    OCXO_SP7_10M_DET_P : in STD_LOGIC;
    SP7_10MHZ_LVDS_CLK_IN_N : in STD_LOGIC;
    SP7_10MHZ_LVDS_CLK_IN_P : in STD_LOGIC;
    SP7_10M_CLK_DAC_RESET : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_10M_CLK_DAC_SCLK : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_10M_CLK_DAC_SDIN : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_10M_CLK_DAC_SEL : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_10M_CLK_DAC_SYNC : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_10M_CLK_REF_EN_B : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_10M_SOURCE_SEL : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_12V_OCXO_EN : out STD_LOGIC;
    SP7_3V3_AFEPLL_PG : in STD_LOGIC;
    SP7_3V3_DIGPLL_PG : in STD_LOGIC;
    SP7_3V3_OCXO_PG : in STD_LOGIC;
    SP7_3V3_VCXO_PG : in STD_LOGIC;
    SP7_50MHZ_OSC_INPUT : in STD_LOGIC;
    SP7_AFE_PLL_RESETB : out STD_LOGIC;
    SP7_AFE_PLL_SPI_CS1 : out STD_LOGIC;
    SP7_AFE_PLL_SYNC : out STD_LOGIC;
    SP7_AFE_VCXO_ENB : out STD_LOGIC;
    SP7_AUXB_CONFIG_CMD : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AUXB_CONFIG_STAT : in STD_LOGIC;
    SP7_AUXB_PWR_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AUXB_PWR_STAT : in STD_LOGIC;
    SP7_AUXETH_PLL_GPIO1_OE : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AUXETH_PLL_GPIO4_LOCK : in STD_LOGIC;
    SP7_AUXETH_PLL_HW_SW_CTRL : inout STD_LOGIC;
    SP7_AUXETH_PLL_RESET : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_DBG_UART_RX : in STD_LOGIC;
    SP7_DBG_UART_TX : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_DIG_PLL_RESET : out STD_LOGIC;
    SP7_DIG_PLL_SPI_CS0 : out STD_LOGIC;
    SP7_DIG_PLL_SYNC : out STD_LOGIC;
    SP7_DIP_SW_11 : in STD_LOGIC;
    SP7_DIP_SW_12 : in STD_LOGIC;
    SP7_DIP_SW_21 : in STD_LOGIC;
    SP7_DIP_SW_22 : in STD_LOGIC;
    SP7_DIP_SW_32 : in STD_LOGIC;
    SP7_DMCU_AUXB_CONFIG_STAT : in STD_LOGIC;
    SP7_DMCU_IRQ : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_FAN_PWM_CTRL_1 : out STD_LOGIC;
    SP7_FAN_PWM_CTRL_2 : out STD_LOGIC;
    SP7_FAN_PWM_CTRL_3 : out STD_LOGIC;
    SP7_FAN_PWM_CTRL_4 : out STD_LOGIC;
    SP7_FAN_PWM_CTRL_5 : out STD_LOGIC;
    SP7_FAN_PWM_CTRL_6 : out STD_LOGIC;
    SP7_FAN_PWR_CTRL_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_GNSS_KU_UART_RX : out STD_LOGIC;
    SP7_GNSS_LS_UART_RX : in STD_LOGIC;
    SP7_GNSS_LS_UART_TX : out STD_LOGIC;
    SP7_GNSS_RST_B : out STD_LOGIC;
    SP7_GNSS_ZU_UART_RX : out STD_LOGIC;
    SP7_JTAG_BUF_EN : in STD_LOGIC;
    SP7_KU_QSPI_CFG_MAP : out STD_LOGIC;
    SP7_KU_SPARE1N_CLKN_LVDS : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_KU_SPARE1P_CLKP_LVDS : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_LS_BST_EN_2V5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_LS_DDR_RESET_B : out STD_LOGIC;
    SP7_LS_EMMC_RESET_B : out STD_LOGIC;
    SP7_LS_IRQ : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_LS_NOR_PORESET : out STD_LOGIC;
    SP7_LS_PORESET_CMD_2V5 : out STD_LOGIC;
    SP7_LS_QSPI_CFG_MAP_2V5 : out STD_LOGIC;
    SP7_LS_TA_PROG_SFP_EN_2V5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_MAIN_CLK_STAT : out STD_LOGIC;
    SP7_OCXO_INTB_EXT_REF : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_OSC_PWR_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_PLL_PWR_EN : out STD_LOGIC;
    SP7_PLL_SPI_CLK : out STD_LOGIC;
    SP7_PLL_SPI_SDIO : out STD_LOGIC;
    SP7_PLL_STATUS : out STD_LOGIC;
    SP7_PUDC : in STD_LOGIC;
    SP7_SPARE_LED_2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_SPARE_LED_3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_SPARE_LED_4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_ZU_3V3_GPIO_1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_ZU_3V3_GPIO_2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_ZU_3V3_GPIO_3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_ZU_3V3_GPIO_5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_ZU_MODE_SPARE_LED_1 : out STD_LOGIC;
    SP7_ZU_QSPI_CFG_MAP_2V5 : out STD_LOGIC;
    SP7_ZU_SPARE1N_CLKN_LVDS : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_ZU_SPARE1P_CLKP_LVDS : out STD_LOGIC_VECTOR ( 0 to 0 );
    ZU_BOOT_STATUS_2V5 : in STD_LOGIC;
    ZU_DONE_2V5 : in STD_LOGIC;
    ZU_ERROR_OUT_2V5 : in STD_LOGIC;
    ZU_ERROR_STATUS_2V5 : in STD_LOGIC;
    ZU_GNSS_1PPS : out STD_LOGIC;
    ZU_SP7_DMCU_RESET_STAT : out STD_LOGIC;
    spi_rtl_0_io0_i : in STD_LOGIC;
    spi_rtl_0_io0_o : out STD_LOGIC;
    spi_rtl_0_io0_t : out STD_LOGIC;
    spi_rtl_0_io1_i : in STD_LOGIC;
    spi_rtl_0_io1_o : out STD_LOGIC;
    spi_rtl_0_io1_t : out STD_LOGIC;
    spi_rtl_0_io2_i : in STD_LOGIC;
    spi_rtl_0_io2_o : out STD_LOGIC;
    spi_rtl_0_io2_t : out STD_LOGIC;
    spi_rtl_0_io3_i : in STD_LOGIC;
    spi_rtl_0_io3_o : out STD_LOGIC;
    spi_rtl_0_io3_t : out STD_LOGIC;
    spi_rtl_0_ss_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    spi_rtl_0_ss_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    spi_rtl_0_ss_t : out STD_LOGIC
  );
  attribute core_generation_info : string;
  attribute core_generation_info of sp7_cal3 : entity is "sp7_cal3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=sp7_cal3,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=209,numReposBlks=171,numNonXlnxBlks=1,numHierBlks=38,maxHierDepth=3,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=103,numPkgbdBlks=1,bdsource=USER,da_mb_cnt=1,synth_mode=Global}";
  attribute hw_handoff : string;
  attribute hw_handoff of sp7_cal3 : entity is "sp7_cal3.hwdef";
end sp7_cal3;

architecture STRUCTURE of sp7_cal3 is

  component sp7_cal3_mmcm_50Mhz_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clkfb_in : in STD_LOGIC;
    clk_50 : out STD_LOGIC;
    clk_10 : out STD_LOGIC;
    clk_100 : out STD_LOGIC;
    clk_6p4 : out STD_LOGIC;
    clkfb_out : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component sp7_cal3_mmcm_50Mhz_0;

  component io_buf is
  port (
    IO : inout STD_LOGIC;
    O : out STD_LOGIC;
    I : in STD_LOGIC;
    T : in STD_LOGIC
  );
  end component io_buf;
  
  component sp7_cal3_hier_flash_microblaze_0_1 is
  port (
    ARESETN : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Debug_SYS_Rst : out STD_LOGIC;
    GNSS_1PPS : in STD_LOGIC;
    INT_PPS : out STD_LOGIC;
    Reset : in STD_LOGIC;
    SP7_10M_CLK_DAC_RESET : out STD_LOGIC;
    SP7_10M_CLK_DAC_SCLK : out STD_LOGIC;
    SP7_10M_CLK_DAC_SDIN : out STD_LOGIC;
    SP7_10M_CLK_DAC_SYNC : out STD_LOGIC;
    SP7_10M_SOURCE_SEL : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_DBG_UART_RX : in STD_LOGIC;
    SP7_DBG_UART_TX : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    clk_10_in : in STD_LOGIC;
    cmd : in STD_LOGIC_VECTOR ( 7 downto 0 );
    dcm_locked : in STD_LOGIC;
    flash_upgrade_start : in STD_LOGIC_VECTOR ( 7 downto 0 );
    hier_microblaze_SP7_10M_SOURCE_SEL_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    radd : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    spi_rtl_0_io0_i : in STD_LOGIC;
    spi_rtl_0_io0_o : out STD_LOGIC;
    spi_rtl_0_io0_t : out STD_LOGIC;
    spi_rtl_0_io1_i : in STD_LOGIC;
    spi_rtl_0_io1_o : out STD_LOGIC;
    spi_rtl_0_io1_t : out STD_LOGIC;
    spi_rtl_0_io2_i : in STD_LOGIC;
    spi_rtl_0_io2_o : out STD_LOGIC;
    spi_rtl_0_io2_t : out STD_LOGIC;
    spi_rtl_0_io3_i : in STD_LOGIC;
    spi_rtl_0_io3_o : out STD_LOGIC;
    spi_rtl_0_io3_t : out STD_LOGIC;
    spi_rtl_0_ss_i : in STD_LOGIC_VECTOR ( 0 to 0 );
    spi_rtl_0_ss_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    spi_rtl_0_ss_t : out STD_LOGIC;
    sta : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wadd : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wdata : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component sp7_cal3_hier_flash_microblaze_0_1;
  
  signal AFE_PLL_SP7_LOCK_STAT_1 : STD_LOGIC;
  signal AFE_VCXO_SP7_122M88_CLK_LVDS_N_1 : STD_LOGIC;
  signal AFE_VCXO_SP7_122M88_CLK_LVDS_P_1 : STD_LOGIC;
  signal DIG_PLL_SP7_LOCK_STAT_1 : STD_LOGIC;
  signal DMCU_DEV_SPI_SP7_CS_1 : STD_LOGIC;
  signal DMCU_FAN_CTRL_1 : STD_LOGIC;
  signal DMCU_SP7_PMCU_SPI_CLK_1 : STD_LOGIC;
  signal DMCU_SP7_PMCU_SPI_MOSI_1 : STD_LOGIC;
  signal DMCU_SP7_ZU_SPI_MOSI_1 : STD_LOGIC;
  signal DMCU_SP7_ZU_SPI_SCK_1 : STD_LOGIC;
  signal DMCU_SPI_OBUFT_DMCU_SP7_ZU_SPI_MISO : STD_LOGIC;
  signal GNSS_1PPS_1 : STD_LOGIC;
  signal GNSS_TP2_1 : STD_LOGIC;
  signal GNSS_UART_TXD_SP7_RXD_1 : STD_LOGIC;
  signal LS_PWRSEQ_RST_OUT_B_1V8_1 : STD_LOGIC;
  signal LS_SP7_ASLEEP_1 : STD_LOGIC;
  signal LS_SP7_HRESET_B_1 : STD_LOGIC;
  signal LS_SP7_RESET_REQ_B_1 : STD_LOGIC;
  signal LS_SP7_SPI_CS1_1 : STD_LOGIC;
  signal LS_SPI_CLK_1 : STD_LOGIC;
  signal LS_SPI_MOSI_1 : STD_LOGIC;
  signal LS_SPI_OBUFT_LS_SPI_MISO : STD_LOGIC;
  signal MCU_LS_PORESET_CMD_1 : STD_LOGIC;
  signal MCU_MAIN_CLK_EN_1 : STD_LOGIC;
  signal MCU_OCXO_CLK_BUF_EN_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal MCU_PLL_RESETB_1 : STD_LOGIC;
  signal MCU_SP7_PMCU_SPI_AFE_PLL_CS2_1 : STD_LOGIC;
  signal MCU_SP7_PMCU_SPI_DIG_PLL_CS1_1 : STD_LOGIC;
  signal Net : STD_LOGIC;
  signal Net1 : STD_LOGIC;
  signal P1_P2_P3_P4_O_V_OLD_VLD_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SP7_10MHZ_LVDS_CLK_IN_N_1 : STD_LOGIC;
  signal SP7_10MHZ_LVDS_CLK_IN_P_1 : STD_LOGIC;
  signal SP7_3V3_AFEPLL_PG_1 : STD_LOGIC;
  signal SP7_3V3_DIGPLL_PG_1 : STD_LOGIC;
  signal SP7_3V3_OCXO_PG_1 : STD_LOGIC;
  signal SP7_3V3_VCXO_PG_1 : STD_LOGIC;
  signal SP7_50MHZ_OSC_INPUT_1 : STD_LOGIC;
  signal \^sp7_auxeth_pll_hw_sw_ctrl\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal SP7_DBG_UART_RX_1 : STD_LOGIC;
  signal SP7_DIP_SW_11_1 : STD_LOGIC;
  signal SP7_DIP_SW_12_1 : STD_LOGIC;
  signal SP7_DIP_SW_21_1 : STD_LOGIC;
  signal SP7_DIP_SW_22_1 : STD_LOGIC;
  signal SP7_GNSS_LS_UART_RX_1 : STD_LOGIC;
  signal SP7_LS_reset_0_SP7_LS_PORESET_CMD : STD_LOGIC;
  signal ZU_BOOT_STATUS_2V5_1 : STD_LOGIC;
  signal ZU_DONE_2V5_1 : STD_LOGIC;
  signal ZU_ERROR_OUT_2V5_1 : STD_LOGIC;
  signal ZU_ERROR_STATUS_2V5_1 : STD_LOGIC;
  signal board_power_done_inv_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal clk100_1 : STD_LOGIC;
  signal clk10_1 : STD_LOGIC;
  signal clk_6p4_1 : STD_LOGIC;
  signal clk_lkd_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal dcm_locked_1 : STD_LOGIC;
  signal hier_0_vio_CLK_REF_10M_EN_B : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_LOC_10M_OSC_SP7_ENABLE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_OCXO_EN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_SP7_AFE_VCXO_ENABLE : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_SP7_AUXB_PWR_EN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_SP7_AUXETH_PLL_RESET : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_SP7_OCXO_INTB_EXT_REF : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_VCTCXO_EN : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_0_vio_reset10 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_50MHz_OUT_SP7_KU_SPARE1N_CLKN_LVDS : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_50MHz_OUT_SP7_ZU_SPARE1N_CLKN_LVDS : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_BOARD_POWER_DONE_board_power_done : STD_LOGIC;
  signal hier_CLK_PG_CLK_PWR_PG : STD_LOGIC;
  signal hier_GNSS_en_GNSS_UART_RXD_SP7_TXD : STD_LOGIC;
  signal hier_GNSS_en_KU_GNSS_1PPS : STD_LOGIC;
  signal hier_GNSS_en_LS_GNSS_1PPS : STD_LOGIC;
  signal hier_GNSS_en_LS_GNSS_TP2_GPIO : STD_LOGIC;
  signal hier_GNSS_en_SP7_GNSS_KU_UART_RX : STD_LOGIC;
  signal hier_GNSS_en_SP7_GNSS_LS_UART_TX : STD_LOGIC;
  signal hier_GNSS_en_SP7_GNSS_RST_B : STD_LOGIC;
  signal hier_GNSS_en_SP7_GNSS_ZU_UART_RX : STD_LOGIC;
  signal hier_GNSS_en_SP7_KU_SPARE1P_CLKP_LVDS : STD_LOGIC;
  signal hier_GNSS_en_SP7_ZU_SPARE1P_CLKP_LVDS : STD_LOGIC;
  signal hier_GNSS_en_ZU_GNSS_1PPS : STD_LOGIC;
  signal hier_LS_Kintex_sel_dip_sync : STD_LOGIC;
  signal hier_LS_OBUFT_SP7_LS_DDR_RESET_B : STD_LOGIC;
  signal hier_LS_OBUFT_SP7_LS_EMMC_RESET_B : STD_LOGIC;
  signal hier_LS_OBUFT_SP7_LS_NOR_PORESET : STD_LOGIC;
  signal hier_LS_OBUFT_SP7_LS_PORESET_CMD_2V5 : STD_LOGIC;
  signal hier_LS_OBUFT_SP7_SPARE_LED_1 : STD_LOGIC;
  signal hier_LS_QSPI_sel_dip_sync : STD_LOGIC;
  signal hier_LS_SPI_LS_SPI_MISO : STD_LOGIC;
  signal hier_LS_SPI_ctrl_reg3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_LS_SPI_flash_upgrade_start : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_LS_SPI_raddress : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hier_LS_SPI_waddress : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hier_LS_SPI_wdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hier_LS_Zynq_sel_dip_sync : STD_LOGIC;
  signal hier_LS_reset_SP7_LS_DDR_RESET_B : STD_LOGIC;
  signal hier_LS_reset_SP7_LS_EMMC_RESET_B : STD_LOGIC;
  signal hier_LS_reset_SP7_LS_NOR_PORESET : STD_LOGIC;
  signal hier_LS_reset_SP7_SPARE_LED_1 : STD_LOGIC;
  signal hier_MCU_SPI_MCU_SP7_PMCU_SPI_AFE_PLL_CS2_2V5 : STD_LOGIC;
  signal hier_MCU_SPI_MCU_SP7_PMCU_SPI_DIG_PLL_CS1_2V5 : STD_LOGIC;
  signal hier_MCU_SPI_SP7_PLL4_SPI_SCK_2V5 : STD_LOGIC;
  signal hier_MCU_SPI_SP7_PLL_SPI_SDIO_o : STD_LOGIC;
  signal hier_SPI_regbank_MCU_FPGA_SPI_MISO : STD_LOGIC;
  signal hier_SPI_regbank_ctrl_reg1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_SPI_regbank_ctrl_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_SPI_regbank_ctrl_reg3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_SPI_regbank_ctrl_reg4 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_SPI_regbank_ctrl_reg5 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_SPI_regbank_ctrl_reg6 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_ZU_status_ZU_SP7_MCU_RESET_STAT : STD_LOGIC;
  signal hier_Zynq_mode_pin_dip_sync : STD_LOGIC;
  signal hier_clock_measurments_clk_10m : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_clock_measurments_ocxo_ld : STD_LOGIC;
  signal hier_clock_measurments_vcxo_ld : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_flash_microblaze_0_Debug_SYS_Rst : STD_LOGIC;
  signal hier_flash_microblaze_0_INT_PPS : STD_LOGIC;
  signal hier_flash_microblaze_0_SP7_10M_CLK_DAC_RESET : STD_LOGIC;
  signal hier_flash_microblaze_0_SP7_10M_CLK_DAC_SCLK : STD_LOGIC;
  signal hier_flash_microblaze_0_SP7_10M_CLK_DAC_SDIN : STD_LOGIC;
  signal hier_flash_microblaze_0_SP7_10M_CLK_DAC_SYNC : STD_LOGIC;
  signal hier_flash_microblaze_0_SP7_10M_SOURCE_SEL : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_flash_microblaze_0_SP7_DBG_UART_TX : STD_LOGIC;
  signal hier_flash_microblaze_0_hier_microblaze_SP7_10M_SOURCE_SEL_n : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_flash_microblaze_0_rdata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hier_flash_microblaze_0_spi_rtl_0_IO0_I : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO0_O : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO0_T : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO1_I : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO1_O : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO1_T : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO2_I : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO2_O : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO2_T : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO3_I : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO3_O : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_IO3_T : STD_LOGIC;
  signal hier_flash_microblaze_0_spi_rtl_0_SS_I : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_flash_microblaze_0_spi_rtl_0_SS_O : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_flash_microblaze_0_spi_rtl_0_SS_T : STD_LOGIC;
  signal hier_flash_microblaze_0_sta : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_ldo_LOC_10M_OSC_SP7_ENABLE1 : STD_LOGIC;
  signal hier_ldo_OCXO_3V3_EN : STD_LOGIC;
  signal hier_ldo_OCXO_CLK_BUF_ENB : STD_LOGIC;
  signal hier_ldo_SP7_AFE_VCXO_ENABLE1 : STD_LOGIC;
  signal hier_pll_AFEPLL_CLKSEL : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_pll_DIGPLL_CLKSEL : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hier_pll_SP7_AFEPLL_RESETB : STD_LOGIC;
  signal hier_pll_SP7_AFEPLL_SYNC : STD_LOGIC;
  signal hier_pll_SP7_DIGPLL_RESETB : STD_LOGIC;
  signal hier_pll_SP7_DIGPLL_SYNC : STD_LOGIC;
  signal hier_pll_SP7_PLL_STATUS : STD_LOGIC;
  signal hier_pll_spi_obuft_SP7_AFE_PLL_SPI_CS1 : STD_LOGIC;
  signal hier_pll_spi_obuft_SP7_DIG_PLL_SPI_CS0 : STD_LOGIC;
  signal hier_pll_spi_obuft_SP7_PLL_SPI_CLK : STD_LOGIC;
  signal hier_pll_spi_obuft_SP7_PLL_SPI_SDIO : STD_LOGIC;
  signal hier_pwm_FAN_PWR_CTRL_1 : STD_LOGIC;
  signal hier_pwm_FAN_PWR_CTRL_2 : STD_LOGIC;
  signal hier_pwm_FAN_PWR_CTRL_3 : STD_LOGIC;
  signal hier_pwm_FAN_PWR_CTRL_4 : STD_LOGIC;
  signal hier_pwm_FAN_PWR_CTRL_5 : STD_LOGIC;
  signal hier_pwm_FAN_PWR_CTRL_6 : STD_LOGIC;
  signal microblaze_0_Clk : STD_LOGIC;
  signal mmcm_50Mhz_clkfb_out : STD_LOGIC;
  signal pll_obut_AFEPLL_CLKSEL : STD_LOGIC;
  signal pll_obut_DIGPLL_CLKSEL : STD_LOGIC;
  signal pll_obut_SP7_AFEPLL_RESETB : STD_LOGIC;
  signal pll_obut_SP7_AFEPLL_SYNC : STD_LOGIC;
  signal pll_obut_SP7_DIGPLL_RESETB : STD_LOGIC;
  signal pll_obut_SP7_DIGPLL_SYNC : STD_LOGIC;
  signal rst_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rstn_10_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal rstn_50_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "0";
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "0";
  signal xlconstant_2_dout1 : STD_LOGIC_VECTOR ( 0 to 0 ):= "1";
  signal xlconstant_3_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  signal NLW_hier_0_vio_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_hier_0_vio_CLK_10M_SOURCE_SP7_SEL_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_hier_0_vio_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_hier_CLK_PG_CLK_PWR_PG_inv_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_hier_LS_SPI_zu_ctrl_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_hier_pll_STA_REG_o_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_io_buf_0_O_UNCONNECTED : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of AFE_VCXO_SP7_122M88_CLK_LVDS_N : signal is "xilinx.com:signal:clock:1.0 CLK.AFE_VCXO_SP7_122M88_CLK_LVDS_N CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of AFE_VCXO_SP7_122M88_CLK_LVDS_N : signal is "XIL_INTERFACENAME CLK.AFE_VCXO_SP7_122M88_CLK_LVDS_N, CLK_DOMAIN sp7_cal3_AFE_VCXO_SP7_122M88_CLK_LVDS_N, FREQ_HZ 122880000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of AFE_VCXO_SP7_122M88_CLK_LVDS_P : signal is "xilinx.com:signal:clock:1.0 CLK.AFE_VCXO_SP7_122M88_CLK_LVDS_P CLK";
  attribute x_interface_parameter of AFE_VCXO_SP7_122M88_CLK_LVDS_P : signal is "XIL_INTERFACENAME CLK.AFE_VCXO_SP7_122M88_CLK_LVDS_P, CLK_DOMAIN sp7_cal3_AFE_VCXO_SP7_122M88_CLK_LVDS_P, FREQ_HZ 122880000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of DMCU_SP7_PMCU_SPI_CLK : signal is "xilinx.com:signal:clock:1.0 CLK.DMCU_SP7_PMCU_SPI_CLK CLK";
  attribute x_interface_parameter of DMCU_SP7_PMCU_SPI_CLK : signal is "XIL_INTERFACENAME CLK.DMCU_SP7_PMCU_SPI_CLK, CLK_DOMAIN sp7_cal3_DMCU_SP7_PMCU_SPI_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of LS_SPI_CLK : signal is "xilinx.com:signal:clock:1.0 CLK.LS_SPI_CLK CLK";
  attribute x_interface_parameter of LS_SPI_CLK : signal is "XIL_INTERFACENAME CLK.LS_SPI_CLK, CLK_DOMAIN sp7_cal3_LS_SPI_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of SP7_10MHZ_LVDS_CLK_IN_N : signal is "xilinx.com:signal:clock:1.0 CLK.SP7_10MHZ_LVDS_CLK_IN_N CLK";
  attribute x_interface_parameter of SP7_10MHZ_LVDS_CLK_IN_N : signal is "XIL_INTERFACENAME CLK.SP7_10MHZ_LVDS_CLK_IN_N, CLK_DOMAIN sp7_cal3_SP7_10MHZ_LVDS_CLK_IN_N, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of SP7_10MHZ_LVDS_CLK_IN_P : signal is "xilinx.com:signal:clock:1.0 CLK.SP7_10MHZ_LVDS_CLK_IN_P CLK";
  attribute x_interface_parameter of SP7_10MHZ_LVDS_CLK_IN_P : signal is "XIL_INTERFACENAME CLK.SP7_10MHZ_LVDS_CLK_IN_P, CLK_DOMAIN sp7_cal3_SP7_10MHZ_LVDS_CLK_IN_P, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of SP7_DIG_PLL_RESET : signal is "xilinx.com:signal:reset:1.0 RST.SP7_DIG_PLL_RESET RST";
  attribute x_interface_parameter of SP7_DIG_PLL_RESET : signal is "XIL_INTERFACENAME RST.SP7_DIG_PLL_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute x_interface_info of SP7_PLL_SPI_CLK : signal is "xilinx.com:signal:clock:1.0 CLK.SP7_PLL_SPI_CLK CLK";
  attribute x_interface_parameter of SP7_PLL_SPI_CLK : signal is "XIL_INTERFACENAME CLK.SP7_PLL_SPI_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000";
  attribute x_interface_info of spi_rtl_0_io0_i : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO0_I";
  attribute x_interface_info of spi_rtl_0_io0_o : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO0_O";
  attribute x_interface_info of spi_rtl_0_io0_t : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO0_T";
  attribute x_interface_info of spi_rtl_0_io1_i : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO1_I";
  attribute x_interface_info of spi_rtl_0_io1_o : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO1_O";
  attribute x_interface_info of spi_rtl_0_io1_t : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO1_T";
  attribute x_interface_info of spi_rtl_0_io2_i : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO2_I";
  attribute x_interface_info of spi_rtl_0_io2_o : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO2_O";
  attribute x_interface_info of spi_rtl_0_io2_t : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO2_T";
  attribute x_interface_info of spi_rtl_0_io3_i : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO3_I";
  attribute x_interface_info of spi_rtl_0_io3_o : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO3_O";
  attribute x_interface_info of spi_rtl_0_io3_t : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 IO3_T";
  attribute x_interface_info of spi_rtl_0_ss_t : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 SS_T";
  attribute x_interface_info of SP7_10M_CLK_DAC_RESET : signal is "xilinx.com:signal:reset:1.0 RST.SP7_10M_CLK_DAC_RESET RST";
  attribute x_interface_parameter of SP7_10M_CLK_DAC_RESET : signal is "XIL_INTERFACENAME RST.SP7_10M_CLK_DAC_RESET, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute x_interface_info of SP7_DMCU_IRQ : signal is "xilinx.com:signal:interrupt:1.0 INTR.SP7_DMCU_IRQ INTERRUPT";
  attribute x_interface_parameter of SP7_DMCU_IRQ : signal is "XIL_INTERFACENAME INTR.SP7_DMCU_IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH";
  attribute x_interface_info of SP7_LS_IRQ : signal is "xilinx.com:signal:interrupt:1.0 INTR.SP7_LS_IRQ INTERRUPT";
  attribute x_interface_parameter of SP7_LS_IRQ : signal is "XIL_INTERFACENAME INTR.SP7_LS_IRQ, PortWidth 1, SENSITIVITY LEVEL_HIGH";
  attribute x_interface_info of spi_rtl_0_ss_i : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 SS_I";
  attribute x_interface_info of spi_rtl_0_ss_o : signal is "xilinx.com:interface:spi:1.0 spi_rtl_0 SS_O";
begin
  AFE_PLL_SP7_CLKSEL0 <= pll_obut_AFEPLL_CLKSEL;
  AFE_PLL_SP7_LOCK_STAT_1 <= AFE_PLL_SP7_LOCK_STAT;
  AFE_VCXO_SP7_122M88_CLK_LVDS_N_1 <= AFE_VCXO_SP7_122M88_CLK_LVDS_N;
  AFE_VCXO_SP7_122M88_CLK_LVDS_P_1 <= AFE_VCXO_SP7_122M88_CLK_LVDS_P;
  DIG_PLL_SP7_CLKSEL0 <= pll_obut_DIGPLL_CLKSEL;
  DIG_PLL_SP7_LOCK_STAT_1 <= DIG_PLL_SP7_LOCK_STAT;
  DMCU_DEV_SPI_SP7_CS_1 <= DMCU_DEV_SPI_SP7_CS;
  DMCU_FAN_CTRL_1 <= DMCU_FAN_CTRL;
  DMCU_RX_SP7_TX_UART_GPIO(0) <= xlconstant_1_dout(0);
  DMCU_SP7_AUXB_CONFIG_CMD(0) <= xlconstant_1_dout(0);
  DMCU_SP7_PMCU_SPI_CLK_1 <= DMCU_SP7_PMCU_SPI_CLK;
  DMCU_SP7_PMCU_SPI_MOSI_1 <= DMCU_SP7_PMCU_SPI_MOSI;
  DMCU_SP7_ZU_SPI_MISO <= DMCU_SPI_OBUFT_DMCU_SP7_ZU_SPI_MISO;
  DMCU_SP7_ZU_SPI_MOSI_1 <= DMCU_SP7_ZU_SPI_MOSI;
  DMCU_SP7_ZU_SPI_SCK_1 <= DMCU_SP7_ZU_SPI_SCK;
  GNSS_1PPS_1 <= GNSS_1PPS;
  GNSS_TP2_1 <= GNSS_TP2;
  GNSS_UART_RXD_SP7_TXD <= hier_GNSS_en_GNSS_UART_RXD_SP7_TXD;
  GNSS_UART_TXD_SP7_RXD_1 <= GNSS_UART_TXD_SP7_RXD;
  J4124(0) <= xlconstant_1_dout(0);
  J4142(0) <= xlconstant_1_dout(0);
  KU_GNSS_1PPS <= hier_GNSS_en_KU_GNSS_1PPS;
  LOC_10M_OSC_SP7_ENABLE <= hier_ldo_LOC_10M_OSC_SP7_ENABLE1;
  LS_GNSS_1PPS <= hier_GNSS_en_LS_GNSS_1PPS;
  LS_GNSS_TP2_GPIO <= hier_GNSS_en_LS_GNSS_TP2_GPIO;
  LS_PWRSEQ_RST_OUT_B_1V8_1 <= LS_PWRSEQ_RST_OUT_B_1V8;
  LS_SP7_ASLEEP_1 <= LS_SP7_ASLEEP;
  LS_SP7_DMCU_RESET_STAT <= hier_LS_OBUFT_SP7_SPARE_LED_1;
  LS_SP7_HRESET_B_1 <= LS_SP7_HRESET_B;
  LS_SP7_RESET_REQ_B_1 <= LS_SP7_RESET_REQ_B;
  LS_SP7_SPI_CS1_1 <= LS_SP7_SPI_CS1;
  LS_SPI_CLK_1 <= LS_SPI_CLK;
  LS_SPI_MOSI_1 <= LS_SPI_MOSI;
  MCU_LS_PORESET_CMD_1 <= DMCU_LS_PORESET_CMD;
  MCU_MAIN_CLK_EN_1 <= DMCU_MAIN_CLK_EN;
  MCU_PLL_RESETB_1 <= DMCU_PLL_RESETB;
  MCU_SP7_PMCU_SPI_AFE_PLL_CS2_1 <= DMCU_SP7_PMCU_SPI_AFE_PLL_CS2;
  MCU_SP7_PMCU_SPI_DIG_PLL_CS1_1 <= DMCU_SP7_PMCU_SPI_DIG_PLL_CS1;
  OCXO_CLK_BUF_ENB <= hier_ldo_OCXO_CLK_BUF_ENB;
  SP7_10MHZ_LVDS_CLK_IN_N_1 <= SP7_10MHZ_LVDS_CLK_IN_N;
  SP7_10MHZ_LVDS_CLK_IN_P_1 <= SP7_10MHZ_LVDS_CLK_IN_P;
  SP7_10M_CLK_DAC_RESET(0) <= hier_flash_microblaze_0_SP7_10M_CLK_DAC_RESET;
  SP7_10M_CLK_DAC_SCLK(0) <= hier_flash_microblaze_0_SP7_10M_CLK_DAC_SCLK;
  SP7_10M_CLK_DAC_SDIN(0) <= hier_flash_microblaze_0_SP7_10M_CLK_DAC_SDIN;
  SP7_10M_CLK_DAC_SYNC(0) <= hier_flash_microblaze_0_SP7_10M_CLK_DAC_SYNC;
  SP7_10M_CLK_REF_EN_B(0) <= hier_0_vio_CLK_REF_10M_EN_B(0);
  SP7_10M_SOURCE_SEL(0) <= hier_flash_microblaze_0_SP7_10M_SOURCE_SEL(0);
  SP7_12V_OCXO_EN <= hier_ldo_OCXO_3V3_EN;
  SP7_3V3_AFEPLL_PG_1 <= SP7_3V3_AFEPLL_PG;
  SP7_3V3_DIGPLL_PG_1 <= SP7_3V3_DIGPLL_PG;
  SP7_3V3_OCXO_PG_1 <= SP7_3V3_OCXO_PG;
  SP7_3V3_VCXO_PG_1 <= SP7_3V3_VCXO_PG;
  SP7_50MHZ_OSC_INPUT_1 <= SP7_50MHZ_OSC_INPUT;
  SP7_AFE_PLL_RESETB <= pll_obut_SP7_AFEPLL_RESETB;
  SP7_AFE_PLL_SPI_CS1 <= hier_pll_spi_obuft_SP7_AFE_PLL_SPI_CS1;
  SP7_AFE_PLL_SYNC <= pll_obut_SP7_AFEPLL_SYNC;
  SP7_AFE_VCXO_ENB <= hier_ldo_SP7_AFE_VCXO_ENABLE1;
  SP7_AUXB_CONFIG_CMD(0) <= hier_0_vio_SP7_AUXB_PWR_EN(0);
  SP7_AUXB_PWR_EN(0) <= hier_0_vio_SP7_AUXB_PWR_EN(0);
  SP7_AUXETH_PLL_GPIO1_OE(0) <= xlconstant_1_dout(0);
  SP7_AUXETH_PLL_RESET(0) <= hier_0_vio_SP7_AUXETH_PLL_RESET(0);
  SP7_DBG_UART_RX_1 <= SP7_DBG_UART_RX;
  SP7_DBG_UART_TX(0) <= hier_flash_microblaze_0_SP7_DBG_UART_TX;
  SP7_DIG_PLL_RESET <= pll_obut_SP7_DIGPLL_RESETB;
  SP7_DIG_PLL_SPI_CS0 <= hier_pll_spi_obuft_SP7_DIG_PLL_SPI_CS0;
  SP7_DIG_PLL_SYNC <= pll_obut_SP7_DIGPLL_SYNC;
  SP7_DIP_SW_11_1 <= SP7_DIP_SW_11;
  SP7_DIP_SW_12_1 <= SP7_DIP_SW_12;
  SP7_DIP_SW_21_1 <= SP7_DIP_SW_21;
  SP7_DIP_SW_22_1 <= SP7_DIP_SW_22;
  SP7_DMCU_IRQ(0) <= xlconstant_3_dout(0);
  SP7_FAN_PWM_CTRL_1 <= hier_pwm_FAN_PWR_CTRL_1;
  SP7_FAN_PWM_CTRL_2 <= hier_pwm_FAN_PWR_CTRL_2;
  SP7_FAN_PWM_CTRL_3 <= hier_pwm_FAN_PWR_CTRL_3;
  SP7_FAN_PWM_CTRL_4 <= hier_pwm_FAN_PWR_CTRL_4;
  SP7_FAN_PWM_CTRL_5 <= hier_pwm_FAN_PWR_CTRL_5;
  SP7_FAN_PWM_CTRL_6 <= hier_pwm_FAN_PWR_CTRL_6;
  SP7_FAN_PWR_CTRL_EN(0) <= xlconstant_0_dout(0);
  SP7_GNSS_KU_UART_RX <= hier_GNSS_en_SP7_GNSS_KU_UART_RX;
  SP7_GNSS_LS_UART_RX_1 <= SP7_GNSS_LS_UART_RX;
  SP7_GNSS_LS_UART_TX <= hier_GNSS_en_SP7_GNSS_LS_UART_TX;
  SP7_GNSS_RST_B <= hier_GNSS_en_SP7_GNSS_RST_B;
  SP7_GNSS_ZU_UART_RX <= hier_GNSS_en_SP7_GNSS_ZU_UART_RX;
  SP7_KU_QSPI_CFG_MAP <= hier_LS_Kintex_sel_dip_sync;
  SP7_KU_SPARE1N_CLKN_LVDS(0) <= hier_50MHz_OUT_SP7_KU_SPARE1N_CLKN_LVDS(0);
  SP7_KU_SPARE1P_CLKP_LVDS(0) <= hier_GNSS_en_SP7_KU_SPARE1P_CLKP_LVDS;
  SP7_LS_BST_EN_2V5(0) <= xlconstant_2_dout(0);
  SP7_LS_DDR_RESET_B <= hier_LS_OBUFT_SP7_LS_DDR_RESET_B;
  SP7_LS_EMMC_RESET_B <= hier_LS_OBUFT_SP7_LS_EMMC_RESET_B;
  SP7_LS_IRQ(0) <= xlconstant_2_dout(0);
  SP7_LS_NOR_PORESET <= hier_LS_OBUFT_SP7_LS_NOR_PORESET;
  SP7_LS_PORESET_CMD_2V5 <= hier_LS_OBUFT_SP7_LS_PORESET_CMD_2V5;
  SP7_LS_QSPI_CFG_MAP_2V5 <= hier_LS_QSPI_sel_dip_sync;
  SP7_LS_TA_PROG_SFP_EN_2V5(0) <= xlconstant_2_dout(0);
  SP7_MAIN_CLK_STAT <= hier_CLK_PG_CLK_PWR_PG;
  SP7_OCXO_INTB_EXT_REF(0) <= hier_0_vio_SP7_OCXO_INTB_EXT_REF(0);
  SP7_OSC_PWR_EN(0) <= xlconstant_2_dout1(0);
  SP7_PLL_PWR_EN <= MCU_MAIN_CLK_EN_1;
  SP7_PLL_SPI_CLK <= hier_pll_spi_obuft_SP7_PLL_SPI_CLK;
  SP7_PLL_SPI_SDIO <= hier_pll_spi_obuft_SP7_PLL_SPI_SDIO;
  SP7_PLL_STATUS <= hier_pll_SP7_PLL_STATUS;
  SP7_SPARE_LED_2(0) <= xlconstant_1_dout(0);
  SP7_SPARE_LED_3(0) <= hier_clock_measurments_ocxo_ld;
  SP7_SPARE_LED_4(0) <= hier_flash_microblaze_0_hier_microblaze_SP7_10M_SOURCE_SEL_n(0);
  SP7_ZU_3V3_GPIO_1(0) <= xlconstant_1_dout(0);
  SP7_ZU_3V3_GPIO_2(0) <= xlconstant_1_dout(0);
  SP7_ZU_3V3_GPIO_3(0) <= xlconstant_1_dout(0);
  SP7_ZU_3V3_GPIO_5(0) <= xlconstant_1_dout(0);
  SP7_ZU_MODE_SPARE_LED_1 <= hier_Zynq_mode_pin_dip_sync;
  SP7_ZU_QSPI_CFG_MAP_2V5 <= hier_LS_Zynq_sel_dip_sync;
  SP7_ZU_SPARE1N_CLKN_LVDS(0) <= hier_50MHz_OUT_SP7_ZU_SPARE1N_CLKN_LVDS(0);
  SP7_ZU_SPARE1P_CLKP_LVDS(0) <= hier_GNSS_en_SP7_ZU_SPARE1P_CLKP_LVDS;
  ZU_BOOT_STATUS_2V5_1 <= ZU_BOOT_STATUS_2V5;
  ZU_DONE_2V5_1 <= ZU_DONE_2V5;
  ZU_ERROR_OUT_2V5_1 <= ZU_ERROR_OUT_2V5;
  ZU_ERROR_STATUS_2V5_1 <= ZU_ERROR_STATUS_2V5;
  ZU_GNSS_1PPS <= hier_GNSS_en_ZU_GNSS_1PPS;
  ZU_SP7_DMCU_RESET_STAT <= hier_ZU_status_ZU_SP7_MCU_RESET_STAT;
  hier_flash_microblaze_0_spi_rtl_0_IO0_I <= spi_rtl_0_io0_i;
  hier_flash_microblaze_0_spi_rtl_0_IO1_I <= spi_rtl_0_io1_i;
  hier_flash_microblaze_0_spi_rtl_0_IO2_I <= spi_rtl_0_io2_i;
  hier_flash_microblaze_0_spi_rtl_0_IO3_I <= spi_rtl_0_io3_i;
  hier_flash_microblaze_0_spi_rtl_0_SS_I(0) <= spi_rtl_0_ss_i(0);
  spi_rtl_0_io0_o <= hier_flash_microblaze_0_spi_rtl_0_IO0_O;
  spi_rtl_0_io0_t <= hier_flash_microblaze_0_spi_rtl_0_IO0_T;
  spi_rtl_0_io1_o <= hier_flash_microblaze_0_spi_rtl_0_IO1_O;
  spi_rtl_0_io1_t <= hier_flash_microblaze_0_spi_rtl_0_IO1_T;
  spi_rtl_0_io2_o <= hier_flash_microblaze_0_spi_rtl_0_IO2_O;
  spi_rtl_0_io2_t <= hier_flash_microblaze_0_spi_rtl_0_IO2_T;
  spi_rtl_0_io3_o <= hier_flash_microblaze_0_spi_rtl_0_IO3_O;
  spi_rtl_0_io3_t <= hier_flash_microblaze_0_spi_rtl_0_IO3_T;
  spi_rtl_0_ss_o(0) <= hier_flash_microblaze_0_spi_rtl_0_SS_O(0);
  spi_rtl_0_ss_t <= hier_flash_microblaze_0_spi_rtl_0_SS_T;
  
DMCU_SPI_OBUFT: entity work.DMCU_SPI_OBUFT
     port map (
      DMCU_SP7_ZU_SPI_MISO => DMCU_SPI_OBUFT_DMCU_SP7_ZU_SPI_MISO,
      I => hier_SPI_regbank_MCU_FPGA_SPI_MISO,
      T => board_power_done_inv_1(0)
    );
    
LS_SPI_OBUFT: entity work.LS_SPI_OBUFT
     port map (
      LS_SPI_MISO => LS_SPI_OBUFT_LS_SPI_MISO,
      LS_SPI_MISO_I => hier_LS_SPI_LS_SPI_MISO,
      board_power_done_inv => board_power_done_inv_1(0)
    );
    
hier_0_vio: entity work.hier_0_vio
     port map (
      CLK_10M_DAC_SEL(0) => SP7_10M_CLK_DAC_SEL(0),
      CLK_10M_SOURCE_SP7_SEL(0) => NLW_hier_0_vio_CLK_10M_SOURCE_SP7_SEL_UNCONNECTED(0),
      CLK_REF_10M_EN_B(0) => hier_0_vio_CLK_REF_10M_EN_B(0),
      LOC_10M_OSC_SP7_ENABLE(0) => hier_0_vio_LOC_10M_OSC_SP7_ENABLE(0),
      MCU_MAIN_CLK_EN => MCU_MAIN_CLK_EN_1,
      MCU_OCXO_CLK_BUF_EN(0) => MCU_OCXO_CLK_BUF_EN_1(0),
      OCXO_EN(0) => hier_0_vio_OCXO_EN(0),
      SP7_AFE_VCXO_ENABLE(0) => hier_0_vio_SP7_AFE_VCXO_ENABLE(0),
      SP7_AUXB_PWR_EN(0) => hier_0_vio_SP7_AUXB_PWR_EN(0),
      SP7_AUXETH_PLL_HW_SW_CTRL(0) => \^sp7_auxeth_pll_hw_sw_ctrl\(0),
      SP7_AUXETH_PLL_RESET(0) => hier_0_vio_SP7_AUXETH_PLL_RESET(0),
      SP7_OCXO_INTB_EXT_REF(0) => hier_0_vio_SP7_OCXO_INTB_EXT_REF(0),
      VCTCXO_EN(0) => hier_0_vio_VCTCXO_EN(0),
      bus_struct_reset(0) => NLW_hier_0_vio_bus_struct_reset_UNCONNECTED(0),
      clk10 => clk10_1,
      clk50 => microblaze_0_Clk,
      dcm_locked => dcm_locked_1,
      mb_debug_sys_rst => hier_flash_microblaze_0_Debug_SYS_Rst,
      mb_reset => NLW_hier_0_vio_mb_reset_UNCONNECTED,
      reset10(0) => hier_0_vio_reset10(0),
      reset_50(0) => rst_1(0),
      resetn_10(0) => rstn_10_1(0),
      resetn_50(0) => rstn_50_1(0)
    );
hier_50MHz_OUT: entity work.hier_50MHz_OUT
     port map (
      SP7_KU_SPARE1N_CLKN_LVDS(0) => hier_50MHz_OUT_SP7_KU_SPARE1N_CLKN_LVDS(0),
      SP7_ZU_SPARE1N_CLKN_LVDS(0) => hier_50MHz_OUT_SP7_ZU_SPARE1N_CLKN_LVDS(0),
      clk100(0) => clk100_1,
      enable(0) => hier_BOARD_POWER_DONE_board_power_done
    );
hier_BOARD_POWER_DONE: entity work.hier_BOARD_POWER_DONE
     port map (
      MCU_OCXO_CLK_BUF_EN(0) => MCU_OCXO_CLK_BUF_EN_1(0),
      board_power_done => hier_BOARD_POWER_DONE_board_power_done,
      board_power_done_inv(0) => board_power_done_inv_1(0),
      clk50 => microblaze_0_Clk,
      rst => rst_1(0)
    );
hier_CLK_PG: entity work.hier_CLK_PG
     port map (
      CLK_PWR_PG => hier_CLK_PG_CLK_PWR_PG,
      CLK_PWR_PG_inv(0) => NLW_hier_CLK_PG_CLK_PWR_PG_inv_UNCONNECTED(0),
      P1_P2_P3_P4_O_V_OLD_VLD(7 downto 0) => P1_P2_P3_P4_O_V_OLD_VLD_1(7 downto 0),
      SP7_3V3_AFEPLL_PG => SP7_3V3_AFEPLL_PG_1,
      SP7_3V3_DIGPLL_PG => SP7_3V3_DIGPLL_PG_1,
      SP7_3V3_OCXO_PG => SP7_3V3_OCXO_PG_1,
      SP7_3V3_VCXO_PG => SP7_3V3_VCXO_PG_1,
      clk_50mhz => microblaze_0_Clk,
      config_OCXO_EN(0) => hier_0_vio_OCXO_EN(0),
      config_VCXO_EN(0) => hier_0_vio_SP7_AFE_VCXO_ENABLE(0),
      locked_ocxo(0) => hier_clock_measurments_ocxo_ld,
      locked_vctcxo(0) => hier_clock_measurments_vcxo_ld(0),
      rstn_50mhz => rstn_50_1(0)
    );
hier_GNSS_en: entity work.hier_GNSS_en
     port map (
      GNSS_1PPS => GNSS_1PPS_1,
      GNSS_TP2 => GNSS_TP2_1,
      GNSS_UART_RXD_SP7_TXD => hier_GNSS_en_GNSS_UART_RXD_SP7_TXD,
      GNSS_UART_TXD_SP7_RXD => GNSS_UART_TXD_SP7_RXD_1,
      INT_1PPS => hier_flash_microblaze_0_INT_PPS,
      KU_GNSS_1PPS => hier_GNSS_en_KU_GNSS_1PPS,
      LS_GNSS_1PPS => hier_GNSS_en_LS_GNSS_1PPS,
      LS_GNSS_TP2_GPIO => hier_GNSS_en_LS_GNSS_TP2_GPIO,
      SP7_GNSS_KU_UART_RX => hier_GNSS_en_SP7_GNSS_KU_UART_RX,
      SP7_GNSS_LS_UART_RX => SP7_GNSS_LS_UART_RX_1,
      SP7_GNSS_LS_UART_TX => hier_GNSS_en_SP7_GNSS_LS_UART_TX,
      SP7_GNSS_RST_B => hier_GNSS_en_SP7_GNSS_RST_B,
      SP7_GNSS_ZU_UART_RX => hier_GNSS_en_SP7_GNSS_ZU_UART_RX,
      SP7_KU_SPARE1P_CLKP_LVDS => hier_GNSS_en_SP7_KU_SPARE1P_CLKP_LVDS,
      SP7_ZU_SPARE1P_CLKP_LVDS => hier_GNSS_en_SP7_ZU_SPARE1P_CLKP_LVDS,
      ZU_GNSS_1PPS => hier_GNSS_en_ZU_GNSS_1PPS,
      board_power_done_inv => board_power_done_inv_1(0),
      clk50 => microblaze_0_Clk,
      clk_pwr_pg => hier_CLK_PG_CLK_PWR_PG,
      rst50 => rst_1(0)
    );
hier_LS_Kintex_sel: entity work.hier_LS_Kintex_sel
     port map (
      CLK50 => microblaze_0_Clk,
      RST50 => rst_1(0),
      SP7_DIP_SW => SP7_DIP_SW_21_1,
      dip_sync => hier_LS_Kintex_sel_dip_sync
    );
hier_LS_OBUFT: entity work.hier_LS_OBUFT
     port map (
      LS_SP7_MCU_RESET_STAT => hier_LS_OBUFT_SP7_SPARE_LED_1,
      SP7_DDR_RESET_B_i => hier_LS_reset_SP7_LS_DDR_RESET_B,
      SP7_LS_DDR_RESET_B => hier_LS_OBUFT_SP7_LS_DDR_RESET_B,
      SP7_LS_EMMC_RESET_B => hier_LS_OBUFT_SP7_LS_EMMC_RESET_B,
      SP7_LS_EMMC_RESET_B_i => hier_LS_reset_SP7_LS_EMMC_RESET_B,
      SP7_LS_NOR_PORESET => hier_LS_OBUFT_SP7_LS_NOR_PORESET,
      SP7_LS_NOR_PORESET_i => hier_LS_reset_SP7_LS_NOR_PORESET,
      SP7_LS_PORESET_CMD => SP7_LS_reset_0_SP7_LS_PORESET_CMD,
      SP7_LS_PORESET_CMD_2V5 => hier_LS_OBUFT_SP7_LS_PORESET_CMD_2V5,
      SP7_MCU_RESET_STAT_i => hier_LS_reset_SP7_SPARE_LED_1,
      board_power_done_inv => board_power_done_inv_1(0)
    );
hier_LS_QSPI_sel: entity work.hier_LS_QSPI_sel
     port map (
      CLK50 => microblaze_0_Clk,
      RST50 => rst_1(0),
      SP7_DIP_SW => SP7_DIP_SW_11_1,
      dip_sync => hier_LS_QSPI_sel_dip_sync
    );
hier_LS_SPI: entity work.hier_LS_SPI
     port map (
      LS_SP7_SPI_CS1 => LS_SP7_SPI_CS1_1,
      LS_SPI_CLK => LS_SPI_CLK_1,
      LS_SPI_MISO => hier_LS_SPI_LS_SPI_MISO,
      LS_SPI_MOSI => LS_SPI_MOSI_1,
      P1_P2_P3_P4_O_V_OLD_VLD(7 downto 0) => P1_P2_P3_P4_O_V_OLD_VLD_1(7 downto 0),
      clk_10Mhz => clk10_1,
      clk_lkd(3 downto 0) => clk_lkd_1(3 downto 0),
      ctrl_reg3(7 downto 0) => hier_LS_SPI_ctrl_reg3(7 downto 0),
      flash_upgrade_start(7 downto 0) => hier_LS_SPI_flash_upgrade_start(7 downto 0),
      raddress(31 downto 0) => hier_LS_SPI_raddress(31 downto 0),
      rdata(31 downto 0) => hier_flash_microblaze_0_rdata(31 downto 0),
      rstn_10mhz => rstn_10_1(0),
      sta_reg1(7 downto 0) => hier_flash_microblaze_0_sta(7 downto 0),
      waddress(31 downto 0) => hier_LS_SPI_waddress(31 downto 0),
      wdata(31 downto 0) => hier_LS_SPI_wdata(31 downto 0),
      zu_ctrl(7 downto 0) => NLW_hier_LS_SPI_zu_ctrl_UNCONNECTED(7 downto 0)
    );
hier_LS_SPI_MISO_IOBUF: entity work.hier_LS_SPI_MISO_IOBUF
     port map (
      LS_SP7_SPI_CS1(0) => LS_SP7_SPI_CS1_1,
      LS_SPI_MISO => LS_SPI_MISO,
      LS_SPI_MISO_I => LS_SPI_OBUFT_LS_SPI_MISO
    );
hier_LS_Zynq_sel: entity work.hier_LS_Zynq_sel
     port map (
      CLK50 => microblaze_0_Clk,
      RST50 => rst_1(0),
      SP7_DIP_SW => SP7_DIP_SW_12_1,
      dip_sync => hier_LS_Zynq_sel_dip_sync
    );
hier_LS_reset: entity work.hier_LS_reset
     port map (
      LS_PWRSEQ_RST_OUT_B_1V8 => LS_PWRSEQ_RST_OUT_B_1V8_1,
      LS_SP7_ASLEEP => LS_SP7_ASLEEP_1,
      LS_SP7_HRESET_B => LS_SP7_HRESET_B_1,
      LS_SP7_RESET_REQ_B => LS_SP7_RESET_REQ_B_1,
      MCU_LS_PORESET_CMD => MCU_LS_PORESET_CMD_1,
      SP7_LS_DDR_RESET_B => hier_LS_reset_SP7_LS_DDR_RESET_B,
      SP7_LS_EMMC_RESET_B => hier_LS_reset_SP7_LS_EMMC_RESET_B,
      SP7_LS_NOR_PORESET => hier_LS_reset_SP7_LS_NOR_PORESET,
      SP7_LS_PORESET_CMD_2V5 => SP7_LS_reset_0_SP7_LS_PORESET_CMD,
      SP7_MCU_RESET_STAT_o => hier_LS_reset_SP7_SPARE_LED_1,
      clk_50mhz => microblaze_0_Clk,
      rstn_50mhz => rstn_50_1(0)
    );
hier_MCU_SPI: entity work.hier_MCU_SPI
     port map (
      MCU_PLL_SPI_CLK => DMCU_SP7_PMCU_SPI_CLK_1,
      MCU_PLL_SPI_SDIO => DMCU_SP7_PMCU_SPI_MOSI_1,
      MCU_SP7_PMCU_SPI_AFE_PLL_CS2 => MCU_SP7_PMCU_SPI_AFE_PLL_CS2_1,
      MCU_SP7_PMCU_SPI_AFE_PLL_CS2_2V5 => hier_MCU_SPI_MCU_SP7_PMCU_SPI_AFE_PLL_CS2_2V5,
      MCU_SP7_PMCU_SPI_DIG_PLL_CS1 => MCU_SP7_PMCU_SPI_DIG_PLL_CS1_1,
      MCU_SP7_PMCU_SPI_DIG_PLL_CS1_2V5 => hier_MCU_SPI_MCU_SP7_PMCU_SPI_DIG_PLL_CS1_2V5,
      SP7_PLL4_SPI_SCK_2V5 => hier_MCU_SPI_SP7_PLL4_SPI_SCK_2V5,
      SP7_PLL_SPI_SDIO_o => hier_MCU_SPI_SP7_PLL_SPI_SDIO_o,
      clk_10mhz => clk10_1,
      rstn_10mhz => rstn_10_1(0)
    );
hier_SPI_regbank: entity work.hier_SPI_regbank
     port map (
      MCU_FPGA_SPI_MISO => hier_SPI_regbank_MCU_FPGA_SPI_MISO,
      MCU_FPGA_SPI_MOSI => DMCU_SP7_ZU_SPI_MOSI_1,
      MCU_FPGA_SPI_SCK => DMCU_SP7_ZU_SPI_SCK_1,
      MCU_FPGA_SPI_SP7_CS => DMCU_DEV_SPI_SP7_CS_1,
      clk_10Mhz => clk10_1,
      ctrl_reg1(7 downto 0) => hier_SPI_regbank_ctrl_reg1(7 downto 0),
      ctrl_reg2(7 downto 0) => hier_SPI_regbank_ctrl_reg2(7 downto 0),
      ctrl_reg3(7 downto 0) => hier_SPI_regbank_ctrl_reg3(7 downto 0),
      ctrl_reg4(7 downto 0) => hier_SPI_regbank_ctrl_reg4(7 downto 0),
      ctrl_reg5(7 downto 0) => hier_SPI_regbank_ctrl_reg5(7 downto 0),
      ctrl_reg6(7 downto 0) => hier_SPI_regbank_ctrl_reg6(7 downto 0),
      rstn_10mhz => rstn_10_1(0)
    );
hier_ZU_status: entity work.hier_ZU_status
     port map (
      ZU_BOOT_STATUS_2V5(0) => ZU_BOOT_STATUS_2V5_1,
      ZU_DONE_2V5 => ZU_DONE_2V5_1,
      ZU_ERROR_OUT_2V5(0) => ZU_ERROR_OUT_2V5_1,
      ZU_ERROR_STATUS_2V5(0) => ZU_ERROR_STATUS_2V5_1,
      ZU_SP7_MCU_RESET_STAT => hier_ZU_status_ZU_SP7_MCU_RESET_STAT,
      clk50 => microblaze_0_Clk,
      rst50 => rst_1(0)
    );
hier_Zynq_mode_pin: entity work.hier_Zynq_mode_pin
     port map (
      CLK50 => microblaze_0_Clk,
      RST50 => rst_1(0),
      SP7_DIP_SW => SP7_DIP_SW_22_1,
      dip_sync => hier_Zynq_mode_pin_dip_sync
    );
hier_clock_measurments: entity work.hier_clock_measurments
     port map (
      SP7_10MHZ_LVDS_CLK_IN_N => SP7_10MHZ_LVDS_CLK_IN_N_1,
      SP7_10MHZ_LVDS_CLK_IN_P => SP7_10MHZ_LVDS_CLK_IN_P_1,
      SP7_AFE_VCXO_LVDS_CLK_IN_N => AFE_VCXO_SP7_122M88_CLK_LVDS_N_1,
      SP7_AFE_VCXO_LVDS_CLK_IN_P => AFE_VCXO_SP7_122M88_CLK_LVDS_P_1,
      clk50 => microblaze_0_Clk,
      clk_10m(0) => hier_clock_measurments_clk_10m(0),
      ocxo_ld => hier_clock_measurments_ocxo_ld,
      rstn_50 => rstn_50_1(0),
      vcxo_ld(0) => hier_clock_measurments_vcxo_ld(0)
    );
hier_flash_microblaze_0: component sp7_cal3_hier_flash_microblaze_0_1
     port map (
      ARESETN => rstn_50_1(0),
      Clk => microblaze_0_Clk,
      Debug_SYS_Rst => hier_flash_microblaze_0_Debug_SYS_Rst,
      GNSS_1PPS => GNSS_1PPS_1,
      INT_PPS => hier_flash_microblaze_0_INT_PPS,
      Reset => rst_1(0),
      SP7_10M_CLK_DAC_RESET => hier_flash_microblaze_0_SP7_10M_CLK_DAC_RESET,
      SP7_10M_CLK_DAC_SCLK => hier_flash_microblaze_0_SP7_10M_CLK_DAC_SCLK,
      SP7_10M_CLK_DAC_SDIN => hier_flash_microblaze_0_SP7_10M_CLK_DAC_SDIN,
      SP7_10M_CLK_DAC_SYNC => hier_flash_microblaze_0_SP7_10M_CLK_DAC_SYNC,
      SP7_10M_SOURCE_SEL(0) => hier_flash_microblaze_0_SP7_10M_SOURCE_SEL(0),
      SP7_DBG_UART_RX => SP7_DBG_UART_RX_1,
      SP7_DBG_UART_TX => hier_flash_microblaze_0_SP7_DBG_UART_TX,
      ap_clk => clk10_1,
      ap_rst_n => rstn_10_1(0),
      clk_10_in => hier_clock_measurments_clk_10m(0),
      cmd(7 downto 0) => hier_LS_SPI_ctrl_reg3(7 downto 0),
      dcm_locked => dcm_locked_1,
      flash_upgrade_start(7 downto 0) => hier_LS_SPI_flash_upgrade_start(7 downto 0),
      hier_microblaze_SP7_10M_SOURCE_SEL_n(0) => hier_flash_microblaze_0_hier_microblaze_SP7_10M_SOURCE_SEL_n(0),
      radd(31 downto 0) => hier_LS_SPI_raddress(31 downto 0),
      rdata(31 downto 0) => hier_flash_microblaze_0_rdata(31 downto 0),
      spi_rtl_0_io0_i => hier_flash_microblaze_0_spi_rtl_0_IO0_I,
      spi_rtl_0_io0_o => hier_flash_microblaze_0_spi_rtl_0_IO0_O,
      spi_rtl_0_io0_t => hier_flash_microblaze_0_spi_rtl_0_IO0_T,
      spi_rtl_0_io1_i => hier_flash_microblaze_0_spi_rtl_0_IO1_I,
      spi_rtl_0_io1_o => hier_flash_microblaze_0_spi_rtl_0_IO1_O,
      spi_rtl_0_io1_t => hier_flash_microblaze_0_spi_rtl_0_IO1_T,
      spi_rtl_0_io2_i => hier_flash_microblaze_0_spi_rtl_0_IO2_I,
      spi_rtl_0_io2_o => hier_flash_microblaze_0_spi_rtl_0_IO2_O,
      spi_rtl_0_io2_t => hier_flash_microblaze_0_spi_rtl_0_IO2_T,
      spi_rtl_0_io3_i => hier_flash_microblaze_0_spi_rtl_0_IO3_I,
      spi_rtl_0_io3_o => hier_flash_microblaze_0_spi_rtl_0_IO3_O,
      spi_rtl_0_io3_t => hier_flash_microblaze_0_spi_rtl_0_IO3_T,
      spi_rtl_0_ss_i(0) => hier_flash_microblaze_0_spi_rtl_0_SS_I(0),
      spi_rtl_0_ss_o(0) => hier_flash_microblaze_0_spi_rtl_0_SS_O(0),
      spi_rtl_0_ss_t => hier_flash_microblaze_0_spi_rtl_0_SS_T,
      sta(7 downto 0) => hier_flash_microblaze_0_sta(7 downto 0),
      wadd(31 downto 0) => hier_LS_SPI_waddress(31 downto 0),
      wdata(31 downto 0) => hier_LS_SPI_wdata(31 downto 0)
    );
hier_ldo: entity work.hier_ldo
     port map (
      LOC_10M_OSC_SP7_ENABLE1 => hier_ldo_LOC_10M_OSC_SP7_ENABLE1,
      LOC_10M_OSC_SP7_ENABLE_i => hier_0_vio_LOC_10M_OSC_SP7_ENABLE(0),
      MCU_MAIN_CLK_EN => MCU_MAIN_CLK_EN_1,
      OCXO_3V3_EN => hier_ldo_OCXO_3V3_EN,
      OCXO_CLK_BUF_ENB => hier_ldo_OCXO_CLK_BUF_ENB,
      SP7_AFE_VCXO_ENABLE => hier_ldo_SP7_AFE_VCXO_ENABLE1,
      SP7_AFE_VCXO_ENABLE_i => hier_0_vio_SP7_AFE_VCXO_ENABLE(0),
      clk10 => clk10_1,
      config_OCXO_EN => hier_0_vio_OCXO_EN(0),
      config_VCTCXO_EN => hier_0_vio_VCTCXO_EN(0),
      rst_10 => hier_0_vio_reset10(0),
      rstn_10 => rstn_10_1(0)
    );
hier_pll: entity work.hier_pll
     port map (
      AFEPLL_CLKSEL(0) => hier_pll_AFEPLL_CLKSEL(0),
      AFE_PLL3_LOCK_STAT => AFE_PLL_SP7_LOCK_STAT_1,
      DIGPLL_CLKSEL(0) => hier_pll_DIGPLL_CLKSEL(0),
      DIGPLL_LOCK_STAT => DIG_PLL_SP7_LOCK_STAT_1,
      MCU_PLL_RESETB => MCU_PLL_RESETB_1,
      MCU_PLL_SYNC => '0',
      SP7_AFEPLL_RESETB => hier_pll_SP7_AFEPLL_RESETB,
      SP7_AFEPLL_SYNC => hier_pll_SP7_AFEPLL_SYNC,
      SP7_DIGPLL_RESETB => hier_pll_SP7_DIGPLL_RESETB,
      SP7_DIGPLL_SYNC => hier_pll_SP7_DIGPLL_SYNC,
      SP7_PLL_STATUS => hier_pll_SP7_PLL_STATUS,
      STA_REG_o(3 downto 0) => NLW_hier_pll_STA_REG_o_UNCONNECTED(3 downto 0),
      clk_50mhz => microblaze_0_Clk,
      clk_lkd(3 downto 0) => clk_lkd_1(3 downto 0),
      clk_pwr_pg_i => '0',
      rstn_50mhz => rstn_50_1(0)
    );
hier_pll_spi_obuft: entity work.hier_pll_spi_obuft
     port map (
      MCU_SP7_PMCU_SPI_AFE_PLL_CS2_2V5_i => hier_MCU_SPI_MCU_SP7_PMCU_SPI_AFE_PLL_CS2_2V5,
      MCU_SP7_PMCU_SPI_DIG_PLL_CS1_2V5_i => hier_MCU_SPI_MCU_SP7_PMCU_SPI_DIG_PLL_CS1_2V5,
      SP7_AFE_PLL_SPI_CS1 => hier_pll_spi_obuft_SP7_AFE_PLL_SPI_CS1,
      SP7_DIG_PLL_SPI_CS0 => hier_pll_spi_obuft_SP7_DIG_PLL_SPI_CS0,
      SP7_PLL_SPI_CLK => hier_pll_spi_obuft_SP7_PLL_SPI_CLK,
      SP7_PLL_SPI_CLK_I => hier_MCU_SPI_SP7_PLL4_SPI_SCK_2V5,
      SP7_PLL_SPI_SDIO => hier_pll_spi_obuft_SP7_PLL_SPI_SDIO,
      SP7_PLL_SPI_SDIO_i => hier_MCU_SPI_SP7_PLL_SPI_SDIO_o,
      board_pwr_done_inv => board_power_done_inv_1(0)
    );
hier_pwm: entity work.hier_pwm
     port map (
      FAN_PWR_CTRL_1 => hier_pwm_FAN_PWR_CTRL_1,
      FAN_PWR_CTRL_2 => hier_pwm_FAN_PWR_CTRL_2,
      FAN_PWR_CTRL_3 => hier_pwm_FAN_PWR_CTRL_3,
      FAN_PWR_CTRL_4 => hier_pwm_FAN_PWR_CTRL_4,
      FAN_PWR_CTRL_5 => hier_pwm_FAN_PWR_CTRL_5,
      FAN_PWR_CTRL_6 => hier_pwm_FAN_PWR_CTRL_6,
      MCU_FAN_CTRL => DMCU_FAN_CTRL_1,
      clk_6p4 => clk_6p4_1,
      duty_cycle(7 downto 0) => hier_SPI_regbank_ctrl_reg1(7 downto 0),
      duty_cycle1(7 downto 0) => hier_SPI_regbank_ctrl_reg2(7 downto 0),
      duty_cycle2(7 downto 0) => hier_SPI_regbank_ctrl_reg3(7 downto 0),
      duty_cycle3(7 downto 0) => hier_SPI_regbank_ctrl_reg4(7 downto 0),
      duty_cycle4(7 downto 0) => hier_SPI_regbank_ctrl_reg5(7 downto 0),
      duty_cycle5(7 downto 0) => hier_SPI_regbank_ctrl_reg6(7 downto 0),
      rstn50 => rstn_50_1(0)
    );
    
io_buf_0: component io_buf
     port map (
      I => xlconstant_3_dout(0),
      IO => SP7_AUXETH_PLL_HW_SW_CTRL,
      O => NLW_io_buf_0_O_UNCONNECTED,
      T => \^sp7_auxeth_pll_hw_sw_ctrl\(0)
    );
    
mmcm_50Mhz: component sp7_cal3_mmcm_50Mhz_0
     port map (
      clk_10 => clk10_1,
      clk_100 => clk100_1,
      clk_50 => microblaze_0_Clk,
      clk_6p4 => clk_6p4_1,
      clk_in1 => SP7_50MHZ_OSC_INPUT_1,
      clkfb_in => mmcm_50Mhz_clkfb_out,
      clkfb_out => mmcm_50Mhz_clkfb_out,
      locked => dcm_locked_1
    );
    
pll_obut: entity work.pll_obut
     port map (
      AFEPLL_CLKSEL => pll_obut_AFEPLL_CLKSEL,
      AFEPLL_CLKSEL_i => hier_pll_AFEPLL_CLKSEL(0),
      DIGPLL_CLKSEL => pll_obut_DIGPLL_CLKSEL,
      DIGPLL_CLKSEL_i => hier_pll_DIGPLL_CLKSEL(0),
      SP7_AFEPLL_RESETB => pll_obut_SP7_AFEPLL_RESETB,
      SP7_AFEPLL_RESETB_i => hier_pll_SP7_AFEPLL_RESETB,
      SP7_AFEPLL_SYNC => pll_obut_SP7_AFEPLL_SYNC,
      SP7_AFEPLL_SYNC_i => hier_pll_SP7_AFEPLL_SYNC,
      SP7_DIGPLL_RESETB => pll_obut_SP7_DIGPLL_RESETB,
      SP7_DIGPLL_RESETB_i => hier_pll_SP7_DIGPLL_RESETB,
      SP7_DIGPLL_SYNC => pll_obut_SP7_DIGPLL_SYNC,
      SP7_DIGPLL_SYNC_i => hier_pll_SP7_DIGPLL_SYNC,
      board_power_done_inv => board_power_done_inv_1(0)
    );

end STRUCTURE;
