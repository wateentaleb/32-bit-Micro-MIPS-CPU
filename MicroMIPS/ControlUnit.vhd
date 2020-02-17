library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ControlUnit is
 port(op : in std_logic_vector (5 downto 0);
		fn : in std_logic_vector (5 downto 0);
		RegWrite : out std_logic;
		RegDst : out std_logic_vector (1 downto 0);
		DataRead : out std_logic;
		DataWrite : out std_logic;
		ALUSrc : out std_logic;
		Add_Sub: out std_logic;
		LogicFn: out std_logic_vector (1 downto 0);
		FnClass : out std_logic_vector (1 downto 0);
		BrType : out std_logic_vector (1 downto 0);
		RegInSrc : out std_logic_vector (1 downto 0);
		PCSrc : out std_logic_vector (1 downto 0));
end ControlUnit;
architecture Behavioral of ControlUnit is
begin
process(op,fn)
begin
case op is
	when "000000" =>
		case fn is
			when "100000" => -- Add
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= '0' ;
				LogicFn <= "XX";
				FnClass <= "10";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "100010" => --Subtract
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= '1' ;
				LogicFn <= "XX";
				FnClass <= "10";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "101010" => -- Set Less Than
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= '1' ;
				LogicFn <= "XX";
				FnClass <= "01";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "100100" => --And
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= 'X' ;
				LogicFn <= "00";
				FnClass <= "11";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "100101" => --OR
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= 'X' ;
				LogicFn <= "01";
				FnClass <= "11";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "100110" => --XOR
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= 'X' ;
				LogicFn <= "10";
				FnClass <= "11";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "100111" => -- NOR
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= 'X' ;
				LogicFn <= "11";
				FnClass <= "11";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "001000" => --Jump Register
				RegWrite <= '1';
				RegDst <= "01";
				RegInSrc <= "01";
				ALUSrc <= '0';
				Add_Sub <= '0' ;
				LogicFn <= "XX";
				FnClass <= "10";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
			when "001100" => --System Call
				RegWrite <= '1';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "XX";
				PCSrc <= "10";
			when others => --ALL OTHER CASES
				RegWrite <= 'X';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= 'X';
				DataWrite <= 'X';
				BrType <= "XX";
				PCSrc <= "XX";
		end case;
		
		when "001111" => --Load Upper Immediate
				RegWrite <= '1';
				RegDst <= "00";
				RegInSrc <= "01";
				ALUSrc <= '1';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "00";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
				
		when "001000" => -- Add Immediate
				RegWrite <= '1';
				RegDst <= "00";
				RegInSrc <= "01";
				ALUSrc <= '1';
				Add_Sub <= '0' ;
				LogicFn <= "XX";
				FnClass <= "10";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
				
		when "001010" => --Set Less Than Immediate
				RegWrite <= '1';
				RegDst <= "00";
				RegInSrc <= "01";
				ALUSrc <= '1';
				Add_Sub <= '1' ;
				LogicFn <= "XX";
				FnClass <= "01";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
				
		when "001100" => --AND Immediate
				RegWrite <= '1';
				RegDst <= "00";
				RegInSrc <= "01";
				ALUSrc <= '1';
				Add_Sub <= 'X' ;
				LogicFn <= "00";
				FnClass <= "11";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
				
		when "001101" => --OR Immediate
				RegWrite <= '1';
				RegDst <= "00";
				RegInSrc <= "01";
				ALUSrc <= '1';
				Add_Sub <= 'X' ;
				LogicFn <= "01";
				FnClass <= "11";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
				
		when "001110" => --XOR Immediate
				RegWrite <= '1';
				RegDst <= "00";
				RegInSrc <= "01";
				ALUSrc <= '1';
				Add_Sub <= 'X' ;
				LogicFn <= "10";
				FnClass <= "11";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
				
		when "100011" => --Load Word
				RegWrite <= '1';
				RegDst <= "00";
				RegInSrc <= "00";
				ALUSrc <= '1';
				Add_Sub <= '0' ;
				LogicFn <= "XX";
				FnClass <= "10";
				DataRead <= '1';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "00";
				
		when "101011" => --Store Word
				RegWrite <= '0';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= '1';
				Add_Sub <= '0' ;
				LogicFn <= "XX";
				FnClass <= "10";
				DataRead <= '0';
				DataWrite <= '1';
				BrType <= "00";
				PCSrc <= "00";
				
		when "000010" => --Jump
				RegWrite <= '0';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "XX";
				PCSrc <= "01";
				
		when "000001" => --Branch on Less Than 0
				RegWrite <= '0';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "11";
				PCSrc <= "00";
				
		when "000100" => --Branch on Equal
				RegWrite <= '0';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "01";
				PCSrc <= "00";
				
		when "000101" => --Branch on Not Equal
				RegWrite <= '0';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "10";
				PCSrc <= "00";
				
		when "000011" => -- Jump and Link
				RegWrite <= '1';
				RegDst <= "10";
				RegInSrc <= "10";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= '0';
				DataWrite <= '0';
				BrType <= "00";
				PCSrc <= "01";
		
		when others => --ALL OTHER CASES
				RegWrite <= 'X';
				RegDst <= "XX";
				RegInSrc <= "XX";
				ALUSrc <= 'X';
				Add_Sub <= 'X' ;
				LogicFn <= "XX";
				FnClass <= "XX";
				DataRead <= 'X';
				DataWrite <= 'X';
				BrType <= "XX";
				PCSrc <= "XX";
	end case;
end process;
end architecture Behavioral;
