library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_pwm is
  port (
    FAN_PWR_CTRL_1 : out STD_LOGIC;
    FAN_PWR_CTRL_2 : out STD_LOGIC;
    FAN_PWR_CTRL_3 : out STD_LOGIC;
    FAN_PWR_CTRL_4 : out STD_LOGIC;
    FAN_PWR_CTRL_5 : out STD_LOGIC;
    FAN_PWR_CTRL_6 : out STD_LOGIC;
    MCU_FAN_CTRL : in STD_LOGIC;
    clk_6p4 : in STD_LOGIC;
    duty_cycle : in STD_LOGIC_VECTOR ( 7 downto 0 );
    duty_cycle1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    duty_cycle2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    duty_cycle3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    duty_cycle4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    duty_cycle5 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rstn50 : in STD_LOGIC
  );
end hier_pwm;

architecture STRUCTURE of hier_pwm is

  component PWM_Generator is
  port (
    clk : in STD_LOGIC;
    enable : in STD_LOGIC;
    duty_cycle : in STD_LOGIC_VECTOR ( 7 downto 0 );
    pwm_out : out STD_LOGIC
  );
  end component;
  
  component SignalDelay is
  generic (delay_param : in INTEGER);
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    input_signal : in STD_LOGIC;
    delayed_signal : out STD_LOGIC
  );
  end component;
  
  component sp7_cal3_proc_sys_reset_0_1 is
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
  end component sp7_cal3_proc_sys_reset_0_1;
  
  signal MCU_FAN_CTRL_1 : STD_LOGIC;
  signal PWM_Generator_0_pwm_out : STD_LOGIC;
  signal PWM_Generator_1_pwm_out : STD_LOGIC;
  signal PWM_Generator_2_pwm_out : STD_LOGIC;
  signal PWM_Generator_3_pwm_out : STD_LOGIC;
  signal PWM_Generator_4_pwm_out : STD_LOGIC;
  signal PWM_Generator_5_pwm_out : STD_LOGIC;
  signal SignalDelay_0_delayed_signal : STD_LOGIC;
  signal SignalDelay_1_delayed_signal : STD_LOGIC;
  signal SignalDelay_2_delayed_signal : STD_LOGIC;
  signal SignalDelay_3_delayed_signal : STD_LOGIC;
  signal SignalDelay_4_delayed_signal : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal duty_cycle2_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal duty_cycle3_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal duty_cycle4_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal duty_cycle5_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_0_vio_resetn_50 : STD_LOGIC;
  signal hier_SPI_regbank_ctrl_reg1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hier_SPI_regbank_ctrl_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal proc_sys_reset_0_peripheral_reset : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  FAN_PWR_CTRL_1 <= PWM_Generator_0_pwm_out;
  FAN_PWR_CTRL_2 <= SignalDelay_0_delayed_signal;
  FAN_PWR_CTRL_3 <= SignalDelay_1_delayed_signal;
  FAN_PWR_CTRL_4 <= SignalDelay_2_delayed_signal;
  FAN_PWR_CTRL_5 <= SignalDelay_4_delayed_signal;
  FAN_PWR_CTRL_6 <= SignalDelay_3_delayed_signal;
  MCU_FAN_CTRL_1 <= MCU_FAN_CTRL;
  clk_wiz_0_clk_out1 <= clk_6p4;
  duty_cycle2_1(7 downto 0) <= duty_cycle2(7 downto 0);
  duty_cycle3_1(7 downto 0) <= duty_cycle3(7 downto 0);
  duty_cycle4_1(7 downto 0) <= duty_cycle4(7 downto 0);
  duty_cycle5_1(7 downto 0) <= duty_cycle5(7 downto 0);
  hier_0_vio_resetn_50 <= rstn50;
  hier_SPI_regbank_ctrl_reg1(7 downto 0) <= duty_cycle(7 downto 0);
  hier_SPI_regbank_ctrl_reg2(7 downto 0) <= duty_cycle1(7 downto 0);
  
