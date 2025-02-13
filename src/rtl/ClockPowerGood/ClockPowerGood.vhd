library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ClockPowerGood is
    port (
        CONFIG_OCXO_VCTCXO_i : in std_logic_vector(1 downto 0);
        PLL1_3V3_PG_i       : in  std_logic;
        PLL2_3V3_PG_i       : in  std_logic;
        PLL3_3V3_PG_i       : in  std_logic;
        PLL4_3V3_PG_i       : in  std_logic;
        OCXO_3V3_PG_i       : in  std_logic;
        VCTCXO_3V3_PG_i     : in  std_logic;
        ocxo_clk_ld_i       : in  std_logic;
        vctcxo_clk_ld_i     : in  std_logic;
        
        PLL1_3V3_PG_o       : out  std_logic;
        PLL2_3V3_PG_o       : out  std_logic;
        PLL3_3V3_PG_o       : out  std_logic;
        PLL4_3V3_PG_o       : out  std_logic;
        OCXO_3V3_PG_o       : out  std_logic;
        VCTCXO_3V3_PG_o     : out  std_logic;
        ocxo_clk_ld_o       : out  std_logic;
        vctcxo_clk_ld_o     : out  std_logic;
        
        
        clk_50mhz           : in  std_logic;
        rstn_50mhz          : in  std_logic;
        CLK_PWR_PG_o        : out std_logic;
	    STA_REG_o	        : out std_logic_vector(7 downto 0)
    );
end entity ClockPowerGood;

architecture Behavioral of ClockPowerGood is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000, PHASE 0.0";


    signal PLL1_3V3_PG_r, PLL1_3V3_PG_rr       :   std_logic;
    signal PLL2_3V3_PG_r, PLL2_3V3_PG_rr       :   std_logic;
    signal PLL3_3V3_PG_r, PLL3_3V3_PG_rr       :   std_logic;
    signal PLL4_3V3_PG_r, PLL4_3V3_PG_rr       :   std_logic;
    signal OCXO_3V3_PG_r, OCXO_3V3_PG_rr       :   std_logic;
    signal VCTCXO_3V3_PG_r, VCTCXO_3V3_PG_rr     :   std_logic;
    signal ocxo_clk_ld_r, ocxo_clk_ld_rr       :   std_logic;
    signal vctcxo_clk_ld_r, vctcxo_clk_ld_rr     :   std_logic;    
    signal async_pwr_pg : std_logic;
    signal sync_pwr_pg  : std_logic;
