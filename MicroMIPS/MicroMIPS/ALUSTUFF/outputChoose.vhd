library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity outputChoose is 
	port(X, Y, Result: in unsigned(31 downto 0); SW17and16: in unsigned(1 downto 0); toDisplay: out unsigned(31 downto 0));
end entity outputChoose;

architecture arch of outputChoose is 
begin 
	with SW17and16 select toDisplay <=
		Result when "00",
		X when "01",
		Y when "10",
		Result when "11";
end architecture arch;