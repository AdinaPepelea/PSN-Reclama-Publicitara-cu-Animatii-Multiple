----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:51 05/21/2022 
-- Design Name: 
-- Module Name:    numarator_alegere - Behavioral 
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

entity numarator_alegere is
    Port ( c3 : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end numarator_alegere;

architecture Behavioral of numarator_alegere is
signal num: std_logic_vector (1 downto 0):="00";

begin

process(c3,enable,reset)
begin
if(reset='1') then num<="00";
elsif(enable='1') then
if(c3='1' and c3'event) then num<=num+1;
end if;
end if;
end process;

q<=num;

end Behavioral;
