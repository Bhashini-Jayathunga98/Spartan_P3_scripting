------------------------------------------------------------------------------
-- user_logic.vhd - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          user_logic.vhd
-- Version:           1.00.a
-- Description:       User logic.
-- Date:              Sat Dec 25 10:11:41 2021 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

-- DO NOT EDIT BELOW THIS LINE --------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
-- use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library proc_common_v4_0;
use proc_common_v4_0.proc_common_pkg.all;

Library UNISIM;
use UNISIM.vcomponents.all;

-- DO NOT EDIT ABOVE THIS LINE --------------------

library unisim;
use unisim.vcomponents.all;

library axi_time_ctrl_v1_00_a;
use axi_time_ctrl_v1_00_a.time_ctrl;

------------------------------------------------------------------------------
-- Entity section
------------------------------------------------------------------------------
-- Definition of Generics:
--   C_NUM_REG                    -- Number of software accessible registers
--   C_SLV_DWIDTH                 -- Slave interface data bus width
--
-- Definition of Ports:
--   Bus2IP_Clk                   -- Bus to IP clock
--   Bus2IP_Resetn                -- Bus to IP reset
--   Bus2IP_Data                  -- Bus to IP data bus
--   Bus2IP_BE                    -- Bus to IP byte enables
--   Bus2IP_RdCE                  -- Bus to IP read chip enable
--   Bus2IP_WrCE                  -- Bus to IP write chip enable
--   IP2Bus_Data                  -- IP to Bus data bus
--   IP2Bus_RdAck                 -- IP to Bus read transfer acknowledgement
--   IP2Bus_WrAck                 -- IP to Bus write transfer acknowledgement
--   IP2Bus_Error                 -- IP to Bus error response
------------------------------------------------------------------------------

entity user_logic is
  generic
  (
    -- ADD USER GENERICS BELOW THIS LINE ---------------
    -- ADD USER GENERICS ABOVE THIS LINE ---------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol parameters, do not add to or delete
    C_NUM_REG                      : integer              := 16;
    C_SLV_DWIDTH                   : integer              := 32
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );
  port
  (
    -- ADD USER PORTS BELOW THIS LINE ------------------
    clk_10mhz                      : in  std_logic;
    pps_gnss_in                    : in  std_logic;
    pps_gnss_out                   : out std_logic;
    pps_int                        : out std_logic;
   clk_xo_out                     : out std_logic;
    -- ADD USER PORTS ABOVE THIS LINE ------------------

    -- DO NOT EDIT BELOW THIS LINE ---------------------
    -- Bus protocol ports, do not add to or delete
    Bus2IP_Clk                     : in  std_logic;
    Bus2IP_Resetn                  : in  std_logic;
    Bus2IP_Data                    : in  std_logic_vector(C_SLV_DWIDTH-1 downto 0);
    Bus2IP_BE                      : in  std_logic_vector(C_SLV_DWIDTH/8-1 downto 0);
    Bus2IP_RdCE                    : in  std_logic_vector(C_NUM_REG-1 downto 0);
    Bus2IP_WrCE                    : in  std_logic_vector(C_NUM_REG-1 downto 0);
    IP2Bus_Data                    : out std_logic_vector(C_SLV_DWIDTH-1 downto 0);
    IP2Bus_RdAck                   : out std_logic;
    IP2Bus_WrAck                   : out std_logic;
    IP2Bus_Error                   : out std_logic
    -- DO NOT EDIT ABOVE THIS LINE ---------------------
  );

  attribute MAX_FANOUT : string;
  attribute SIGIS : string;

  attribute SIGIS of Bus2IP_Clk    : signal is "CLK";
  attribute SIGIS of Bus2IP_Resetn : signal is "RST";

