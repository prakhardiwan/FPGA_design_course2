LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.std_logic_unsigned.all;

entity AAC2M2P1 is port (                 	
   CP: 	in std_logic; 	-- clock
   SR:  in std_logic;  -- Active low, synchronous reset
   P:    in std_logic_vector(3 downto 0);  -- Parallel input
   PE:   in std_logic;  -- Parallel Enable (Load)
   CEP: in std_logic;  -- Count enable parallel input
   CET:  in std_logic; -- Count enable trickle input
   Q:   out std_logic_vector(3 downto 0);            			
    TC:  out std_logic  -- Terminal Count
);            		
end AAC2M2P1;

architecture behavioral of AAC2M2P1 is
signal temp: std_logic_vector(3 downto 0);
begin
	count_proc: process (CP, SR, PE, CEP, CET)
	begin
		if rising_edge(CP) then 
			if(SR = '0') then temp <= "0000";
			elsif (SR = '1') then 
				if (PE = '0') then temp <= P;
				elsif (PE = '1') then
					if(CEP and CET) then
						temp <= temp + 1;
					end if;
				end if;
			end if;
		end if;
	end process count_proc;
	TC <= (temp(3) and temp(2) and temp(1) and temp(0) and CET);
	Q <= temp;
end architecture behavioral;
