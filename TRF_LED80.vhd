-- TRF_LED80

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY TRF_LED80 IS
	generic(
		TRF_SIZE : integer:= 8
		);

	PORT(
		din: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END TRF_LED80;

ARCHITECTURE dataflow OF TRF_LED80 IS

SIGNAL index: INTEGER RANGE 0 TO (2**TRF_SIZE-1);
TYPE vector_array IS ARRAY (0 to (2**TRF_SIZE-1)) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT memory : vector_array := 
	(

x"0C",x"05",x"06",x"0B",x"09",x"00",x"0A",x"0D",x"03",x"0E",x"0F",x"08",x"04",x"07",x"01",x"02",
x"00",x"01",x"00",x"03",x"00",x"07",x"01",x"07",x"03",x"07",x"07",x"06",x"07",x"05",x"07",x"03",
x"06",x"07",x"05",x"07",x"03",x"06",x"07",x"04",x"07",x"01",x"06",x"03",x"04",x"07",x"01",x"06",
x"03",x"05",x"07",x"02",x"06",x"05",x"05",x"03",x"02",x"06",x"05",x"04",x"03",x"00",x"06",x"00",
x"04",x"01",x"00",x"02",x"00",x"05",x"01",x"03",x"02",x"07",x"05",x"06",x"03",x"04",x"07",x"00",
x"06",x"01",x"04",x"03",x"00",x"06",x"01",x"05",x"03",x"03",x"06",x"06",x"05",x"05",x"03",x"02",
x"06",x"04",x"05",x"01",x"02",x"02",x"04",x"04",x"01",x"00",x"02",x"01",x"04",x"02",x"00",x"04",
x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00",x"00"
);

BEGIN

	index <= to_integer(unsigned(din(TRF_SIZE-1 downto 0)));
	dout <= memory(index);

END dataflow;
