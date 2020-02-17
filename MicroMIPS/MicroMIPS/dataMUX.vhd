library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dataMUX is
	port(dataCache, fromALU, IncrPC: in std_logic_vector(31 downto 0); RegInSrc : in std_logic_vector(1 downto 0); regFileIn : out std_logic_vector(31 downto 0));
end dataMUX;

architecture arch of dataMUX is
begin
	
	
	process (RegInSrc) 
	begin
			case RegInSrc is
				when "00" => regFileIn <=dataCache after 10ns;
				when "01" => regFileIn <=fromALU after 10ns;
				when "10" => regFileIn <=IncrPC after 10ns;
				when "11" => regFileIn <="00000000000000000000000000000000";
			end case;
	end process;

end arch;