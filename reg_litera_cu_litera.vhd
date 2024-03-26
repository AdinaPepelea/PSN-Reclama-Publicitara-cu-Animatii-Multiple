----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:07 05/21/2022 
-- Design Name: 
-- Module Name:    reg_litera_cu_litera - Behavioral 
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

entity reg_3 is		  
	port (
	afis : in std_logic;
	c1: in std_logic;
	c2:in std_logic;
	anod3: out std_logic_vector (3 downto 0);
	catod3: out std_logic_vector (6 downto 0));
end reg_3; 

architecture reg_3x of reg_3 is	
signal cx:std_logic_vector(1 downto 0):="00";
signal i:integer :=0;
begin
	process (c1,c2,afis,i)
	begin 
	case (afis) is
	when '1' =>
		if (c1='1' and c1'event) then 
			cx<=cx+1;
		end if;
		if(c2='1' and c2'event) then i<=i+1;
		end if;
		if(i=10)then i<=0;
		end if;
	when others => cx<="00";
	end case;
	end process;
	
	process(cx,i)
	begin
	catod3<="1111111";
	anod3<="1111";
	case(i)is
	when 0 =>
		case cx is
			when "00" => catod3<="0001000"; anod3<="0111";
			when "01" => catod3<="1111111"; anod3<="1011";
			when "10" => catod3<="1111111"; anod3<="1101";
			when others => catod3<="1111111"; anod3<="1101";
		end case;
	when 1=>
		case cx is
			when "00" => catod3<="0001000"; anod3<="0111";
			when "01" => catod3<="1000111"; anod3<="1011";
			when "10" => catod3<="1111111"; anod3<="1101";
			when others => catod3<="1111111"; anod3<="1101";
		end case;
	when 2=>
		case cx is
			when "00" => catod3<="0001000"; anod3<="0111";
			when "01" => catod3<="1000111"; anod3<="1011";
			when "10" => catod3<="0000011"; anod3<="1101";
			when others => catod3<="1111111"; anod3<="1101";
		end case;
	when 3=>
		case cx is
			when "00" => catod3<="0001000"; anod3<="0111";
			when "01" => catod3<="1000111"; anod3<="1011";
			when "10" => catod3<="0000011"; anod3<="1101";
			when others => catod3<="0001000"; anod3<="1110";
		end case;
	when others=>null;
	end case;
	end process;
end reg_3x;		

