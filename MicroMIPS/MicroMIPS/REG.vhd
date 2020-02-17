library IEEE;
Use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity REG is
	port(RegW, clk: in std_logic; DR, SR1, SR2: in unsigned(4 downto 0); Reg_In: in unsigned (31 downto 0);
	Data_Out1, Data_Out2: out unsigned (31 downto 0));
end entity REG;

architecture arch of REG is
type regFile is array(0 to 31) of unsigned (31 downto 0);
signal registers : regFile;

begin 
	
	Data_Out1 <= registers(to_integer(unsigned(SR1)));
	Data_Out2 <= registers(to_integer(unsigned(SR2)));

	process (clk)
	begin
		if rising_edge(clk) then
			
			if (RegW = '1') then 
				
				registers(to_integer(unsigned(DR))) <= Reg_In(31 downto 0);
				
			end if; 
		end if; 
		
	end process;
	
end architecture arch;
				
				
			
