library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_SPI_regbank is
  port (
    MCU_FPGA_SPI_MISO : out STD_LOGIC;
    MCU_FPGA_SPI_MOSI : in STD_LOGIC;
    MCU_FPGA_SPI_SCK : in STD_LOGIC;
    MCU_FPGA_SPI_SP7_CS : in STD_LOGIC;
    clk_10Mhz : in STD_LOGIC;
    ctrl_reg1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg4 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg5 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    ctrl_reg6 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rstn_10mhz : in STD_LOGIC
  );
end hier_SPI_regbank;

architecture STRUCTURE of hier_SPI_regbank is

  component sp7_cal3_ila_0_0 is
  port (
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe1 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe3 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe4 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component sp7_cal3_ila_0_0;
  
  component sp7_cal3_vio_0_0 is
  port (
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in5 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in6 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in7 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component sp7_cal3_vio_0_0;
  
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
  
  signal MCU_FPGA_SPI_MOSI_1 : STD_LOGIC;
  signal MCU_FPGA_SPI_SCK_1 : STD_LOGIC;
  signal MCU_FPGA_SPI_SP7_CS_1 : STD_LOGIC;
  signal clk_10Mhz_1 : STD_LOGIC;
  signal rstn_10mhz_1 : STD_LOGIC;
  signal spi_regbank_M_spi_miso_dbg : STD_LOGIC;
  signal spi_regbank_M_spi_miso_o : STD_LOGIC;
  signal spi_regbank_ctrl_reg0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg10 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg11 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg12 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg13 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg14 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg15 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg4 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg5 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg6 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg7 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg8 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_ctrl_reg9 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal spi_regbank_interrupt : STD_LOGIC;
  signal vio_0_probe_out0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal vio_0_probe_out1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal vio_0_probe_out2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal vio_0_probe_out3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal vio_0_probe_out4 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal vio_0_probe_out5 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal vio_0_probe_out6 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal vio_0_probe_out7 : STD_LOGIC_VECTOR ( 7 downto 0 );
  
begin

  MCU_FPGA_SPI_MISO <= spi_regbank_M_spi_miso_o;
  MCU_FPGA_SPI_MOSI_1 <= MCU_FPGA_SPI_MOSI;
  MCU_FPGA_SPI_SCK_1 <= MCU_FPGA_SPI_SCK;
  MCU_FPGA_SPI_SP7_CS_1 <= MCU_FPGA_SPI_SP7_CS;
  clk_10Mhz_1 <= clk_10Mhz;
  ctrl_reg1(7 downto 0) <= spi_regbank_ctrl_reg1(7 downto 0);
  ctrl_reg2(7 downto 0) <= spi_regbank_ctrl_reg2(7 downto 0);
  ctrl_reg3(7 downto 0) <= spi_regbank_ctrl_reg3(7 downto 0);
  ctrl_reg4(7 downto 0) <= spi_regbank_ctrl_reg4(7 downto 0);
  ctrl_reg5(7 downto 0) <= spi_regbank_ctrl_reg5(7 downto 0);
  ctrl_reg6(7 downto 0) <= spi_regbank_ctrl_reg6(7 downto 0);
  rstn_10mhz_1 <= rstn_10mhz;
  
ila_0: component sp7_cal3_ila_0_0
     port map (
      clk => clk_10Mhz_1,
      probe0(0) => MCU_FPGA_SPI_SCK_1,
      probe1(0) => MCU_FPGA_SPI_SP7_CS_1,
      probe2(0) => MCU_FPGA_SPI_MOSI_1,
      probe3(0) => spi_regbank_M_spi_miso_dbg,
      probe4(0) => spi_regbank_interrupt
    );
    
spi_regbank_0: component spi_regbank
     port map (
      M_spi_clk_i => MCU_FPGA_SPI_SCK_1,
      M_spi_cs_i => MCU_FPGA_SPI_SP7_CS_1,
      M_spi_miso_dbg => spi_regbank_M_spi_miso_dbg,
      M_spi_miso_o => spi_regbank_M_spi_miso_o,
      M_spi_mosi_i => MCU_FPGA_SPI_MOSI_1,
      clk_10Mhz => clk_10Mhz_1,
      ctrl_reg0(7 downto 0) => spi_regbank_ctrl_reg0(7 downto 0),
      ctrl_reg1(7 downto 0) => spi_regbank_ctrl_reg1(7 downto 0),
      ctrl_reg10(7 downto 0) => spi_regbank_ctrl_reg10(7 downto 0),
      ctrl_reg11(7 downto 0) => spi_regbank_ctrl_reg11(7 downto 0),
      ctrl_reg12(7 downto 0) => spi_regbank_ctrl_reg12(7 downto 0),
      ctrl_reg13(7 downto 0) => spi_regbank_ctrl_reg13(7 downto 0),
      ctrl_reg14(7 downto 0) => spi_regbank_ctrl_reg14(7 downto 0),
      ctrl_reg15(7 downto 0) => spi_regbank_ctrl_reg15(7 downto 0),
      ctrl_reg2(7 downto 0) => spi_regbank_ctrl_reg2(7 downto 0),
      ctrl_reg3(7 downto 0) => spi_regbank_ctrl_reg3(7 downto 0),
      ctrl_reg4(7 downto 0) => spi_regbank_ctrl_reg4(7 downto 0),
      ctrl_reg5(7 downto 0) => spi_regbank_ctrl_reg5(7 downto 0),
      ctrl_reg6(7 downto 0) => spi_regbank_ctrl_reg6(7 downto 0),
      ctrl_reg7(7 downto 0) => spi_regbank_ctrl_reg7(7 downto 0),
      ctrl_reg8(7 downto 0) => spi_regbank_ctrl_reg8(7 downto 0),
      ctrl_reg9(7 downto 0) => spi_regbank_ctrl_reg9(7 downto 0),
      interrupt => spi_regbank_interrupt,
      rstn_10mhz => rstn_10mhz_1,
      sta_reg0(7 downto 0) => vio_0_probe_out0(7 downto 0),
      sta_reg1(7 downto 0) => vio_0_probe_out1(7 downto 0),
      sta_reg10(7 downto 0) => spi_regbank_ctrl_reg10(7 downto 0),
      sta_reg11(7 downto 0) => spi_regbank_ctrl_reg11(7 downto 0),
      sta_reg12(7 downto 0) => spi_regbank_ctrl_reg12(7 downto 0),
      sta_reg13(7 downto 0) => spi_regbank_ctrl_reg13(7 downto 0),
      sta_reg14(7 downto 0) => spi_regbank_ctrl_reg14(7 downto 0),
      sta_reg15(7 downto 0) => spi_regbank_ctrl_reg15(7 downto 0),
      sta_reg2(7 downto 0) => vio_0_probe_out2(7 downto 0),
      sta_reg3(7 downto 0) => vio_0_probe_out3(7 downto 0),
      sta_reg4(7 downto 0) => vio_0_probe_out4(7 downto 0),
      sta_reg5(7 downto 0) => vio_0_probe_out5(7 downto 0),
      sta_reg6(7 downto 0) => vio_0_probe_out6(7 downto 0),
      sta_reg7(7 downto 0) => vio_0_probe_out7(7 downto 0),
      sta_reg8(7 downto 0) => spi_regbank_ctrl_reg8(7 downto 0),
      sta_reg9(7 downto 0) => spi_regbank_ctrl_reg9(7 downto 0)
    );
    
vio_0: component sp7_cal3_vio_0_0
     port map (
      clk => clk_10Mhz_1,
      probe_in0(7 downto 0) => spi_regbank_ctrl_reg0(7 downto 0),
      probe_in1(7 downto 0) => spi_regbank_ctrl_reg1(7 downto 0),
      probe_in2(7 downto 0) => spi_regbank_ctrl_reg2(7 downto 0),
      probe_in3(7 downto 0) => spi_regbank_ctrl_reg3(7 downto 0),
      probe_in4(7 downto 0) => spi_regbank_ctrl_reg4(7 downto 0),
      probe_in5(7 downto 0) => spi_regbank_ctrl_reg5(7 downto 0),
      probe_in6(7 downto 0) => spi_regbank_ctrl_reg6(7 downto 0),
      probe_in7(7 downto 0) => spi_regbank_ctrl_reg7(7 downto 0),
      probe_out0(7 downto 0) => vio_0_probe_out0(7 downto 0),
      probe_out1(7 downto 0) => vio_0_probe_out1(7 downto 0),
      probe_out2(7 downto 0) => vio_0_probe_out2(7 downto 0),
      probe_out3(7 downto 0) => vio_0_probe_out3(7 downto 0),
      probe_out4(7 downto 0) => vio_0_probe_out4(7 downto 0),
      probe_out5(7 downto 0) => vio_0_probe_out5(7 downto 0),
      probe_out6(7 downto 0) => vio_0_probe_out6(7 downto 0),
      probe_out7(7 downto 0) => vio_0_probe_out7(7 downto 0)
    );
    
end STRUCTURE;