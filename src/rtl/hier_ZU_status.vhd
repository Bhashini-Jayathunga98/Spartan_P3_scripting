library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_ZU_status is
  port (
    ZU_BOOT_STATUS_2V5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    ZU_DONE_2V5 : in STD_LOGIC;
    ZU_ERROR_OUT_2V5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    ZU_ERROR_STATUS_2V5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    ZU_SP7_MCU_RESET_STAT : out STD_LOGIC;
    clk50 : in STD_LOGIC;
    rst50 : in STD_LOGIC
  );
end hier_ZU_status;

architecture STRUCTURE of hier_ZU_status is

  component sp7_cal3_vio_ZU_status_0 is
  port (
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_vio_ZU_status_0;
  
  component utility_dff is
  port (
    Q : out STD_LOGIC;
    C : in STD_LOGIC;
    CE : in STD_LOGIC;
    D : in STD_LOGIC;
    R : in STD_LOGIC
  );
  end component utility_dff;
  
  signal ZU_BOOT_STATUS_2V5_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ZU_BOOT_STATUS_2V5_o : STD_LOGIC;
  signal ZU_DONE_2V5_1 : STD_LOGIC;
  signal ZU_DONE_2V5_o : STD_LOGIC;
  signal ZU_ERROR_OUT_2V5_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ZU_ERROR_OUT_2V5_o : STD_LOGIC;
  signal ZU_ERROR_STATUS_2V5_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal ZU_ERROR_STATUS_2V5_o : STD_LOGIC;
  signal \^zu_sp7_mcu_reset_stat\ : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal rst_1 : STD_LOGIC;
  signal util_vector_logic_0_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_1_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  signal util_vector_logic_2_Res : STD_LOGIC_VECTOR ( 0 to 0 );
  
begin

  ZU_BOOT_STATUS_2V5_1(0) <= ZU_BOOT_STATUS_2V5(0);
  ZU_DONE_2V5_1 <= ZU_DONE_2V5;
  ZU_ERROR_OUT_2V5_1(0) <= ZU_ERROR_OUT_2V5(0);
  ZU_ERROR_STATUS_2V5_1(0) <= ZU_ERROR_STATUS_2V5(0);
  ZU_SP7_MCU_RESET_STAT <= \^zu_sp7_mcu_reset_stat\;
  clk_1 <= clk50;
  rst_1 <= rst50;
  
hier_synchronizers: entity work.hier_synchronizers_ZU_status
     port map (
      ZU_BOOT_STATUS_2V5 => ZU_BOOT_STATUS_2V5_1(0),
      ZU_BOOT_STATUS_2V5_o => ZU_BOOT_STATUS_2V5_o,
      ZU_DONE_2V5 => ZU_DONE_2V5_1,
      ZU_DONE_2V5_o => ZU_DONE_2V5_o,
      ZU_ERROR_OUT_2V5 => ZU_ERROR_OUT_2V5_1(0),
      ZU_ERROR_OUT_2V5_o => ZU_ERROR_OUT_2V5_o,
      ZU_ERROR_STATUS_2V5 => ZU_ERROR_STATUS_2V5_1(0),
      ZU_ERROR_STATUS_2V5_o => ZU_ERROR_STATUS_2V5_o,
      clk50 => clk_1,
      rst50 => rst_1
    );
    
util_vector_logic_0_Res(0) <=  util_vector_logic_2_Res(0) AND ZU_ERROR_STATUS_2V5_o;

util_vector_logic_1_Res(0) <= util_vector_logic_0_Res(0) AND ZU_BOOT_STATUS_2V5_o;

util_vector_logic_2_Res(0) <= NOT ZU_ERROR_OUT_2V5_o;

utility_dff_0: component utility_dff
     port map (
      C => clk_1,
      CE => ZU_DONE_2V5_o,
      D => util_vector_logic_1_Res(0),
      Q => \^zu_sp7_mcu_reset_stat\,
      R => rst_1
    );
    
vio_ZU_status: component sp7_cal3_vio_ZU_status_0
     port map (
      clk => clk_1,
      probe_in0(0) => ZU_ERROR_OUT_2V5_o,
      probe_in1(0) => ZU_DONE_2V5_o,
      probe_in2(0) => ZU_BOOT_STATUS_2V5_o,
      probe_in3(0) => ZU_ERROR_STATUS_2V5_o,
      probe_in4(0) => \^zu_sp7_mcu_reset_stat\
    );
    
end STRUCTURE;