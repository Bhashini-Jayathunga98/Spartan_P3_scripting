library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

Library xpm;
use xpm.vcomponents.all;

entity clock_counter is
    Port ( clk                     : in STD_LOGIC;   -- 50Mhz sampling clock
           rstn                    : in STD_LOGIC;   -- reset 
           trigger                 : in STD_LOGIC;   -- from vio
           clk_10Mhz               : in STD_LOGIC;   -- 10 Mhz
           clk_4096Mhz             : in STD_LOGIC;   -- 40.96 Mhz clock
		   --running_count_4096Mhz_o : out unsigned(25 downto 0);
		   --running_count_10Mhz_o   : out unsigned(25 downto 0)
		   running_count_4096Mhz_o : out std_logic_vector(25 downto 0);
		   running_count_10Mhz_o   : out std_logic_vector(25 downto 0)
		   );
end clock_counter;

architecture Behavioral of clock_counter is

-- Declare attributes for clocks and resets
ATTRIBUTE X_INTERFACE_INFO : STRING; 
ATTRIBUTE X_INTERFACE_INFO of clk_10Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_10Mhz CLK"; 
ATTRIBUTE X_INTERFACE_INFO of clk_4096Mhz: SIGNAL is "xilinx.com:signal:clock:1.0 clk_4096Mhz CLK";

constant c_maximum           : integer := 50000000;

signal running_count         : integer range 0 to 16383;

signal counter               : integer range 0 to 50000000;

signal counter_10Mhz         : integer range 0 to 50000000 := 50000000;
signal counter_4096Mhz       : integer range 0 to 50000000 := 50000000;
--signal running_count_4096Mhz : integer range 0 to 50000000 := 0;

signal trigger_rising_edge : STD_LOGIC;

signal trigger_d           : STD_LOGIC; 




signal trigger_cdc         : STD_LOGIC;     
signal trigger_cdc1        : STD_LOGIC; 



   
signal trigger_r1          : STD_LOGIC;  
signal trigger_r2          : STD_LOGIC; 

signal trigger_stop        : STD_LOGIC;  
signal trigger_stop_r      : STD_LOGIC; 
signal trigger_stop_r2     : STD_LOGIC; 

signal trigger_10_cdc         : STD_LOGIC;     
signal trigger_10_cdc1        : STD_LOGIC; 



   
signal trigger_10_r1          : STD_LOGIC;  
signal trigger_10_r2          : STD_LOGIC; 
 
signal trigger_10_stop_r      : STD_LOGIC; 
signal trigger_10_stop_r2     : STD_LOGIC; 

--attribute ASYNC_REG : string;
--attribute ASYNC_REG of trigger_cdc     : signal is "TRUE";
--attribute ASYNC_REG of trigger_cdc1    : signal is "TRUE";
--attribute ASYNC_REG of trigger_10_cdc  : signal is "TRUE";
--attribute ASYNC_REG of trigger_10_cdc1 : signal is "TRUE";

signal running_count_4096Mhz : std_logic_vector(25 downto 0);
signal running_count_10Mhz   : std_logic_vector(25 downto 0);

   

begin

  --process to count to 1 second @ 50Mhz
  one_second_p : process (clk)
  begin
    if (rising_edge(clk)) then
      if rstn = '0' then
        trigger_d           <= '0';
        trigger_rising_edge <= '0';
        counter             <=  0;
		trigger_stop        <= '0';
	  else
        trigger_d <= trigger;
        trigger_rising_edge <= trigger and not trigger_d;
        if trigger_rising_edge = '1' then
	      counter         <= 0;
		  trigger_stop <= '0';
	    else
	      if counter < c_maximum then
		    counter <= counter + 1;
		  else
		    trigger_stop <= '1';
		  end if;
		end if;
	  end if;
	end if;  
  end process;
  
  
  

