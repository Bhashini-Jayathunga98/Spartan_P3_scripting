library ieee;
use ieee.std_logic_1164.all;

entity PG_fault is
    port (
        clk_50mhz           : in  std_logic;
        rstn_50mhz          : in  std_logic;       
		LS_PLL1_LOCK_STAT   : in  std_logic;
		FPGA_PLL2_LOCK_STAT : in  std_logic;
		AFE_PLL3_LOCK_STAT  : in  std_logic;
		SP7_PLL_STATUS      : out std_logic;
        STA_REG_o 	        : out std_logic_vector(2 downto 0)
    );
end entity PG_fault;

architecture Behavioral of PG_fault is
    signal AFE_PLL3_LOCK_STAT_i  : std_logic;
    signal FPGA_PLL2_LOCK_STAT_i : std_logic;
    signal LS_PLL1_LOCK_STAT_i   : std_logic;
    
begin
    -- Synchronous PLL Status Signal
    process (clk_50mhz)
    begin
	if rising_edge(clk_50mhz) then
        if rstn_50mhz = '0' then
           LS_PLL1_LOCK_STAT_i   <= '0';
		   FPGA_PLL2_LOCK_STAT_i <= '0';
		   AFE_PLL3_LOCK_STAT_i  <= '0';
		   SP7_PLL_STATUS        <= '0';
		   STA_REG_o             <= (others => '0');
        else           
            SP7_PLL_STATUS <= AFE_PLL3_LOCK_STAT_i and FPGA_PLL2_LOCK_STAT_i and LS_PLL1_LOCK_STAT_i; 			
			STA_REG_o	   <=  AFE_PLL3_LOCK_STAT_i & FPGA_PLL2_LOCK_STAT_i & LS_PLL1_LOCK_STAT_i;       
        end if;				
	end if;
    end process;

end architecture Behavioral;
