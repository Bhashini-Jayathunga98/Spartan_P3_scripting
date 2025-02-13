library ieee;
use ieee.std_logic_1164.all;

entity MCU_PLL_SPI is
    port (
		clk_10mhz          : in std_logic;
		rstn_10mhz         : in std_logic;
		
		--MCU side signals
		--shared
		MCU_PLL_SPI_CLK    : in std_logic;
		MCU_PLL_SPI_SDIO_i : in std_logic;
		--MCU_PLL_SPI_SDIO_o : out std_logic;
		--individual
		MCU_PLL1_SPI_CS1   : in std_logic;
		MCU_PLL2_SPI_CS2   : in std_logic;
		MCU_PLL3_SPI_CS3   : in std_logic;
		MCU_PLL4_SPI_CS0   : in std_logic;
			
		--PLL side signals
		--shared
		--SP7_PLL_SPI_SDIO_i : in std_logic;
		SP7_PLL_SPI_SDIO_o : out std_logic;
		
		SP7_PLL_SPI_CLK    : out std_logic;
		
		--individual
		SP7_PLL4_SPI_CS    : out std_logic; 
		SP7_PLL1_SPI_CS1   : out std_logic;
		SP7_PLL2_SPI_CS2   : out std_logic;
		SP7_PLL3_SPI_CS3   : out std_logic;
		
		SP7_PLL4_SPI_SDI   : out std_logic;
		SP7_PLL4_SPI_SDO   : in std_logic
		
        
    );
end entity MCU_PLL_SPI; 

architecture behavioral of MCU_PLL_SPI is

-- Declare attributes for clocks and resets
    ATTRIBUTE X_INTERFACE_INFO : STRING; 
    ATTRIBUTE X_INTERFACE_INFO of clk_10mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_10mhz CLK";
    ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
    ATTRIBUTE X_INTERFACE_PARAMETER of clk_10mhz : SIGNAL is "ASSOCIATED_RESET rstn_10mhz, FREQ_HZ 10000000";

    ATTRIBUTE X_INTERFACE_INFO of MCU_PLL_SPI_CLK: SIGNAL is "xilinx.com:signal:data:1.0 MCU_PLL_SPI_CLK DATA";
    ATTRIBUTE X_INTERFACE_INFO of SP7_PLL_SPI_CLK: SIGNAL is "xilinx.com:signal:data:1.0 SP7_PLL_SPI_CLK DATA";

signal MCU_PLL_SPI_CLK_r  : std_logic_vector(2 downto 0);
signal MCU_PLL4_SPI_CS0_r : std_logic_vector(2 downto 0);
signal MCU_PLL1_SPI_CS1_r : std_logic_vector(2 downto 0);
signal MCU_PLL2_SPI_CS2_r : std_logic_vector(2 downto 0);
signal MCU_PLL3_SPI_CS3_r : std_logic_vector(2 downto 0);
signal MCU_PLL_SPI_SDIO_i_r : std_logic_vector(2 downto 0);

--signal SP7_PLL_SPI_SDIO_i_r : std_logic_vector(2 downto 0);

begin
    process(clk_10mhz)
		begin
		    if rising_edge(clk_10mhz) then		
			  if rstn_10mhz = '0' then 
				
				MCU_PLL_SPI_CLK_r  <= (others => '0');
				MCU_PLL4_SPI_CS0_r <= (others => '0');			
				MCU_PLL1_SPI_CS1_r <= (others => '0');
				MCU_PLL2_SPI_CS2_r <= (others => '0');
				MCU_PLL3_SPI_CS3_r <= (others => '0');
				
				MCU_PLL_SPI_SDIO_i_r <= (others => '0');
                --SP7_PLL_SPI_SDIO_i_r <= (others => '0');
			  else		
				
				MCU_PLL_SPI_CLK_r    <= MCU_PLL_SPI_CLK_r(1 downto 0) & MCU_PLL_SPI_CLK;
				MCU_PLL4_SPI_CS0_r   <= MCU_PLL4_SPI_CS0_r(1 downto 0) & MCU_PLL4_SPI_CS0;
				MCU_PLL1_SPI_CS1_r   <= MCU_PLL1_SPI_CS1_r(1 downto 0) & MCU_PLL1_SPI_CS1;
				MCU_PLL2_SPI_CS2_r   <= MCU_PLL2_SPI_CS2_r(1 downto 0) & MCU_PLL2_SPI_CS2;
				MCU_PLL3_SPI_CS3_r   <= MCU_PLL3_SPI_CS3_r(1 downto 0) & MCU_PLL3_SPI_CS3;
				
				MCU_PLL_SPI_SDIO_i_r <= MCU_PLL_SPI_SDIO_i_r(1 downto 0) & MCU_PLL_SPI_SDIO_i;
				
				--SP7_PLL_SPI_SDIO_i_r <= SP7_PLL_SPI_SDIO_i_r(1 downto 0) & SP7_PLL_SPI_SDIO_i;
				
		      end if;  
				
								
			end if;
    end process;
					
		SP7_PLL_SPI_CLK    <= MCU_PLL_SPI_CLK_r(2);
				
		SP7_PLL4_SPI_CS    <= MCU_PLL4_SPI_CS0_r(2);
		SP7_PLL1_SPI_CS1   <= MCU_PLL1_SPI_CS1_r(2);
		SP7_PLL2_SPI_CS2   <= MCU_PLL2_SPI_CS2_r(2);  
		SP7_PLL3_SPI_CS3   <= MCU_PLL3_SPI_CS3_r(2);
        SP7_PLL4_SPI_SDI <= MCU_PLL_SPI_SDIO_i_r(2);
		SP7_PLL_SPI_SDIO_o <= MCU_PLL_SPI_SDIO_i_r(2);
		--MCU_PLL_SPI_SDIO_o <= SP7_PLL_SPI_SDIO_i_r(2);
			
end architecture behavioral;
