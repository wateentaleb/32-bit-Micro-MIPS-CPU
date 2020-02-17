library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity logicunit is 
	port(X, Y: in unsigned(31 downto 0); choose: in unsigned(1 downto 0); myoutput: out unsigned(31 downto 0));
end entity logicunit;

architecture arch of logicunit is 
	begin
		with choose select myoutput <=
			X and Y when "00",
			X or Y when "01",
			X xor Y when "10",
			X nor Y when "11";
end architecture arch;