library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SP7_KU_PG is
    port (
	    clk_50mhz         : in  std_logic;
        rstn_50mhz        : in  std_logic;
				
		KU_0V85_PG        : in  std_logic;  --?ZU
		MGTAVCC_0V9_KU_PG : in  std_logic; 
		MGTAVTT_1V2_KU_PG : in  std_logic; 
	    MGTAUX_1V8_KU_PG  : in  std_logic;   --?ZU
        KU_1V8_PG         : in  std_logic; 
        QDR_1V3_KU_PG     : in  std_logic; 
		QDR_1V2_KU_PG     : in  std_logic; 
	
        KU_PG_FAULT_N     : out std_logic;
        
        --GBL_PWR_PG_o    : out std_logic;
	    STA_REG3_upper_o  : out std_logic_vector(1 downto 0);
	    STA_REG3_lower_o  : out std_logic_vector(2 downto 0);
		STA_REG4_o	      : out std_logic_vector(0 downto 0)
    );
end entity SP7_KU_PG;

architecture Behavioral of SP7_KU_PG is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";

    signal KU_PG_FAULT_N_i     : std_logic;
    signal KU_0V85_PG_i        : std_logic;  --?ZU
    signal MGTAVCC_0V9_KU_PG_i : std_logic; 
	signal MGTAVTT_1V2_KU_PG_i : std_logic; 
	signal MGTAUX_1V8_KU_PG_i  : std_logic;   --?ZU
    signal KU_1V8_PG_i         : std_logic; 
    signal QDR_1V3_KU_PG_i     : std_logic; 
    signal QDR_1V2_KU_PG_i     : std_logic; 
    
begin
    

    -- Synchronous Power Good
    process (clk_50mhz)
    begin
        if rising_edge(clk_50mhz) then
	        if rstn_50mhz = '0' then
		        KU_PG_FAULT_N_i <= '0'; 
				--STA_REG3_o <= (others => '0');
				STA_REG3_upper_o <= (others => '0');
				STA_REG3_lower_o <= (others => '0');
				STA_REG4_o <= (others => '0');
				
				KU_0V85_PG_i        <= '0';
				MGTAVCC_0V9_KU_PG_i <= '0';
				MGTAVTT_1V2_KU_PG_i <= '0';
				MGTAUX_1V8_KU_PG_i  <= '0';
				KU_1V8_PG_i         <= '0';
				QDR_1V3_KU_PG_i     <= '0';
				QDR_1V2_KU_PG_i     <= '0';
				
	        else
			    KU_0V85_PG_i        <= KU_0V85_PG;
				MGTAVCC_0V9_KU_PG_i <= MGTAVCC_0V9_KU_PG;
				MGTAVTT_1V2_KU_PG_i <= MGTAVTT_1V2_KU_PG;
				MGTAUX_1V8_KU_PG_i  <= MGTAUX_1V8_KU_PG;
				KU_1V8_PG_i         <= KU_1V8_PG;
				QDR_1V3_KU_PG_i     <= QDR_1V3_KU_PG;
				QDR_1V2_KU_PG_i     <= QDR_1V2_KU_PG;
				
				--STA_REG3_o <= QDR_1V3_KU_PG_i & KU_1V8_PG_i & MGTAVTT_1V2_KU_PG_i & MGTAVCC_0V9_KU_PG_i & KU_0V85_PG_i;
				STA_REG3_upper_o <= QDR_1V3_KU_PG_i & KU_1V8_PG_i;
				STA_REG3_lower_o <= MGTAVTT_1V2_KU_PG_i & MGTAVCC_0V9_KU_PG_i & KU_0V85_PG_i;
				
				--STA_REG4_o <= '0' & MGTAUX_1V8_KU_PG_i;
				STA_REG4_o(0) <= QDR_1V2_KU_PG_i;				
				if KU_0V85_PG_i = '1' and MGTAVCC_0V9_KU_PG_i = '1' and MGTAVTT_1V2_KU_PG_i = '1' and MGTAUX_1V8_KU_PG_i = '1' 
				  and KU_1V8_PG_i = '1' and QDR_1V3_KU_PG_i = '1' and QDR_1V2_KU_PG_i = '1' then   			
                  KU_PG_FAULT_N_i <= '1';
			    else
                  KU_PG_FAULT_N_i <= '0';		
			    end if;			
						        
		    end if;    
        end if;
    end process;

    -- Output Synchronized Power Good
    --GBL_PWR_PG_o <= sync_pwr_pg;
	KU_PG_FAULT_N <= KU_PG_FAULT_N_i;

end architecture Behavioral;
