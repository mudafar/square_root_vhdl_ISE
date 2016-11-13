----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:51:57 10/14/2013 
-- Design Name: 
-- Module Name:    seg_comp - Behavioral 
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

entity seg_comp is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           D0 : in  STD_LOGIC_VECTOR (3 downto 0);
           D1 : in  STD_LOGIC_VECTOR (3 downto 0);
           D2 : in  STD_LOGIC_VECTOR (3 downto 0);
			  D3 : in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (7 downto 0);
           multiple : out  STD_LOGIC_VECTOR (3 downto 0));
end seg_comp;

architecture Behavioral of seg_comp is

component mult 
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           D0 : in  STD_LOGIC_VECTOR (3 downto 0);
           D1 : in  STD_LOGIC_VECTOR (3 downto 0);
           D2 : in  STD_LOGIC_VECTOR (3 downto 0);
           D3 : in  STD_LOGIC_VECTOR (3 downto 0);
           salida : out  STD_LOGIC_VECTOR (3 downto 0);
           multip : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component divisor_frecuencia 
    Port ( clk_in : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end component;

component siete_segmentos 
    Port ( key : in  STD_LOGIC_VECTOR (3 downto 0);
           numero : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal clk_aux : std_logic := '0';
signal numero_aux : std_logic_vector (3 downto 0);

begin

reloj: divisor_frecuencia port map (clk, reset, clk_aux);

multiplexor: mult port map (clk_aux, reset, D0, D1, D2, D3, numero_aux, multiple);

segmentos: siete_segmentos port map (numero_aux, salida);

end Behavioral;

