library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity RegMUX is
	port(rt,rd,in31 : in std_logic_vector(4 downto 0); regDst : in std_logic_vector(1 downto 0); destRegFinal : out std_logic_vector(4 downto 0));
end RegMUX;

architecture arch of RegMUX is
begin
	with regDst select destRegFinal <= 
		rt when "00",
		rd when "01", 
		in31 when "10",
		"00000" when "11";
end arch;