end entity user_logic;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of user_logic is

  --USER signal declarations added here, as needed for user logic
  constant TIME_CTRL_ID                 : std_logic_vector(15 downto 0) := x"BACD";
  constant VERSION                      : std_logic_vector(15 downto 0) := x"0005";

  signal reset                          : std_logic;
  signal pps_int_enable                 : std_logic;
  signal pps_int_resync                 : std_logic;
  signal next_pps_timestamp_valid       : std_logic;
  signal next_pps_timestamp             : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal pps_gnss_clk_count             : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal pps_int_clk_count              : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal pps_curr_clk_count             : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal clear_pps_gnss_clk_count       : std_logic;
  signal clear_pps_int_clk_count        : std_logic;
  signal latch_pps_curr_clk_count       : std_logic;
  signal reset_stopwatch                : std_logic;
  signal stopwatch                      : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal timestamp                      : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal clks_since_pps_int             : std_logic_vector(C_SLV_DWIDTH-1 downto 0);

  signal clk_10mhz_bufg                 : std_logic;
  signal clk_100mhz_dcm                 : std_logic;
  signal clk_fb_buf                     : std_logic;
  signal clk_100mhz                     : std_logic;

  signal clk_fb                         : std_logic;

  signal dcm_status                     : std_logic_vector(7 downto 0);
  signal clkfx_stopped                  : std_logic;
  signal dcm_locked                     : std_logic;
  signal dcm_rst                        : std_logic;

  ------------------------------------------
  -- Signals for user logic slave model s/w accessible register example
  ------------------------------------------
  signal slv_reg_write_sel              : std_logic_vector(15 downto 0);
  signal slv_reg_read_sel               : std_logic_vector(15 downto 0);
  signal slv_ip2bus_data                : std_logic_vector(C_SLV_DWIDTH-1 downto 0);
  signal slv_read_ack                   : std_logic;
  signal slv_write_ack                  : std_logic;

