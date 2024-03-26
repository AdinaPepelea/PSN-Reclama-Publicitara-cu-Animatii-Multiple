----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:36:29 05/21/2022 
-- Design Name: 
-- Module Name:    reg_2 - Behavioral 
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
Library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity reg_2 is		  
	port (
	afis : in std_logic;
	c1: in std_logic;	
	c2:in std_logic;
	anod2: out std_logic_vector (3 downto 0);
	catod2: out std_logic_vector (6 downto 0));
end reg_2;

architecture reg_2x of reg_2 is
signal cx: std_logic_vector (1 downto 0):="00";
signal i :natural :=1;

begin		
	process (c1,afis,c2,i)
	begin
		case (afis) is
		when '1' =>
		if (c1='1' and c1'event) then 
			cx<=cx+1;
		end if;
		if(c2='1' and c2'event) then i<=i+1;
		end if;
		if(i=2)then i<=0;
		end if;
		when others => cx<="00";
		end case;
	end process;  
	
	process (cx,i)
	begin 
		anod2<="1111";
		case cx is
			when "00"=>anod2<="1110";
			when "01"=>anod2<="1101";
			when "10"=>anod2<="1011";
			when others=>anod2<="0111";
 		end case;
		case (i) is
			when 0 => 
				case cx is
				when "00"=>catod2<="0001000";
				when "01"=>catod2<="0000011";
				when "10"=>catod2<="1000111";
				when others=>catod2<="0001000";
				end case;
			when others =>
				case cx is
				when "00"=>catod2<="1111111";
				when "01"=>catod2<="1111111";
				when "10"=>catod2<="1111111";
				when others=>catod2<="1111111";
				end case;
		end case;
	end process;
	
end reg_2x;	