begin
    process(clk_50mhz)
    begin
        if rising_edge(clk_50mhz) then 
            if rstn_50mhz = '0' then 
                PLL1_3V3_PG_r <= '0';
                PLL1_3V3_PG_rr <= '0';
                PLL2_3V3_PG_r <= '0';
                PLL2_3V3_PG_rr <= '0';
                PLL3_3V3_PG_r <= '0';
                PLL3_3V3_PG_rr <= '0';
                PLL4_3V3_PG_r <= '0';
                PLL4_3V3_PG_rr <= '0';
                OCXO_3V3_PG_r <= '0';
                OCXO_3V3_PG_rr <= '0';
                VCTCXO_3V3_PG_r <= '0';
                VCTCXO_3V3_PG_rr <= '0';
                ocxo_clk_ld_r <= '0';
                ocxo_clk_ld_rr <= '0';
                vctcxo_clk_ld_r <= '0';
                vctcxo_clk_ld_rr <= '0';
            else
                PLL1_3V3_PG_r <= PLL1_3V3_PG_i;
                PLL1_3V3_PG_rr <= PLL1_3V3_PG_r;
                PLL2_3V3_PG_r <= PLL2_3V3_PG_i;
                PLL2_3V3_PG_rr <= PLL2_3V3_PG_r;
                PLL3_3V3_PG_r <= PLL3_3V3_PG_i;
                PLL3_3V3_PG_rr <= PLL3_3V3_PG_r;
                PLL4_3V3_PG_r <= PLL4_3V3_PG_i;
                PLL4_3V3_PG_rr <= PLL4_3V3_PG_r;
                OCXO_3V3_PG_r <= OCXO_3V3_PG_i;
                OCXO_3V3_PG_rr <= OCXO_3V3_PG_r;
                VCTCXO_3V3_PG_r <= VCTCXO_3V3_PG_i;
                VCTCXO_3V3_PG_rr <= VCTCXO_3V3_PG_r;
                ocxo_clk_ld_r <= ocxo_clk_ld_i;
                ocxo_clk_ld_rr <= ocxo_clk_ld_r;
                vctcxo_clk_ld_r <= vctcxo_clk_ld_i;
                vctcxo_clk_ld_rr <= vctcxo_clk_ld_r;
            end if;
        end if;
    end process;
    -- Asynchronous Power Good
    process (PLL1_3V3_PG_rr, PLL2_3V3_PG_rr, PLL3_3V3_PG_rr, PLL4_3V3_PG_rr, OCXO_3V3_PG_rr, VCTCXO_3V3_PG_rr, CONFIG_OCXO_VCTCXO_i, ocxo_clk_ld_rr, vctcxo_clk_ld_rr)
    begin
        if CONFIG_OCXO_VCTCXO_i = "00" then
            async_pwr_pg <= PLL1_3V3_PG_rr and PLL2_3V3_PG_rr and PLL3_3V3_PG_rr and PLL4_3V3_PG_rr;
        elsif CONFIG_OCXO_VCTCXO_i = "10" then
            async_pwr_pg <= PLL1_3V3_PG_rr and PLL2_3V3_PG_rr and PLL3_3V3_PG_rr and PLL4_3V3_PG_rr and OCXO_3V3_PG_rr and ocxo_clk_ld_rr;
        elsif CONFIG_OCXO_VCTCXO_i = "01" then
            async_pwr_pg <= PLL1_3V3_PG_rr and PLL2_3V3_PG_rr and PLL3_3V3_PG_rr and PLL4_3V3_PG_rr and VCTCXO_3V3_PG_rr and vctcxo_clk_ld_rr;
        elsif CONFIG_OCXO_VCTCXO_i = "11" then
            async_pwr_pg <= PLL1_3V3_PG_rr and PLL2_3V3_PG_rr and PLL3_3V3_PG_rr and PLL4_3V3_PG_rr and OCXO_3V3_PG_rr and VCTCXO_3V3_PG_rr ;
        end if;
    end process;

    -- Synchronous Power Good
    process (clk_50mhz)
    begin
        if rising_edge(clk_50mhz) then
            if rstn_50mhz = '0' then
                sync_pwr_pg <= '0';
                STA_REG_o	<= (others => '0');
            else
                sync_pwr_pg <= async_pwr_pg;
	            STA_REG_o	<= vctcxo_clk_ld_rr & ocxo_clk_ld_rr & PLL1_3V3_PG_rr & PLL2_3V3_PG_rr & PLL3_3V3_PG_rr & PLL4_3V3_PG_rr & OCXO_3V3_PG_rr & VCTCXO_3V3_PG_rr;
            end if;
        end if;
    end process;

    -- Output Synchronized Power Good
    CLK_PWR_PG_o <= sync_pwr_pg;
            
        PLL1_3V3_PG_o       <= PLL1_3V3_PG_rr;
        PLL2_3V3_PG_o       <= PLL2_3V3_PG_rr;
        PLL3_3V3_PG_o       <= PLL3_3V3_PG_rr;
        PLL4_3V3_PG_o       <= PLL4_3V3_PG_rr;
        OCXO_3V3_PG_o       <= OCXO_3V3_PG_rr;
        VCTCXO_3V3_PG_o     <= VCTCXO_3V3_PG_rr;
        ocxo_clk_ld_o       <= ocxo_clk_ld_rr;
        vctcxo_clk_ld_o     <= vctcxo_clk_ld_rr;
        
end architecture Behavioral;
