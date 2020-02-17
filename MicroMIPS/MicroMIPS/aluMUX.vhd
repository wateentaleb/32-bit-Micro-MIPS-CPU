library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity alumux is
	port(rt : in std_logic_vector(31 downto 0); imm : in std_logic_vector(15 downto 0); ALUSrc : in std_logic; ALUin : out std_logic_vector(31 downto 0));
end alumux;

architecture arch of alumux is
signal immSE : std_logic_vector(31 downto 0);
begin

immSE <= "0000000000000000" & imm;

with ALUSrc select ALUin <= 
	rt when '0',
	immSE when '1';
end arch;