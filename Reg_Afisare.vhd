----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:29:04 05/21/2022 
-- Design Name: 
-- Module Name:    Reg_Afisare - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.all;

entity reg_1 is			  
	port (
	afis:in std_logic;
	c1: in std_logic;
	anod1: out std_logic_vector (3 downto 0);
	catod1: out std_logic_vector (6 downto 0));
end reg_1;

architecture reg_1x of reg_1 is

signal cx: std_logic_vector (1 downto 0):="00";
begin 
	
	process (c1,afis)
	begin
		case (afis) is
		when '1' =>
		if (c1='1' and c1'event) then 
			cx<=cx+1;
		end if;
		when others => cx<="00";
		end case;
	end process ;
	
	process (cx)
	begin
		anod1<="1111";
		case cx is 
			when "00" =>
			anod1<="1110";
			catod1<="0001000";
			when "01" =>
			anod1<="1101";
			catod1<="0000011";
			when "10" =>
			anod1<="1011";
			catod1<="1000111";
			when others =>
			anod1<="0111";
			catod1<="0001000";
		end case;
					
	end process ;
end reg_1x;

