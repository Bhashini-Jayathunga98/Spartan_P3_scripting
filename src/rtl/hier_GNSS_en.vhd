library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity hier_GNSS_en is
  port (
    GNSS_1PPS : in STD_LOGIC;
    GNSS_TP2 : in STD_LOGIC;
    GNSS_UART_RXD_SP7_TXD : out STD_LOGIC;
    GNSS_UART_TXD_SP7_RXD : in STD_LOGIC;
    INT_1PPS : in STD_LOGIC;
    KU_GNSS_1PPS : out STD_LOGIC;
    LS_GNSS_1PPS : out STD_LOGIC;
    LS_GNSS_TP2_GPIO : out STD_LOGIC;
    SP7_GNSS_KU_UART_RX : out STD_LOGIC;
    SP7_GNSS_LS_UART_RX : in STD_LOGIC;
    SP7_GNSS_LS_UART_TX : out STD_LOGIC;
    SP7_GNSS_RST_B : out STD_LOGIC;
    SP7_GNSS_ZU_UART_RX : out STD_LOGIC;
    SP7_KU_SPARE1P_CLKP_LVDS : out STD_LOGIC;
    SP7_ZU_SPARE1P_CLKP_LVDS : out STD_LOGIC;
    ZU_GNSS_1PPS : out STD_LOGIC;
    board_power_done_inv : in STD_LOGIC;
    clk50 : in STD_LOGIC;
    clk_pwr_pg : in STD_LOGIC;
    rst50 : in STD_LOGIC
  );
end hier_GNSS_en;

architecture STRUCTURE of hier_GNSS_en is

  component utility_dff is
  port (
    Q : out STD_LOGIC;
    C : in STD_LOGIC;
    CE : in STD_LOGIC;
    D : in STD_LOGIC;
    R : in STD_LOGIC
  );
  end component;
 
  component o_buft is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC
  );
  end component;
  
  signal C_1 : STD_LOGIC;
  signal D_1 : STD_LOGIC;
  signal GNSS_1PPS_r : STD_LOGIC;
  signal GNSS_TP2_dff_Q : STD_LOGIC;
  signal GNSS_UART_Q : STD_LOGIC;
  signal GNSS_UART_RXD_SP7_TXD_w : STD_LOGIC;
  signal \^gnss_uart_txd_sp7_rxd\ : STD_LOGIC;
  signal GNSS_UART_TXD_SP7_RXD_1 : STD_LOGIC;
  signal INT_PPS_KU_dff2_Q : STD_LOGIC;
  signal INT_PPS_LS_dff2_Q : STD_LOGIC;
  signal INT_PPS_ZU_dff2_Q : STD_LOGIC;
  signal INT_PPS_dff_Q : STD_LOGIC;
  signal \^ku_gnss_1pps\ : STD_LOGIC;
  signal \^ls_gnss_1pps\ : STD_LOGIC;
  signal LS_GNSS_TP2_GPIO_w : STD_LOGIC;
  signal R_1 : STD_LOGIC;
  signal SP7_GNSS_KU_UART_RX_w : STD_LOGIC;
  signal SP7_GNSS_LS_UART_TX_w : STD_LOGIC;
  signal SP7_GNSS_ZU_UART_RX_w : STD_LOGIC;
  signal \^zu_gnss_1pps\ : STD_LOGIC;
  signal board_power_done_inv_1 : STD_LOGIC;
  signal gnsss_constant_dout : STD_LOGIC_VECTOR ( 0 to 0 ) := "1";
  signal o_buft_0_O : STD_LOGIC;
  signal o_buft_1_O : STD_LOGIC;
  signal o_buft_2_O : STD_LOGIC;
  signal o_buft_3_O : STD_LOGIC;
  signal o_buft_4_O : STD_LOGIC;
  signal o_buft_5_O : STD_LOGIC;
  signal o_buft_6_O : STD_LOGIC;
  signal o_buft_7_O : STD_LOGIC;
  signal o_buft_8_O : STD_LOGIC;
  signal o_buft_9_O : STD_LOGIC;
  signal NLW_o_buft_10_O_UNCONNECTED : STD_LOGIC;
  
begin

  C_1 <= clk50;
  D_1 <= INT_1PPS;
  GNSS_UART_RXD_SP7_TXD <= o_buft_0_O;
  GNSS_UART_TXD_SP7_RXD_1 <= GNSS_UART_TXD_SP7_RXD;
  KU_GNSS_1PPS <= o_buft_6_O;
  LS_GNSS_1PPS <= o_buft_5_O;
  LS_GNSS_TP2_GPIO <= o_buft_1_O;
  R_1 <= rst50;
  SP7_GNSS_KU_UART_RX <= o_buft_2_O;
  SP7_GNSS_LS_UART_TX <= o_buft_3_O;
  SP7_GNSS_ZU_UART_RX <= o_buft_4_O;
  SP7_KU_SPARE1P_CLKP_LVDS <= o_buft_8_O;
  SP7_ZU_SPARE1P_CLKP_LVDS <= o_buft_9_O;
  ZU_GNSS_1PPS <= o_buft_7_O;
  board_power_done_inv_1 <= board_power_done_inv;
  
