library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity GlobalPowerGood is
    port (
        clk_50mhz       : in  std_logic;
        rstn_50mhz      : in  std_logic;
        
        GBL_3V8_PG_i    : in  std_logic;
        GBL_2V5_PG_i    : in  std_logic;
        GBL_2V2_PG_i    : in  std_logic;
        GBL_1V5_PG_i    : in  std_logic;
        
        GBL_3V8_PG_o    : out  std_logic;
        GBL_2V5_PG_o    : out  std_logic;
        GBL_2V2_PG_o    : out  std_logic;
        GBL_1V5_PG_o    : out  std_logic;
        
        GBL_PWR_PG_o    : out std_logic;
	    STA_REG_o	    : out std_logic_vector(3 downto 0)
    );
end entity GlobalPowerGood;

architecture Behavioral of GlobalPowerGood is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";

    signal GBL_3V8_PG_r, GBL_3V8_PG_rr    :   std_logic;
    signal GBL_2V5_PG_r, GBL_2V5_PG_rr    :   std_logic;
    signal GBL_2V2_PG_r, GBL_2V2_PG_rr    :   std_logic;
    signal GBL_1V5_PG_r, GBL_1V5_PG_rr    :   std_logic;
        
    
    signal sync_pwr_pg  : std_logic;
    signal sync_sta_reg : std_logic_vector(3 downto 0);
begin
    process (clk_50mhz) 
    begin
        if rising_edge (clk_50mhz) then 
            if rstn_50mhz = '0' then
                GBL_3V8_PG_r <= '0';
                GBL_3V8_PG_rr <= '0';
                GBL_2V5_PG_r <= '0';
                GBL_2V5_PG_rr <= '0';
                GBL_2V2_PG_r <= '0';
                GBL_2V2_PG_rr <= '0';
                GBL_1V5_PG_r <= '0';
                GBL_1V5_PG_rr <= '0';
            else
                GBL_3V8_PG_r <= GBL_3V8_PG_i;
                GBL_3V8_PG_rr <= GBL_3V8_PG_r;
            
                GBL_2V5_PG_r <= GBL_2V5_PG_i;
                GBL_2V5_PG_rr <= GBL_2V5_PG_r;
            
                GBL_2V2_PG_r <= GBL_2V2_PG_i;
                GBL_2V2_PG_rr <= GBL_2V2_PG_r;
            
                GBL_1V5_PG_r <= GBL_1V5_PG_i;
                GBL_1V5_PG_rr <= GBL_1V5_PG_r;
           end if;
        end if;
    end process;

    -- Synchronous Power Good
    process (clk_50mhz)
    begin
        if rising_edge(clk_50mhz) then
	        if rstn_50mhz = '0' then
            	sync_pwr_pg <= '0';
		        sync_sta_reg <= (others => '0');
	        else
            	--STA_REG_o <= X"0" & GBL_3V8_PG_i & GBL_2V5_PG_i & GBL_2V2_PG_i & GBL_1V5_PG_i;
            	sync_sta_reg <= GBL_1V5_PG_rr & GBL_2V2_PG_rr & GBL_2V5_PG_rr & GBL_3V8_PG_rr;
		        sync_pwr_pg <= GBL_3V8_PG_rr and GBL_2V5_PG_rr and GBL_2V2_PG_rr and GBL_1V5_PG_rr;
		    end if;    
        end if;
    end process;

    -- Output Synchronized Power Good
    GBL_PWR_PG_o <= sync_pwr_pg;
    STA_REG_o <= sync_sta_reg;
    GBL_3V8_PG_o    <= GBL_3V8_PG_rr;
    GBL_2V5_PG_o    <= GBL_2V5_PG_rr;
    GBL_2V2_PG_o    <= GBL_2V2_PG_rr;
    GBL_1V5_PG_o    <= GBL_1V5_PG_rr;
        
end architecture Behavioral;
