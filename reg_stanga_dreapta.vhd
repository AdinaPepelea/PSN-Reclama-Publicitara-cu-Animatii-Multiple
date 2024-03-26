----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:22:23 05/21/2022 
-- Design Name: 
-- Module Name:    reg_stanga_dreapta - Behavioral 
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

entity reg_4 is		  
	port (
	afis : in std_logic;
	c1: in std_logic;	
	c2: in std_logic;
	anod4: out std_logic_vector (3 downto 0);
	catod4: out std_logic_vector (6 downto 0));
end reg_4; 

architecture reg_4x of reg_4 is
signal cx: std_logic_vector (1 downto 0):="00";
signal n0: std_logic_vector (6 downto 0):="0001000";
signal n1: std_logic_vector (6 downto 0):="1000111";
signal n2: std_logic_vector (6 downto 0):="0000011";
signal n3: std_logic_vector (6 downto 0):="0001000";   
begin
	process(c1,afis,c2)
	begin  
	case (afis) is
	when '1' =>
		if c1='1' and c1'event then
			cx<=cx+1;
		end if;
		if(c2='1' and c2'event) then
			n0<=n3;
			n1<=n0;
			n2<=n1; 
			n3<=n2;
		end if;
	when others => cx<="00";n0<="0001000";n1<="1000111";n2<="0000011";n3<="0001000";
	end case;
	end process;
	
	process (cx,n3,n2,n1,n0) 
	begin 
		anod4<="1111";
		case cx is
			when "00" => 
			catod4<=n3;
			anod4<="1110";
			when "01" =>
			catod4<=n2;
			anod4<="1101";
			when "10" =>
			catod4<=n1;
			anod4<="1011";
			when others =>
			catod4<=n0;
			anod4<="0111";
		end case;
	end process;
	
end reg_4x;

