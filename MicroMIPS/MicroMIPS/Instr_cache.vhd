library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Instr_cache is
  port(ADDR: in unsigned(31 downto 0); outp: out unsigned(31 downto 0));
end Instr_cache;

architecture Internal of Instr_cache is
  type RAMtype is array (0 to 127) of unsigned(7 downto 0);
  signal RAM1: RAMtype := (others => (others => '0'));
begin

-- store instruction (0) + (1) -> (2) 
RAM1(23) <= "10101100";-- op code 
RAM1(22) <= "00000001";-- rs 
RAM1(21) <= "00000000";-- rt 
RAM1(20) <= "00000001";-- storing the value 7 in register 1 


-- and immidiate 
 RAM1(19) <= "00110000";-- op code 
RAM1(18) <= "00000001";-- rs 
RAM1(17) <= "00000000";-- rt 
RAM1(16) <= "00000001";-- storing the value 7 in register 1  


-- xor instruction (0) U (1) -> (2)
RAM1(15) <= "00000000"; -- first 6 bits is op
RAM1(14) <= "00100010"; -- next 5 bits are rs 
RAM1(13) <= "00011000"; -- next 5 bits are rt 
RAM1(12) <= "00100110"; -- next 5 bits are rd 

-- load word (imm + (0)) ->(2)
RAM1(11) <= "10001100";-- op code 
RAM1(10) <= "00000010";-- rs 
RAM1(9) <= "00000000";-- rt 
RAM1(8) <= "00000010";-- instruction function 

-- load word (imm + (0)) ->(2)
RAM1(7) <= "10001100";-- op code 
RAM1(6) <= "00000001";-- rs 
RAM1(5) <= "00000000";-- rt 
RAM1(4) <= "00000001";-- instruction function 

outp(7 downto 0) <= RAM1(to_integer(ADDR(6 downto 0)));
outp(15 downto 8) <= RAM1(to_integer(ADDR(6 downto 0))+1);
outp(23 downto 16) <= RAM1(to_integer(ADDR(6 downto 0))+2);
outp(31 downto 24) <= RAM1(to_integer(ADDR(6 downto 0))+3); 
end Internal;