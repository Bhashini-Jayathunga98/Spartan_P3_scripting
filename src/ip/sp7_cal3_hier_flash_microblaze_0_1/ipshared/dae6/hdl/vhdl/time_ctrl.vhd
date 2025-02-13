-------------------------------------------------------------------------------
-- Title: Time Control
-------------------------------------------------------------------------------
--
-- Description: The time control module handles all time-keeping
--  functionalities of the system.
--
--  The module requires at least one GNSS PPS pulse to start the internal
--  PPS generation. The timestamp and clock since last PPS are based
--  on the internal PPS only such that they are not affected by a PPS loss.
--
-- The module reports the number of clock cycles between two GNSS pulses.
--
--  Additionally, the module provides a stopwatch to monitor time execution
--  measurement.
--
-- Note: The implementation assumes that no GNSS pulse will occur when
-- GNSS is not locked i.e that all GNSS PPS pulses are valid.
--
-- Standard: VHDL'93
--
-- Development notice
-------------------------------------------------------------------------------
-- This file is developed in 2022 by:
--     [Nicolas Barthelemy <nbarthelemy@widenorth.com>]
--           @ WideNorth AS (www.widenorth.com)
--
-- for Digital14
-------------------------------------------------------------------------------
-- Last update: 2022-04-22
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity time_ctrl is
  generic (
    CLK_XO_FREQ : natural               -- clk_xo clock frequency
    );
  port (
    clk                      : in  std_logic;  -- 50 Mhz free-running clock
    reset                    : in  std_logic;
    clk_xo                   : in  std_logic;  -- Derived OCXO/TCXO clock
    clk_xo_out                     : out std_logic;
    -- Microblaze interface
    pps_edge_trigger         : in  std_logic;  -- Set to '0' for rising-edge GNSS PPS pulse detection, '1' for falling-edge
    pps_int_enable           : in  std_logic;  -- Set to '1' to enable internal PPS output
    pps_int_resync           : in  std_logic;  -- Set to '1' to resync internal PPS to GNSS PPS
    -- Set time for next internal PPS pulse
    next_pps_timestamp_valid : in  std_logic;
    next_pps_timestamp       : in  std_logic_vector(31 downto 0);  -- Apply timestamp for next internal PPS pulse
    --
    pps_gnss_in              : in  std_logic;  -- PPS pulse from GNSS
    -- Outputs
    pps_gnss_out             : out std_logic;  -- PPS pulse from GNSS out (passthrough)
    pps_int                  : out std_logic;  -- Internal PPS pulse
    -- Status
    pps_gnss_clk_count       : out std_logic_vector(31 downto 0);  -- Counter value when GNSS PPS pulse occured
    clear_pps_gnss_clk_count : in  std_logic;  -- Assert to '1' to clear "pps_gnss_clk_count"
    pps_int_clk_count        : out std_logic_vector(31 downto 0);  -- Counter value when internal PPS pulse occured
    clear_pps_int_clk_count  : in  std_logic;  -- Assert to '1' to clear "pps_int_clk_count"
    pps_curr_clk_count       : out std_logic_vector(31 downto 0);  -- Counter value when latch_pps_curr_clk_count = '1'
    latch_pps_curr_clk_count : in  std_logic;  -- Assert one clock-cycle to '1' to latch current counter value to "pps_curr_clk_count"
    stopwatch                : out std_logic_vector(31 downto 0);  -- Free-running counter @clk
    reset_stopwatch          : in  std_logic;  -- Reset stopwatch counter
    timestamp                : out std_logic_vector(31 downto 0);  -- Number of seconds elapsed since time reference
    clks_since_pps_int       : out std_logic_vector(31 downto 0)  -- Number of clocks cycles @clk since last internal PPS
    );
end entity;

