----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:59:36 10/09/2013 
-- Design Name: 
-- Module Name:    siete_segmentos - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity siete_segmentos is
    Port ( key : in  STD_LOGIC_VECTOR (3 downto 0);
           numero : out  STD_LOGIC_VECTOR (7 downto 0));
end siete_segmentos;

architecture Behavioral of siete_segmentos is

begin

    visualizador: process (key) begin
        case key is
					when "0000" =>  numero <= x"C0"; -- 0
					when "0001" =>  numero <= x"F9"; -- 1
					when "0010" =>  numero <= x"A4"; -- 2
					when "0011" =>  numero <= x"B0"; -- 3
					when "0100" =>  numero <= x"99"; -- 4
					when "0101" =>  numero <= x"92"; -- 5
					when "0110" =>  numero <= x"82"; -- 6
					when "0111" =>  numero <= x"F8"; -- 7
					when "1000" =>  numero <= x"80"; -- 8
					when "1001" =>  numero <= x"98"; -- 9
					when "1010" =>  numero <= "10001000"; -- A
					when "1011" =>  numero <= "00000000"; -- B
					when "1100" =>  numero <= "11000110"; -- C
					when "1101" =>  numero <= "01000000"; -- D
					when "1110" =>  numero <= "10000110"; -- E
					when "1111" =>  numero <= "10001110"; -- F
					when others   =>  numero <= x"FF"; -- Nada
        end case;
    end process;

end Behavioral;

