library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SP7_LS_PG is
    port (
	    clk_50mhz         : in  std_logic;
        rstn_50mhz        : in  std_logic;
		
        GBL_3V3_PG        : in  std_logic;
        GBL_1V8_PG        : in  std_logic;
        LS_1V35_PG        : in  std_logic;
        LS_1V0_PG         : in  std_logic;
        LS_VDD_PG         : in  std_logic;
        LS_1V2_DDR4_PG    : in  std_logic;
        LS_DDR4_TERM_PG   : in  std_logic;
        LS_1V0_PHY_PG     : in  std_logic;
        LS_2V5_PHY_PG     : in  std_logic;
        LS_TA_PROG_SFP_PG : in  std_logic;
		
        PG_FAULT_N        : out std_logic;
        
		STA_REG2_o        : out std_logic_vector(7 downto 0);
	    STA_REG3_o        : out std_logic_vector(1 downto 0)
		
    );
end entity SP7_LS_PG;

architecture Behavioral of SP7_LS_PG is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";
	
	signal PG_FAULT_N_i        : std_logic;
	signal GBL_3V3_PG_i        : std_logic;
    signal GBL_1V8_PG_i        : std_logic;
    signal LS_1V35_PG_i        : std_logic;
    signal LS_1V0_PG_i         : std_logic;
    signal LS_VDD_PG_i         : std_logic;
    signal LS_1V2_DDR4_PG_i    : std_logic;
    signal LS_DDR4_TERM_PG_i   : std_logic;
    signal LS_1V0_PHY_PG_i     : std_logic;
    signal LS_2V5_PHY_PG_i     : std_logic;
    signal LS_TA_PROG_SFP_PG_i : std_logic;
    
begin
    

    -- Synchronous Power Good
    process (clk_50mhz)
    begin
        if rising_edge(clk_50mhz) then
	        if rstn_50mhz = '0' then
		        PG_FAULT_N_i <= '0';
				STA_REG2_o <= (others => '0');
				STA_REG3_o <= (others => '0');
						
				GBL_3V3_PG_i        <= '0';
                GBL_1V8_PG_i        <= '0';
                LS_1V35_PG_i        <= '0';
                LS_1V0_PG_i         <= '0';
                LS_VDD_PG_i         <= '0';
                LS_1V2_DDR4_PG_i    <= '0';
                LS_DDR4_TERM_PG_i   <= '0';
                LS_1V0_PHY_PG_i     <= '0';
                LS_2V5_PHY_PG_i     <= '0';
                LS_TA_PROG_SFP_PG_i <= '0';
				
	        else			    
				
				GBL_3V3_PG_i        <= GBL_3V3_PG;
                GBL_1V8_PG_i        <= GBL_1V8_PG;
                LS_1V35_PG_i        <= LS_1V35_PG;
                LS_1V0_PG_i         <= LS_1V0_PG;
                LS_VDD_PG_i         <= LS_VDD_PG;
                LS_1V2_DDR4_PG_i    <= LS_1V2_DDR4_PG;
                LS_DDR4_TERM_PG_i   <= LS_DDR4_TERM_PG;
                LS_1V0_PHY_PG_i     <= LS_1V0_PHY_PG;
                LS_2V5_PHY_PG_i     <= LS_2V5_PHY_PG;
                LS_TA_PROG_SFP_PG_i <= LS_TA_PROG_SFP_PG;
								
				STA_REG2_o <= LS_1V0_PHY_PG_i & LS_DDR4_TERM_PG_i & LS_1V2_DDR4_PG_i & LS_VDD_PG_i & LS_1V0_PG_i & LS_1V35_PG_i & GBL_1V8_PG_i & GBL_3V3_PG_i;							
                STA_REG3_o <= LS_TA_PROG_SFP_PG_i & LS_2V5_PHY_PG_i;
        
                if GBL_3V3_PG_i  = '1' and GBL_1V8_PG_i  = '1' and LS_1V35_PG_i  = '1' and LS_1V0_PG_i  = '1' and LS_VDD_PG_i  = '1' and      
                   LS_1V2_DDR4_PG_i = '1' and LS_DDR4_TERM_PG_i = '1' and LS_1V0_PHY_PG_i  = '1' and LS_2V5_PHY_PG_i = '1' and LS_TA_PROG_SFP_PG_i = '1' then
			
                  PG_FAULT_N_i <= '1';
			    else
                  PG_FAULT_N_i <= '0';		
			    end if;			
						        
		    end if;    
        end if;
    end process;

    -- Output Synchronized Power Good
    --GBL_PWR_PG_o <= sync_pwr_pg;
	PG_FAULT_N <= PG_FAULT_N_i;

end architecture Behavioral;
