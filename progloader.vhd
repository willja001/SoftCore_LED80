-- progloader
-- LED-80
-- Set PMEM -> 9

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY progloader IS
	generic(
		LOADER_SIZE : integer:= 8
		);

	PORT(
		addr: IN STD_LOGIC_VECTOR(LOADER_SIZE - 1 DOWNTO 0);
		dout: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);

END progloader;

ARCHITECTURE dataflow OF progloader IS

SIGNAL index: INTEGER RANGE 0 TO 2**LOADER_SIZE - 1;
TYPE vector_array IS ARRAY (0 to 2**LOADER_SIZE-1) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
CONSTANT memory : vector_array := 
	(

-- Assembled by SoftAsm.py at Sun Mar 12 09:08:07 2017
-- Start location: 0x000
-- End location: 0x013
-- Highest program address: 0x1CE
-- .equ x0 0x00
-- .equ x1 0x01
-- .equ x2 0x02
-- .equ x3 0x03
-- .equ x4 0x04
-- .equ x5 0x05
-- .equ x6 0x06
-- .equ x7 0x07
-- .equ x8 0x08
-- .equ x9 0x09
-- .equ x10 0x0A
-- .equ x11 0x0B
-- .equ x12 0x0C
-- .equ x13 0x0D
-- .equ x14 0x0E
-- .equ x15 0x0F
-- .equ tx0 0x10
-- .equ tx1 0x14
-- .equ tx2 0x18
-- .equ tx3 0x1C
-- .equ tx4 0x1D
-- .equ tx5 0x11
-- .equ tx6 0x15
-- .equ tx7 0x19
-- .equ tx8 0x1A
-- .equ tx9 0x1E
-- .equ tx10 0x12
-- .equ tx11 0x16
-- .equ tx12 0x17
-- .equ tx13 0x1B
-- .equ tx14 0x1F
-- .equ tx15 0x13
-- .equ k0 0x20
-- .equ k19 0x33
-- .equ step 0x34
-- .equ rnd 0x35
-- .equ kptr 0x36
-- .lbl lpst 0x000
-- .lbl lpnd 0x00F
-- .lbl stplp 0x014
-- .lbl stplp1 0x01B
-- .lbl stpnd 0x02A
-- .lbl rndlp 0x02B
-- .lbl sbst 0x075
-- .lbl sbnd 0x07D
-- .lbl mulrow0 0x13E
-- .lbl mulrow1 0x159
-- .lbl mulrow2 0x175
-- .lbl mulrow3 0x192
-- .lbl adky 0x1AE
-- .lbl adky1 0x1B3
-- .lbl kprt 0x1C0
-- .lbl kpct 0x1C2
-- .lbl adkynd 0x1CB

x"90", --PC=0x000 jsr stplp
x"14",
x"50", --PC=0x002 mvi step, r0
x"34",
x"01", --PC=0x004 lds r0, r1
x"52", --PC=0x005 mvi 0x0B, r2
x"0B",
x"6C", --PC=0x007 sub r1, r2
x"16",
x"F8", --PC=0x009 bzi lpnd
x"0F",
x"61", --PC=0x00B inc r1
x"24", --PC=0x00C sts r1, r0
x"D0", --PC=0x00D jmp lpst
x"00",
x"61", --PC=0x00F inc r1
x"24", --PC=0x010 sts r1, r0
x"91", --PC=0x011 jsr adky
x"AE",
 -------PC=0x013---- end -----
x"40", --PC=0x013 nop
x"50", --PC=0x014 mvi 0x00, r0
x"00",
x"51", --PC=0x016 mvi rnd, r1
x"35",
x"21", --PC=0x018 sts r0, r1
x"91", --PC=0x019 jsr adky
x"AE",
x"90", --PC=0x01B jsr rndlp
x"2B",
x"50", --PC=0x01D mvi rnd, r0
x"35",
x"01", --PC=0x01F lds r0, r1
x"52", --PC=0x020 mvi 0x03, r2
x"03",
x"6C", --PC=0x022 sub r1, r2
x"16",
x"F8", --PC=0x024 bzi stpnd
x"2A",
x"61", --PC=0x026 inc r1
x"24", --PC=0x027 sts r1, r0
x"D0", --PC=0x028 jmp stplp1
x"1B",
x"A0", --PC=0x02A ret  
x"50", --PC=0x02B mvi 0x05, r0
x"05",
x"51", --PC=0x02D mvi x0, r1
x"00",
x"06", --PC=0x02F lds r1, r2
x"B2", --PC=0x030 xor r0, r2
x"29", --PC=0x031 sts r2, r1
x"50", --PC=0x032 mvi 0x04, r0
x"04",
x"51", --PC=0x034 mvi x4, r1
x"04",
x"06", --PC=0x036 lds r1, r2
x"B2", --PC=0x037 xor r0, r2
x"29", --PC=0x038 sts r2, r1
x"50", --PC=0x039 mvi 0x02, r0
x"02",
x"51", --PC=0x03B mvi x8, r1
x"08",
x"06", --PC=0x03D lds r1, r2
x"B2", --PC=0x03E xor r0, r2
x"29", --PC=0x03F sts r2, r1
x"50", --PC=0x040 mvi 0x03, r0
x"03",
x"51", --PC=0x042 mvi x12, r1
x"0C",
x"06", --PC=0x044 lds r1, r2
x"B2", --PC=0x045 xor r0, r2
x"29", --PC=0x046 sts r2, r1
x"50", --PC=0x047 mvi step, r0
x"34",
x"00", --PC=0x049 lds r0, r0
x"51", --PC=0x04A mvi 0x03, r1
x"03",
x"6C", --PC=0x04C sll r1, r0
x"74",
x"52", --PC=0x04E mvi rnd, r2
x"35",
x"0A", --PC=0x050 lds r2, r2
x"51", --PC=0x051 mvi 0x01, r1
x"01",
x"6C", --PC=0x053 sll r1, r2
x"76",
x"6C", --PC=0x055 add r2, r0
x"08",
x"51", --PC=0x057 mvi 0x10, r1
x"10",
x"6C", --PC=0x059 add r1, r0
x"04",
x"41", --PC=0x05B mov r0, r1
x"C0", --PC=0x05C trf t0, r0
x"61", --PC=0x05D inc r1
x"C1", --PC=0x05E trf t0, r1
x"52", --PC=0x05F mvi x1, r2
x"01",
x"0B", --PC=0x061 lds r2, r3
x"B3", --PC=0x062 xor r0, r3
x"2E", --PC=0x063 sts r3, r2
x"52", --PC=0x064 mvi x5, r2
x"05",
x"0B", --PC=0x066 lds r2, r3
x"B7", --PC=0x067 xor r1, r3
x"2E", --PC=0x068 sts r3, r2
x"52", --PC=0x069 mvi x9, r2
x"09",
x"0B", --PC=0x06B lds r2, r3
x"B3", --PC=0x06C xor r0, r3
x"2E", --PC=0x06D sts r3, r2
x"52", --PC=0x06E mvi x13, r2
x"0D",
x"0B", --PC=0x070 lds r2, r3
x"B7", --PC=0x071 xor r1, r3
x"2E", --PC=0x072 sts r3, r2
x"50", --PC=0x073 mvi x15, r0
x"0F",
x"01", --PC=0x075 lds r0, r1
x"C1", --PC=0x076 trf t0, r1
x"24", --PC=0x077 sts r1, r0
x"64", --PC=0x078 dec r0
x"F4", --PC=0x079 bni sbnd
x"7D",
x"D0", --PC=0x07B jmp sbst
x"75",
x"50", --PC=0x07D mvi x0, r0
x"00",
x"01", --PC=0x07F lds r0, r1
x"52", --PC=0x080 mvi tx0, r2
x"10",
x"26", --PC=0x082 sts r1, r2
x"60", --PC=0x083 inc r0
x"01", --PC=0x084 lds r0, r1
x"52", --PC=0x085 mvi tx1, r2
x"14",
x"26", --PC=0x087 sts r1, r2
x"60", --PC=0x088 inc r0
x"01", --PC=0x089 lds r0, r1
x"52", --PC=0x08A mvi tx2, r2
x"18",
x"26", --PC=0x08C sts r1, r2
x"60", --PC=0x08D inc r0
x"01", --PC=0x08E lds r0, r1
x"52", --PC=0x08F mvi tx3, r2
x"1C",
x"26", --PC=0x091 sts r1, r2
x"60", --PC=0x092 inc r0
x"01", --PC=0x093 lds r0, r1
x"62", --PC=0x094 inc r2
x"26", --PC=0x095 sts r1, r2
x"60", --PC=0x096 inc r0
x"01", --PC=0x097 lds r0, r1
x"52", --PC=0x098 mvi tx5, r2
x"11",
x"26", --PC=0x09A sts r1, r2
x"60", --PC=0x09B inc r0
x"01", --PC=0x09C lds r0, r1
x"52", --PC=0x09D mvi tx6, r2
x"15",
x"26", --PC=0x09F sts r1, r2
x"60", --PC=0x0A0 inc r0
x"01", --PC=0x0A1 lds r0, r1
x"52", --PC=0x0A2 mvi tx7, r2
x"19",
x"26", --PC=0x0A4 sts r1, r2
x"60", --PC=0x0A5 inc r0
x"01", --PC=0x0A6 lds r0, r1
x"62", --PC=0x0A7 inc r2
x"26", --PC=0x0A8 sts r1, r2
x"60", --PC=0x0A9 inc r0
x"01", --PC=0x0AA lds r0, r1
x"52", --PC=0x0AB mvi tx9, r2
x"1E",
x"26", --PC=0x0AD sts r1, r2
x"60", --PC=0x0AE inc r0
x"01", --PC=0x0AF lds r0, r1
x"52", --PC=0x0B0 mvi tx10, r2
x"12",
x"26", --PC=0x0B2 sts r1, r2
x"60", --PC=0x0B3 inc r0
x"01", --PC=0x0B4 lds r0, r1
x"52", --PC=0x0B5 mvi tx11, r2
x"16",
x"26", --PC=0x0B7 sts r1, r2
x"60", --PC=0x0B8 inc r0
x"01", --PC=0x0B9 lds r0, r1
x"62", --PC=0x0BA inc r2
x"26", --PC=0x0BB sts r1, r2
x"60", --PC=0x0BC inc r0
x"01", --PC=0x0BD lds r0, r1
x"52", --PC=0x0BE mvi tx13, r2
x"1B",
x"26", --PC=0x0C0 sts r1, r2
x"60", --PC=0x0C1 inc r0
x"01", --PC=0x0C2 lds r0, r1
x"52", --PC=0x0C3 mvi tx14, r2
x"1F",
x"26", --PC=0x0C5 sts r1, r2
x"60", --PC=0x0C6 inc r0
x"01", --PC=0x0C7 lds r0, r1
x"52", --PC=0x0C8 mvi tx15, r2
x"13",
x"26", --PC=0x0CA sts r1, r2
x"50", --PC=0x0CB mvi tx0, r0
x"10",
x"91", --PC=0x0CD jsr mulrow0
x"3E",
x"50", --PC=0x0CF mvi x0, r0
x"00",
x"2C", --PC=0x0D1 sts r3, r0
x"50", --PC=0x0D2 mvi tx1, r0
x"14",
x"91", --PC=0x0D4 jsr mulrow0
x"3E",
x"50", --PC=0x0D6 mvi x1, r0
x"01",
x"2C", --PC=0x0D8 sts r3, r0
x"50", --PC=0x0D9 mvi tx2, r0
x"18",
x"91", --PC=0x0DB jsr mulrow0
x"3E",
x"50", --PC=0x0DD mvi x2, r0
x"02",
x"2C", --PC=0x0DF sts r3, r0
x"50", --PC=0x0E0 mvi tx3, r0
x"1C",
x"91", --PC=0x0E2 jsr mulrow0
x"3E",
x"50", --PC=0x0E4 mvi x3, r0
x"03",
x"2C", --PC=0x0E6 sts r3, r0
x"50", --PC=0x0E7 mvi tx0, r0
x"10",
x"91", --PC=0x0E9 jsr mulrow1
x"59",
x"50", --PC=0x0EB mvi x4, r0
x"04",
x"2C", --PC=0x0ED sts r3, r0
x"50", --PC=0x0EE mvi tx1, r0
x"14",
x"91", --PC=0x0F0 jsr mulrow1
x"59",
x"50", --PC=0x0F2 mvi x5, r0
x"05",
x"2C", --PC=0x0F4 sts r3, r0
x"50", --PC=0x0F5 mvi tx2, r0
x"18",
x"91", --PC=0x0F7 jsr mulrow1
x"59",
x"50", --PC=0x0F9 mvi x6, r0
x"06",
x"2C", --PC=0x0FB sts r3, r0
x"50", --PC=0x0FC mvi tx3, r0
x"1C",
x"40", --PC=0x0FE nop
x"40", --PC=0x0FF nop
x"91", --PC=0x100 jsr mulrow1
x"59",
x"50", --PC=0x102 mvi x7, r0
x"07",
x"2C", --PC=0x104 sts r3, r0
x"50", --PC=0x105 mvi tx0, r0
x"10",
x"91", --PC=0x107 jsr mulrow2
x"75",
x"50", --PC=0x109 mvi x8, r0
x"08",
x"2C", --PC=0x10B sts r3, r0
x"50", --PC=0x10C mvi tx1, r0
x"14",
x"91", --PC=0x10E jsr mulrow2
x"75",
x"50", --PC=0x110 mvi x9, r0
x"09",
x"2C", --PC=0x112 sts r3, r0
x"50", --PC=0x113 mvi tx2, r0
x"18",
x"91", --PC=0x115 jsr mulrow2
x"75",
x"50", --PC=0x117 mvi x10, r0
x"0A",
x"2C", --PC=0x119 sts r3, r0
x"50", --PC=0x11A mvi tx3, r0
x"1C",
x"91", --PC=0x11C jsr mulrow2
x"75",
x"50", --PC=0x11E mvi x11, r0
x"0B",
x"2C", --PC=0x120 sts r3, r0
x"50", --PC=0x121 mvi tx0, r0
x"10",
x"91", --PC=0x123 jsr mulrow3
x"92",
x"50", --PC=0x125 mvi x12, r0
x"0C",
x"2C", --PC=0x127 sts r3, r0
x"50", --PC=0x128 mvi tx1, r0
x"14",
x"91", --PC=0x12A jsr mulrow3
x"92",
x"50", --PC=0x12C mvi x13, r0
x"0D",
x"2C", --PC=0x12E sts r3, r0
x"50", --PC=0x12F mvi tx2, r0
x"18",
x"91", --PC=0x131 jsr mulrow3
x"92",
x"50", --PC=0x133 mvi x14, r0
x"0E",
x"2C", --PC=0x135 sts r3, r0
x"50", --PC=0x136 mvi tx3, r0
x"1C",
x"91", --PC=0x138 jsr mulrow3
x"92",
x"50", --PC=0x13A mvi x15, r0
x"0F",
x"2C", --PC=0x13C sts r3, r0
x"A0", --PC=0x13D ret
x"53", --PC=0x13E mvi 0x00, r3
x"00",
x"01", --PC=0x140 lds r0, r1
x"52", --PC=0x141 mvi 0x04, r2
x"04",
x"6C", --PC=0x143 gf4 r2, r1
x"89",
x"47", --PC=0x145 mov r1, r3
x"60", --PC=0x146 inc r0
x"01", --PC=0x147 lds r0, r1
x"52", --PC=0x148 mvi 0x01, r2
x"01",
x"6C", --PC=0x14A gf4 r2, r1
x"89",
x"B7", --PC=0x14C xor r1, r3
x"60", --PC=0x14D inc r0
x"01", --PC=0x14E lds r0, r1
x"62", --PC=0x14F inc r2
x"6C", --PC=0x150 gf4 r2, r1
x"89",
x"B7", --PC=0x152 xor r1, r3
x"60", --PC=0x153 inc r0
x"01", --PC=0x154 lds r0, r1
x"6C", --PC=0x155 gf4 r2, r1
x"89",
x"B7", --PC=0x157 xor r1, r3
x"A0", --PC=0x158 ret
x"53", --PC=0x159 mvi 0x00, r3
x"00",
x"01", --PC=0x15B lds r0, r1
x"52", --PC=0x15C mvi 0x08, r2
x"08",
x"6C", --PC=0x15E gf4 r2, r1
x"89",
x"47", --PC=0x160 mov r1, r3
x"60", --PC=0x161 inc r0
x"01", --PC=0x162 lds r0, r1
x"52", --PC=0x163 mvi 0x06, r2
x"06",
x"6C", --PC=0x165 gf4 r2, r1
x"89",
x"B7", --PC=0x167 xor r1, r3
x"60", --PC=0x168 inc r0
x"01", --PC=0x169 lds r0, r1
x"66", --PC=0x16A dec r2
x"6C", --PC=0x16B gf4 r2, r1
x"89",
x"B7", --PC=0x16D xor r1, r3
x"60", --PC=0x16E inc r0
x"01", --PC=0x16F lds r0, r1
x"62", --PC=0x170 inc r2
x"6C", --PC=0x171 gf4 r2, r1
x"89",
x"B7", --PC=0x173 xor r1, r3
x"A0", --PC=0x174 ret
x"53", --PC=0x175 mvi 0x00, r3
x"00",
x"01", --PC=0x177 lds r0, r1
x"52", --PC=0x178 mvi 0x0B, r2
x"0B",
x"6C", --PC=0x17A gf4 r2, r1
x"89",
x"47", --PC=0x17C mov r1, r3
x"60", --PC=0x17D inc r0
x"01", --PC=0x17E lds r0, r1
x"52", --PC=0x17F mvi 0x0E, r2
x"0E",
x"6C", --PC=0x181 gf4 r2, r1
x"89",
x"B7", --PC=0x183 xor r1, r3
x"60", --PC=0x184 inc r0
x"01", --PC=0x185 lds r0, r1
x"52", --PC=0x186 mvi 0x0A, r2
x"0A",
x"6C", --PC=0x188 gf4 r2, r1
x"89",
x"B7", --PC=0x18A xor r1, r3
x"60", --PC=0x18B inc r0
x"01", --PC=0x18C lds r0, r1
x"66", --PC=0x18D dec r2
x"6C", --PC=0x18E gf4 r2, r1
x"89",
x"B7", --PC=0x190 xor r1, r3
x"A0", --PC=0x191 ret
x"53", --PC=0x192 mvi 0x00, r3
x"00",
x"01", --PC=0x194 lds r0, r1
x"52", --PC=0x195 mvi 0x02, r2
x"02",
x"6C", --PC=0x197 gf4 r2, r1
x"89",
x"47", --PC=0x199 mov r1, r3
x"60", --PC=0x19A inc r0
x"01", --PC=0x19B lds r0, r1
x"6C", --PC=0x19C gf4 r2, r1
x"89",
x"B7", --PC=0x19E xor r1, r3
x"60", --PC=0x19F inc r0
x"01", --PC=0x1A0 lds r0, r1
x"52", --PC=0x1A1 mvi 0x0F, r2
x"0F",
x"6C", --PC=0x1A3 gf4 r2, r1
x"89",
x"B7", --PC=0x1A5 xor r1, r3
x"60", --PC=0x1A6 inc r0
x"01", --PC=0x1A7 lds r0, r1
x"52", --PC=0x1A8 mvi 0x0B, r2
x"0B",
x"6C", --PC=0x1AA gf4 r2, r1
x"89",
x"B7", --PC=0x1AC xor r1, r3
x"A0", --PC=0x1AD ret
x"52", --PC=0x1AE mvi kptr, r2
x"36",
x"0A", --PC=0x1B0 lds r2, r2
x"50", --PC=0x1B1 mvi x0, r0
x"00",
x"01", --PC=0x1B3 lds r0, r1
x"0B", --PC=0x1B4 lds r2, r3
x"B7", --PC=0x1B5 xor r1, r3
x"2C", --PC=0x1B6 sts r3, r0
x"53", --PC=0x1B7 mvi k19, r3
x"33",
x"6C", --PC=0x1B9 sub r2, r3
x"1B",
x"F9", --PC=0x1BB bzi kprt
x"C0",
x"62", --PC=0x1BD inc r2
x"D1", --PC=0x1BE jmp kpct
x"C2",
x"52", --PC=0x1C0 mvi k0, r2
x"20",
x"53", --PC=0x1C2 mvi 0x0F, r3
x"0F",
x"6C", --PC=0x1C4 sub r0, r3
x"13",
x"F9", --PC=0x1C6 bzi adkynd
x"CB",
x"60", --PC=0x1C8 inc r0
x"D1", --PC=0x1C9 jmp adky1
x"B3",
x"51", --PC=0x1CB mvi kptr, r1
x"36",
x"29", --PC=0x1CD sts r2, r1
x"A0", --PC=0x1CE ret
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00",
x"00"


);

BEGIN

	index <= to_integer(unsigned(addr));
	dout <= memory(index);

END dataflow;
