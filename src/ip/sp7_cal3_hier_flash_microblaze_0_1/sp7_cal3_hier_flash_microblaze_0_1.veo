// (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.

// IP VLNV: user.org:user:hier_flash_microblaze:1.0
// IP Revision: 2

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
sp7_cal3_hier_flash_microblaze_0_1 your_instance_name (
  .ARESETN(ARESETN),                                                            // input wire ARESETN
  .Clk(Clk),                                                                    // input wire Clk
  .Debug_SYS_Rst(Debug_SYS_Rst),                                                // output wire Debug_SYS_Rst
  .GNSS_1PPS(GNSS_1PPS),                                                        // input wire GNSS_1PPS
  .INT_PPS(INT_PPS),                                                            // output wire INT_PPS
  .Reset(Reset),                                                                // input wire Reset
  .SP7_10M_CLK_DAC_RESET(SP7_10M_CLK_DAC_RESET),                                // output wire SP7_10M_CLK_DAC_RESET
  .SP7_10M_CLK_DAC_SCLK(SP7_10M_CLK_DAC_SCLK),                                  // output wire SP7_10M_CLK_DAC_SCLK
  .SP7_10M_CLK_DAC_SDIN(SP7_10M_CLK_DAC_SDIN),                                  // output wire SP7_10M_CLK_DAC_SDIN
  .SP7_10M_CLK_DAC_SYNC(SP7_10M_CLK_DAC_SYNC),                                  // output wire SP7_10M_CLK_DAC_SYNC
  .SP7_10M_SOURCE_SEL(SP7_10M_SOURCE_SEL),                                      // output wire [0 : 0] SP7_10M_SOURCE_SEL
  .SP7_DBG_UART_RX(SP7_DBG_UART_RX),                                            // input wire SP7_DBG_UART_RX
  .SP7_DBG_UART_TX(SP7_DBG_UART_TX),                                            // output wire SP7_DBG_UART_TX
  .ap_clk(ap_clk),                                                              // input wire ap_clk
  .ap_rst_n(ap_rst_n),                                                          // input wire ap_rst_n
  .clk_10_in(clk_10_in),                                                        // input wire clk_10_in
  .cmd(cmd),                                                                    // input wire [7 : 0] cmd
  .dcm_locked(dcm_locked),                                                      // input wire dcm_locked
  .flash_upgrade_start(flash_upgrade_start),                                    // input wire [7 : 0] flash_upgrade_start
  .hier_microblaze_SP7_10M_SOURCE_SEL_n(hier_microblaze_SP7_10M_SOURCE_SEL_n),  // output wire [0 : 0] hier_microblaze_SP7_10M_SOURCE_SEL_n
  .radd(radd),                                                                  // input wire [31 : 0] radd
  .rdata(rdata),                                                                // output wire [31 : 0] rdata
  .spi_rtl_0_io0_i(spi_rtl_0_io0_i),                                            // input wire spi_rtl_0_io0_i
  .spi_rtl_0_io0_o(spi_rtl_0_io0_o),                                            // output wire spi_rtl_0_io0_o
  .spi_rtl_0_io0_t(spi_rtl_0_io0_t),                                            // output wire spi_rtl_0_io0_t
  .spi_rtl_0_io1_i(spi_rtl_0_io1_i),                                            // input wire spi_rtl_0_io1_i
  .spi_rtl_0_io1_o(spi_rtl_0_io1_o),                                            // output wire spi_rtl_0_io1_o
  .spi_rtl_0_io1_t(spi_rtl_0_io1_t),                                            // output wire spi_rtl_0_io1_t
  .spi_rtl_0_io2_i(spi_rtl_0_io2_i),                                            // input wire spi_rtl_0_io2_i
  .spi_rtl_0_io2_o(spi_rtl_0_io2_o),                                            // output wire spi_rtl_0_io2_o
  .spi_rtl_0_io2_t(spi_rtl_0_io2_t),                                            // output wire spi_rtl_0_io2_t
  .spi_rtl_0_io3_i(spi_rtl_0_io3_i),                                            // input wire spi_rtl_0_io3_i
  .spi_rtl_0_io3_o(spi_rtl_0_io3_o),                                            // output wire spi_rtl_0_io3_o
  .spi_rtl_0_io3_t(spi_rtl_0_io3_t),                                            // output wire spi_rtl_0_io3_t
  .spi_rtl_0_ss_i(spi_rtl_0_ss_i),                                              // input wire [0 : 0] spi_rtl_0_ss_i
  .spi_rtl_0_ss_o(spi_rtl_0_ss_o),                                              // output wire [0 : 0] spi_rtl_0_ss_o
  .spi_rtl_0_ss_t(spi_rtl_0_ss_t),                                              // output wire spi_rtl_0_ss_t
  .sta(sta),                                                                    // output wire [7 : 0] sta
  .wadd(wadd),                                                                  // input wire [31 : 0] wadd
  .wdata(wdata)                                                                // input wire [31 : 0] wdata
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