begin

  --USER logic implementation added here

  ------------------------------------------
  -- Example code to read/write user logic slave model s/w accessible registers
  --
  -- Note:
  -- The example code presented here is to show you one way of reading/writing
  -- software accessible registers implemented in the user logic slave model.
  -- Each bit of the Bus2IP_WrCE/Bus2IP_RdCE signals is configured to correspond
  -- to one software accessible register by the top level template. For example,
  -- if you have four 32 bit software accessible registers in the user logic,
  -- you are basically operating on the following memory mapped registers:
  --
  --    Bus2IP_WrCE/Bus2IP_RdCE   Memory Mapped Register
  --                     "1000"   C_BASEADDR + 0x0
  --                     "0100"   C_BASEADDR + 0x4
  --                     "0010"   C_BASEADDR + 0x8
  --                     "0001"   C_BASEADDR + 0xC
  --
  ------------------------------------------
  slv_reg_write_sel <= Bus2IP_WrCE(15 downto 0);
  slv_reg_read_sel  <= Bus2IP_RdCE(15 downto 0);
  slv_write_ack     <= Bus2IP_WrCE(0) or Bus2IP_WrCE(1) or Bus2IP_WrCE(2) or Bus2IP_WrCE(3) or Bus2IP_WrCE(4) or Bus2IP_WrCE(5) or Bus2IP_WrCE(6) or Bus2IP_WrCE(7) or Bus2IP_WrCE(8) or Bus2IP_WrCE(9) or Bus2IP_WrCE(10) or Bus2IP_WrCE(11) or Bus2IP_WrCE(12) or Bus2IP_WrCE(13) or Bus2IP_WrCE(14) or Bus2IP_WrCE(15);
  slv_read_ack      <= Bus2IP_RdCE(0) or Bus2IP_RdCE(1) or Bus2IP_RdCE(2) or Bus2IP_RdCE(3) or Bus2IP_RdCE(4) or Bus2IP_RdCE(5) or Bus2IP_RdCE(6) or Bus2IP_RdCE(7) or Bus2IP_RdCE(8) or Bus2IP_RdCE(9) or Bus2IP_RdCE(10) or Bus2IP_RdCE(11) or Bus2IP_RdCE(12) or Bus2IP_RdCE(13) or Bus2IP_RdCE(14) or Bus2IP_RdCE(15);

  -- implement slave model software accessible register(s)
  SLAVE_REG_WRITE_PROC : process( Bus2IP_Clk ) is
  begin

    if Bus2IP_Clk'event and Bus2IP_Clk = '1' then
      if Bus2IP_Resetn = '0' then
        pps_int_resync           <= '0';
        clear_pps_gnss_clk_count <= '0';
        clear_pps_int_clk_count  <= '0';
        latch_pps_curr_clk_count <= '0';
        reset_stopwatch          <= '0';
        next_pps_timestamp_valid <= '0';
        reset                    <= '1';
        pps_int_enable           <= '0';
      else
        pps_int_resync           <= '0';
        clear_pps_gnss_clk_count <= '0';
        clear_pps_int_clk_count  <= '0';
        latch_pps_curr_clk_count <= '0';
        reset_stopwatch          <= '0';
        next_pps_timestamp_valid <= '0';
        case slv_reg_write_sel is
          when "1000000000000000" => -- 0x0000
            null;
          when "0100000000000000" => -- 0x0004
            null;
          when "0010000000000000" => -- 0x0008
            null;
          when "0001000000000000" => -- 0x000C
            next_pps_timestamp_valid <= '1';
            for byte_index in 0 to (C_SLV_DWIDTH/8)-1 loop
              if ( Bus2IP_BE(byte_index) = '1' ) then
                next_pps_timestamp(byte_index*8+7 downto byte_index*8) <= Bus2IP_Data(byte_index*8+7 downto byte_index*8);
              end if;
            end loop;
          when "0000100000000000" => -- 0x0010
            clear_pps_gnss_clk_count <= '1';
          when "0000010000000000" => -- 0x0014
            clear_pps_int_clk_count <= '1';
          when "0000001000000000" => -- 0x0018
            latch_pps_curr_clk_count <= '1';
          when "0000000100000000" => -- 0x001C
            reset_stopwatch <= '1';
          when "0000000010000000" => -- 0x0020
            reset <= Bus2IP_Data(0);
          when "0000000001000000" => -- 0x0024
            pps_int_enable <= Bus2IP_Data(0);
          when "0000000000100000" => -- 0x0028
            pps_int_resync <= '1';
          when "0000000000010000" => -- 0x002C
            null;
          when others => null;
        end case;
      end if;
    end if;

  end process SLAVE_REG_WRITE_PROC;

  -- implement slave model software accessible register(s) read mux
  SLAVE_REG_READ_PROC : process( slv_reg_read_sel, clks_since_pps_int, timestamp, next_pps_timestamp, pps_gnss_clk_count, pps_int_clk_count, pps_curr_clk_count, dcm_locked, stopwatch) is
  begin

    case slv_reg_read_sel is
      when "1000000000000000" => -- 0x0000
        slv_ip2bus_data <= TIME_CTRL_ID & VERSION;
      when "0100000000000000" => --0x0004
        slv_ip2bus_data <= clks_since_pps_int;
      when "0010000000000000" => --0x0008
        slv_ip2bus_data <= timestamp;
      when "0001000000000000" => --0x000C
        slv_ip2bus_data <= next_pps_timestamp;
      when "0000100000000000" => --0x0010
        slv_ip2bus_data <= pps_gnss_clk_count;
      when "0000010000000000" => --0x0014
        slv_ip2bus_data <= pps_int_clk_count;
      when "0000001000000000" => --0x0018
        slv_ip2bus_data <= pps_curr_clk_count;
      when "0000000100000000" => --0x001C
        slv_ip2bus_data <= stopwatch;
      when "0000000010000000" => -- 0x0020
        slv_ip2bus_data <= (0 => reset, others => '0');
      when "0000000001000000" => -- 0x0024
        slv_ip2bus_data <= (0 => pps_int_enable, others => '0');
      when "0000000000100000" => -- 0x0028
        slv_ip2bus_data <= (others => '0');
      when "0000000000010000" => -- 0x002C
        slv_ip2bus_data <= (0 => dcm_locked, others => '0');
      when others =>
        slv_ip2bus_data <= (others => '0');
    end case;

  end process SLAVE_REG_READ_PROC;

  ------------------------------------------
  -- Example code to drive IP to Bus signals
  ------------------------------------------
  IP2Bus_Data  <= slv_ip2bus_data when slv_read_ack = '1' else
                  (others => '0');

  IP2Bus_WrAck <= slv_write_ack;
  IP2Bus_RdAck <= slv_read_ack;
  IP2Bus_Error <= '0';

  ------------------------------------------
  -- User logic
  ------------------------------------------

  -- Generate 100 MHz clock derived from the 10MHz OCXO input clock
  IBUFG_inst : IBUFG
    generic map
    (
      IBUF_LOW_PWR => false,  -- Low power (TRUE) vs. performance (FALSE) setting for referenced I/O standards
      IOSTANDARD   => "DEFAULT"
    )
    port map
    (
      O => clk_10mhz_bufg,
      I => clk_10mhz
    );

