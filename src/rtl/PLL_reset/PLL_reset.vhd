library ieee;
use ieee.std_logic_1164.all;

entity PLL_reset is
    port (      
        clk_50mhz            : in  std_logic;
        rstn_50mhz           : in  std_logic;
  --      clk_pwr_pg_i         : in std_logic;
		MCU_PLL_RESETB       : in  std_logic;				
		SP7_LS_PLL1_RESETB   : out std_logic;
		SP7_FPGA_PLL2_RESETB : out std_logic;
		SP7_AFE_PLL3_RESETB  : out std_logic;
		SP7_SYNTH_PLL4_CE    : out std_logic
    );
end entity PLL_reset;

architecture Behavioral of PLL_reset is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";

    signal MCU_PLL_RESETB_i, MCU_PLL_RESETB_r       : std_logic;
    signal SP7_LS_PLL1_RESETB_i   : std_logic;
	signal SP7_FPGA_PLL2_RESETB_i : std_logic;
	signal SP7_AFE_PLL3_RESETB_i  : std_logic; 
	signal SP7_SYNTH_PLL4_CE_i    : std_logic;
	
begin
    -- Synchronous PLL reset Signal
    process (clk_50mhz)
    begin
	if rising_edge(clk_50mhz) then
		if rstn_50mhz = '0' then
            ---desired outputs on reset?
            --should these be 1 at startup?
            MCU_PLL_RESETB_r       <= '1';	
            MCU_PLL_RESETB_i       <= '1';		
            SP7_LS_PLL1_RESETB_i   <= '1';
		    SP7_FPGA_PLL2_RESETB_i <= '1';
		    SP7_AFE_PLL3_RESETB_i  <= '1';
		    SP7_SYNTH_PLL4_CE_i    <= '0';   					 
        else
             
            MCU_PLL_RESETB_r       <= MCU_PLL_RESETB;    
            MCU_PLL_RESETB_i <= MCU_PLL_RESETB_r;
                         		    
		    
		      SP7_LS_PLL1_RESETB_i       <= not MCU_PLL_RESETB_i;  		
		      SP7_FPGA_PLL2_RESETB_i       <= not MCU_PLL_RESETB_i;
		      SP7_AFE_PLL3_RESETB_i       <= not MCU_PLL_RESETB_i;
		       SP7_SYNTH_PLL4_CE_i       <=  MCU_PLL_RESETB_i; 
	end if;
	end if;
    end process;
		
    -- Output Synchronized PLL Sync Signals
	SP7_LS_PLL1_RESETB   <= SP7_LS_PLL1_RESETB_i; 
    SP7_FPGA_PLL2_RESETB <= SP7_FPGA_PLL2_RESETB_i;
    SP7_AFE_PLL3_RESETB  <= SP7_AFE_PLL3_RESETB_i;
	SP7_SYNTH_PLL4_CE    <= SP7_SYNTH_PLL4_CE_i;
	
end architecture Behavioral;
