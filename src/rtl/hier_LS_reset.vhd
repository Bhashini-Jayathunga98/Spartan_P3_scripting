library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_LS_reset is
  port (
    LS_PWRSEQ_RST_OUT_B_1V8 : in STD_LOGIC;
    LS_SP7_ASLEEP : in STD_LOGIC;
    LS_SP7_HRESET_B : in STD_LOGIC;
    LS_SP7_RESET_REQ_B : in STD_LOGIC;
    MCU_LS_PORESET_CMD : in STD_LOGIC;
    SP7_LS_DDR_RESET_B : out STD_LOGIC;
    SP7_LS_EMMC_RESET_B : out STD_LOGIC;
    SP7_LS_NOR_PORESET : out STD_LOGIC;
    SP7_LS_PORESET_CMD_2V5 : out STD_LOGIC;
    SP7_MCU_RESET_STAT_o : out STD_LOGIC;
    clk_50mhz : in STD_LOGIC;
    rstn_50mhz : in STD_LOGIC
  );
end hier_LS_reset;

architecture STRUCTURE of hier_LS_reset is

  component sp7_LS_reset is
  port (
    clk_50mhz : in STD_LOGIC;
    rstn_50mhz : in STD_LOGIC;
    MCU_LS_PORESET_CMD : in STD_LOGIC;
    LS_SP7_MCU_RESET_STAT : out STD_LOGIC;
    LS_PWRSEQ_RST_OUT_B_1V8 : in STD_LOGIC;
    SP7_LS_PORESET_CMD : out STD_LOGIC;
    SP7_LS_NOR_PORESET : out STD_LOGIC;
    LS_SP7_RESET_REQ_B : in STD_LOGIC;
    LS_SP7_ASLEEP : in STD_LOGIC;
    LS_SP7_HRESET_B : in STD_LOGIC;
    LS_EMMC_RESET_B : out STD_LOGIC;
    LS_DDR_RESET_B : out STD_LOGIC
  );
  end component;
  
  signal SP7_LS_PORESET_CMD : STD_LOGIC;
  signal SP7_MCU_RESET_STAT : STD_LOGIC;
  signal mmcm_50Mhz_clk_50 : STD_LOGIC;
  signal rstn : STD_LOGIC;
  
begin

  SP7_LS_PORESET_CMD_2V5 <= SP7_LS_PORESET_CMD;
  SP7_MCU_RESET_STAT_o <= SP7_MCU_RESET_STAT;
  mmcm_50Mhz_clk_50 <= clk_50mhz;
  rstn <= rstn_50mhz;
  
SP7_LS_reset_0: component sp7_LS_reset
     port map (
      LS_DDR_RESET_B => SP7_LS_DDR_RESET_B,
      LS_EMMC_RESET_B => SP7_LS_EMMC_RESET_B,
      LS_PWRSEQ_RST_OUT_B_1V8 => LS_PWRSEQ_RST_OUT_B_1V8,
      LS_SP7_ASLEEP => LS_SP7_ASLEEP,
      LS_SP7_HRESET_B => LS_SP7_HRESET_B,
      LS_SP7_MCU_RESET_STAT => SP7_MCU_RESET_STAT,
      LS_SP7_RESET_REQ_B => LS_SP7_RESET_REQ_B,
      MCU_LS_PORESET_CMD => MCU_LS_PORESET_CMD,
      SP7_LS_NOR_PORESET => SP7_LS_NOR_PORESET,
      SP7_LS_PORESET_CMD => SP7_LS_PORESET_CMD,
      clk_50mhz => mmcm_50Mhz_clk_50,
      rstn_50mhz => rstn
    );
    
end STRUCTURE;