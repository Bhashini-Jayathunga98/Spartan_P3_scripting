----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.07.2023 13:06:46
-- Design Name: 
-- Module Name: async_reg - Behavioral
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

entity async_reg is
    Port ( clkb : in STD_LOGIC;
           siga : in STD_LOGIC;
           sigb : out STD_LOGIC);
end async_reg;

architecture Behavioral of async_reg is
signal sig_meta: std_logic;
signal sig_metb : std_logic;
attribute ASYNC_REG: string;
attribute DONT_TOUCH: string;
attribute ASYNC_REG of sig_meta: signal is "TRUE";
attribute DONT_TOUCH of sig_meta: signal is "TRUE";
attribute ASYNC_REG of sig_metb: signal is "TRUE";
attribute DONT_TOUCH of sig_metb: signal is "TRUE";
begin
process(clkb)
begin
    if (rising_edge(clkb)) then 
        sig_meta <= siga;
        sig_metb <= sig_meta;
    end if;
sigb <= sig_metb;
end process;

end Behavioral;
