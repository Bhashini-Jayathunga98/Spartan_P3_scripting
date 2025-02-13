----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2023 02:07:28 PM
-- Design Name: 
-- Module Name: ldo_enable - Behavioral
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

entity ldo_enable is
    Port ( clk                       : in  STD_LOGIC;
           rst_n                     : in  STD_LOGIC;
           mcu_main_clk_en_i           : in  STD_LOGIC;
           config_ocxo_i               : in std_logic;
           config_vctcxo_i              : in std_logic;
           ocxo_3v3_en_o               : out STD_LOGIC;
           vctcxo_3v3_en_o             : out STD_LOGIC;
           STA_REG_o 	             : out std_logic_vector(1 downto 0)
           );
end ldo_enable;

architecture Behavioral of ldo_enable is

begin

    -- Synchronous OCXO/VCTCXO Source Control
    p_ldo_src_ctrl : process (clk)
    begin
        if rising_edge(clk) then
	        if rst_n = '0' then
                ocxo_3v3_en_o   <= '0';
                vctcxo_3v3_en_o <= '0';
                STA_REG_o       <= (others => '0');            
	        else
	           if mcu_main_clk_en_i = '1' then
	               ocxo_3v3_en_o   <= config_ocxo_i;
                   vctcxo_3v3_en_o <= config_vctcxo_i;
                   STA_REG_o <= config_ocxo_i & config_vctcxo_i;
               else 
                   ocxo_3v3_en_o   <= '0';
                   vctcxo_3v3_en_o <= '0'; 
                   STA_REG_o <= (others => '0');
               end if;
	                           
            end if;
        end if;
    end process;
end Behavioral;
