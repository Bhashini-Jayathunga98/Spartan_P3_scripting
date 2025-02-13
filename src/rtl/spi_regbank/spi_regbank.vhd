------------------------------------------------------------------------

library ieee;
library unisim;
use ieee.std_logic_1164.all;
use unisim.vcomponents.all;
use ieee.numeric_std.all;
entity spi_regbank is
  port
  (
    M_spi_clk_i           : in  std_logic;
    M_spi_cs_i            : in  std_logic;
    M_spi_mosi_i          : in  std_logic;
    M_spi_miso_o          : out std_logic;
    M_spi_miso_dbg          : out std_logic;
    clk_10Mhz             : in  std_logic;
    rstn_10mhz            : in  std_logic;
    interrupt             : out std_logic;
	ctrl_reg0			  : out std_logic_vector(7 downto 0); -- addr 0x00
	ctrl_reg1			  : out std_logic_vector(7 downto 0); -- addr 0x01
	ctrl_reg2			  : out std_logic_vector(7 downto 0); -- addr 0x02
	ctrl_reg3			  : out std_logic_vector(7 downto 0); -- addr 0x03
	ctrl_reg4			  : out std_logic_vector(7 downto 0); -- addr 0x04
	ctrl_reg5			  : out std_logic_vector(7 downto 0); -- addr 0x05
	ctrl_reg6			  : out std_logic_vector(7 downto 0); -- addr 0x06
	ctrl_reg7			  : out std_logic_vector(7 downto 0); -- addr 0x07
	ctrl_reg8			  : out std_logic_vector(7 downto 0); -- addr 0x08
	ctrl_reg9			  : out std_logic_vector(7 downto 0); -- addr 0x09
	ctrl_reg10			  : out std_logic_vector(7 downto 0); -- addr 0x0A
	ctrl_reg11			  : out std_logic_vector(7 downto 0); -- addr 0x0B
	ctrl_reg12			  : out std_logic_vector(7 downto 0); -- addr 0x0C
	ctrl_reg13			  : out std_logic_vector(7 downto 0); -- addr 0x0D
	ctrl_reg14			  : out std_logic_vector(7 downto 0); -- addr 0x0E
	ctrl_reg15			  : out std_logic_vector(7 downto 0); -- addr 0x0F
	sta_reg0			  : in std_logic_vector(7 downto 0); -- addr 0x10
	sta_reg1			  : in std_logic_vector(7 downto 0); -- addr 0x11
	sta_reg2			  : in std_logic_vector(7 downto 0); -- addr 0x12
	sta_reg3			  : in std_logic_vector(7 downto 0); -- addr 0x13
	sta_reg4			  : in std_logic_vector(7 downto 0); -- addr 0x14
	sta_reg5			  : in std_logic_vector(7 downto 0); -- addr 0x15
	sta_reg6			  : in std_logic_vector(7 downto 0); -- addr 0x16
	sta_reg7			  : in std_logic_vector(7 downto 0); -- addr 0x17
	sta_reg8			  : in std_logic_vector(7 downto 0); -- addr 0x18
	sta_reg9			  : in std_logic_vector(7 downto 0); -- addr 0x19
	sta_reg10			  : in std_logic_vector(7 downto 0); -- addr 0x1A
	sta_reg11			  : in std_logic_vector(7 downto 0); -- addr 0x1B
	sta_reg12			  : in std_logic_vector(7 downto 0); -- addr 0x1C
	sta_reg13			  : in std_logic_vector(7 downto 0); -- addr 0x1D
	sta_reg14			  : in std_logic_vector(7 downto 0); -- addr 0x1E
	sta_reg15			  : in std_logic_vector(7 downto 0) -- addr 0x1F
 );
end entity;

architecture rtl of spi_regbank is

-- Declare attributes for clocks and resets
ATTRIBUTE X_INTERFACE_INFO : STRING; 
ATTRIBUTE X_INTERFACE_INFO of clk_10Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_10Mhz CLK";
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER of clk_10Mhz : SIGNAL is "ASSOCIATED_RESET rstn_10mhz, FREQ_HZ 10000000";

component spi_slave is
generic(
        CPOL : std_logic := '1' 
);
  Port (
  
    mosi    : in  std_logic;
    miso    : out std_logic;
    ss_i    : in  std_logic;
    sclk    : in  std_logic;  
    addr_o  : out std_logic_vector(15 downto 0);
    data_o  : out std_logic_vector(7 downto 0);
    wr_rd_o : out std_logic;
    en_o    : out std_logic;
    data_i  : in  std_logic_vector(7 downto 0)
  
   );
end component;
 
type reg_type is array (0 to 31) of std_logic_vector(7 downto 0);
signal cs_reg : reg_type;

signal M_spi_clk_r, M_spi_clk_r1, M_spi_clk_r2           :  std_logic;
signal M_spi_cs_r, M_spi_cs_r1, M_spi_cs_r2              :  std_logic;
signal M_spi_mosi_r, M_spi_mosi_r1, M_spi_mosi_r2        :  std_logic;

signal spi_address : std_logic_vector(15 downto 0);
signal spi_rdwr    : std_logic;
signal spi_en      : std_logic;
signal spi_wdata   : std_logic_vector(7 downto 0);
signal spi_rdata   : std_logic_vector(7 downto 0);
signal spi_rdwr_10mhz_r1, spi_rdwr_10mhz_r2, spi_rdwr_10mhz_r3, spi_rdwr_10mhz : std_logic;
signal spi_en_10mhz_r1, spi_en_10mhz_r2, spi_en_10mhz_r3, spi_en_10mhz         : std_logic;


