----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:39 05/21/2022 
-- Design Name: 
-- Module Name:    mux_iesire - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_iesire is
    Port ( q : in  STD_LOGIC_VECTOR (1 downto 0);
           anod1 : in  STD_LOGIC_VECTOR (3 downto 0);
           anod2 : in  STD_LOGIC_VECTOR (3 downto 0);
           anod3 : in  STD_LOGIC_VECTOR (3 downto 0);
           anod4 : in  STD_LOGIC_VECTOR (3 downto 0);
           catod1 : in  STD_LOGIC_VECTOR (6 downto 0);
           catod2 : in  STD_LOGIC_VECTOR (6 downto 0);
           catod3 : in  STD_LOGIC_VECTOR (6 downto 0);
           catod4 : in  STD_LOGIC_VECTOR (6 downto 0);
           anod : out  STD_LOGIC_VECTOR (3 downto 0);
           catod : out  STD_LOGIC_VECTOR (6 downto 0));
end mux_iesire;

architecture Behavioral of mux_iesire is

begin

process(q,anod1,catod1,anod2,catod2,anod3,catod3,anod4,catod4)
begin
		case q is
			when "00"=>anod<=anod1;catod<=catod1;
			when "01"=>anod<=anod2;catod<=catod2;
			when "10"=>anod<=anod3;catod<=catod3;
			when others=>anod<=anod4;catod<=catod4;
		end case;
end process;

end Behavioral;

