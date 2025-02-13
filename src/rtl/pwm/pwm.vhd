library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity PWM_Generator is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           duty_cycle : in STD_LOGIC_VECTOR(7 downto 0);
           pwm_out : out STD_LOGIC );
end PWM_Generator;

architecture Behavioral of PWM_Generator is
    signal counter : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal threshold : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal pwm_signal : STD_LOGIC := '1';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if enable = '1' then
                counter <= counter + 1;

                -- Convert duty_cycle to binary
                threshold <= duty_cycle;

                -- Generate PWM signal
                if counter <= threshold then
                    pwm_signal <= '1';
                else
                    pwm_signal <= '0';
                end if;
            else
                counter <= (others => '0');
                pwm_signal <= '1';
            end if;
        end if;
    end process;

    pwm_out <= pwm_signal;
end Behavioral;