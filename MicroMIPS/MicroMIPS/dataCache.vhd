library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity datacache is 
	port (DATA_IN : in std_logic_vector(31 downto 0); 
	ADDR : in unsigned (6 downto 0); 
	CS, WE, OE : in std_logic; 
	DATA_OUT : out std_logic_vector(31 downto 0) := (others => 'Z'));
end entity datacache;

architecture arch of datacache is
type data is array (0 to 127) of std_logic_vector(31 downto 0);
signal member : data;
signal realADDR : integer range 0 to 127;
begin

	realADDR <= to_integer(ADDR);

	process (CS, WE, OE, realADDR, DATA_IN)
	begin

		member(1)<="00000000000000000000000000000101";
		member(2)<="00000000000000000000000000000111";

		if CS = '0' then 
			DATA_OUT <= (others => 'Z');
		elsif WE = '1'  then 
			member(realADDR) <= DATA_IN;
		elsif OE = '1'  then 
			DATA_OUT <= member(realADDR);
		else DATA_OUT <= (others => 'U');
		
		end if;
		
	end process;

end architecture arch;