architecture rtl of time_ctrl is

  attribute async_reg : string;
  
  -- gnss_pps_p
  signal pps_gnss_q1, pps_gnss_q2, pps_gnss_q3 : std_logic;
  signal pps_edge_trigger_n                    : std_logic;
  signal pps_gnss_pulse                        : std_logic;

  -- clk_xo_count_p
  signal clk_xo_count          : unsigned(31 downto 0);
  signal pps_gnss_clk_xo_count : std_logic_vector(31 downto 0);
  signal pps_gnss_valid_slr    : std_logic_vector(5 downto 0);
  signal pps_int_clk_xo_count  : std_logic_vector(31 downto 0);
  signal pps_int_valid_slr     : std_logic_vector(5 downto 0);
  signal pps_curr_clk_xo_count : std_logic_vector(31 downto 0);
  signal pps_curr_valid_slr    : std_logic_vector(5 downto 0);

  signal latch_pps_curr_clk_xo_count_q1 : std_logic;
  signal latch_pps_curr_clk_xo_count_q  : std_logic;
  signal latch_pps_curr_clk_xo_count    : std_logic;

  attribute async_reg of latch_pps_curr_clk_xo_count_q1 : signal is "true";
  attribute async_reg of latch_pps_curr_clk_xo_count_q  : signal is "true";

  -- gnss_pps_clk_count_cdc_p
  signal pps_gnss_clk_count_valid_q3 : std_logic;
  signal pps_gnss_clk_count_valid_q2 : std_logic;
  signal pps_gnss_clk_count_valid_q1 : std_logic;
  signal pps_gnss_clk_count_valid_q  : std_logic;

  attribute async_reg of pps_gnss_clk_count_valid_q3 : signal is "true";
  attribute async_reg of pps_gnss_clk_count_valid_q2 : signal is "true";
  attribute async_reg of pps_gnss_clk_count_valid_q1 : signal is "true";

  signal pps_gnss_clk_xo_count_q1 : std_logic_vector(31 downto 0);
  signal pps_gnss_clk_xo_count_q  : std_logic_vector(31 downto 0);

  attribute async_reg of pps_gnss_clk_xo_count_q1 : signal is "true";
  attribute async_reg of pps_gnss_clk_xo_count_q  : signal is "true";

  -- int_pps_clk_count_cdc_p
  signal pps_int_clk_count_valid_q3 : std_logic;
  signal pps_int_clk_count_valid_q2 : std_logic;
  signal pps_int_clk_count_valid_q1 : std_logic;
  signal pps_int_clk_count_valid_q  : std_logic;

  attribute async_reg of pps_int_clk_count_valid_q3 : signal is "true";
  attribute async_reg of pps_int_clk_count_valid_q2 : signal is "true";
  attribute async_reg of pps_int_clk_count_valid_q1 : signal is "true";

  signal pps_int_clk_xo_count_q1 : std_logic_vector(31 downto 0);
  signal pps_int_clk_xo_count_q  : std_logic_vector(31 downto 0);

  attribute async_reg of pps_int_clk_xo_count_q1 : signal is "true";
  attribute async_reg of pps_int_clk_xo_count_q  : signal is "true";

  -- curr_pps_clk_count_cdc_p
  signal pps_curr_clk_count_valid_q3 : std_logic;
  signal pps_curr_clk_count_valid_q2 : std_logic;
  signal pps_curr_clk_count_valid_q1 : std_logic;
  signal pps_curr_clk_count_valid_q  : std_logic;

  attribute async_reg of pps_curr_clk_count_valid_q3 : signal is "true";
  attribute async_reg of pps_curr_clk_count_valid_q2 : signal is "true";
  attribute async_reg of pps_curr_clk_count_valid_q1 : signal is "true";

  signal pps_curr_clk_xo_count_q1 : std_logic_vector(31 downto 0);
  signal pps_curr_clk_xo_count_q  : std_logic_vector(31 downto 0);

  attribute async_reg of pps_curr_clk_xo_count_q1 : signal is "true";
  attribute async_reg of pps_curr_clk_xo_count_q  : signal is "true";

  -- pps_enable_cdc
  signal pps_int_enable_xo_q : std_logic;
  signal pps_int_enable_xo   : std_logic;

  attribute async_reg of pps_int_enable_xo_q : signal is "true";
  attribute async_reg of pps_int_enable_xo   : signal is "true";

  -- pps_resync_cdc_p
  signal pps_int_resync_q  : std_logic;
  signal pps_int_resync_q1 : std_logic;
  signal pps_int_resync_q2 : std_logic;
  signal pps_int_resync_q3 : std_logic;

  attribute async_reg of pps_int_resync_q3 : signal is "true";
  attribute async_reg of pps_int_resync_q2 : signal is "true";
  attribute async_reg of pps_int_resync_q1 : signal is "true";

  -- pps_resync_p
  type pps_int_state_t is (IDLE, RUNNING);
  signal pps_int_state        : pps_int_state_t;
  signal pps_int_resync_cnt   : unsigned(31 downto 0);
  signal pps_int_running      : std_logic;
  signal pps_resync           : std_logic;
  signal clear_pps_int_resync : std_logic;

  -- pps_int_p
  signal pps_resync_latch : std_logic;
  signal pps_int_cnt      : unsigned(31 downto 0) := (others => '0');  -- Init only for simulation purpose
  signal pps_int_i        : std_logic;
  signal pps_int_o        : std_logic;
  signal pps_int_pulse    : std_logic;
  signal pps_int_pulse_q  : std_logic;
  signal pps_int_pulse_q1 : std_logic;
  signal pps_int_pulse_q2 : std_logic;

  -- pps_int_cdc
  signal pps_int_q3 : std_logic;
  signal pps_int_q2 : std_logic;
  signal pps_int_q1 : std_logic;
  signal pps_int_q  : std_logic;

  -- time_keeping_p
  signal clks_since_pps_int_i     : unsigned(clks_since_pps_int'range);
  signal next_pps_timestamp_latch : std_logic;
  signal next_pps_timestamp_q     : unsigned(31 downto 0);
  signal timestamp_i              : unsigned(31 downto 0);

  -- stopwatch_p
  signal stopwatch_i : unsigned(stopwatch'range);

begin

  -----------------------------------------------------------------------------
  -- Import GNSS PPS and generate a one-clock cycle pulse on PPS edge
  -----------------------------------------------------------------------------
  pps_edge_trigger_n <= not pps_edge_trigger;

  -- PPS GNSS pulse is three clock cycles delayed compared to GNSS PPS edge
  gnss_pps_p : process(clk_xo)
  begin
    if rising_edge(clk_xo) then
      -- No reset to prevent detecting a PPS pulse if the reset is released
      -- when the GNSS PPS pulse is high (rising-edge detection) / low (falling-edge)
      pps_gnss_q1 <= pps_gnss_in;
      pps_gnss_q2 <= pps_gnss_q1;
      pps_gnss_q3 <= pps_gnss_q2;

      -- Detect edge
      if pps_gnss_q3 = pps_edge_trigger and pps_gnss_q2 = pps_edge_trigger_n then
        pps_gnss_pulse <= '1';
      else
        pps_gnss_pulse <= '0';
      end if;

      if reset = '1' then
        pps_gnss_pulse <= '0';
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Free-running clock counter value
  -- The counter value is latched on GNSS and internal PPS pulses providing
  -- timestamp on these events
  -----------------------------------------------------------------------------
  clk_xo_count_p : process(clk_xo)
  begin
    if rising_edge(clk_xo) then
      -- Compensate for GNSS pulse delay such that
      -- measurement is aligned between GNSS and internal PPS pulses
      pps_int_pulse_q  <= pps_int_pulse;
      pps_int_pulse_q1 <= pps_int_pulse_q;
      pps_int_pulse_q2 <= pps_int_pulse_q1;

      -- Import "latch_pps_curr_clk_count" to "clk_xo" clock
      latch_pps_curr_clk_xo_count_q1 <= latch_pps_curr_clk_count;
      latch_pps_curr_clk_xo_count_q  <= latch_pps_curr_clk_xo_count_q1;
      latch_pps_curr_clk_xo_count    <= latch_pps_curr_clk_xo_count_q;

      if reset = '1' then
        clk_xo_count       <= (others => '0');
        pps_gnss_valid_slr <= (others => '0');
        pps_int_valid_slr  <= (others => '0');
        pps_curr_valid_slr <= (others => '0');
      else
        -- Free-running clock counter
        clk_xo_count <= clk_xo_count + 1;
        -- Latch clock counter value on GNSS PPS pulse
        if pps_gnss_pulse = '1' then
          pps_gnss_clk_xo_count <= std_logic_vector(clk_xo_count);
          pps_gnss_valid_slr    <= (others => '1');  -- used for clock crossing domain
        else
          pps_gnss_valid_slr(0)                                <= '0';
          pps_gnss_valid_slr(pps_gnss_valid_slr'left downto 1) <= pps_gnss_valid_slr(pps_gnss_valid_slr'left-1 downto 0);
        end if;
        -- Latch clock counter value on internal PPS pulse
        if pps_int_pulse_q2 = '1' then
          pps_int_clk_xo_count <= std_logic_vector(clk_xo_count);
          pps_int_valid_slr    <= (others => '1');  -- used for clock crossing domain
        else
          pps_int_valid_slr(0)                               <= '0';
          pps_int_valid_slr(pps_int_valid_slr'left downto 1) <= pps_int_valid_slr(pps_int_valid_slr'left-1 downto 0);
        end if;
        -- Latch current counter value on request
        if latch_pps_curr_clk_xo_count = '0' and latch_pps_curr_clk_xo_count_q = '1' then
          pps_curr_clk_xo_count <= std_logic_vector(clk_xo_count);
          pps_curr_valid_slr    <= (others => '1');  -- used for clock crossing domain
        else
          pps_curr_valid_slr(0)                                <= '0';
          pps_curr_valid_slr(pps_curr_valid_slr'left downto 1) <= pps_curr_valid_slr(pps_curr_valid_slr'left-1 downto 0);
        end if;
      end if;
    end if;
  end process;

  -- Clock domain crossing from fast to slow clock
  gnss_pps_clk_count_cdc_p : process(clk)
  begin
    if rising_edge(clk) then
      pps_gnss_clk_xo_count_q1 <= pps_gnss_clk_xo_count;
      pps_gnss_clk_xo_count_q  <= pps_gnss_clk_xo_count_q1;
      --
      if reset = '1' then
        pps_gnss_clk_count_valid_q3 <= '0';
        pps_gnss_clk_count_valid_q2 <= '0';
        pps_gnss_clk_count_valid_q1 <= '0';
        pps_gnss_clk_count_valid_q  <= '0';
        pps_gnss_clk_count          <= (others => '0');
      else
        pps_gnss_clk_count_valid_q3 <= pps_gnss_valid_slr(pps_gnss_valid_slr'left);
        pps_gnss_clk_count_valid_q2 <= pps_gnss_clk_count_valid_q3;
        pps_gnss_clk_count_valid_q1 <= pps_gnss_clk_count_valid_q2;
        pps_gnss_clk_count_valid_q  <= pps_gnss_clk_count_valid_q1;

        if pps_gnss_clk_count_valid_q = '0' and pps_gnss_clk_count_valid_q1 = '1' then
          pps_gnss_clk_count <= pps_gnss_clk_xo_count_q;
        elsif clear_pps_gnss_clk_count = '1' then
          pps_gnss_clk_count <= (others => '0');  -- Visualize used measure
        end if;
      end if;
    end if;
  end process;

  int_pps_clk_count_cdc_p : process(clk)
  begin
    if rising_edge(clk) then
      pps_int_clk_xo_count_q1 <= pps_int_clk_xo_count;
      pps_int_clk_xo_count_q  <= pps_int_clk_xo_count_q1;
      --
      if reset = '1' then
        pps_int_clk_count_valid_q3 <= '0';
        pps_int_clk_count_valid_q2 <= '0';
        pps_int_clk_count_valid_q1 <= '0';
        pps_int_clk_count_valid_q  <= '0';
        pps_int_clk_count          <= (others => '0');
      else
        pps_int_clk_count_valid_q3 <= pps_int_valid_slr(pps_int_valid_slr'left);
        pps_int_clk_count_valid_q2 <= pps_int_clk_count_valid_q3;
        pps_int_clk_count_valid_q1 <= pps_int_clk_count_valid_q2;
        pps_int_clk_count_valid_q  <= pps_int_clk_count_valid_q1;

        if pps_int_clk_count_valid_q = '0' and pps_int_clk_count_valid_q1 = '1' then
          pps_int_clk_count <= pps_int_clk_xo_count_q;
        elsif clear_pps_int_clk_count = '1' then
          pps_int_clk_count <= (others => '0');  -- Visualize used measure
        end if;
      end if;
    end if;
  end process;

  pps_clk_count_cdc_p : process(clk)
  begin
    if rising_edge(clk) then
      pps_curr_clk_xo_count_q1 <= pps_curr_clk_xo_count;
      pps_curr_clk_xo_count_q  <= pps_curr_clk_xo_count_q1;
      --
      if reset = '1' then
        pps_curr_clk_count_valid_q3 <= '0';
        pps_curr_clk_count_valid_q2 <= '0';
        pps_curr_clk_count_valid_q1 <= '0';
        pps_curr_clk_count_valid_q  <= '0';
        pps_curr_clk_count          <= (others => '0');
      else
        pps_curr_clk_count_valid_q3 <= pps_curr_valid_slr(pps_curr_valid_slr'left);
        pps_curr_clk_count_valid_q2 <= pps_curr_clk_count_valid_q3;
        pps_curr_clk_count_valid_q1 <= pps_curr_clk_count_valid_q2;
        pps_curr_clk_count_valid_q  <= pps_curr_clk_count_valid_q1;

        if pps_curr_clk_count_valid_q = '0' and pps_curr_clk_count_valid_q1 = '1' then
          pps_curr_clk_count <= pps_curr_clk_xo_count_q;
        end if;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Generate internal PPS pulse
  -----------------------------------------------------------------------------
  pps_enable_cdc : process(clk_xo)
  begin
    if rising_edge(clk_xo) then
      if reset = '1' then
        pps_int_enable_xo_q <= '0';
        pps_int_enable_xo   <= '0';
      else
        pps_int_enable_xo_q <= pps_int_enable;
        pps_int_enable_xo   <= pps_int_enable_xo_q;
      end if;
    end if;
  end process;

  pps_resync_cdc_p : process(clk_xo)
  begin
    if rising_edge(clk_xo) then
      if reset = '1' then
        pps_int_resync_q  <= '1';
        pps_int_resync_q1 <= '0';
        pps_int_resync_q2 <= '0';
        pps_int_resync_q3 <= '0';
      else
        pps_int_resync_q3 <= pps_int_resync;
        pps_int_resync_q2 <= pps_int_resync_q3;
        pps_int_resync_q1 <= pps_int_resync_q2;
        if pps_int_resync_q1 = '0' and pps_int_resync_q2 = '1' then
          pps_int_resync_q <= '1';
        elsif clear_pps_int_resync = '1' then
          pps_int_resync_q <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Generate a pulse from the last received GNSS pulse
  -- This is done after reset or when requesting a PPS resync
  pps_resync_p : process(clk_xo)
  begin
    if rising_edge(clk_xo) then
      if reset = '1' then
        pps_int_state        <= IDLE;
        pps_int_running      <= '0';
        pps_resync           <= '0';
        clear_pps_int_resync <= '0';
      else
        pps_resync           <= '0';
        clear_pps_int_resync <= '0';

        case pps_int_state is
          when IDLE =>

            if pps_gnss_pulse = '1' and pps_int_resync_q = '1' then
              pps_int_state        <= RUNNING;
              pps_int_resync_cnt   <= to_unsigned(1, pps_int_resync_cnt'length);
              clear_pps_int_resync <= '1';
            end if;

          when RUNNING =>

            if pps_int_resync_cnt = CLK_XO_FREQ-5 then
              pps_resync      <= '1';
              pps_int_running <= '1';
              pps_int_state   <= IDLE;
            else
              pps_int_resync_cnt <= pps_int_resync_cnt + 1;
            end if;
            
          when others =>
             pps_int_state   <= IDLE;

        end case;

      end if;
    end if;
  end process;

  -- Generate internal PPS.
  -- The first internal PPS will come after the first GNSS pulse
  -- and then runs without interruption unless a resync
  -- to the GNSS pulse  has been requested
  pps_int_p : process(clk_xo)
  begin
    if rising_edge(clk_xo) then
      if reset = '1' then
        pps_int_i        <= '0';
        pps_int_o        <= '0';
        pps_int_pulse    <= '0';
        pps_resync_latch <= '1';
      else

        pps_int_pulse <= '0';

        if pps_resync_latch = '1' and pps_resync = '1' then
          pps_int_i        <= '1';
          pps_int_o        <= pps_int_enable_xo;
          pps_int_pulse    <= '1';
          pps_int_cnt      <= (others => '0');
          pps_resync_latch <= '0';
        elsif pps_resync_latch = '0' and pps_int_cnt = CLK_XO_FREQ-1 then
          pps_int_i     <= '1';
          pps_int_o     <= pps_int_enable_xo;
          pps_int_pulse <= '1';
          pps_int_cnt   <= (others => '0');
        elsif pps_int_cnt = CLK_XO_FREQ/2-1 then
          pps_int_i   <= '0';
          pps_int_o   <= '0';
          pps_int_cnt <= pps_int_cnt + 1;
          -- Only re-trigger resync if in RUNNING state
          -- such that we know a valid PPS pulse will triggered
          if pps_int_state = RUNNING then
            pps_resync_latch <= '1';
          end if;
        else
          pps_int_cnt <= pps_int_cnt + 1;
        end if;

      end if;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Time-keeping
  -----------------------------------------------------------------------------

  -- Import internal PPS at the free-running clock
  pps_int_cdc : process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        pps_int_q  <= '0';
        pps_int_q1 <= '0';
        pps_int_q2 <= '0';
        pps_int_q3 <= '0';
      else
        pps_int_q3 <= pps_int_i;
        pps_int_q2 <= pps_int_q3;
        pps_int_q1 <= pps_int_q2;
        if pps_int_q1 = '0' and pps_int_q2 = '1' then
          pps_int_q <= '1';
        else
          pps_int_q <= '0';
        end if;
      end if;
    end if;
  end process;

  -- Time keeping at 50 MHz free-running clock
  -- Dependent only on the internal PPS such that
  -- operation is not altered on GNSS PPS loss
  time_keeping_p : process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        timestamp_i              <= (others => '0');
        next_pps_timestamp_latch <= '0';
        clks_since_pps_int_i     <= to_unsigned(1, clks_since_pps_int_i'length);  -- lsb = '1'
      else
        if next_pps_timestamp_valid = '1' then
          next_pps_timestamp_q     <= unsigned(next_pps_timestamp);
          next_pps_timestamp_latch <= '1';
        end if;
        --
        if pps_int_q = '1' then
          -- Count from 1 to compensate for not incrementing when pps occurs
          clks_since_pps_int_i <= to_unsigned(1, clks_since_pps_int_i'length);
          if next_pps_timestamp_latch = '1' then
            timestamp_i              <= next_pps_timestamp_q;
            next_pps_timestamp_latch <= '0';
          else
            timestamp_i <= timestamp_i + 1;
          end if;
        elsif pps_int_running = '1' then  -- count only when PPS internal is running
          clks_since_pps_int_i <= clks_since_pps_int_i + 1;
        end if;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Stopwatch
  -----------------------------------------------------------------------------
  stopwatch_p : process(clk)
  begin
    if rising_edge(clk) then
      if reset_stopwatch = '1' then
        stopwatch_i <= (others => '0');
      else
        stopwatch_i <= stopwatch_i + 1;
      end if;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Module outputs
  -----------------------------------------------------------------------------
  clks_since_pps_int <= std_logic_vector(clks_since_pps_int_i);
  timestamp          <= std_logic_vector(timestamp_i);
  stopwatch          <= std_logic_vector(stopwatch_i);

  pps_gnss_out <= pps_gnss_in;
  pps_int      <= pps_int_o;
  clk_xo_out   <= clk_xo;

end architecture;
