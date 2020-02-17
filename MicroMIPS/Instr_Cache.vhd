library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Instr_cache is
  port(
       ADDR: in unsigned(31 downto 0);
       outp: out unsigned(31 downto 0));
end Instr_cache;

architecture Internal of Instr_cache is
  type RAMtype is array (0 to 127) of unsigned(7 downto 0);
  signal RAM1: RAMtype := (others => (others => '0'));
 
begin
outp(7 downto 0) <= RAM1(to_integer(ADDR(6 downto 0)));
outp(15 downto 8) <= RAM1(to_integer(ADDR(6 downto 0))+1);
outp(23 downto 16) <= RAM1(to_integer(ADDR(6 downto 0))+2);
outp(31 downto 24) <= RAM1(to_integer(ADDR(6 downto 0))+3); 
end Internal;