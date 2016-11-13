----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:45 10/09/2013 
-- Design Name: 
-- Module Name:    divisor_frecuencia - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divisor_frecuencia is
    Port ( clk_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end divisor_frecuencia;

architecture Behavioral of divisor_frecuencia is

    signal temporal: STD_LOGIC;
    signal contador: integer range 0 to 12499 := 0; --124999
	 
begin
    divisor_frecuencia: process (reset, clk_in) begin
        if (reset = '1') then
            temporal <= '0';
            contador <= 0;
        elsif rising_edge(clk_in) then
            if (contador = 12499) then
                temporal <= NOT(temporal);
                contador <= 0;
            else
                contador <= contador+1;
            end if;
        end if;
    end process;
 
    clk_out <= temporal;

end Behavioral;

