library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;

architecture logic of fsm is
type state_symbol is (A, B, C);
signal cur, nex : state_symbol;
begin
	sync: process(CLK, RST, nex)
	begin
		if (RST='1') then 
			cur <= A;
		elsif(rising_edge(CLK)) then
			cur <= nex;
		end if;
	end process sync; 
	
	comb: process(In1, cur)
	begin
		Out1<='0';
		case (cur) is 
			when A=>
				Out1 <= '0';
				if (In1 = '1') then
					nex <= B;
				else
					nex <= A;
				end if;
			when B=>
				Out1 <= '0';
				if (In1 = '1') then
					nex <= B;
				elsif (In1 = '0') then
					nex <= C;
				end if;
			when C=>
				Out1 <= '1';
				if (In1 = '1') then
					nex <= A;
				elsif (In1 = '0') then
					nex <= C;
				end if;
		end case;
	end process comb;
end logic;
		
		
					
	
	
