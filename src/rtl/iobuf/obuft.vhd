----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.07.2023 13:29:37
-- Design Name: 
-- Module Name: obuft - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity o_buft is
    Port ( I : in STD_LOGIC;
           O : out STD_LOGIC;
           T : in STD_LOGIC);
end o_buft;

architecture Behavioral of o_buft is
begin
--obuft_inst: OBUFT 
 -- port map(
 --   O => O,
 --   I => I,
 --   T => T
 --   );
    O <= I when T = '0' else 'Z';
end Behavioral;
