library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignalDelay is
    generic (delay_param : in INTEGER);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           input_signal : in STD_LOGIC;
           -- Delay parameter in clock cycles
           delayed_signal : out STD_LOGIC );
end SignalDelay;

architecture Behavioral of SignalDelay is
    signal delay_counter : INTEGER range 0 to delay_param-1 := 0; -- Adjust the range as needed based on your delay parameter
    signal shift_register : STD_LOGIC_VECTOR(delay_param-1 downto 0) := (others => '1'); -- Adjust the size based on your delay parameter
begin
    process(clk)
    begin
      
        if rising_edge(clk) then
          if rst = '0' then
            delay_counter <= 0;
            shift_register <= (others => '1');
          else
            -- Shift the input signal into the shift register
            shift_register <= input_signal & shift_register((delay_param -1) downto 1);

            -- Output the delayed signal
            delayed_signal <= shift_register(0);

            -- Update the delay counter
            if delay_counter < delay_param then
                delay_counter <= delay_counter + 1;
            end if;
           end if;
        end if;
    end process;
end Behavioral;
