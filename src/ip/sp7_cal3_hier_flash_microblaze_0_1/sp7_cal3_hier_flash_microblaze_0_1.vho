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

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT sp7_cal3_hier_flash_microblaze_0_1
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
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : sp7_cal3_hier_flash_microblaze_0_1
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
-- INST_TAG_END ------ End INSTANTIATION Template ---------