--  DCM_SP_inst : DCM_SP
--    generic map
--    (
--      CLKDV_DIVIDE          => 2.0,     -- CLKDV divide value
--      -- (1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,9,10,11,12,13,14,15,16).
--      CLKFX_DIVIDE          => 1,  -- Divide value on CLKFX outputs - D - (1-32)
--      CLKFX_MULTIPLY        => 2,  -- Multiply value on CLKFX outputs - M - (2-32)
--      CLKIN_DIVIDE_BY_2     => false,   -- CLKIN divide by two (TRUE/FALSE)
--      CLKIN_PERIOD          => 100.0,   -- Input clock period specified in nS
--      CLKOUT_PHASE_SHIFT    => "NONE",  -- Output phase shift (NONE, FIXED, VARIABLE)
--      CLK_FEEDBACK          => "1X",  -- Feedback source (NONE, 1X, 2X)
--      DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS",  -- SYSTEM_SYNCHRNOUS or SOURCE_SYNCHRONOUS
--      DFS_FREQUENCY_MODE    => "LOW",   -- Unsupported - Do not change value
--      DLL_FREQUENCY_MODE    => "LOW",   -- Unsupported - Do not change value
--      DSS_MODE              => "NONE",  -- Unsupported - Do not change value
--      DUTY_CYCLE_CORRECTION => true,    -- Unsupported - Do not change value
--      FACTORY_JF            => X"c080",  -- Unsupported - Do not change value
--      PHASE_SHIFT           => 0,  -- Amount of fixed phase shift (-255 to 255)
--      STARTUP_WAIT          => false  -- Delay config DONE until DCM_SP LOCKED (TRUE/FALSE)
--    )
--    port map
--    (
--      CLK0     => clk_fb,
--      CLKFX    => clk_100mhz_dcm,  -- 1-bit output: Digital Frequency Synthesizer output (DFS)
--      LOCKED   => dcm_locked,           -- 1-bit output: DCM_SP Lock Output
--      STATUS   => dcm_status,           -- 8-bit output: DCM_SP status output
--      CLKFB    => clk_fb,                  -- 1-bit input: Clock feedback input
--      CLKIN    => clk_10mhz_bufg,       -- 1-bit input: Clock input
--      DSSEN    => '0',  -- 1-bit input: Unsupported, specify to GND.
--      PSCLK    => '0',                  -- 1-bit input: Phase shift clock input
--      PSEN     => '0',                  -- 1-bit input: Phase shift enable
--      PSINCDEC => '0',  -- 1-bit input: Phase shift increment/decrement input
--      RST      => dcm_rst               -- 1-bit input: Active high reset input
--      );
      
      
   MMCME2_BASE_inst : MMCME2_BASE
   generic map (
      BANDWIDTH => "OPTIMIZED",  -- Jitter programming (OPTIMIZED, HIGH, LOW)
      CLKFBOUT_MULT_F => 10.0,    -- Multiply value for all CLKOUT (2.000-64.000).
      CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB (-360.000-360.000).
      CLKIN1_PERIOD => 100.0,      -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      -- CLKOUT0_DIVIDE - CLKOUT6_DIVIDE: Divide amount for each CLKOUT (1-128)
      CLKOUT0_DIVIDE_F => 1.0,   -- Divide amount for CLKOUT0 (1.000-128.000).
      -- CLKOUT0_DUTY_CYCLE - CLKOUT6_DUTY_CYCLE: Duty cycle for each CLKOUT (0.01-0.99).
      CLKOUT0_DUTY_CYCLE => 0.5,
      -- CLKOUT0_PHASE - CLKOUT6_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
      CLKOUT0_PHASE => 0.0,
      DIVCLK_DIVIDE => 1,        -- Master division value (1-106)
      REF_JITTER1 => 0.01,        -- Reference input jitter in UI (0.000-0.999).
      STARTUP_WAIT => FALSE      -- Delays DONE until MMCM is locked (FALSE, TRUE)
   )
   port map (
      -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
      CLKOUT0 => clk_100mhz_dcm,     -- 1-bit output: CLKOUT0
      -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
      CLKFBOUT => clk_fb,   -- 1-bit output: Feedback clock
      -- Status Ports: 1-bit (each) output: MMCM status ports
      LOCKED => dcm_locked,       -- 1-bit output: LOCK
      -- Clock Inputs: 1-bit (each) input: Clock input
      CLKIN1 => clk_10mhz_bufg,       -- 1-bit input: Clock
      -- Control Ports: 1-bit (each) input: MMCM control ports
      PWRDWN => '0',       -- 1-bit input: Power-down
      RST => dcm_rst,             -- 1-bit input: Reset
      -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
      CLKFBIN => clk_fb      -- 1-bit input: Feedback clock
      --CLKFBIN => clk_fb_buf      -- 1-bit input: Feedback clock --this give dcm notlock
   );     
   

  --clkfx_stopped <= dcm_status(2);
  dcm_rst       <= (not Bus2IP_Resetn) ;
  --dcm_rst       <=  (not Bus2IP_Resetn) or (clkfx_stopped and not dcm_locked);

  BUFG_inst : BUFG
    port map
    (
      O => clk_100mhz,
      I => clk_100mhz_dcm
    );
    
