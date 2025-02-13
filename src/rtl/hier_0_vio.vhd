library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_0_vio is
  port (
    CLK_10M_DAC_SEL : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK_10M_SOURCE_SP7_SEL : out STD_LOGIC_VECTOR ( 0 to 0 );
    CLK_REF_10M_EN_B : out STD_LOGIC_VECTOR ( 0 to 0 );
    LOC_10M_OSC_SP7_ENABLE : out STD_LOGIC_VECTOR ( 0 to 0 );
    MCU_MAIN_CLK_EN : in STD_LOGIC;
    MCU_OCXO_CLK_BUF_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    OCXO_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AFE_VCXO_ENABLE : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AUXB_PWR_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AUXETH_PLL_HW_SW_CTRL : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_AUXETH_PLL_RESET : out STD_LOGIC_VECTOR ( 0 to 0 );
    SP7_OCXO_INTB_EXT_REF : out STD_LOGIC_VECTOR ( 0 to 0 );
    VCTCXO_EN : out STD_LOGIC_VECTOR ( 0 to 0 );
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk10 : in STD_LOGIC;
    clk50 : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    reset10 : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_50 : out STD_LOGIC_VECTOR ( 0 to 0 );
    resetn_10 : out STD_LOGIC_VECTOR ( 0 to 0 );
    resetn_50 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
end hier_0_vio;

architecture STRUCTURE of hier_0_vio is

  component sp7_cal3_vio_main_config_0 is
  port (
    clk : in STD_LOGIC;
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out10 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out11 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out12 : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_vio_main_config_0;
  
  component sp7_cal3_proc_sys_reset_0_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_proc_sys_reset_0_0;
  
  component sp7_cal3_proc_sys_reset_1_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_proc_sys_reset_1_0;
  
  signal MCU_MAIN_CLK_EN_1 : STD_LOGIC;
  signal clk10_1 : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal dcm_locked_1 : STD_LOGIC;
  signal hier_0_vio_SP7_AUXETH_PLL_RESET : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mdm_1_debug_sys_rst : STD_LOGIC;
  signal proc_sys_reset_0_bus_struct_reset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_0_mb_reset : STD_LOGIC;
  signal reset_10 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal soft_rstn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal vio_main_config_probe_out10 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  
begin

  MCU_MAIN_CLK_EN_1 <= MCU_MAIN_CLK_EN;
  MCU_OCXO_CLK_BUF_EN(0) <= vio_main_config_probe_out10(0);
  SP7_AUXETH_PLL_RESET(0) <= hier_0_vio_SP7_AUXETH_PLL_RESET(0);
  bus_struct_reset(0) <= proc_sys_reset_0_bus_struct_reset(0);
  clk10_1 <= clk10;
  clk_1 <= clk50;
  dcm_locked_1 <= dcm_locked;
  mb_reset <= proc_sys_reset_0_mb_reset;
  mdm_1_debug_sys_rst <= mb_debug_sys_rst;
  reset10(0) <= reset_10(0);
  
proc_sys_reset_0: component sp7_cal3_proc_sys_reset_0_0
     port map (
      aux_reset_in => soft_rstn(0),
      bus_struct_reset(0) => proc_sys_reset_0_bus_struct_reset(0),
      dcm_locked => dcm_locked_1,
      ext_reset_in => MCU_MAIN_CLK_EN_1,
      interconnect_aresetn(0) => NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => mdm_1_debug_sys_rst,
      mb_reset => proc_sys_reset_0_mb_reset,
      peripheral_aresetn(0) => resetn_50(0),
      peripheral_reset(0) => reset_50(0),
      slowest_sync_clk => clk_1
    );
    
proc_sys_reset_1: component sp7_cal3_proc_sys_reset_1_0
     port map (
      aux_reset_in => soft_rstn(0),
      bus_struct_reset(0) => NLW_proc_sys_reset_1_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => dcm_locked_1,
      ext_reset_in => MCU_MAIN_CLK_EN_1,
      interconnect_aresetn(0) => NLW_proc_sys_reset_1_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_1_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => resetn_10(0),
      peripheral_reset(0) => reset_10(0),
      slowest_sync_clk => clk10_1
    );
    
vio_main_config: component sp7_cal3_vio_main_config_0
     port map (
      clk => clk_1,
      probe_out0(0) => LOC_10M_OSC_SP7_ENABLE(0),
      probe_out1(0) => CLK_10M_DAC_SEL(0),
      probe_out10(0) => vio_main_config_probe_out10(0),
      probe_out11(0) => hier_0_vio_SP7_AUXETH_PLL_RESET(0),
      probe_out12(0) => SP7_AUXETH_PLL_HW_SW_CTRL(0),
      probe_out2(0) => VCTCXO_EN(0),
      probe_out3(0) => soft_rstn(0),
      probe_out4(0) => CLK_10M_SOURCE_SP7_SEL(0),
      probe_out5(0) => OCXO_EN(0),
      probe_out6(0) => SP7_AFE_VCXO_ENABLE(0),
      probe_out7(0) => CLK_REF_10M_EN_B(0),
      probe_out8(0) => SP7_AUXB_PWR_EN(0),
      probe_out9(0) => SP7_OCXO_INTB_EXT_REF(0)
    );
    
end STRUCTURE;