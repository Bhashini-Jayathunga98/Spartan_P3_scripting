library ieee;
use ieee.std_logic_1164.all;

entity PLL_lock_stat is
    port (
        clk_50mhz                   : in  std_logic;
        rstn_50mhz                  : in  std_logic;       
		LS_PLL1_LOCK_STAT           : in  std_logic;
		FPGA_PLL2_LOCK_STAT         : in  std_logic;
		AFE_PLL3_LOCK_STAT          : in  std_logic;
		SP7_PLL4_SPI_SDO_MUXOUT_2V5 : in  std_logic;
		SP7_PLL_STATUS              : out std_logic;
        STA_REG_o 	                : out std_logic_vector(3 downto 0)
    );
end entity PLL_lock_stat;

architecture Behavioral of PLL_lock_stat is

    signal SP7_PLL4_SPI_SDO_MUXOUT_2V5_i, SP7_PLL4_SPI_SDO_MUXOUT_2V5_ii : std_logic;
    signal AFE_PLL3_LOCK_STAT_i, AFE_PLL3_LOCK_STAT_ii          : std_logic;
    signal FPGA_PLL2_LOCK_STAT_i, FPGA_PLL2_LOCK_STAT_ii         : std_logic;
    signal LS_PLL1_LOCK_STAT_i, LS_PLL1_LOCK_STAT_ii           : std_logic;
    
begin
    -- Synchronous PLL Status Signal
    process (clk_50mhz)
    begin
	if rising_edge(clk_50mhz) then
        if rstn_50mhz = '0' then
           LS_PLL1_LOCK_STAT_i           <= '0';
		   FPGA_PLL2_LOCK_STAT_i         <= '0';
		   AFE_PLL3_LOCK_STAT_i          <= '0';
		   SP7_PLL4_SPI_SDO_MUXOUT_2V5_i <= '0';
		   LS_PLL1_LOCK_STAT_ii           <= '0';
		   FPGA_PLL2_LOCK_STAT_ii         <= '0';
		   AFE_PLL3_LOCK_STAT_ii          <= '0';
		   SP7_PLL4_SPI_SDO_MUXOUT_2V5_ii <= '0';
		   SP7_PLL_STATUS                <= '0';
		   STA_REG_o                     <= (others => '0');
        else
            LS_PLL1_LOCK_STAT_i           <= LS_PLL1_LOCK_STAT;
		    FPGA_PLL2_LOCK_STAT_i         <= FPGA_PLL2_LOCK_STAT;
		    AFE_PLL3_LOCK_STAT_i          <= AFE_PLL3_LOCK_STAT;
		    SP7_PLL4_SPI_SDO_MUXOUT_2V5_i <= SP7_PLL4_SPI_SDO_MUXOUT_2V5;   
		    
		    LS_PLL1_LOCK_STAT_ii           <= LS_PLL1_LOCK_STAT_i;
		    FPGA_PLL2_LOCK_STAT_ii         <= FPGA_PLL2_LOCK_STAT_i;
		    AFE_PLL3_LOCK_STAT_ii          <= AFE_PLL3_LOCK_STAT_i;
		    SP7_PLL4_SPI_SDO_MUXOUT_2V5_ii <= SP7_PLL4_SPI_SDO_MUXOUT_2V5_i;
		            
            SP7_PLL_STATUS                <= SP7_PLL4_SPI_SDO_MUXOUT_2V5_ii and AFE_PLL3_LOCK_STAT_ii and FPGA_PLL2_LOCK_STAT_ii and LS_PLL1_LOCK_STAT_ii; 			
            SP7_PLL_STATUS                <= SP7_PLL4_SPI_SDO_MUXOUT_2V5_ii and AFE_PLL3_LOCK_STAT_ii and FPGA_PLL2_LOCK_STAT_ii and LS_PLL1_LOCK_STAT_ii; 			
			STA_REG_o	                  <= SP7_PLL4_SPI_SDO_MUXOUT_2V5_ii & AFE_PLL3_LOCK_STAT_ii & FPGA_PLL2_LOCK_STAT_ii & LS_PLL1_LOCK_STAT_ii;       
        end if;				
	end if;
    end process;

end architecture Behavioral;
