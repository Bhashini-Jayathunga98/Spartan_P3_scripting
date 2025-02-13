Library UNISIM;
use UNISIM.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;

entity utility_dff is
  Port ( 
      Q  : out  std_logic;
      C  : in  std_logic;
      CE : in  std_logic;
      D  : in std_logic;
      R  : in  std_logic 
  );
end utility_dff;

architecture Behavioral of utility_dff is

begin

   FDRE_inst : FDRE
   generic map (
      INIT => '0',          -- Initial value of register, '0', '1'
      -- Programmable Inversion Attributes: Specifies the use of the built-in programmable inversion
      IS_C_INVERTED => '0', -- Optional inversion for C
      IS_D_INVERTED => '0', -- Optional inversion for D
      IS_R_INVERTED => '0'  -- Optional inversion for R
   )
   port map (
      Q => Q,   -- 1-bit output: Data
      C => C,   -- 1-bit input: Clock
      CE => CE, -- 1-bit input: Clock enable
      D => D,   -- 1-bit input: Data
      R => R    -- 1-bit input: Synchronous reset
   );

   -- End of FDRE_inst instantiation
					
end architecture behavioral;