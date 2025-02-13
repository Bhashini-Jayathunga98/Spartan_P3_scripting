-- (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: user.org:user:hier_flash_microblaze:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY sp7_cal3_hier_flash_microblaze_0_1 IS
  PORT (
    ARESETN : IN STD_LOGIC;
    Clk : IN STD_LOGIC;
    Debug_SYS_Rst : OUT STD_LOGIC;
    GNSS_1PPS : IN STD_LOGIC;
    INT_PPS : OUT STD_LOGIC;
    Reset : IN STD_LOGIC;
    SP7_10M_CLK_DAC_RESET : OUT STD_LOGIC;
    SP7_10M_CLK_DAC_SCLK : OUT STD_LOGIC;
    SP7_10M_CLK_DAC_SDIN : OUT STD_LOGIC;
    SP7_10M_CLK_DAC_SYNC : OUT STD_LOGIC;
    SP7_10M_SOURCE_SEL : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    SP7_DBG_UART_RX : IN STD_LOGIC;
    SP7_DBG_UART_TX : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    clk_10_in : IN STD_LOGIC;
    cmd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dcm_locked : IN STD_LOGIC;
    flash_upgrade_start : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    hier_microblaze_SP7_10M_SOURCE_SEL_n : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    radd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    spi_rtl_0_io0_i : IN STD_LOGIC;
    spi_rtl_0_io0_o : OUT STD_LOGIC;
    spi_rtl_0_io0_t : OUT STD_LOGIC;
    spi_rtl_0_io1_i : IN STD_LOGIC;
    spi_rtl_0_io1_o : OUT STD_LOGIC;
    spi_rtl_0_io1_t : OUT STD_LOGIC;
    spi_rtl_0_io2_i : IN STD_LOGIC;
    spi_rtl_0_io2_o : OUT STD_LOGIC;
    spi_rtl_0_io2_t : OUT STD_LOGIC;
    spi_rtl_0_io3_i : IN STD_LOGIC;
    spi_rtl_0_io3_o : OUT STD_LOGIC;
    spi_rtl_0_io3_t : OUT STD_LOGIC;
    spi_rtl_0_ss_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    spi_rtl_0_ss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    spi_rtl_0_ss_t : OUT STD_LOGIC;
    sta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    wadd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END sp7_cal3_hier_flash_microblaze_0_1;

ARCHITECTURE sp7_cal3_hier_flash_microblaze_0_1_arch OF sp7_cal3_hier_flash_microblaze_0_1 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF sp7_cal3_hier_flash_microblaze_0_1_arch: ARCHITECTURE IS "yes";
  COMPONENT hier_flash_microblaze IS
    PORT (
      ARESETN : IN STD_LOGIC;
      Clk : IN STD_LOGIC;
      Debug_SYS_Rst : OUT STD_LOGIC;
      GNSS_1PPS : IN STD_LOGIC;
      INT_PPS : OUT STD_LOGIC;
      Reset : IN STD_LOGIC;
      SP7_10M_CLK_DAC_RESET : OUT STD_LOGIC;
      SP7_10M_CLK_DAC_SCLK : OUT STD_LOGIC;
      SP7_10M_CLK_DAC_SDIN : OUT STD_LOGIC;
      SP7_10M_CLK_DAC_SYNC : OUT STD_LOGIC;
      SP7_10M_SOURCE_SEL : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      SP7_DBG_UART_RX : IN STD_LOGIC;
      SP7_DBG_UART_TX : OUT STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      clk_10_in : IN STD_LOGIC;
      cmd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      dcm_locked : IN STD_LOGIC;
      flash_upgrade_start : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      hier_microblaze_SP7_10M_SOURCE_SEL_n : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      radd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      spi_rtl_0_io0_i : IN STD_LOGIC;
      spi_rtl_0_io0_o : OUT STD_LOGIC;
      spi_rtl_0_io0_t : OUT STD_LOGIC;
      spi_rtl_0_io1_i : IN STD_LOGIC;
      spi_rtl_0_io1_o : OUT STD_LOGIC;
      spi_rtl_0_io1_t : OUT STD_LOGIC;
      spi_rtl_0_io2_i : IN STD_LOGIC;
      spi_rtl_0_io2_o : OUT STD_LOGIC;
      spi_rtl_0_io2_t : OUT STD_LOGIC;
      spi_rtl_0_io3_i : IN STD_LOGIC;
      spi_rtl_0_io3_o : OUT STD_LOGIC;
      spi_rtl_0_io3_t : OUT STD_LOGIC;
      spi_rtl_0_ss_i : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      spi_rtl_0_ss_o : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      spi_rtl_0_ss_t : OUT STD_LOGIC;
      sta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      wadd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT hier_flash_microblaze;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF sp7_cal3_hier_flash_microblaze_0_1_arch: ARCHITECTURE IS "hier_flash_microblaze,Vivado 2020.1";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF sp7_cal3_hier_flash_microblaze_0_1_arch : ARCHITECTURE IS "sp7_cal3_hier_flash_microblaze_0_1,hier_flash_microblaze,{}";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF sp7_cal3_hier_flash_microblaze_0_1_arch: ARCHITECTURE IS "IPI";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF wdata: SIGNAL IS "XIL_INTERFACENAME DATA.WDATA, LAYERED_METADATA undef, PortWidth 32";
  ATTRIBUTE X_INTERFACE_INFO OF wdata: SIGNAL IS "xilinx.com:signal:data:1.0 DATA.WDATA DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF wadd: SIGNAL IS "XIL_INTERFACENAME DATA.WADD, LAYERED_METADATA undef, PortWidth 32";
  ATTRIBUTE X_INTERFACE_INFO OF wadd: SIGNAL IS "xilinx.com:signal:data:1.0 DATA.WADD DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF sta: SIGNAL IS "XIL_INTERFACENAME DATA.STA, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF sta: SIGNAL IS "xilinx.com:signal:data:1.0 DATA.STA DATA";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_ss_t: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 SS_T";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_ss_o: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 SS_O";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_ss_i: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 SS_I";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io3_t: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO3_T";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io3_o: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO3_O";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io3_i: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO3_I";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io2_t: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO2_T";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io2_o: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO2_O";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io2_i: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO2_I";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io1_t: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO1_T";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io1_o: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO1_O";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io1_i: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO1_I";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io0_t: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO0_T";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io0_o: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO0_O";
  ATTRIBUTE X_INTERFACE_PARAMETER OF spi_rtl_0_io0_i: SIGNAL IS "XIL_INTERFACENAME spi_rtl_0, BUSIF.BOARD_INTERFACE Custom";
  ATTRIBUTE X_INTERFACE_INFO OF spi_rtl_0_io0_i: SIGNAL IS "xilinx.com:interface:spi:1.0 spi_rtl_0 IO0_I";
  ATTRIBUTE X_INTERFACE_PARAMETER OF rdata: SIGNAL IS "XIL_INTERFACENAME DATA.RDATA, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF rdata: SIGNAL IS "xilinx.com:signal:data:1.0 DATA.RDATA DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF radd: SIGNAL IS "XIL_INTERFACENAME DATA.RADD, LAYERED_METADATA undef, PortWidth 32";
  ATTRIBUTE X_INTERFACE_INFO OF radd: SIGNAL IS "xilinx.com:signal:data:1.0 DATA.RADD DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF cmd: SIGNAL IS "XIL_INTERFACENAME DATA.CMD, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF cmd: SIGNAL IS "xilinx.com:signal:data:1.0 DATA.CMD DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME RST.AP_RST_N, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME CLK.AP_CLK, FREQ_HZ 10000000, PHASE 0.0, ASSOCIATED_RESET ap_rst_n, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Reset: SIGNAL IS "XIL_INTERFACENAME RST.RESET, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF Reset: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.RESET RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Debug_SYS_Rst: SIGNAL IS "XIL_INTERFACENAME RST.DEBUG_SYS_RST, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF Debug_SYS_Rst: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.DEBUG_SYS_RST RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF Clk: SIGNAL IS "XIL_INTERFACENAME CLK.CLK, FREQ_HZ 50000000, PHASE 0.0, ASSOCIATED_RESET ARESETN, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF Clk: SIGNAL IS "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ARESETN: SIGNAL IS "XIL_INTERFACENAME RST.ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ARESETN: SIGNAL IS "xilinx.com:signal:reset:1.0 RST.ARESETN RST";
BEGIN
  U0 : hier_flash_microblaze
    PORT MAP (
      ARESETN => ARESETN,
      Clk => Clk,
      Debug_SYS_Rst => Debug_SYS_Rst,
      GNSS_1PPS => GNSS_1PPS,
      INT_PPS => INT_PPS,
      Reset => Reset,
      SP7_10M_CLK_DAC_RESET => SP7_10M_CLK_DAC_RESET,
      SP7_10M_CLK_DAC_SCLK => SP7_10M_CLK_DAC_SCLK,
      SP7_10M_CLK_DAC_SDIN => SP7_10M_CLK_DAC_SDIN,
      SP7_10M_CLK_DAC_SYNC => SP7_10M_CLK_DAC_SYNC,
      SP7_10M_SOURCE_SEL => SP7_10M_SOURCE_SEL,
      SP7_DBG_UART_RX => SP7_DBG_UART_RX,
      SP7_DBG_UART_TX => SP7_DBG_UART_TX,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      clk_10_in => clk_10_in,
      cmd => cmd,
      dcm_locked => dcm_locked,
      flash_upgrade_start => flash_upgrade_start,
      hier_microblaze_SP7_10M_SOURCE_SEL_n => hier_microblaze_SP7_10M_SOURCE_SEL_n,
      radd => radd,
      rdata => rdata,
      spi_rtl_0_io0_i => spi_rtl_0_io0_i,
      spi_rtl_0_io0_o => spi_rtl_0_io0_o,
      spi_rtl_0_io0_t => spi_rtl_0_io0_t,
      spi_rtl_0_io1_i => spi_rtl_0_io1_i,
      spi_rtl_0_io1_o => spi_rtl_0_io1_o,
      spi_rtl_0_io1_t => spi_rtl_0_io1_t,
      spi_rtl_0_io2_i => spi_rtl_0_io2_i,
      spi_rtl_0_io2_o => spi_rtl_0_io2_o,
      spi_rtl_0_io2_t => spi_rtl_0_io2_t,
      spi_rtl_0_io3_i => spi_rtl_0_io3_i,
      spi_rtl_0_io3_o => spi_rtl_0_io3_o,
      spi_rtl_0_io3_t => spi_rtl_0_io3_t,
      spi_rtl_0_ss_i => spi_rtl_0_ss_i,
      spi_rtl_0_ss_o => spi_rtl_0_ss_o,
      spi_rtl_0_ss_t => spi_rtl_0_ss_t,
      sta => sta,
      wadd => wadd,
      wdata => wdata
    );
END sp7_cal3_hier_flash_microblaze_0_1_arch;
