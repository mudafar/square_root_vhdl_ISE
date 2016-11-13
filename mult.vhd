----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:47:18 10/14/2013 
-- Design Name: 
-- Module Name:    mult - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           D0 : in  STD_LOGIC_VECTOR (3 downto 0);
           D1 : in  STD_LOGIC_VECTOR (3 downto 0);
           D2 : in  STD_LOGIC_VECTOR (3 downto 0);
			  D3 : in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (3 downto 0);
           multip : out  STD_LOGIC_VECTOR (3 downto 0));
end mult;

architecture Behavioral of mult is

    type estados is (rst, v0, v1, v2, v3,v4);
    signal estado : estados;
begin
    visualizadores: process (reset, clk) begin
        if (reset = '1') then
            estado <= rst;
            multip <= "0000";
            salida <= "0000";
			elsif rising_edge(clk) then
            case estado is
                when v0 =>
                    salida <= D0;
                    multip <= "1110";  --1110
                    estado <= v1;
                when v1 =>
                    salida <= D1;
                    multip <= "1101";  --1101
                    estado <= v2;
                when v2 =>
                    salida <= D2;
                    multip <= "1011";  --1011
                    estado <= v3;
                when v3 =>
                    salida <= D3;
                    multip <= "0111";  --0111
                    estado <= v4;
				    when others =>
                    salida <= D0;
                    multip <= "1111";  --0111
                    estado <= v0;
            end case;
        end if;
    end process;

end Behavioral;

