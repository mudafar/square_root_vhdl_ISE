library ieee; 
use ieee.std_logic_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity squart is port
			(
			numero     : out  STD_LOGIC_VECTOR (7 downto 0);
			mul        : out STD_LOGIC_vector (3 downto 0);
			re         : in std_logic;
			clock      : in std_logic;  
			data_in    : in  unsigned(15 downto 0); 
			data_out   : out unsigned(15 downto 0)); 

end squart;

architecture behaviour of squart is

component seg_comp
	port(
			clk : in  STD_LOGIC;
         reset : in  STD_LOGIC;
         D0 : in  STD_LOGIC_VECTOR (3 downto 0);
         D1 : in  STD_LOGIC_VECTOR (3 downto 0);
         D2 : in  STD_LOGIC_VECTOR (3 downto 0);
			D3 : in  STD_LOGIC_VECTOR (3 downto 0);
         salida : out  STD_LOGIC_VECTOR (7 downto 0);
         multiple : out  STD_LOGIC_VECTOR (3 downto 0)
	);
	
end component;


component bin8bcd
    port (
        bin:    in  std_logic_vector (7 downto 0);
        bcd:    out std_logic_vector (11 downto 0)
    );
end component;

signal bin : std_logic_vector (7 downto 0);
signal bcd : std_logic_vector (11 downto 0); 

signal c1 , c2, c3 : std_logic;
signal reset : std_logic := '0';
signal D0 , D1, D2, D3, multiple : std_logic_vector ( 3 downto 0);
signal salida : std_logic_vector (7 downto 0); 

	
begin 

	siete_segemntos: seg_comp 
	port map (
			  clock ,
           reset,
           D0,
           D1,
           D2,
			  D3,
           salida,
           multiple);

	bit8_bcd : bin8bcd
	port map (
				bin,
				bcd);


	sqrt : process(data_in)
		variable num : unsigned(15 downto 0) ;
		variable res : unsigned(15 downto 0) ;
		variable aux : unsigned(15 downto 0) ;
		variable i : integer := 0;
		
		variable int, a0, a1, a2, a3 : integer;
	begin
		num := data_in;
		res := "0000000000000000";
		aux := "0100000000000000";
		for i in 0 to 8 loop
			if (aux > num) then
				aux :=  aux srl 2;
			end if;
		--report "num: " & std_logic'image(num(0)) & std_logic'image(num(1)) & std_logic'image(num(2)) & std_logic'image(num(3)) & std_logic'image(num(4));					
		--report "aux: " & std_logic'image(aux(0)) & std_logic'image(aux(1)) & std_logic'image(aux(2)) & std_logic'image(aux(3)) & std_logic'image(aux(4));				
		end loop;
		
		
		for i in 0 to 8 loop
			if (aux /= "0000000000000000") then
				if (num >= res + aux) then
					num := num - (res + aux);
					res := (res srl 1) + aux;
				else
					res := res srl 1;
				end if;
				aux := aux srl 2;
			end if;
			--report std_logic'image(res(0)) & std_logic'image(res(1)) & std_logic'image(res(2)) & std_logic'image(res(3)) & std_logic'image(res(4));	
		end loop;
	data_out <= res;


	bin <= std_logic_vector(res(7 downto 0));
	--report "bcd: " & std_logic'image(bcd(4)) & std_logic'image(bcd(3)) & std_logic'image(bcd(2)) & std_logic'image(bcd(1)) & std_logic'image(bcd(0));					
	
	D0 <= bcd(3 downto 0);
	D1 <= bcd(7 downto 4);
	D2 <= bcd(11 downto 8);	
	--D3 <= bcd(11 downto 8);
	
	numero <= salida;
	mul    <= multiple;
	reset <= re;
--	int := to_integer(res);
--	
--	a0  := int mod 10;
--	int := (int / 16);
--	a1  := int mod 10;
--	int := int / 10;
--	a2  := int mod 10;
--	int := int / 10;
--	a3  := int mod 10;
--	--int := int / 10;	
--	
--	D0 <= std_logic_vector(to_unsigned(a0, 4));
--	D1 <= std_logic_vector(to_unsigned(a1, 4));
--	D2 <= std_logic_vector(to_unsigned(a2, 4));
--	D3 <= std_logic_vector(to_unsigned(a3, 4));	
	
	end process;   
end behaviour;