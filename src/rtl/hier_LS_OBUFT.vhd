library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_LS_OBUFT is
  port (
    LS_SP7_MCU_RESET_STAT : out STD_LOGIC;
    SP7_DDR_RESET_B_i : in STD_LOGIC;
    SP7_LS_DDR_RESET_B : out STD_LOGIC;
    SP7_LS_EMMC_RESET_B : out STD_LOGIC;
    SP7_LS_EMMC_RESET_B_i : in STD_LOGIC;
    SP7_LS_NOR_PORESET : out STD_LOGIC;
    SP7_LS_NOR_PORESET_i : in STD_LOGIC;
    SP7_LS_PORESET_CMD : in STD_LOGIC;
    SP7_LS_PORESET_CMD_2V5 : out STD_LOGIC;
    SP7_MCU_RESET_STAT_i : in STD_LOGIC;
    board_power_done_inv : in STD_LOGIC
  );
end hier_LS_OBUFT;

architecture STRUCTURE of hier_LS_OBUFT is

  component o_buft is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC
  );
  end component;
  
  signal SP7_LS_reset_0_LS_DDR_RESET_B : STD_LOGIC;
  signal SP7_LS_reset_0_LS_EMMC_RESET_B : STD_LOGIC;
  signal SP7_LS_reset_0_LS_SP7_MCU_RESET_STAT : STD_LOGIC;
  signal SP7_LS_reset_0_SP7_LS_NOR_PORESET : STD_LOGIC;
  signal SP7_LS_reset_0_SP7_LS_PORESET_CMD : STD_LOGIC;
  signal hier_BOARD_POWER_DONE_board_power_done_inv : STD_LOGIC;
  signal o_buft_0_O2 : STD_LOGIC;
  signal o_buft_1_O1 : STD_LOGIC;
  signal o_buft_2_O2 : STD_LOGIC;
  signal o_buft_3_O2 : STD_LOGIC;
  signal o_buft_4_O2 : STD_LOGIC;
  
begin

  LS_SP7_MCU_RESET_STAT <= o_buft_0_O2;
  SP7_LS_DDR_RESET_B <= o_buft_4_O2;
  SP7_LS_EMMC_RESET_B <= o_buft_3_O2;
  SP7_LS_NOR_PORESET <= o_buft_2_O2;
  SP7_LS_PORESET_CMD_2V5 <= o_buft_1_O1;
  SP7_LS_reset_0_LS_DDR_RESET_B <= SP7_DDR_RESET_B_i;
  SP7_LS_reset_0_LS_EMMC_RESET_B <= SP7_LS_EMMC_RESET_B_i;
  SP7_LS_reset_0_LS_SP7_MCU_RESET_STAT <= SP7_MCU_RESET_STAT_i;
  SP7_LS_reset_0_SP7_LS_NOR_PORESET <= SP7_LS_NOR_PORESET_i;
  SP7_LS_reset_0_SP7_LS_PORESET_CMD <= SP7_LS_PORESET_CMD;
  hier_BOARD_POWER_DONE_board_power_done_inv <= board_power_done_inv;
  
o_buft_0: component o_buft
     port map (
      I => SP7_LS_reset_0_LS_SP7_MCU_RESET_STAT,
      O => o_buft_0_O2,
      T => hier_BOARD_POWER_DONE_board_power_done_inv
    );
o_buft_1: component o_buft
     port map (
      I => SP7_LS_reset_0_SP7_LS_PORESET_CMD,
      O => o_buft_1_O1,
      T => hier_BOARD_POWER_DONE_board_power_done_inv
    );
o_buft_2: component o_buft
     port map (
      I => SP7_LS_reset_0_SP7_LS_NOR_PORESET,
      O => o_buft_2_O2,
      T => hier_BOARD_POWER_DONE_board_power_done_inv
    );
o_buft_3: component o_buft
     port map (
      I => SP7_LS_reset_0_LS_EMMC_RESET_B,
      O => o_buft_3_O2,
      T => hier_BOARD_POWER_DONE_board_power_done_inv
    );
o_buft_4: component o_buft
     port map (
      I => SP7_LS_reset_0_LS_DDR_RESET_B,
      O => o_buft_4_O2,
      T => hier_BOARD_POWER_DONE_board_power_done_inv
    );
end STRUCTURE;