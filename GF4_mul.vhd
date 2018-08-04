-- GF4multiply
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity GF4multiply is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
	   b : in STD_LOGIC_VECTOR (3 downto 0);
	   y : out std_logic_vector (3 downto 0)	
	 );

end GF4multiply;



architecture structural of GF4multiply is

signal w : std_logic_vector(3 downto 0);
signal z0, z1, z2, z3, z4, z5, z6 : std_logic;

begin

z0 <= a(0) and b(0);
z1 <= (a(1) and b(0)) xor (a(0) and b(1));
z2 <= (a(2) and b(0)) xor (a(1) and b(1)) xor (a(0) and b(2));
z3 <= (a(3) and b(0)) xor (a(2) and b(1)) xor (a(1) and b(2)) xor (a(0) and b(3));
z4 <= (a(3) and b(1)) xor (a(2) and b(2)) xor (a(1) and b(3));
z5 <= (a(3) and b(2)) xor (a(2) and b(3));
z6 <= (a(3) and b(3));


w(0) <= z0 xor z4;
w(1) <= z1 xor z4 xor z5;
w(2) <= z2 xor z5 xor z6;
w(3) <= z3 xor z6;

Y <= w(3) & w(2) & w(1) & w(0);

end structural;




