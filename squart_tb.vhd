LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY squart_tb IS
END squart_tb;
 
ARCHITECTURE behavior OF squart_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT squart
    PORT(
         clock : IN  std_logic;
         data_in : IN  unsigned(15 downto 0);
         data_out : OUT  unsigned(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal data_in : unsigned(15 downto 0) := (others => '0');

 	--Outputs
   signal data_out : unsigned(15 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: squart PORT MAP (
          clock => clock,
          data_in => data_in,
          data_out => data_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for clock_period*10;
      -- insert stimulus here 
		data_in <= "0000000000000100";
		wait for 100 ns;	

		data_in <= "0000000000001100";
		wait for 100 ns;		

		data_in <= "0000000000010000";
		wait for 100 ns;			

		data_in <= "0000000000100000";
		wait for 100 ns;	

		data_in <= "0000000000010001";
		wait for 100 ns;			
   end process;

END;
