----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:31 05/21/2022 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top is
    Port ( clk : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           anod  : out  STD_LOGIC_VECTOR (3 downto 0);
           catod : out  STD_LOGIC_VECTOR (6 downto 0));
end top;

architecture Behavioral of top is

component Divizor is
    Port ( afis: in std_logic;
			 clk : in  STD_LOGIC;
           c1 : out  STD_LOGIC;
           c2 : out  STD_LOGIC;
           c3 : out  STD_LOGIC);
end component Divizor;

component numarator_alegere is
    Port ( c3 : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (1 downto 0));
end component numarator_alegere;

component reg_1 is			  
	port (
	afis : in std_logic;
	c1: in std_logic;
	anod1: out std_logic_vector (3 downto 0);
	catod1: out std_logic_vector (6 downto 0));
end component reg_1;

component reg_2 is		  
	port (
	afis : in std_logic;
	c1: in std_logic;	
	c2:in std_logic;
	anod2: out std_logic_vector (3 downto 0);
	catod2: out std_logic_vector (6 downto 0));
end component reg_2;

component reg_3 is		  
	port (
	afis : in std_logic;
	c1: in std_logic;
	c2:in std_logic;
	anod3: out std_logic_vector (3 downto 0);
	catod3: out std_logic_vector (6 downto 0));
end component reg_3;

component reg_4 is		  
	port (
	afis : in std_logic;
	c1: in std_logic;	
	c2: in std_logic;
	anod4: out std_logic_vector (3 downto 0);
	catod4: out std_logic_vector (6 downto 0));
end component reg_4;

component mux_iesire is
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
end component mux_iesire;

type stare_tip is (A,B,C);

signal stare :stare_tip :=A;

signal c1,c2,c3: std_logic:='0';
--signal e:std_logic_vector (3 downto 0):="0000";
signal q: std_logic_vector(1 downto 0);
signal catod1,catod2,catod3,catod4: std_logic_vector(6 downto 0);
signal anod1,anod2,anod3,anod4:std_logic_vector(3 downto 0);
signal afis:std_logic:='0';

begin

div:Divizor port map(afis=>afis,clk=>clk,c1=>c1,c2=>c2,c3=>c3);
numarator:numarator_alegere port map(c3=>c3,reset=>reset,enable=>enable,q=>q);
reg1:reg_1 port map(afis=>afis,c1=>c1,anod1=>anod1,catod1=>catod1);
reg2:reg_2 port map(afis=>afis,c1=>c1,c2=>c2,anod2=>anod2,catod2=>catod2);
reg3:reg_3 port map(afis=>afis,c1=>c1,c2=>c2,anod3=>anod3,catod3=>catod3);
reg4:reg_4 port map(afis=>afis,c1=>c1,c2=>c2,anod4=>anod4,catod4=>catod4);
mux:mux_iesire port map(q=>q,anod1=>anod1,anod2=>anod2,anod3=>anod3,anod4=>anod4,catod1=>catod1,catod2=>catod2,catod3=>catod3,catod4=>catod4,anod=>anod,catod=>catod);

process(reset,enable,stare,clk)
begin
	if(clk='1' and clk'event) then
	case stare is
	when A=> if(enable='1')then stare<=B;end if;
	when B=> if(reset='1')then stare<=C;
				elsif(enable='0') then stare<=A;
				end if;
	when others => if(reset='0')then 
						if(enable='1') then stare<=B;
						elsif(enable='0') then stare<=A;
						end if; 
						else stare<=C;
						end if;
	end case;
	end if;
end process;

process(stare)
begin
	case stare is
	when A=> afis<='0';
	when B=>	afis<='1';
	when others => afis<='0';
	end case;
end process;

end Behavioral;

