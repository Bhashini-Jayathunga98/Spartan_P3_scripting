library ieee;
use ieee.std_logic_1164.all;

entity PLLSync is
    port (
        MCU_PLL_SYNC_i  : in  std_logic;
        clk_50mhz       : in  std_logic;
        rstn_50mhz      : in  std_logic;
        LS_PLL1_SYNC_o  : out std_logic;
        FPGA_PLL2_SYNC_o : out std_logic;
        AFE_PLL3_SYNC_o : out std_logic;
        SYNTH_PLL4_SYNC_o : out std_logic
    );
end entity PLLSync;

architecture Behavioral of PLLSync is

    -- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_50Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_50Mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_50Mhz : SIGNAL is "ASSOCIATED_RESET rstn_50mhz, FREQ_HZ 50000000";

    signal MCU_PLL_SYNC_r, MCU_PLL_SYNC_rr  : std_logic;
    signal sync_LS_PLL1_SYNC : std_logic;
    signal sync_FPGA_PLL2_SYNC : std_logic;
    signal sync_AFE_PLL3_SYNC : std_logic;
    signal sync_SYNTH_PLL4_SYNC : std_logic;
begin
 
     process (clk_50mhz)
    begin
	if rising_edge(clk_50mhz) then
        if rstn_50mhz = '0' then
            MCU_PLL_SYNC_r <= '0';
            MCU_PLL_SYNC_rr <= '0';
        else
            MCU_PLL_SYNC_r <= MCU_PLL_SYNC_i;
            MCU_PLL_SYNC_rr <= MCU_PLL_SYNC_r;
        end if;
	end if;
    end process;
 
    -- Synchronous PLL Sync Signal
    process (clk_50mhz)
    begin
	if rising_edge(clk_50mhz) then
        if rstn_50mhz = '0' then
            sync_LS_PLL1_SYNC <= '0';
            sync_FPGA_PLL2_SYNC <= '0';
            sync_AFE_PLL3_SYNC <= '0';
            sync_SYNTH_PLL4_SYNC <= '0';
        else
            sync_LS_PLL1_SYNC <= MCU_PLL_SYNC_rr;
            sync_FPGA_PLL2_SYNC <= MCU_PLL_SYNC_rr;
            sync_AFE_PLL3_SYNC <= MCU_PLL_SYNC_rr;
            sync_SYNTH_PLL4_SYNC <= MCU_PLL_SYNC_rr;
        end if;
	end if;
    end process;

    -- Output Synchronized PLL Sync Signals
    LS_PLL1_SYNC_o <= sync_LS_PLL1_SYNC;
    FPGA_PLL2_SYNC_o <= sync_FPGA_PLL2_SYNC;
    AFE_PLL3_SYNC_o <= sync_AFE_PLL3_SYNC;
    SYNTH_PLL4_SYNC_o <= sync_SYNTH_PLL4_SYNC;
end architecture Behavioral;
