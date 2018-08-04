-- dataloader
-- LED
-- Set DMEM Generic to 6

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY dataloader IS
	generic(
		LOADER_SIZE : integer:= 8
		);

	PORT(
		addr: IN STD_LOGIC_VECTOR(LOADER_SIZE - 1 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END dataloader;

ARCHITECTURE dataflow OF dataloader IS

SIGNAL index: INTEGER RANGE 0 TO 2**LOADER_SIZE - 1;
TYPE vector_array IS ARRAY (0 to 2**LOADER_SIZE-1) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT memory : vector_array := 
	(

-- 00 - 0F state variables 0 - 15
-- initial plaintext placed here

x"0f",x"00",x"02",x"01",
x"0e",x"09",x"0b",x"01",
x"0b",x"07",x"08",x"0c",
x"0c",x"0b",x"0d",x"08",

-- 10 - 1F temporary transposed state
-- reserved - initially zero

x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00",
-- 20 - 33 Secret Key

x"02",x"0f",x"07",x"0f",
x"0f",x"02",x"0b",x"03",
x"08",x"0c",x"06",x"0d",
x"04",x"08",x"0d",x"00",
x"01",x"0e",x"04",x"08",

-- 34 - 3F variables and reserved for stack
-- 34 - step
-- 35 - round
-- 36 - kptr

x"00",x"00",x"20",x"00",
x"00",x"00",x"00",x"00",
x"00",x"00",x"00",x"00"


);
BEGIN

	index <= to_integer(unsigned(addr));
	dout <= memory(index);

END dataflow;