PWM_Generator_0: component PWM_Generator
     port map (
      clk => clk_wiz_0_clk_out1,
      duty_cycle(7 downto 0) => hier_SPI_regbank_ctrl_reg1(7 downto 0),
      enable => MCU_FAN_CTRL_1,
      pwm_out => PWM_Generator_0_pwm_out
    );
PWM_Generator_1: component PWM_Generator
     port map (
      clk => clk_wiz_0_clk_out1,
      duty_cycle(7 downto 0) => hier_SPI_regbank_ctrl_reg2(7 downto 0),
      enable => MCU_FAN_CTRL_1,
      pwm_out => PWM_Generator_1_pwm_out
    );
PWM_Generator_2: component PWM_Generator
     port map (
      clk => clk_wiz_0_clk_out1,
      duty_cycle(7 downto 0) => duty_cycle2_1(7 downto 0),
      enable => MCU_FAN_CTRL_1,
      pwm_out => PWM_Generator_2_pwm_out
    );
PWM_Generator_3: component PWM_Generator
     port map (
      clk => clk_wiz_0_clk_out1,
      duty_cycle(7 downto 0) => duty_cycle3_1(7 downto 0),
      enable => MCU_FAN_CTRL_1,
      pwm_out => PWM_Generator_3_pwm_out
    );
PWM_Generator_4: component PWM_Generator
     port map (
      clk => clk_wiz_0_clk_out1,
      duty_cycle(7 downto 0) => duty_cycle4_1(7 downto 0),
      enable => MCU_FAN_CTRL_1,
      pwm_out => PWM_Generator_4_pwm_out
    );
PWM_Generator_5: component PWM_Generator
     port map (
      clk => clk_wiz_0_clk_out1,
      duty_cycle(7 downto 0) => duty_cycle5_1(7 downto 0),
      enable => MCU_FAN_CTRL_1,
      pwm_out => PWM_Generator_5_pwm_out
    );
SignalDelay_0: component SignalDelay
     generic map ( delay_param => 64 )
     port map (
      clk => clk_wiz_0_clk_out1,
      delayed_signal => SignalDelay_0_delayed_signal,
      input_signal => PWM_Generator_1_pwm_out,
      rst => proc_sys_reset_0_peripheral_reset(0)
    );
SignalDelay_1: component SignalDelay
     generic map ( delay_param => 128 )
     port map (
      clk => clk_wiz_0_clk_out1,
      delayed_signal => SignalDelay_1_delayed_signal,
      input_signal => PWM_Generator_2_pwm_out,
      rst => proc_sys_reset_0_peripheral_reset(0)
    );
SignalDelay_2: component SignalDelay
      generic map ( delay_param => 192 )
      port map (
      clk => clk_wiz_0_clk_out1,
      delayed_signal => SignalDelay_2_delayed_signal,
      input_signal => PWM_Generator_3_pwm_out,
      rst => proc_sys_reset_0_peripheral_reset(0)
    );
SignalDelay_3: component SignalDelay
     generic map ( delay_param => 256 )
     port map (
      clk => clk_wiz_0_clk_out1,
      delayed_signal => SignalDelay_3_delayed_signal,
      input_signal => PWM_Generator_4_pwm_out,
      rst => proc_sys_reset_0_peripheral_reset(0)
    );
SignalDelay_4: component SignalDelay
     generic map ( delay_param => 320 )
     port map (
      clk => clk_wiz_0_clk_out1,
      delayed_signal => SignalDelay_4_delayed_signal,
      input_signal => PWM_Generator_5_pwm_out,
      rst => proc_sys_reset_0_peripheral_reset(0)
    );
proc_sys_reset_0: component sp7_cal3_proc_sys_reset_0_1
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => '1',
      ext_reset_in => hier_0_vio_resetn_50,
      interconnect_aresetn(0) => NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_proc_sys_reset_0_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => proc_sys_reset_0_peripheral_reset(0),
      peripheral_reset(0) => NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_0_clk_out1
    );
end STRUCTURE;