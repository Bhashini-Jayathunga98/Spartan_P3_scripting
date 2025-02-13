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

-- IP VLNV: xilinx.com:hls:parallel_to_AXI:1.0
-- IP Revision: 2107311424

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY hier_flash_microblaze_parallel_to_AXI_0_0 IS
  PORT (
    rdata_ap_vld : OUT STD_LOGIC;
    sta_ap_vld : OUT STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_AWREADY : IN STD_LOGIC;
    m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_WLAST : OUT STD_LOGIC;
    m_axi_gmem_WVALID : OUT STD_LOGIC;
    m_axi_gmem_WREADY : IN STD_LOGIC;
    m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_BVALID : IN STD_LOGIC;
    m_axi_gmem_BREADY : OUT STD_LOGIC;
    m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
    m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    m_axi_gmem_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_ARREADY : IN STD_LOGIC;
    m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    m_axi_gmem_RLAST : IN STD_LOGIC;
    m_axi_gmem_RVALID : IN STD_LOGIC;
    m_axi_gmem_RREADY : OUT STD_LOGIC;
    wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wadd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    radd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    cmd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    sta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    AXI : IN STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END hier_flash_microblaze_parallel_to_AXI_0_0;

ARCHITECTURE hier_flash_microblaze_parallel_to_AXI_0_0_arch OF hier_flash_microblaze_parallel_to_AXI_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF hier_flash_microblaze_parallel_to_AXI_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT parallel_to_AXI IS
    GENERIC (
      C_M_AXI_GMEM_ID_WIDTH : INTEGER;
      C_M_AXI_GMEM_ADDR_WIDTH : INTEGER;
      C_M_AXI_GMEM_DATA_WIDTH : INTEGER;
      C_M_AXI_GMEM_AWUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_ARUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_WUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_RUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_BUSER_WIDTH : INTEGER;
      C_M_AXI_GMEM_USER_VALUE : INTEGER;
      C_M_AXI_GMEM_PROT_VALUE : INTEGER;
      C_M_AXI_GMEM_CACHE_VALUE : INTEGER
    );
    PORT (
      rdata_ap_vld : OUT STD_LOGIC;
      sta_ap_vld : OUT STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      ap_start : IN STD_LOGIC;
      ap_done : OUT STD_LOGIC;
      ap_idle : OUT STD_LOGIC;
      ap_ready : OUT STD_LOGIC;
      m_axi_gmem_AWID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_AWUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_AWVALID : OUT STD_LOGIC;
      m_axi_gmem_AWREADY : IN STD_LOGIC;
      m_axi_gmem_WID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_WLAST : OUT STD_LOGIC;
      m_axi_gmem_WUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_WVALID : OUT STD_LOGIC;
      m_axi_gmem_WREADY : IN STD_LOGIC;
      m_axi_gmem_BID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_BUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_BVALID : IN STD_LOGIC;
      m_axi_gmem_BREADY : OUT STD_LOGIC;
      m_axi_gmem_ARID : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
      m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      m_axi_gmem_ARUSER : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_ARVALID : OUT STD_LOGIC;
      m_axi_gmem_ARREADY : IN STD_LOGIC;
      m_axi_gmem_RID : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      m_axi_gmem_RLAST : IN STD_LOGIC;
      m_axi_gmem_RUSER : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      m_axi_gmem_RVALID : IN STD_LOGIC;
      m_axi_gmem_RREADY : OUT STD_LOGIC;
      wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      wadd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      radd : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      cmd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      sta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      AXI : IN STD_LOGIC_VECTOR(63 DOWNTO 0)
    );
  END COMPONENT parallel_to_AXI;
  ATTRIBUTE SDX_KERNEL : STRING;
  ATTRIBUTE SDX_KERNEL OF parallel_to_AXI: COMPONENT IS "true";
  ATTRIBUTE SDX_KERNEL_TYPE : STRING;
  ATTRIBUTE SDX_KERNEL_TYPE OF parallel_to_AXI: COMPONENT IS "hls";
  ATTRIBUTE SDX_KERNEL_SIM_INST : STRING;
  ATTRIBUTE SDX_KERNEL_SIM_INST OF parallel_to_AXI: COMPONENT IS "U0";
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF hier_flash_microblaze_parallel_to_AXI_0_0_arch: ARCHITECTURE IS "HLS";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER OF AXI: SIGNAL IS "XIL_INTERFACENAME AXI, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF AXI: SIGNAL IS "xilinx.com:signal:data:1.0 AXI DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF sta: SIGNAL IS "XIL_INTERFACENAME sta, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF sta: SIGNAL IS "xilinx.com:signal:data:1.0 sta DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF cmd: SIGNAL IS "XIL_INTERFACENAME cmd, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF cmd: SIGNAL IS "xilinx.com:signal:data:1.0 cmd DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF radd: SIGNAL IS "XIL_INTERFACENAME radd, LAYERED_METADATA undef, PortWidth 32";
  ATTRIBUTE X_INTERFACE_INFO OF radd: SIGNAL IS "xilinx.com:signal:data:1.0 radd DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF rdata: SIGNAL IS "XIL_INTERFACENAME rdata, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF rdata: SIGNAL IS "xilinx.com:signal:data:1.0 rdata DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF wadd: SIGNAL IS "XIL_INTERFACENAME wadd, LAYERED_METADATA undef, PortWidth 32";
  ATTRIBUTE X_INTERFACE_INFO OF wadd: SIGNAL IS "xilinx.com:signal:data:1.0 wadd DATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF wdata: SIGNAL IS "XIL_INTERFACENAME wdata, LAYERED_METADATA undef, PortWidth 32";
  ATTRIBUTE X_INTERFACE_INFO OF wdata: SIGNAL IS "xilinx.com:signal:data:1.0 wdata DATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARLEN";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WLAST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WLAST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWQOS: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWQOS";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWPROT: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWPROT";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWCACHE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWCACHE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWREGION: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWREGION";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWLOCK: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWLOCK";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWBURST: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWBURST";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWSIZE: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWSIZE";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWLEN: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWLEN";
  ATTRIBUTE X_INTERFACE_PARAMETER OF m_axi_gmem_AWADDR: SIGNAL IS "XIL_INTERFACENAME m_axi_gmem, ADDR_WIDTH 32, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_" & 
"THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF m_axi_gmem_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 m_axi_gmem AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF ap_ready: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  ATTRIBUTE X_INTERFACE_INFO OF ap_idle: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  ATTRIBUTE X_INTERFACE_INFO OF ap_done: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  ATTRIBUTE X_INTERFACE_INFO OF ap_start: SIGNAL IS "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_rst_n: SIGNAL IS "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ap_clk: SIGNAL IS "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF m_axi_gmem, ASSOCIATED_RESET ap_rst_n, FREQ_TOLERANCE_HZ 0, PHASE 0.000, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
BEGIN
  U0 : parallel_to_AXI
    GENERIC MAP (
      C_M_AXI_GMEM_ID_WIDTH => 1,
      C_M_AXI_GMEM_ADDR_WIDTH => 32,
      C_M_AXI_GMEM_DATA_WIDTH => 32,
      C_M_AXI_GMEM_AWUSER_WIDTH => 1,
      C_M_AXI_GMEM_ARUSER_WIDTH => 1,
      C_M_AXI_GMEM_WUSER_WIDTH => 1,
      C_M_AXI_GMEM_RUSER_WIDTH => 1,
      C_M_AXI_GMEM_BUSER_WIDTH => 1,
      C_M_AXI_GMEM_USER_VALUE => 0,
      C_M_AXI_GMEM_PROT_VALUE => 0,
      C_M_AXI_GMEM_CACHE_VALUE => 3
    )
    PORT MAP (
      rdata_ap_vld => rdata_ap_vld,
      sta_ap_vld => sta_ap_vld,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      ap_start => ap_start,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_ready => ap_ready,
      m_axi_gmem_AWADDR => m_axi_gmem_AWADDR,
      m_axi_gmem_AWLEN => m_axi_gmem_AWLEN,
      m_axi_gmem_AWSIZE => m_axi_gmem_AWSIZE,
      m_axi_gmem_AWBURST => m_axi_gmem_AWBURST,
      m_axi_gmem_AWLOCK => m_axi_gmem_AWLOCK,
      m_axi_gmem_AWREGION => m_axi_gmem_AWREGION,
      m_axi_gmem_AWCACHE => m_axi_gmem_AWCACHE,
      m_axi_gmem_AWPROT => m_axi_gmem_AWPROT,
      m_axi_gmem_AWQOS => m_axi_gmem_AWQOS,
      m_axi_gmem_AWVALID => m_axi_gmem_AWVALID,
      m_axi_gmem_AWREADY => m_axi_gmem_AWREADY,
      m_axi_gmem_WDATA => m_axi_gmem_WDATA,
      m_axi_gmem_WSTRB => m_axi_gmem_WSTRB,
      m_axi_gmem_WLAST => m_axi_gmem_WLAST,
      m_axi_gmem_WVALID => m_axi_gmem_WVALID,
      m_axi_gmem_WREADY => m_axi_gmem_WREADY,
      m_axi_gmem_BID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_BRESP => m_axi_gmem_BRESP,
      m_axi_gmem_BUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_BVALID => m_axi_gmem_BVALID,
      m_axi_gmem_BREADY => m_axi_gmem_BREADY,
      m_axi_gmem_ARADDR => m_axi_gmem_ARADDR,
      m_axi_gmem_ARLEN => m_axi_gmem_ARLEN,
      m_axi_gmem_ARSIZE => m_axi_gmem_ARSIZE,
      m_axi_gmem_ARBURST => m_axi_gmem_ARBURST,
      m_axi_gmem_ARLOCK => m_axi_gmem_ARLOCK,
      m_axi_gmem_ARREGION => m_axi_gmem_ARREGION,
      m_axi_gmem_ARCACHE => m_axi_gmem_ARCACHE,
      m_axi_gmem_ARPROT => m_axi_gmem_ARPROT,
      m_axi_gmem_ARQOS => m_axi_gmem_ARQOS,
      m_axi_gmem_ARVALID => m_axi_gmem_ARVALID,
      m_axi_gmem_ARREADY => m_axi_gmem_ARREADY,
      m_axi_gmem_RID => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_RDATA => m_axi_gmem_RDATA,
      m_axi_gmem_RRESP => m_axi_gmem_RRESP,
      m_axi_gmem_RLAST => m_axi_gmem_RLAST,
      m_axi_gmem_RUSER => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 1)),
      m_axi_gmem_RVALID => m_axi_gmem_RVALID,
      m_axi_gmem_RREADY => m_axi_gmem_RREADY,
      wdata => wdata,
      wadd => wadd,
      rdata => rdata,
      radd => radd,
      cmd => cmd,
      sta => sta,
      AXI => AXI
    );
END hier_flash_microblaze_parallel_to_AXI_0_0_arch;
