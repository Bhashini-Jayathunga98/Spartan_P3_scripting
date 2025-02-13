-------------------------------------------------------------------------------
-- axi_uart16550.vhd - entity/architecture pair
-------------------------------------------------------------------------------
--  ***************************************************************************
--  ** DISCLAIMER OF LIABILITY                                               **
--  **                                                                       **
--  **  This file contains proprietary and confidential information of       **
--  **  Xilinx, Inc. ("Xilinx"), that is distributed under a license         **
--  **  from Xilinx, and may be used, copied and/or disclosed only           **
--  **  pursuant to the terms of a valid license agreement with Xilinx.      **
--  **                                                                       **
--  **  XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION                **
--  **  ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER           **
--  **  EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT                  **
--  **  LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,            **
--  **  MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx        **
--  **  does not warrant that functions included in the Materials will       **
--  **  meet the requirements of Licensee, or that the operation of the      **
--  **  Materials will be uninterrupted or error-free, or that defects       **
--  **  in the Materials will be corrected. Furthermore, Xilinx does         **
--  **  not warrant or make any representations regarding use, or the        **
--  **  results of the use, of the Materials in terms of correctness,        **
--  **  accuracy, reliability or otherwise.                                  **
--  **                                                                       **
--  **  Xilinx products are not designed or intended to be fail-safe,        **
--  **  or for use in any application requiring fail-safe performance,       **
--  **  such as life-support or safety devices or systems, Class III         **
--  **  medical devices, nuclear facilities, applications related to         **
--  **  the deployment of airbags, or any other applications that could      **
--  **  lead to death, personal injury or severe property or                 **
--  **  environmental damage (individually and collectively, "critical       **
--  **  applications"). Customer assumes the sole risk and liability         **
--  **  of any use of Xilinx products in critical applications,              **
--  **  subject only to applicable laws and regulations governing            **
--  **  limitations on product liability.                                    **
--  **                                                                       **
--  **  Copyright 2010 Xilinx, Inc.                                          **
--  **  All rights reserved.                                                 **
--  **                                                                       **
--  **  This disclaimer and copyright notice must be retained as part        **
--  **  of this file at all times.                                           **
--  ***************************************************************************
-------------------------------------------------------------------------------
-- Filename:        axi_uart16550.vhd
-- Version:         v1.00.a
-- Description:     This is the top level module for axi 16550 uart core.
--                  This module has interfaces to AXI Lite IPIF,
--                  Serial port and Modem and incorporates the logic for 
--                  UART 16550 core functionality and interfacing logic 
--                  for AXI.
--
-- VHDL-Standard:   VHDL'93
--
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
-- Structure:   
--                  axi_uart16550.vhd
--                      -- axi_lite_ipif.vhd   
--                      -- xuart.vhd
--                          -- ipic_if.vhd
--                          -- uart16550.vhd
--                              -- rx16550.vhd
--                              -- tx16550.vhd
--                              -- xuart_tx_load_sm.vhd
--                              -- tx_fifo_block.vhd
--                              -- rx_fifo_block.vhd
--                                  -- rx_fifo_control.vhd
-------------------------------------------------------------------------------
--
--*****************************************************************************
-------------------------------------------------------------------------------
-- Author:          PVK
--
--  PVK           07/22/09
-- ^^^^^^
--  - Initial release of v1.00.a
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x" 
--      reset signals:                          "rst", "rst_n" 
--      generics:                               "C_*" 
--      user defined types:                     "*_TYPE" 
--      state machine next state:               "*_ns" 
--      state machine current state:            "*_cs" 
--      combinatorial signals:                  "*_cmb" 
--      pipelined or register delay signals:    "*_d#" 
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce" 
--      internal version of output port         "*_i"
--      device pins:                            "*_pin" 
--      ports:                                  - Names begin with Uppercase 
--      processes:                              "*_PROCESS" 
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
-- axi_uart16550_v1_02_a library is used for axi_uart16550_v1_02_a 
-- component declarations
-------------------------------------------------------------------------------
library axi_uart16550_v1_02_a;
    use axi_uart16550_v1_02_a.xuart;

-------------------------------------------------------------------------------
-- axi_lite_ipif_v1_01_a library is used for AXI Lite IPIF 
-- component declarations
-------------------------------------------------------------------------------
library axi_lite_ipif_v2_0; 
    use axi_lite_ipif_v2_0.axi_lite_ipif;

-------------------------------------------------------------------------------
-- proc common package of the proc common library is used for different 
-- function declarations
-------------------------------------------------------------------------------
library proc_common_v4_0;
-- SLV64_ARRAY_TYPE refered from ipif_pkg
use proc_common_v4_0.ipif_pkg.SLV64_ARRAY_TYPE;
-- INTEGER_ARRAY_TYPE refered from ipif_pkg
use proc_common_v4_0.ipif_pkg.INTEGER_ARRAY_TYPE;


-------------------------------------------------------------------------------
-- Definition of Generics :
-------------------------------------------------------------------------------
-- System generics
--    C_FAMILY              --  Xilinx FPGA Family
--    C_S_AXI_ACLK_FREQ_HZ  --  System clock frequency driving UART lite
--                              peripheral in Hz
--                          
-- AXI generics             
--    C_S_AXI_ADDR_WIDTH    --  Width of AXI Address Bus (in bits)
--    C_S_AXI_DATA_WIDTH    --  Width of the AXI Data Bus (in bits)
--
-- UART 16550 generics       
--    C_IS_A_16550          --  Selection of UART for 16450 or 16550 mode
--    C_HAS_EXTERNAL_XIN    --  External XIN
--    C_HAS_EXTERNAL_RCLK   --  External RCLK
--    C_EXTERNAL_XIN_CLK_HZ --  External XIN clock frequency
-------------------------------------------------------------------------------
-- Definition of Ports :
-------------------------------------------------------------------------------
-- System signals
--    S_AXI_ACLK          --  AXI Clock
--    S_AXI_ARESETN       --  AXI Reset
--    IP2INTC_Irpt        --  Device interrupt output to microprocessor 
--                            interrupt input or system interrupt controller.
--    Freeze              --  Freezes UART for software debug (active high)
--                            
-- AXI signals                
--    S_AXI_AWADDR        --  AXI Write address
--    S_AXI_AWVALID       --  Write address valid
--    S_AXI_AWREADY       --  Write address ready
--    S_AXI_WDATA         --  Write data
--    S_AXI_WSTRB         --  Write strobes
--    S_AXI_WVALID        --  Write valid
--    S_AXI_WREADY        --  Write ready
--    S_AXI_BRESP         --  Write response
--    S_AXI_BVALID        --  Write response valid
--    S_AXI_BREADY        --  Response ready
--    S_AXI_ARADDR        --  Read address
--    S_AXI_ARVALID       --  Read address valid
--    S_AXI_ARREADY       --  Read address ready
--    S_AXI_RDATA         --  Read data
--    S_AXI_RRESP         --  Read response
--    S_AXI_RVALID        --  Read valid
--    S_AXI_RREADY        --  Read ready
--
-- UART16550 interface signals
--    BaudoutN            --  Transmitter Clock
--    Rclk                --  Receiver 16x Clock
--    Sin                 --  Serial Data Input
--    Sout                --  Serial Data Output
--    Xin                 --  Baud Rate Generator reference clock
--    Xout                --  Inverted XIN
--    CtsN                --  Clear To Send (active low)
--    DcdN                --  Data Carrier Detect (active low)
--    DsrN                --  Data Set Ready (active low)
--    DtrN                --  Data Terminal Ready (active low)
--    RiN                 --  Ring Indicator (active low)
--    RtsN                --  Request To Send (active low)
--    Ddis                --  Driver Disable
--    Out1N               --  User controlled output1
--    Out2N               --  User controlled output2
--    RxrdyN              --  DMA control signal
--    TxrdyN              --  DMA control signal
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Entity section
-------------------------------------------------------------------------------

entity axi_uart16550 is

  generic (

--  -- System Parameter
    C_FAMILY              : string                        := "virtex6";
    C_S_AXI_ACLK_FREQ_HZ  : integer                       := 100_000_000;
--  -- AXI Parameters
    C_S_AXI_ADDR_WIDTH    : integer                       := 13;
    C_S_AXI_DATA_WIDTH    : integer range 32 to 128       := 32;
--  -- UARTLite Parameters
    C_IS_A_16550          : integer range 0 to 1          := 1;
    C_HAS_EXTERNAL_XIN    : integer range 0 to 1          := 0;
    C_HAS_EXTERNAL_RCLK   : integer range 0 to 1          := 0;
    C_EXTERNAL_XIN_CLK_HZ : integer                       := 25_000_000;
    C_INSTANCE            : string                        := "axi_uart16550_inst" 
   );
 
  port (
    -- System signals
    S_AXI_ACLK       : in  std_logic;
    S_AXI_ARESETN    : in  std_logic;
    IP2INTC_Irpt     : out std_logic;
    Freeze           : in  std_logic;

-- AXI signals
    S_AXI_AWADDR     : in  std_logic_vector(12 downto 0);
    S_AXI_AWVALID    : in  std_logic;
    S_AXI_AWREADY    : out std_logic;
    S_AXI_WDATA      : in  std_logic_vector(31 downto 0);
    S_AXI_WSTRB      : in  std_logic_vector(3 downto 0);
    S_AXI_WVALID     : in  std_logic;
    S_AXI_WREADY     : out std_logic;
    S_AXI_BRESP      : out std_logic_vector(1 downto 0);
    S_AXI_BVALID     : out std_logic;
    S_AXI_BREADY     : in  std_logic;
    S_AXI_ARADDR     : in  std_logic_vector(12 downto 0);
    S_AXI_ARVALID    : in  std_logic;
    S_AXI_ARREADY    : out std_logic;
    S_AXI_RDATA      : out std_logic_vector(31 downto 0);
    S_AXI_RRESP      : out std_logic_vector(1 downto 0);
    S_AXI_RVALID     : out std_logic;
    S_AXI_RREADY     : in  std_logic;

    -- UART16550 Interface Signals
    BaudoutN         : out std_logic;
    CtsN             : in  std_logic;
    DcdN             : in  std_logic;
    Ddis             : out std_logic;
    DsrN             : in  std_logic;
    DtrN             : out std_logic;
    Out1N            : out std_logic;
    Out2N            : out std_logic;
    Rclk             : in  std_logic := '0';
    RiN              : in  std_logic;
    RtsN             : out std_logic;
    RxrdyN           : out std_logic;
    Sin              : in  std_logic;
    Sout             : out std_logic;
    TxrdyN           : out std_logic;
    Xin              : in  std_logic := '0';
    Xout             : out std_logic
);

  
  --fan-out attributes for XST
  attribute MAX_FANOUT                  : string;             
  attribute MAX_FANOUT of S_AXI_ACLK    : signal   is "10000";  
  attribute MAX_FANOUT of S_AXI_ARESETN : signal   is "10000";
  
  attribute SIGIS                       : string;             
  attribute SIGIS of Rclk               : signal   is "CLK";  
  attribute SIGIS of Xin                : signal   is "CLK";
  attribute SIGIS of IP2INTC_Irpt       : signal   is "INTERRUPT";

end entity axi_uart16550;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------
architecture rtl of axi_uart16550 is

  constant C_CORE_GENERATION_INFO : string := C_INSTANCE & ",axi_uart16550,{"
      & "c_family="                    & C_FAMILY
      & ",c_instance="                 & C_INSTANCE
      & ",c_s_axi_aclk_freq_hz="       & integer'image(C_S_AXI_ACLK_FREQ_HZ)
      & ",c_is_a_16550="               & integer'image(C_IS_A_16550)
      & ",c_has_external_xin="         & integer'image(C_HAS_EXTERNAL_XIN)
      & ",c_has_external_rclk="        & integer'image(C_HAS_EXTERNAL_RCLK)
      & ",c_external_xin_clk_hz="      & integer'image(C_EXTERNAL_XIN_CLK_HZ)
      & "}";

    attribute CORE_GENERATION_INFO : string;
    attribute CORE_GENERATION_INFO of rtl : architecture is C_CORE_GENERATION_INFO;
 

  -----------------------------------------------------------------------------
    -- Constant Declarations
  -----------------------------------------------------------------------------
  constant  ZEROES                : std_logic_vector := X"00000000";

 
  constant UART_REG_BASEADDR  : std_logic_vector  := X"00000000" or X"00001000";
  constant UART_REG_HIGHADDR  : std_logic_vector  := X"00000000" or X"0000101F";
 
  constant ARD_ADDR_RANGE_ARRAY : SLV64_ARRAY_TYPE  :=
        (
         ZEROES & UART_REG_BASEADDR, -- Uart Reg Base Address
         ZEROES & UART_REG_HIGHADDR  -- Uart Reg High Address
        );

  constant ARD_NUM_CE_ARRAY     : INTEGER_ARRAY_TYPE :=
          (
           0 => 1   
          );

  constant AXI_MIN_SIZE       : std_logic_vector(31 downto 0) := X"0000001F";
  constant USE_WSTRB          : integer := 1;
  constant DPHASE_TIMEOUT     : integer := 0;

  -----------------------------------------------------------------------------
    -- Signal and Type Declarations
  -----------------------------------------------------------------------------
  signal bus2ip_clk_i     : std_logic;
  signal bus2ip_data_i    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  signal bus2ip_addr_i    : std_logic_vector(12 downto 0);
  signal bus2ip_reset_i   : std_logic;
  signal ip2bus_data_i    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
  signal bus2ip_rdce_i    : std_logic_vector(0 downto 0);
  signal bus2ip_wrce_i    : std_logic_vector(0 downto 0);
  signal ip2bus_wrack_i   : std_logic;
  signal ip2bus_rdack_i   : std_logic;
  signal bus2ip_reset_int      : std_logic;
  signal bus2ip_reset_int_core : std_logic;

 
  -----------------------------------------------------------------------------
    -- Begin Architecture
  -----------------------------------------------------------------------------
    
  begin
  

  -----------------------------------------------------------------------------
  -- Component Instantiations
  -----------------------------------------------------------------------------

    --------------------------------------------------------------------------
    -- Instantiate AXI lite IPIF
    --------------------------------------------------------------------------
    AXI_LITE_IPIF_I : entity axi_lite_ipif_v2_0.axi_lite_ipif
      generic map
       (
        C_S_AXI_ADDR_WIDTH        => 13,
        C_S_AXI_DATA_WIDTH        => C_S_AXI_DATA_WIDTH,
        C_S_AXI_MIN_SIZE          => AXI_MIN_SIZE,
        C_USE_WSTRB               => USE_WSTRB,
        C_DPHASE_TIMEOUT          => DPHASE_TIMEOUT,
        C_ARD_ADDR_RANGE_ARRAY    => ARD_ADDR_RANGE_ARRAY,
        C_ARD_NUM_CE_ARRAY        => ARD_NUM_CE_ARRAY,
        C_FAMILY                  => C_FAMILY
       )
     port map
       (
        S_AXI_ACLK       => S_AXI_ACLK,
        S_AXI_ARESETN    => S_AXI_ARESETN,
        S_AXI_AWADDR     => S_AXI_AWADDR,
        S_AXI_AWVALID    => S_AXI_AWVALID,
        S_AXI_AWREADY    => S_AXI_AWREADY,
        S_AXI_WDATA      => S_AXI_WDATA,
        S_AXI_WSTRB      => S_AXI_WSTRB,
        S_AXI_WVALID     => S_AXI_WVALID,
        S_AXI_WREADY     => S_AXI_WREADY,
        S_AXI_BRESP      => S_AXI_BRESP,
        S_AXI_BVALID     => S_AXI_BVALID,
        S_AXI_BREADY     => S_AXI_BREADY,
        S_AXI_ARADDR     => S_AXI_ARADDR,
        S_AXI_ARVALID    => S_AXI_ARVALID,
        S_AXI_ARREADY    => S_AXI_ARREADY,
        S_AXI_RDATA      => S_AXI_RDATA,
        S_AXI_RRESP      => S_AXI_RRESP,
        S_AXI_RVALID     => S_AXI_RVALID,
        S_AXI_RREADY     => S_AXI_RREADY,
     
     -- IP Interconnect (IPIC) port signals 
        Bus2IP_Clk       => bus2ip_clk_i,
        Bus2IP_Resetn    => bus2ip_reset_int,
        Bus2IP_Addr      => bus2ip_addr_i,
        Bus2IP_Data      => bus2ip_data_i,
        Bus2IP_RNW       => open,
        Bus2IP_BE        => open,
        Bus2IP_CS        => open,
        Bus2IP_RdCE      => bus2ip_rdce_i,
        Bus2IP_WrCE      => bus2ip_wrce_i,
        IP2Bus_Data      => ip2bus_data_i,
        IP2Bus_WrAck     => ip2bus_wrack_i,
        IP2Bus_RdAck     => ip2bus_rdack_i,
        IP2Bus_Error     => '0'
       );


      ----------------------
      --REG_RESET_FROM_IPIF: convert active low to active hig reset to rest of 
      --                     the core.
      ----------------------    
      REG_RESET_FROM_IPIF: process (S_AXI_ACLK) is
      begin
           if(S_AXI_ACLK'event and S_AXI_ACLK = '1') then
           bus2ip_reset_int_core <= not(bus2ip_reset_int);
           end if;
      end process REG_RESET_FROM_IPIF;

    --------------------------------------------------------------------------
    -- Instantiate UART16550
    --------------------------------------------------------------------------

    XUART_I_1 : entity axi_uart16550_v1_02_a.xuart
    generic map (
      C_IS_A_16550          => C_IS_A_16550 /= 0,         -- default TRUE
      C_HAS_EXTERNAL_XIN    => C_HAS_EXTERNAL_XIN /= 0,   -- default TRUE
      C_HAS_EXTERNAL_RCLK   => C_HAS_EXTERNAL_RCLK /= 0,  -- default TRUE
      C_EXTERNAL_XIN_CLK_HZ => C_EXTERNAL_XIN_CLK_HZ,
      C_FAMILY              => C_FAMILY,
      C_S_AXI_CLK_FREQ_HZ   => C_S_AXI_ACLK_FREQ_HZ,
      AXI_ADDR_WIDTH        => 13,
      AXI_DATA_WIDTH        => C_S_AXI_DATA_WIDTH
      )
    port map (
      Bus2IP_Clk     => bus2ip_clk_i,
      Bus2IP_Reset   => bus2ip_reset_int_core,
      Bus2IP_Addr    => bus2ip_addr_i(4 downto 2),
      Bus2IP_Data    => bus2ip_data_i,
      Bus2IP_RdCE    => bus2ip_rdce_i(0),
      Bus2IP_WrCE    => bus2ip_wrce_i(0),
      IP2Bus_Data    => ip2bus_data_i,
      IP2Bus_WrAck   => ip2bus_wrack_i,
      IP2Bus_RdAck   => ip2bus_rdack_i,

      BaudoutN       => BaudoutN,
      CtsN           => CtsN,
      DcdN           => DcdN,
      Ddis           => Ddis,
      DsrN           => DsrN,
      DtrN           => DtrN,
      Out1N          => Out1N,
      Out2N          => Out2N,
      Rclk           => Rclk,
      RiN            => RiN,
      RtsN           => RtsN,
      RxrdyN         => RxrdyN,
      Sin            => Sin,
      Sout           => Sout,
      IP2INTC_Irpt   => IP2INTC_Irpt,
      TxrdyN         => TxrdyN,
      Xin            => Xin,
      Xout           => Xout,
      Intr           => open,
      Freeze         => Freeze
     );

      
end architecture rtl;
