library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
  port(CLK: in std_logic;
           
       PC_In: in unsigned(31 downto 0);
       PC_out: out unsigned(31 downto 0));
end PC;

architecture Behavioral of PC is
  
begin
process(clk)
  begin
    if CLK = '1' and CLK'event then
        PC_out <= PC_In;
     
    end if;
  end process;
  
end Behavioral;

