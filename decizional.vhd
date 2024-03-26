----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:09:13 05/21/2022 
-- Design Name: 
-- Module Name:    decizional - Behavioral 
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

entity decizional is
    Port ( q : in  STD_LOGIC_VECTOR (1 downto 0);
           en0 : out  STD_LOGIC;
           en1 : out  STD_LOGIC;
           en2 : out  STD_LOGIC;
           en3 : out  STD_LOGIC);
end decizional;

architecture Behavioral of decizional is

signal e0,e1,e2,e3:std_logic:='0';

begin

process(q)
begin
e0<='0';e1<='0';e2<='0';e3<='0';
case q is
when "00"=>e0<='1';
when "01"=>e1<='1';
when "10"=>e2<='1';
when others=>e3<='1';
end case;
end process;

en0<=e0;en1<=e1;en2<=e2;en3<=e3;

end Behavioral;

