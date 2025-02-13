library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;


entity io_buf is
  Port (
  IO    : inout  std_logic;
  O     : out  std_logic;
  I     : in  std_logic;
  T     : in  std_logic
  );
end io_buf;

architecture Behavioral of io_buf is

begin
   
   IOBUF_inst : IOBUF
   --generic map (
   --   DRIVE => 12,
   --   IOSTANDARD => "DEFAULT",
   --   SLEW => "SLOW")
   port map (
      O => O,     -- Buffer output
      IO => IO,   -- Buffer inout port (connect directly to top-level port)
      I => I,     -- Buffer input
      T => T      -- 3-state enable input, high=input, low=output 
   );
  
  end Behavioral;


					





