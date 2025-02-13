library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SP7_AFE_PG is
    port (
	    clk_50mhz              : in  std_logic;
        rstn_50mhz             : in  std_logic;
				
        DVDD_1V0_AFE_PG        : in  std_logic;
        VDD_1V0_SERDES_AFE_PG  : in  std_logic;
        VDD_1V0_AFE_PG	       : in  std_logic;	
        RX_1V2_AFE_PG          : in  std_logic;
        VDDR_1V5_SERDES_AFE_PG : in  std_logic;
        VDD_1V8_AFE_PG         : in  std_logic;
        GPIO_1V8_AFE_PG        : in  std_logic;
        RX_1V85_AFE_PG         : in  std_logic;
        NEG1V8_VEE_AFE_PG      : in  std_logic;
		
        AFE_PG_FAULT_N         : out std_logic; --neg?
		        
		STA_REG5_o	           : out std_logic_vector(4 downto 0);
		STA_REG6_o	           : out std_logic_vector(3 downto 0)
    );
end entity SP7_AFE_PG;

architecture Behavioral of SP7_AFE_PG is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";
    
    signal AFE_PG_FAULT_N_i         : std_logic;     

    signal DVDD_1V0_AFE_PG_i        : std_logic;
    signal VDD_1V0_SERDES_AFE_PG_i  : std_logic;
    signal VDD_1V0_AFE_PG_i	        : std_logic;	
    signal RX_1V2_AFE_PG_i          : std_logic;
    signal VDDR_1V5_SERDES_AFE_PG_i : std_logic;
    signal VDD_1V8_AFE_PG_i         : std_logic;
    signal GPIO_1V8_AFE_PG_i        : std_logic;
    signal RX_1V85_AFE_PG_i         : std_logic;
    signal NEG1V8_VEE_AFE_PG_i      : std_logic;	
       
    
begin
    
    -- Synchronous Power Good
    process (clk_50mhz)
    begin
        if rising_edge(clk_50mhz) then
	        if rstn_50mhz = '0' then
		        AFE_PG_FAULT_N_i <= '0'; 
				
				STA_REG5_o <= (others => '0');
				STA_REG6_o <= (others => '0');

                DVDD_1V0_AFE_PG_i        <= '0';      
                VDD_1V0_SERDES_AFE_PG_i  <= '0'; 
                VDD_1V0_AFE_PG_i         <= '0'; 	      	
                RX_1V2_AFE_PG_i          <= '0';         
                VDDR_1V5_SERDES_AFE_PG_i <= '0'; 
                VDD_1V8_AFE_PG_i         <= '0';       
                GPIO_1V8_AFE_PG_i        <= '0';       
                RX_1V85_AFE_PG_i         <= '0';       
                NEG1V8_VEE_AFE_PG_i      <= '0';     					
				
	        else
            	
				DVDD_1V0_AFE_PG_i        <= DVDD_1V0_AFE_PG;      
                VDD_1V0_SERDES_AFE_PG_i  <= VDD_1V0_SERDES_AFE_PG; 
                VDD_1V0_AFE_PG_i	     <= VDD_1V0_AFE_PG;	
                RX_1V2_AFE_PG_i          <= RX_1V2_AFE_PG;
                VDDR_1V5_SERDES_AFE_PG_i <= VDDR_1V5_SERDES_AFE_PG;
                VDD_1V8_AFE_PG_i         <= VDD_1V8_AFE_PG;
                GPIO_1V8_AFE_PG_i        <= GPIO_1V8_AFE_PG;
                RX_1V85_AFE_PG_i         <= RX_1V85_AFE_PG;
                NEG1V8_VEE_AFE_PG_i      <= NEG1V8_VEE_AFE_PG;
				
				AFE_PG_FAULT_N_i <= DVDD_1V0_AFE_PG_i and VDD_1V0_SERDES_AFE_PG_i and VDD_1V0_AFE_PG_i and RX_1V2_AFE_PG_i and 
				VDDR_1V5_SERDES_AFE_PG_i and VDD_1V8_AFE_PG_i and GPIO_1V8_AFE_PG_i and RX_1V85_AFE_PG_i and NEG1V8_VEE_AFE_PG_i;
				
				STA_REG5_o <= VDD_1V8_AFE_PG_i & RX_1V2_AFE_PG_i & VDD_1V0_AFE_PG_i & VDD_1V0_SERDES_AFE_PG_i & DVDD_1V0_AFE_PG_i;
				STA_REG6_o <= NEG1V8_VEE_AFE_PG_i & VDDR_1V5_SERDES_AFE_PG_i & RX_1V85_AFE_PG_i & GPIO_1V8_AFE_PG_i;
				
		   end if;    
        end if;
    end process;

    -- Output 
   
	AFE_PG_FAULT_N <= AFE_PG_FAULT_N_i;

end architecture Behavioral;
