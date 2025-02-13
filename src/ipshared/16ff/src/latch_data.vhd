----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.07.2023 00:35:06
-- Design Name: 
-- Module Name: latch_data - Behavioral
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

entity latch_data is
generic(
	DATA_WIDTH : INTEGER := 32
);
port(
	clk_i : in std_logic;
	rstn_i : in std_logic;
	data_i : in std_logic_vector(DATA_WIDTH -1 downto 0);
	valid_i : in std_logic;
	data_o : out std_logic_vector(DATA_WIDTH -1 downto 0));
end latch_data;

architecture Behavioral of latch_data is
signal data_tmp : std_logic_vector(DATA_WIDTH - 1 downto 0);
begin
process(clk_i)
begin
if rising_edge(clk_i) then 
	if rstn_i <= '0' then 
		data_tmp <= (others => '0');
	else
		if (valid_i = '1') then 
			data_tmp <= data_i;
		else
			data_tmp <= data_tmp;
		end if;
	end if;
end if;
end process;
data_o <= data_tmp;

end Behavioral;