----------------------------------------------------------------------------------
-- Company:  THAKSHANA TECHNOLOGIES PVT LIMITED
-- Engineer: MADUSHAN S.D.
-- 
-- Create Date: 12/20/2023 10:26:03 AM
-- Design Name: DAC 82001/2 SPI CONTROLLER
-- Module Name: dac_82002_ctrl - axi lite
-- Project Name: 
-- Target Devices: SPARTAN7
-- Tool Versions: 
-- Description: This will generate SPI signaling to control Vout of 16-bit DAC
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 1.00 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dac_82002_ctrl is
  port (
    ----------- Input Ports -----------
    clk         : in  std_logic;          -- System clock of 100MHz
    start       : in  std_logic;          -- Start signal/ data available
    inp_data    : in  std_logic_vector(23 downto 0); --Available 24 bit data to send using SPI
    
    ----------- Output Ports -----------
    dac_reset_n : out std_logic;          -- Asynchronous clear (not supported always set to high)
    dac_sync_n  : out std_logic;          -- Active low Sync signal 
    dac_sclk    : out std_logic;          -- Serial Clock  (set to 1MHz and max sclk is 50MHz)
    dac_mosi    : out std_logic           -- Serial data output
    );
end entity;

architecture rtl of dac_82002_ctrl is
 ----------- Internal signals -----------
 
 ----------- Clock generation -----------
  signal clk_cnt : integer range 0 to 51 := 0;
  signal tsclk   : std_logic  := '0';
  
  ----------- SPI signaling -----------
  type state_type is (idle,setup,write);
  signal state : state_type := idle;
  signal treset_n, tsync_n : std_logic := '1';
  signal tmosi : std_logic := '0';
  signal setup_count : integer range 0 to 3 := 0;
  signal data_count : integer range 0 to 25 := 0;

begin

 ----------- SPI FSM -----------
 data_gen : process(tsclk)
 begin
 if(rising_edge(tsclk)) then
 case(state) is
 when idle =>
    tmosi <= '0';
    setup_count <= 0;
    data_count <= 0;
    tsync_n <= '1';
    
    if(start = '1') then
        state <= setup;
    else
        state <= idle;
    end if;
    
 when setup =>
    if(setup_count < 2) then -- 2 can be adjusted to match with sclk . min idle time is 200ns
        setup_count <= setup_count+1;
    else
        setup_count <= 0;
        state <= write;
    end if;
 when write =>
 tsync_n <= '0';
 if(data_count = 23) then
     tmosi <= inp_data(0);
     data_count <= 0;
     state <= idle;
 else
     tmosi <= inp_data(23 - data_count);
     data_count <= data_count + 1;
 end if;    

 when others =>
   state <= idle;  
 end case;
 end if;
 end process;


  -- Generate a clock of 1MHz
  dac_slower_clk : process(clk)
  begin
    if rising_edge(clk) then
        if (start = '1') then
            if (clk_cnt<50) then
                clk_cnt <= clk_cnt +1 ;
            else
                clk_cnt <= 0;
                tsclk <= not tsclk;
            end if;
        end if;
    end if;

  end process dac_slower_clk;

  -- Output registers to ease timing
--  out_p : process(clk)
--  begin
--    if rising_edge(clk) then
--        dac_sclk <= tsclk;
--        dac_reset_n <= treset_n;
--        dac_sync_n  <= tsync_n;
--        dac_mosi   <= tmosi;
--    end if;
--  end process;
        dac_sclk <= tsclk;
        dac_reset_n <= treset_n;
        dac_sync_n  <= tsync_n;
        dac_mosi   <= tmosi;

end architecture;

