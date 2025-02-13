----------------------------------------------------------------------------------
-- Company:  THAKSHANA TECHNOLOGIES PVT LIMITED
-- Engineer: MADUSHAN S.D.
-- 
-- Create Date: 01/23/2024 03:26:03 PM
-- Design Name: CLOCK DETECTOR
-- Module Name: ext_clk_detector_ctrl - rtl
-- Project Name: 
-- Target Devices: SPARTAN7
-- Tool Versions: 
-- Description: This will detect whether external or internal 10MHz to be used by sensing availibility.
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 1.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ext_clk_detector_ctrl is
    Port ( clk          : in STD_LOGIC;
           reset        : in STD_LOGIC;
           clk_10_in    : in STD_LOGIC;
           start_in     : in STD_LOGIC_VECTOR (0 downto 0);
           clk_sel      : out STD_LOGIC_VECTOR (0 downto 0);
           time_synq_en : out STD_LOGIC_VECTOR (0 downto 0)
           );
end ext_clk_detector_ctrl;

architecture rtl of ext_clk_detector_ctrl is

  -- clk_count_p
  signal int_reset                                            : std_logic := '1';
  signal clk_in_q, clk_in_q1, clk_in_q2, clk_in_q3, clk_in_q4 : std_logic;
  signal clk_count                                            : integer range 0 to 255 := 0;
 
  constant edge_trigger   : std_logic := '1';
  constant edge_trigger_n : std_logic := '0'; 
  
  -- proces_fsm
  type pps_int_state_t is (START,DELAY, IDLE, EXT_COUNT, TRIGGER);
  signal state                : pps_int_state_t;
  signal latched_clk_count    : integer range 0 to 255 := 0;
  signal process_clk_count    : integer range 0 to 255 := 0;
  signal clk_select_sig       : STD_LOGIC_VECTOR (0 downto 0);
  signal clk_select_reg       : STD_LOGIC_VECTOR (0 downto 0);
  signal delay_count          : integer range 0 to 24 := 0;
  


begin

-- This process will detect and count rising/falling edges when int_reset =0
clk_count_p : process(clk)
begin

    if rising_edge(clk) then
        if reset = '0' then
            clk_in_q    <= '0';
            clk_in_q1   <= '0';
            clk_in_q2   <= '0';
            clk_in_q3   <= '0';
            clk_in_q4   <= '0';  
            clk_count   <= 0; 
        else                  
            if int_reset = '1' then
                clk_count   <= 0; 
                clk_in_q    <= '0';
                clk_in_q1   <= '0';
                clk_in_q2   <= '0';
                clk_in_q3   <= '0';
                clk_in_q4   <= '0';  
            else
                clk_in_q  <= clk_10_in;
                clk_in_q1 <= clk_in_q;
                clk_in_q2 <= clk_in_q1;
                clk_in_q3 <= clk_in_q2;
                clk_in_q4 <= clk_in_q3;
                -- Detect edge
                if clk_in_q2 = edge_trigger and clk_in_q3 = edge_trigger_n then
                    clk_count <= clk_count+1;
                end if;
            end if;
         end if;
     end if;
end process;

--This state machine process will select ext clock and try to count
--number of clock cycles within 100 cycles of 50HMz clock. if its 
--within desired range then it will keep select signal as it is.
--else internal clock will be selected.
count_fsm_p : process(clk)
  begin
    if rising_edge(clk) then
      if reset = '0' then

        clk_select_sig    <= "0";
        clk_select_reg    <= "0";
        int_reset         <= '1';
        latched_clk_count <= 0; 
        Process_clk_count <= 0; 
        delay_count       <= 0;  
        state             <= START;
        
        
      else

        case state is
            when START => --wait until signal come from uB to detect external ocxo
                if start_in = "1" then
                    state             <= DELAY;
                else
                    state             <= START;
                end if;
            
            when DELAY => --startup delay. This added to makesure External clock is up and running
                clk_select_sig <= "0"; --select clock source as external
                if delay_count = 8 then
                    state             <= EXT_COUNT;
                    int_reset <= '0';
                else 
                    delay_count <= delay_count + 1;
                end if;
          
            when EXT_COUNT =>
                -- Here gives signal to start count for 100 clock cycles 
                -- then it latch the count value of clock pulses of 10Mhz clock. 
                if Process_clk_count = 100 then
                    latched_clk_count <= clk_count;
                    state             <= TRIGGER;
                    
                else
                    --int_reset <= '0';
                    process_clk_count <= process_clk_count + 1;
                end if; 
            
            when TRIGGER =>

                Process_clk_count <= 0; 
                int_reset         <= '1';
                delay_count       <= 0;
                 
                --Periodically check whether externl clock is availavle. if not switch to internal
                if latched_clk_count  > 8 and latched_clk_count < 50 then
                        clk_select_sig <= "0"; --select clock source as external
                        clk_select_reg <= "0";
                        latched_clk_count <= 0;
                        state             <= DELAY;
                -- If internal it will permenantly switch to internal till power cycle            
                else
                        clk_select_sig <= "1"; --select clock source as internal
                        clk_select_reg <= "1";
                        state <= IDLE;
                end if;
                

            when IDLE =>
                --Here it waits forever until reset 
            
            when others =>
                state   <= DELAY;

        end case;

      end if;
    end if;
  end process;

  clk_sel      <= clk_select_sig;
  time_synq_en <= clk_select_reg;

end rtl;