--    BUFG_fb_inst : BUFG
--    port map
--    (
--      O => clk_fb_buf,
--      I => clk_fb
--    );

  -- Time control module
  TIME_CTRL_I : entity axi_time_ctrl_v1_00_a.time_ctrl
    generic map
    (
      CLK_XO_FREQ => 100000000
    )
    port map
    (
      clk                      => Bus2IP_Clk,
      reset                    => reset,
      clk_xo                   => clk_100mhz,--clk_100mhz,
      clk_xo_out               => clk_xo_out,--output clk_100mhz,
      pps_edge_trigger         => '0',
      pps_int_enable           => pps_int_enable,
      pps_int_resync           => pps_int_resync,
      next_pps_timestamp_valid => next_pps_timestamp_valid,
      next_pps_timestamp       => next_pps_timestamp,
      pps_gnss_in              => pps_gnss_in,
      pps_gnss_out             => pps_gnss_out,
      pps_int                  => pps_int,
      pps_gnss_clk_count       => pps_gnss_clk_count,
      clear_pps_gnss_clk_count => clear_pps_gnss_clk_count,
      pps_int_clk_count        => pps_int_clk_count,
      clear_pps_int_clk_count  => clear_pps_int_clk_count,
      pps_curr_clk_count       => pps_curr_clk_count,
      latch_pps_curr_clk_count => latch_pps_curr_clk_count,
      stopwatch                => stopwatch,
      reset_stopwatch          => reset_stopwatch,
      timestamp                => timestamp,
      clks_since_pps_int       => clks_since_pps_int
    );

end IMP;







