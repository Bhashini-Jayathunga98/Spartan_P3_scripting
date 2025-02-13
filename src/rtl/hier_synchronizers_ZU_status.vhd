library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_synchronizers_ZU_status is
  port (
    ZU_BOOT_STATUS_2V5 : in STD_LOGIC;
    ZU_BOOT_STATUS_2V5_o : out STD_LOGIC;
    ZU_DONE_2V5 : in STD_LOGIC;
    ZU_DONE_2V5_o : out STD_LOGIC;
    ZU_ERROR_OUT_2V5 : in STD_LOGIC;
    ZU_ERROR_OUT_2V5_o : out STD_LOGIC;
    ZU_ERROR_STATUS_2V5 : in STD_LOGIC;
    ZU_ERROR_STATUS_2V5_o : out STD_LOGIC;
    clk50 : in STD_LOGIC;
    rst50 : in STD_LOGIC
  );
end hier_synchronizers_ZU_status;

architecture STRUCTURE of hier_synchronizers_ZU_status is

  signal ZU_BOOT_STATUS_2V5_1 : STD_LOGIC;
  signal ZU_DONE_2V5_1 : STD_LOGIC;
  signal ZU_ERROR_OUT_2V5_1 : STD_LOGIC;
  signal ZU_ERROR_STATUS_2V5_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal hier_sync1_Q : STD_LOGIC;
  signal hier_sync2_Q : STD_LOGIC;
  signal hier_sync3_Q : STD_LOGIC;
  signal hier_sync_Q : STD_LOGIC;
  signal rst_1 : STD_LOGIC;
  
begin

  ZU_BOOT_STATUS_2V5_1 <= ZU_BOOT_STATUS_2V5;
  ZU_BOOT_STATUS_2V5_o <= hier_sync1_Q;
  ZU_DONE_2V5_1 <= ZU_DONE_2V5;
  ZU_DONE_2V5_o <= hier_sync_Q;
  ZU_ERROR_OUT_2V5_1 <= ZU_ERROR_OUT_2V5;
  ZU_ERROR_OUT_2V5_o <= hier_sync2_Q;
  ZU_ERROR_STATUS_2V5_1 <= ZU_ERROR_STATUS_2V5;
  ZU_ERROR_STATUS_2V5_o <= hier_sync3_Q;
  clk_1 <= clk50;
  rst_1 <= rst50;
  
hier_sync: entity work.hier_sync
     port map (
      D => ZU_DONE_2V5_1,
      Q => hier_sync_Q,
      clk => clk_1,
      rst => rst_1
    );
hier_sync1: entity work.hier_sync
     port map (
      D => ZU_BOOT_STATUS_2V5_1,
      Q => hier_sync1_Q,
      clk => clk_1,
      rst => rst_1
    );
hier_sync2: entity work.hier_sync
     port map (
      D => ZU_ERROR_OUT_2V5_1,
      Q => hier_sync2_Q,
      clk => clk_1,
      rst => rst_1
    );
hier_sync3: entity work.hier_sync
     port map (
      D => ZU_ERROR_STATUS_2V5_1,
      Q => hier_sync3_Q,
      clk => clk_1,
      rst => rst_1
    );
end STRUCTURE;