GNSS_LS_TP2_dff: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_1PPS_r,
      Q => \^ku_gnss_1pps\,
      R => R_1
    );
    
GNSS_LS_TP2_dff1: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_1PPS_r,
      Q => \^ls_gnss_1pps\,
      R => R_1
    );
    
GNSS_LS_TP2_dff2: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_1PPS_r,
      Q => \^zu_gnss_1pps\,
      R => R_1
    );
GNSS_Reset_dff: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => clk_pwr_pg,
      Q => SP7_GNSS_RST_B,
      R => R_1
    );
GNSS_TP2_dff: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_TP2,
      Q => GNSS_TP2_dff_Q,
      R => R_1
    );
GNSS_UART: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => SP7_GNSS_LS_UART_RX,
      Q => GNSS_UART_Q,
      R => R_1
    );
GNSS_UART1: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_UART_Q,
      Q => GNSS_UART_RXD_SP7_TXD_w,
      R => R_1
    );
GNSS_UART_dff: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => \^gnss_uart_txd_sp7_rxd\,
      Q => SP7_GNSS_KU_UART_RX_w,
      R => R_1
    );
GNSS_UART_dff1: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => \^gnss_uart_txd_sp7_rxd\,
      Q => SP7_GNSS_LS_UART_TX_w,
      R => R_1
    );
GNSS_UART_dff2: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => \^gnss_uart_txd_sp7_rxd\,
      Q => SP7_GNSS_ZU_UART_RX_w,
      R => R_1
    );
GNSS_dff: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_1PPS,
      Q => GNSS_1PPS_r,
      R => R_1
    );
INT_PPS_KU_dff2: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => INT_PPS_dff_Q,
      Q => INT_PPS_KU_dff2_Q,
      R => R_1
    );
INT_PPS_LS_dff2: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => INT_PPS_dff_Q,
      Q => INT_PPS_LS_dff2_Q,
      R => R_1
    );
INT_PPS_ZU_dff2: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => INT_PPS_dff_Q,
      Q => INT_PPS_ZU_dff2_Q,
      R => R_1
    );
INT_PPS_dff: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => D_1,
      Q => INT_PPS_dff_Q,
      R => R_1
    );
o_buft_0: component o_buft
     port map (
      I => GNSS_UART_RXD_SP7_TXD_w,
      O => o_buft_0_O,
      T => board_power_done_inv_1
    );
o_buft_1: component o_buft
     port map (
      I => LS_GNSS_TP2_GPIO_w,
      O => o_buft_1_O,
      T => board_power_done_inv_1
    );
o_buft_10: component o_buft
     port map (
      I => INT_PPS_LS_dff2_Q,
      O => NLW_o_buft_10_O_UNCONNECTED,
      T => board_power_done_inv_1
    );
o_buft_2: component o_buft
     port map (
      I => SP7_GNSS_KU_UART_RX_w,
      O => o_buft_2_O,
      T => board_power_done_inv_1
    );
o_buft_3: component o_buft
     port map (
      I => SP7_GNSS_LS_UART_TX_w,
      O => o_buft_3_O,
      T => board_power_done_inv_1
    );
o_buft_4: component o_buft
     port map (
      I => SP7_GNSS_ZU_UART_RX_w,
      O => o_buft_4_O,
      T => board_power_done_inv_1
    );
o_buft_5: component o_buft
     port map (
      I => \^ls_gnss_1pps\,
      O => o_buft_5_O,
      T => board_power_done_inv_1
    );
o_buft_6: component o_buft
     port map (
      I => \^ku_gnss_1pps\,
      O => o_buft_6_O,
      T => board_power_done_inv_1
    );
o_buft_7: component o_buft
     port map (
      I => \^zu_gnss_1pps\,
      O => o_buft_7_O,
      T => board_power_done_inv_1
    );
o_buft_8: component o_buft
     port map (
      I => INT_PPS_KU_dff2_Q,
      O => o_buft_8_O,
      T => board_power_done_inv_1
    );
o_buft_9: component o_buft
     port map (
      I => INT_PPS_ZU_dff2_Q,
      O => o_buft_9_O,
      T => board_power_done_inv_1
    );
utility_dff_0: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_TP2_dff_Q,
      Q => LS_GNSS_TP2_GPIO_w,
      R => R_1
    );
utility_dff_1: component utility_dff
     port map (
      C => C_1,
      CE => gnsss_constant_dout(0),
      D => GNSS_UART_TXD_SP7_RXD_1,
      Q => \^gnss_uart_txd_sp7_rxd\,
      R => R_1
    );
end STRUCTURE;