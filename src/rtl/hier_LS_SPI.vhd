library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_LS_SPI is
  port (
    LS_SP7_SPI_CS1 : in STD_LOGIC;
    LS_SPI_CLK : in STD_LOGIC;
    LS_SPI_MISO : out STD_LOGIC;
    LS_SPI_MOSI : in STD_LOGIC;
    P1_P2_P3_P4_O_V_OLD_VLD : in STD_LOGIC_VECTOR ( 7 downto 0 );
    clk_10Mhz : in STD_LOGIC;
    clk_lkd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    ctrl_reg3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    flash_upgrade_start : out STD_LOGIC_VECTOR ( 7 downto 0 );
    raddress : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    rstn_10mhz : in STD_LOGIC;
    sta_reg1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    waddress : out STD_LOGIC_VECTOR ( 31 downto 0 );
    wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    zu_ctrl : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end hier_LS_SPI;

architecture STRUCTURE of hier_LS_SPI is

  component spi_regbank is
  port (
    M_spi_clk_i : in STD_LOGIC;
    M_spi_cs_i : in STD_LOGIC;
    M_spi_mosi_i : in STD_LOGIC;
    M_spi_miso_o : out STD_LOGIC;
    M_spi_miso_dbg : out STD_LOGIC;
    clk_10Mhz : in STD_LOGIC;
    rstn_10mhz : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    ctrl_reg0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg4 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg5 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg6 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg7 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg8 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg9 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg10 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg11 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg12 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg13 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg14 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg15 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg5 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg6 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg7 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg8 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg9 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg10 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg11 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg12 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg13 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg14 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sta_reg15 : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component;

  signal In1_1 : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal LS_SP7_SPI_CS1_1 : STD_LOGIC;
  signal LS_SPI_CLK_1 : STD_LOGIC;
  signal LS_SPI_MOSI_1 : STD_LOGIC;
  signal clk_10Mhz_1 : STD_LOGIC;
  signal flsh_upgrade_start_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal rdata_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rstn_10mhz_1 : STD_LOGIC;
  signal spi_ls_regbank_M_spi_miso_o : STD_LOGIC;
  signal spi_ls_regbank_ctrl_reg0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg10 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg11 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg12 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg13 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg15 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg4 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg5 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg6 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg7 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg8 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_ls_regbank_ctrl_reg9 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sta_reg1_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal sta_reg6_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconcat_1_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconcat_2_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconcat_3_dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 7 downto 0 ) := (others => '0');
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 23 downto 0 ) := x"B00001";
  signal xlconstant_1_dout1 : STD_LOGIC_VECTOR ( 3 downto 0 ) := (others => '0');
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_1_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_2_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_3_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_4_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_5_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal xlslice_6_Dout : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_spi_ls_regbank_M_spi_miso_dbg_UNCONNECTED : STD_LOGIC;
  signal NLW_spi_ls_regbank_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_spi_ls_regbank_ctrl_reg14_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  
begin

  In1_1(3 downto 0) <= clk_lkd(3 downto 0);
  LS_SP7_SPI_CS1_1 <= LS_SP7_SPI_CS1;
  LS_SPI_CLK_1 <= LS_SPI_CLK;
  LS_SPI_MISO <= spi_ls_regbank_M_spi_miso_o;
  LS_SPI_MOSI_1 <= LS_SPI_MOSI;
  clk_10Mhz_1 <= clk_10Mhz;
  ctrl_reg3(7 downto 0) <= spi_ls_regbank_ctrl_reg12(7 downto 0);
  flash_upgrade_start(7 downto 0) <= flsh_upgrade_start_Dout(7 downto 0);
  raddress(31 downto 0) <= xlconcat_2_dout(31 downto 0);
  rdata_1(31 downto 0) <= rdata(31 downto 0);
  rstn_10mhz_1 <= rstn_10mhz;
  sta_reg1_1(7 downto 0) <= sta_reg1(7 downto 0);
  sta_reg6_1(7 downto 0) <= P1_P2_P3_P4_O_V_OLD_VLD(7 downto 0);
  waddress(31 downto 0) <= xlconcat_1_dout(31 downto 0);
  wdata(31 downto 0) <= xlconcat_0_dout(31 downto 0);
  zu_ctrl(7 downto 0) <= spi_ls_regbank_ctrl_reg13(7 downto 0);

--Version_H_0x1F  
xlslice_4_Dout(7 downto 0) <= xlconstant_1_dout(23 downto 16);

--Version_L_0x1D
xlslice_6_Dout(7 downto 0) <= xlconstant_1_dout(7 downto 0);

--Version_M_0x1E
xlslice_5_Dout(7 downto 0) <= xlconstant_1_dout(15 downto 8);

--flsh_upgrade_start
flsh_upgrade_start_Dout(7 downto 0) <= spi_ls_regbank_ctrl_reg15(7 downto 0);

