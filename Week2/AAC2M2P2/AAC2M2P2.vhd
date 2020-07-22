LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

ARCHITECTURE logic OF RAM128_32 IS
TYPE memory IS ARRAY(127 DOWNTO 0) OF STD_LOGIC_VECTOR(31 DOWNTO 0);  --data type for memory
SIGNAL ram	:	memory;                                                    --internal address register
BEGIN
	PROCESS(clock)
	BEGIN
		if(rising_edge(clock)) then
			 if(wren='1') then -- when write enable = 1, 
			 -- write input data into RAM at the provided address
			 ram(to_integer(unsigned(address))) <= data;
			 -- The index of the RAM array type needs to be integer so
			 -- converts RAM_ADDR from std_logic_vector -> Unsigned -> Interger using numeric_std library
			 end if;
		end if;
	end process;
 -- Data to be read out 
	q <= ram(to_integer(unsigned(address)));
end logic;