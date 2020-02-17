library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux4 is 
	port(A : in unsigned(31 downto 0); B : in std_logic; C, D : in unsigned(31 downto 0); choose : in unsigned(1 downto 0); S : out unsigned(31 downto 0));
end entity mux4;

architecture arch of mux4 is 
	signal bout : unsigned(31 downto 0);
	begin
		bout(0) <= B;
		with choose select S <= 
		  A(15 downto 0) & "0000000000000000" when "00",
		  bout when "01",
		  C when "10",
		  D when "11";
end arch;