--interrupt related signals
signal sta_reg0_d : std_logic;

signal sta_reg0_del : std_logic_vector(7 downto 0);
signal sta_reg1_del : std_logic_vector(7 downto 0);
signal sta_reg2_del : std_logic_vector(7 downto 0);
signal sta_reg3_del : std_logic_vector(7 downto 0);
signal sta_reg4_del : std_logic_vector(7 downto 0);
signal sta_reg5_del : std_logic_vector(7 downto 0);

signal int_sta      :  std_logic_vector(5 downto 0);

signal miso_w : std_logic;
begin

RETIME_001:process(clk_10Mhz)
begin
  if rising_edge(clk_10Mhz)then
    M_spi_clk_r  <= M_spi_clk_i;
    M_spi_clk_r1 <= M_spi_clk_r;
    M_spi_clk_r2 <= M_spi_clk_r1;
	  
    M_spi_cs_r  <= M_spi_cs_i;
    M_spi_cs_r1 <= M_spi_cs_r;
    M_spi_cs_r2 <= M_spi_cs_r1;
	  
    M_spi_mosi_r  <= M_spi_mosi_i;
    M_spi_mosi_r1 <= M_spi_mosi_r;
    M_spi_mosi_r2 <= M_spi_mosi_r1;

  end if;
end process ;  

spi_slv: spi_slave 
generic map(
        CPOL => '1' 
)
  Port map(
  
    mosi    => M_spi_mosi_r2,
    miso    => miso_w,
    ss_i    => M_spi_cs_r2,
    sclk    => M_spi_clk_r2,
    addr_o  => spi_address,
    data_o  => spi_wdata,
    wr_rd_o => spi_rdwr,
    en_o    => spi_en,
    data_i  => spi_rdata
  
   );

M_spi_miso_dbg <= miso_w;
M_spi_miso_o <= miso_w;
process(clk_10Mhz)
begin
	if(rising_edge (clk_10Mhz)) then 
		spi_rdwr_10mhz_r1 <= spi_rdwr;
		spi_rdwr_10mhz_r2 <= spi_rdwr_10mhz_r1;
		spi_rdwr_10mhz_r3 <= not spi_rdwr_10mhz_r2;

	 end if;
end process;
spi_rdwr_10mhz <= spi_rdwr_10mhz_r2 and spi_rdwr_10mhz_r3;

process(clk_10Mhz)
begin
	if rising_edge(clk_10Mhz) then 
		spi_en_10mhz_r1 <= spi_en;
		spi_en_10mhz_r2 <= spi_en_10mhz_r1;
		spi_en_10mhz_r3 <= not spi_en_10mhz_r2;
	end if;
end process;
spi_en_10mhz <= spi_en_10mhz_r2 and spi_en_10mhz_r3;

process(clk_10Mhz)
begin
	if rising_edge(clk_10Mhz) then 
		if rstn_10mhz = '0' then	    
		    cs_reg(0) <= "00000111";			
			for I in 1 to 15 loop
				cs_reg(I) <= (others => '0');
			end loop;
		else 
			if(spi_en_10mhz = '1' and spi_rdwr_10mhz = '0') then
				spi_rdata <= cs_reg(to_integer(unsigned(spi_address(7 downto 0))));
			elsif (spi_en_10mhz = '1' and spi_rdwr_10mhz = '1') then 
				cs_reg(to_integer(unsigned(spi_address(3 downto 0)))) <= spi_wdata;
			else 
				for I in 0 to 15 loop
					cs_reg(I) <= cs_reg(I);
				end loop;
			end if;
		end if;
	end if;
end process;
ctrl_reg0 <= cs_reg(0);
ctrl_reg1 <= cs_reg(1);
ctrl_reg2 <= cs_reg(2);
ctrl_reg3 <= cs_reg(3);
ctrl_reg4 <= cs_reg(4);
ctrl_reg5 <= cs_reg(5);
ctrl_reg6 <= cs_reg(6);
ctrl_reg7 <= cs_reg(7);

ctrl_reg8 <= cs_reg(8);
ctrl_reg9 <= cs_reg(9);
ctrl_reg10 <= cs_reg(10);
ctrl_reg11 <= cs_reg(11);
ctrl_reg12 <= cs_reg(12);
ctrl_reg13 <= cs_reg(13);
ctrl_reg14 <= cs_reg(14);
ctrl_reg15 <= cs_reg(15);

cs_reg(16) <= sta_reg0;
cs_reg(17) <= sta_reg1;
cs_reg(18) <= sta_reg2;
cs_reg(19) <= sta_reg3;
cs_reg(20) <= sta_reg4;
cs_reg(21) <= sta_reg5;
cs_reg(22) <= sta_reg6;
cs_reg(23) <= sta_reg7;

cs_reg(24) <= sta_reg8;
cs_reg(25) <= sta_reg9;
cs_reg(26) <= sta_reg10;
cs_reg(27) <= sta_reg11;
cs_reg(28) <= sta_reg12;
cs_reg(29) <= sta_reg13;
cs_reg(30) <= sta_reg14;
cs_reg(31) <= sta_reg15;


end rtl;