spi_ls_regbank: component spi_regbank
     port map (
      M_spi_clk_i => LS_SPI_CLK_1,
      M_spi_cs_i => LS_SP7_SPI_CS1_1,
      M_spi_miso_dbg => NLW_spi_ls_regbank_M_spi_miso_dbg_UNCONNECTED,
      M_spi_miso_o => spi_ls_regbank_M_spi_miso_o,
      M_spi_mosi_i => LS_SPI_MOSI_1,
      clk_10Mhz => clk_10Mhz_1,
      ctrl_reg0(7 downto 0) => spi_ls_regbank_ctrl_reg0(7 downto 0),
      ctrl_reg1(7 downto 0) => spi_ls_regbank_ctrl_reg1(7 downto 0),
      ctrl_reg10(7 downto 0) => spi_ls_regbank_ctrl_reg10(7 downto 0),
      ctrl_reg11(7 downto 0) => spi_ls_regbank_ctrl_reg11(7 downto 0),
      ctrl_reg12(7 downto 0) => spi_ls_regbank_ctrl_reg12(7 downto 0),
      ctrl_reg13(7 downto 0) => spi_ls_regbank_ctrl_reg13(7 downto 0),
      ctrl_reg14(7 downto 0) => NLW_spi_ls_regbank_ctrl_reg14_UNCONNECTED(7 downto 0),
      ctrl_reg15(7 downto 0) => spi_ls_regbank_ctrl_reg15(7 downto 0),
      ctrl_reg2(7 downto 0) => spi_ls_regbank_ctrl_reg2(7 downto 0),
      ctrl_reg3(7 downto 0) => spi_ls_regbank_ctrl_reg3(7 downto 0),
      ctrl_reg4(7 downto 0) => spi_ls_regbank_ctrl_reg4(7 downto 0),
      ctrl_reg5(7 downto 0) => spi_ls_regbank_ctrl_reg5(7 downto 0),
      ctrl_reg6(7 downto 0) => spi_ls_regbank_ctrl_reg6(7 downto 0),
      ctrl_reg7(7 downto 0) => spi_ls_regbank_ctrl_reg7(7 downto 0),
      ctrl_reg8(7 downto 0) => spi_ls_regbank_ctrl_reg8(7 downto 0),
      ctrl_reg9(7 downto 0) => spi_ls_regbank_ctrl_reg9(7 downto 0),
      interrupt => NLW_spi_ls_regbank_interrupt_UNCONNECTED,
      rstn_10mhz => rstn_10mhz_1,
      sta_reg0(7 downto 0) => xlslice_0_Dout(7 downto 0),
      sta_reg1(7 downto 0) => xlslice_1_Dout(7 downto 0),
      sta_reg10(7 downto 0) => xlconstant_0_dout(7 downto 0),
      sta_reg11(7 downto 0) => xlconstant_0_dout(7 downto 0),
      sta_reg12(7 downto 0) => xlconstant_0_dout(7 downto 0),
      sta_reg13(7 downto 0) => xlslice_6_Dout(7 downto 0),
      sta_reg14(7 downto 0) => xlslice_5_Dout(7 downto 0),
      sta_reg15(7 downto 0) => xlslice_4_Dout(7 downto 0),
      sta_reg2(7 downto 0) => xlslice_2_Dout(7 downto 0),
      sta_reg3(7 downto 0) => xlslice_3_Dout(7 downto 0),
      sta_reg4(7 downto 0) => sta_reg1_1(7 downto 0),
      sta_reg5(7 downto 0) => xlconcat_3_dout(7 downto 0),
      sta_reg6(7 downto 0) => sta_reg6_1(7 downto 0),
      sta_reg7(7 downto 0) => xlconstant_0_dout(7 downto 0),
      sta_reg8(7 downto 0) => xlconstant_0_dout(7 downto 0),
      sta_reg9(7 downto 0) => xlconstant_0_dout(7 downto 0)
    );
    
xlconcat_0_dout(31 downto 0) <= 
    spi_ls_regbank_ctrl_reg3(7 downto 0) & 
    spi_ls_regbank_ctrl_reg2(7 downto 0) & 
    spi_ls_regbank_ctrl_reg1(7 downto 0) & 
    spi_ls_regbank_ctrl_reg0(7 downto 0);

xlconcat_1_dout(31 downto 0) <= 
    spi_ls_regbank_ctrl_reg7(7 downto 0) & 
    spi_ls_regbank_ctrl_reg6(7 downto 0) & 
    spi_ls_regbank_ctrl_reg5(7 downto 0) & 
    spi_ls_regbank_ctrl_reg4(7 downto 0);

xlconcat_2_dout(31 downto 0) <= 
    spi_ls_regbank_ctrl_reg11(7 downto 0) & 
    spi_ls_regbank_ctrl_reg10(7 downto 0) & 
    spi_ls_regbank_ctrl_reg9(7 downto 0) & 
    spi_ls_regbank_ctrl_reg8(7 downto 0);

xlconcat_3_dout(7 downto 0) <= In1_1(3 downto 0) & xlconstant_1_dout1(3 downto 0);

--xlslice_0
xlslice_0_Dout(7 downto 0) <= rdata_1(7 downto 0);

--xlslice_1
xlslice_1_Dout(7 downto 0) <= rdata_1(15 downto 8);

--xlslice_2
xlslice_2_Dout(7 downto 0) <= rdata_1(23 downto 16);

--xlslice_3
xlslice_3_Dout(7 downto 0) <= rdata_1(31 downto 24);

end STRUCTURE;
