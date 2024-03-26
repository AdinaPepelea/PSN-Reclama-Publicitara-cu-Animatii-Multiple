----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:45 05/21/2022 
-- Design Name: 
-- Module Name:    Divizor - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divizor is
    Port (afis:in std_logic;
			 clk : in  STD_LOGIC;
           c1 : out  STD_LOGIC;
           c2 : out  STD_LOGIC;
           c3 : out  STD_LOGIC);
end Divizor;

architecture Behavioral of Divizor is

signal clkdiv: std_logic_vector (29 downto 0):="000000000000000000000000000000";

begin

process(clk,clkdiv,afis)
begin
case (afis) is
when '1'=>
	if(clk='1' and clk'event) then 
		clkdiv<=clkdiv+1;
	end if;
when others =>clkdiv<="000000000000000000000000000000";
end case;
	c1<=clkdiv(15);
	c2<=clkdiv(24);
	c3<=clkdiv(29);
end process;

end Behavioral;