-- <-----Cut code below this line and paste into the architecture body---->

   -- xpm_cdc_single: Single-bit Synchronizer
   -- Xilinx Parameterized Macro, version 2020.1

   xpm_cdc_single_inst : xpm_cdc_single
   generic map (
      DEST_SYNC_FF => 4,   -- DECIMAL; range: 2-10
      INIT_SYNC_FF => 0,   -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
      SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
      SRC_INPUT_REG => 1   -- DECIMAL; 0=do not register input, 1=register input
   )
   port map (
      dest_out => trigger_cdc1, -- 1-bit output: src_in synchronized to the destination clock domain. This output
                            -- is registered.

      dest_clk => clk, -- 1-bit input: Clock signal for the destination clock domain.
      src_clk => clk_4096Mhz,   -- 1-bit input: optional; required when SRC_INPUT_REG = 1
      src_in => trigger      -- 1-bit input: Input signal to be synchronized to dest_clk domain.
   );

   -- End of xpm_cdc_single_inst instantiation
  
  
  
  
  
  --process to sample the 4096Mhz clock
  sample_4096Mhz_p : process (clk_4096Mhz)
  begin
    if (rising_edge(clk_4096Mhz)) then
      if rstn = '0' then
        --trigger_cdc     <= '0';
        --trigger_cdc1    <= '0';
        trigger_r1      <= '0';
        trigger_r2      <= '0';
        trigger_stop_r  <= '0';
        trigger_stop_r2 <= '0';    
      else     
        --trigger_cdc     <= trigger;
        --trigger_cdc1    <= trigger_cdc;
        trigger_r1      <= trigger_cdc1;
        trigger_r2      <= trigger_r1;
        trigger_stop_r  <= trigger_stop;
        trigger_stop_r2 <= trigger_stop_r;     
        if trigger_r2 = '0' and trigger_r1 = '1' then
	      counter_4096Mhz         <= 0;
		  running_count_4096Mhz <= (others => '0');
	    elsif trigger_stop_r2 = '0' and trigger_stop_r = '1' then
	      counter_4096Mhz         <= c_maximum;
	      running_count_4096Mhz <= std_logic_vector(to_unsigned(counter_4096Mhz, running_count_4096Mhz_o'length));
	    elsif counter_4096Mhz < c_maximum then
	      counter_4096Mhz <= counter_4096Mhz + 1;	    
	    end if;
	  end if;
	end if;  
  end process;		   		   


 --process to sample the 10Mhz clock
  sample_10Mhz_p : process (clk_10Mhz)
  begin
    if (rising_edge(clk_10Mhz)) then
      trigger_10_cdc     <= trigger;
      trigger_10_cdc1    <= trigger_10_cdc;
      trigger_10_r1      <= trigger_10_cdc1;
      trigger_10_r2      <= trigger_10_r1;
      trigger_10_stop_r  <= trigger_stop;
      trigger_10_stop_r2 <= trigger_10_stop_r;
      if rstn = '0' then
        trigger_10_cdc     <= '0';
        trigger_10_cdc1    <= '0';
        trigger_10_r1      <= '0';
        trigger_10_r2      <= '0';
        trigger_10_stop_r  <= '0';
        trigger_10_stop_r2 <= '0';
      else          
        if trigger_10_r2 = '0' and trigger_10_r1 = '1' then
	      counter_10Mhz         <= 0;
		  running_count_10Mhz <= (others => '0');
	    elsif trigger_10_stop_r2 = '0' and trigger_10_stop_r = '1' then
	      counter_10Mhz         <= c_maximum;
	      running_count_10Mhz <= std_logic_vector(to_unsigned(counter_10Mhz, running_count_10Mhz_o'length));
	    elsif counter_10Mhz < c_maximum then
	      counter_10Mhz <= counter_10Mhz + 1;	    
	    end if;
	  end if;
	end if;  
  end process;		   		     

--technically we have a bus.. - but this is good enough for reading from vio
xpm_cdc_array_single_inst_10 : xpm_cdc_array_single
   generic map (
      DEST_SYNC_FF => 4,   -- DECIMAL; range: 2-10
      INIT_SYNC_FF => 0,   -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
      SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
      SRC_INPUT_REG => 1,  -- DECIMAL; 0=do not register input, 1=register input
      WIDTH => 26           -- DECIMAL; range: 1-1024
   )
   port map (
      dest_out => running_count_10Mhz_o, 
      dest_clk => clk_10Mhz, 
      src_clk  => clk,   
      src_in   => running_count_10Mhz      
   );


--technically we have a bus.. - but this is good enough for reading from vio
xpm_cdc_array_single_inst_40m96 : xpm_cdc_array_single
   generic map (
      DEST_SYNC_FF => 4,   -- DECIMAL; range: 2-10
      INIT_SYNC_FF => 0,   -- DECIMAL; 0=disable simulation init values, 1=enable simulation init values
      SIM_ASSERT_CHK => 0, -- DECIMAL; 0=disable simulation messages, 1=enable simulation messages
      SRC_INPUT_REG => 1,  -- DECIMAL; 0=do not register input, 1=register input
      WIDTH => 26           -- DECIMAL; range: 1-1024
   )
   port map (
      dest_out => running_count_4096Mhz_o, 
      dest_clk => clk, 
      src_clk  => clk_4096Mhz,   
      src_in   => running_count_4096Mhz     
   );







end Behavioral;
