----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2022 07:49:14 PM
-- Design Name: 
-- Module Name: spi_slave - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity spi_slave is
generic(
        CPOL : std_logic := '1' 
);
  Port (
  
    mosi : in std_logic;
    miso : out std_logic;
    ss_i : in std_logic;
    sclk : in std_logic;  
    addr_o : out std_logic_vector(15 downto 0);
    data_o : out std_logic_vector(7 downto 0);
    wr_rd_o : out std_logic;
    en_o : out std_logic;
    data_i : in std_logic_vector(7 downto 0)
  
   );
end spi_slave;




architecture Behavioral of spi_slave is

signal counter : integer := 0; 
signal address : std_logic_vector(15 downto 0) := (others => '0') ;
signal data : std_logic_vector(7 downto 0) := (others => '0') ;  
signal miso_w : std_logic;
begin

--wr_rd_o <= address(15);
addr_o <= address;
data_o <= data;

process(sclk)
begin
	if sclk'event and sclk = CPOL then
		if (ss_i = '0') then
			
			if counter < 16 then 
				address <= address;
				address(15-counter) <= mosi;	
				
				en_o <= '0';
				wr_rd_o <= '0';
				if (counter = 15) then 
					en_o <= '1';
					counter <= 16;
				else 
				counter <= counter + 1;
				end if;
			elsif counter < 24 then
				address <= address;
				data <= data;
				data(23-counter) <= mosi;
				en_o <= '0';
				wr_rd_o <= '0';

				if (counter = 23) then 
					en_o <= '1';
					wr_rd_o <= address(14);
					counter <= 0;
				else 
				counter <= counter + 1;
				end if;
			end if;
		else
			address <= address;
			data <= data;
			counter <= counter;
			en_o <= '0';
		end if;
	end if;
end process;


process(sclk)
begin
	if sclk'event and sclk = not CPOL then
		if (ss_i = '0') then	
			if counter < 16 then 
				miso_w <= '1';
			elsif counter < 24 then
				miso_w <= data_i(23 - (counter));			
			end if;
		else
			miso_w <= '1';
		end if;
	end if;
end process;
miso <= miso_w when ss_i = '0' else 'Z';
end Behavioral;
