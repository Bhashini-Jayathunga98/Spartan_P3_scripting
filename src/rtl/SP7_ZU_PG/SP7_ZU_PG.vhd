library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SP7_ZU_PG is
    port (
	    clk_50mhz              : in  std_logic;
        rstn_50mhz             : in  std_logic;
				
		GBL_3V3_PG             : in  std_logic;
		GBL_1V8_PG             : in  std_logic;
		MGTAVCC_0V9_ZU_PG      : in  std_logic;
		MGTAVTT_1V2_ZU_PG      : in  std_logic;
        ZU_0V85_PG             : in  std_logic;
        DDR4_1V2_ZU_PG         : in  std_logic;
	    DDR4_ZU_TERM_PG        : in  std_logic;	
		PS_0V85_MGTRAVCC_ZU_PG : in  std_logic;	
        DDR4_2V5_ZU_PG         : in  std_logic;
        QDR_1V3_ZU_PG          : in  std_logic;
        VCC_1V2_PSPLL_ZU_PG    : in  std_logic;
        MGTAUX_1V8_ZU_PG       : in  std_logic;
        QDR_1V2_ZU_PG 	       : in  std_logic;	
		
        ZU_PG_FAULT_N          : out std_logic; --neg?
		
        STA_REG2_o	           : out std_logic_vector(1 downto 0);
	    STA_REG3_o	           : out std_logic_vector(0 downto 0);
		STA_REG4_o	           : out std_logic_vector(6 downto 0);
		STA_REG5_o	           : out std_logic_vector(2 downto 0)
		
    );
end entity SP7_ZU_PG;

architecture Behavioral of SP7_ZU_PG is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";
    
    signal ZU_PG_FAULT_N_i          : std_logic;     
    signal GBL_3V3_PG_i             : std_logic;                      
    signal GBL_1V8_PG_i             : std_logic;                      
    signal MGTAVCC_0V9_ZU_PG_i      : std_logic;          
    signal MGTAVTT_1V2_ZU_PG_i      : std_logic;        
    signal ZU_0V85_PG_i             : std_logic;               
    signal DDR4_1V2_ZU_PG_i         : std_logic;             
	signal DDR4_ZU_TERM_PG_i        : std_logic;         
    signal PS_0V85_MGTRAVCC_ZU_PG_i : std_logic;
    signal DDR4_2V5_ZU_PG_i         : std_logic;              
    signal QDR_1V3_ZU_PG_i          : std_logic;              
    signal VCC_1V2_PSPLL_ZU_PG_i    : std_logic; 
    signal MGTAUX_1V8_ZU_PG_i       : std_logic;        
    signal QDR_1V2_ZU_PG_i          : std_logic;              
       
    
begin
    
    -- Synchronous Power Good
    process (clk_50mhz)
    begin
        if rising_edge(clk_50mhz) then
	        if rstn_50mhz = '0' then
		        ZU_PG_FAULT_N_i <= '0'; 
				STA_REG2_o <= (others => '0');
				STA_REG3_o <= (others => '0');
				STA_REG4_o <= (others => '0');
				STA_REG5_o <= (others => '0');

                GBL_3V3_PG_i             <= '0';         
		        GBL_1V8_PG_i             <= '0';           
		        MGTAVCC_0V9_ZU_PG_i      <= '0';     
		        MGTAVTT_1V2_ZU_PG_i      <= '0';    
                ZU_0V85_PG_i             <= '0';      
                DDR4_1V2_ZU_PG_i         <= '0';        
	            DDR4_ZU_TERM_PG_i        <= '0';   
		        PS_0V85_MGTRAVCC_ZU_PG_i <= '0'; 
                DDR4_2V5_ZU_PG_i         <= '0';       
                QDR_1V3_ZU_PG_i          <= '0';      
                VCC_1V2_PSPLL_ZU_PG_i    <= '0'; 
                MGTAUX_1V8_ZU_PG_i       <= '0';    
                QDR_1V2_ZU_PG_i          <= '0';      
				
	        else
			    
			    GBL_3V3_PG_i             <= GBL_3V3_PG;          
		        GBL_1V8_PG_i             <= GBL_1V8_PG;            
		        MGTAVCC_0V9_ZU_PG_i      <= MGTAVCC_0V9_ZU_PG;     
		        MGTAVTT_1V2_ZU_PG_i      <= MGTAVTT_1V2_ZU_PG;     
                ZU_0V85_PG_i             <= ZU_0V85_PG;          
                DDR4_1V2_ZU_PG_i         <= DDR4_1V2_ZU_PG;        
	            DDR4_ZU_TERM_PG_i        <= DDR4_ZU_TERM_PG;     
		        PS_0V85_MGTRAVCC_ZU_PG_i <= PS_0V85_MGTRAVCC_ZU_PG;
                DDR4_2V5_ZU_PG_i         <= DDR4_2V5_ZU_PG;         
                QDR_1V3_ZU_PG_i          <= QDR_1V3_ZU_PG;      
                VCC_1V2_PSPLL_ZU_PG_i    <= VCC_1V2_PSPLL_ZU_PG;  
                MGTAUX_1V8_ZU_PG_i       <= MGTAUX_1V8_ZU_PG;      
                QDR_1V2_ZU_PG_i          <= QDR_1V2_ZU_PG;	      
            	
                if GBL_3V3_PG_i = '1' and GBL_1V8_PG_i  = '1' and MGTAVCC_0V9_ZU_PG_i  = '1' and MGTAVTT_1V2_ZU_PG_i = '1' and      
                  ZU_0V85_PG_i = '1' and DDR4_1V2_ZU_PG_i  = '1' and DDR4_ZU_TERM_PG_i = '1' and PS_0V85_MGTRAVCC_ZU_PG_i = '1' and 
                  DDR4_2V5_ZU_PG_i = '1' and QDR_1V3_ZU_PG_i  = '1' and VCC_1V2_PSPLL_ZU_PG_i  = '1' and  MGTAUX_1V8_ZU_PG_i = '1' and QDR_1V2_ZU_PG_i = '1' then 	       	
				  ZU_PG_FAULT_N_i <= '1';
		        else	
		          ZU_PG_FAULT_N_i <= '0';
				end if;
				STA_REG2_o <= GBL_1V8_PG_i & GBL_3V3_PG_i; 
				STA_REG3_o(0) <= ZU_0V85_PG_i;
				STA_REG4_o <= QDR_1V3_ZU_PG_i & DDR4_2V5_ZU_PG_i & PS_0V85_MGTRAVCC_ZU_PG_i & DDR4_ZU_TERM_PG_i & DDR4_1V2_ZU_PG_i & MGTAVTT_1V2_ZU_PG_i & MGTAVCC_0V9_ZU_PG_i;
				STA_REG5_o <= QDR_1V2_ZU_PG_i & MGTAUX_1V8_ZU_PG_i & VCC_1V2_PSPLL_ZU_PG_i;
		   end if;    
        end if;
    end process;

    -- Output 
   
	ZU_PG_FAULT_N <= ZU_PG_FAULT_N_i;

end architecture Behavioral;
