library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity inverter is
	port(X: in unsigned(31 downto 0); toinvert: in std_logic; Xout: out unsigned(31 downto 0));
end entity inverter;

architecture arch of inverter is
begin
	with toinvert select Xout (31 downto 0)<=
		not X(31 downto 0) when '1',
			 X(31 downto 0) when '0';
end architecture arch;