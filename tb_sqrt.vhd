--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:58:21 10/24/2016
-- Design Name:   
-- Module Name:   /home/juancho/Dropbox/carrera/sistemasLogicos/pruebas/raizcuadrada/tb_sqrt.vhd
-- Project Name:  raizcuadrada
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sqrt
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_sqrt IS
END tb_sqrt;
 
ARCHITECTURE behavior OF tb_sqrt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sqrt
    PORT(
         clk : IN  std_logic;
         number : IN  std_logic_vector(31 downto 0);
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   --signal number : std_logic_vector(31 downto 0) := (others => '1');
   signal number : std_logic_vector(31 downto 0) := "00000000000000000000000010000001";

 	--Outputs
   signal result : std_logic_vector(15 downto 0) := (others => '0');

	signal fault : std_logic := '0';
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sqrt PORT MAP (
          clk => clk,
          number => number,
          result => result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   process(clk)
	variable cond : std_logic := '0';
   begin	

		--wait until 
      if rising_edge(clK) then
         number <= std_logic_vector(unsigned(number)+1);
         if unsigned(result) * unsigned(result) > unsigned(number)-16 or
            (unsigned(result)+1) * (unsigned(result)+1) <= unsigned(number)-16 then
            fault <= '1';
         else
            fault <= '0';
         end if;
      end if;
		
		--assert cond = '1'
			--report "BADDDDD" severity error;
			
   end process;

END;
