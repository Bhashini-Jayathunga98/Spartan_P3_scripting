library ieee;
use ieee.std_logic_1164.all;

entity SP7_LS_reset is
    port (      
        clk_50mhz               : in  std_logic;
        rstn_50mhz              : in  std_logic;
		
		MCU_LS_PORESET_CMD      : in  std_logic;
		LS_SP7_MCU_RESET_STAT   : out  std_logic;
				
		LS_PWRSEQ_RST_OUT_B_1V8 : in  std_logic;
		SP7_LS_PORESET_CMD      : out  std_logic;
		
		SP7_LS_NOR_PORESET      : out  std_logic;
		
		LS_SP7_RESET_REQ_B      : in  std_logic;
		LS_SP7_ASLEEP           : in  std_logic;
		LS_SP7_HRESET_B         : in  std_logic;
		
		LS_EMMC_RESET_B         : out  std_logic;
		LS_DDR_RESET_B          : out  std_logic		
    );
end entity SP7_LS_reset;

architecture Behavioral of SP7_LS_reset is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";

    signal MCU_LS_PORESET_CMD_i     : std_logic;
    signal LS_SP7_MCU_RESET_STAT_i  : std_logic;
    signal LS_SP7_RESET_REQ_B_i     : std_logic;
    signal LS_SP7_ASLEEP_i          : std_logic;
    signal LS_SP7_HRESET_B_i        : std_logic;
    
    signal MCU_LS_PORESET_CMD_ii     : std_logic;
    signal MCU_LS_PORESET_CMD_ii_inv : std_logic;
    signal LS_SP7_RESET_REQ_B_ii     : std_logic;
    signal LS_SP7_ASLEEP_ii          : std_logic;
    signal LS_SP7_HRESET_B_ii        : std_logic;
	
begin
    -- Synchronous PLL reset Signal
    process (clk_50mhz)
    begin
	if rising_edge(clk_50mhz) then
        if rstn_50mhz = '0' then
            MCU_LS_PORESET_CMD_i     <= '0';		
		    MCU_LS_PORESET_CMD_ii_inv <= '1';   
            LS_SP7_RESET_REQ_B_i     <= '0';  
		    LS_SP7_ASLEEP_i          <= '0';  
		    LS_SP7_HRESET_B_i        <= '0';			
			LS_SP7_MCU_RESET_STAT_i  <= '0';
			
			MCU_LS_PORESET_CMD_ii     <= '0';	
            LS_SP7_RESET_REQ_B_ii     <= '0';  
		    LS_SP7_ASLEEP_ii          <= '0';  
		    LS_SP7_HRESET_B_ii        <= '0';	
			
        else
		    MCU_LS_PORESET_CMD_i     <= MCU_LS_PORESET_CMD;
		    MCU_LS_PORESET_CMD_ii     <= MCU_LS_PORESET_CMD_i;
		    
			MCU_LS_PORESET_CMD_ii_inv <= not MCU_LS_PORESET_CMD_i;

            LS_SP7_RESET_REQ_B_i     <= LS_SP7_RESET_REQ_B;  
            LS_SP7_RESET_REQ_B_ii     <= LS_SP7_RESET_REQ_B_i;
            
		    LS_SP7_ASLEEP_i          <= LS_SP7_ASLEEP;  
		    LS_SP7_ASLEEP_ii          <= LS_SP7_ASLEEP_i; 
		     
		    LS_SP7_HRESET_B_i        <= LS_SP7_HRESET_B;
			LS_SP7_HRESET_B_ii        <= LS_SP7_HRESET_B_i;
			
			if LS_SP7_RESET_REQ_B_ii = '1' and  LS_SP7_ASLEEP_ii = '0' and  LS_SP7_HRESET_B_ii = '1' then
              LS_SP7_MCU_RESET_STAT_i <= '1';
			else
              LS_SP7_MCU_RESET_STAT_i <= '0';		
			end if;
        end if;
	end if;
    end process;
		
    -- Output Synchronized PLL Sync Signals
	
	LS_EMMC_RESET_B  <=  LS_SP7_HRESET_B_ii;
    LS_DDR_RESET_B   <=  LS_SP7_HRESET_B_ii;
	
	
	SP7_LS_PORESET_CMD <= MCU_LS_PORESET_CMD_ii;	
	SP7_LS_NOR_PORESET <= MCU_LS_PORESET_CMD_ii_inv;
	
	LS_SP7_MCU_RESET_STAT <= LS_SP7_MCU_RESET_STAT_i;
		
	
end architecture Behavioral;
