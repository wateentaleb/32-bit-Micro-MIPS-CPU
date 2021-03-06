library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registerfile is 
	port (RegW: in std_logic; DR, SR1, SR2 : in integer range 0 to 31; Reg_In : in unsigned(31 downto 0); Data_Out1, Data_Out2, Reg2Viewer : out unsigned(31 downto 0));
end entity registerfile;

architecture arch of registerfile is 
--	signal reg0 : unsigned(31 downto 0) := "00000000000000000000000000101001";
--	signal reg1 : unsigned(31 downto 0) := "00000000000000000000000000100001";
	signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31 : unsigned(31 downto 0);
begin
--
--	Reg2Viewer <= reg2;

--SR1 IS RT 
	with SR1 select Data_Out1 <=
		reg0 when 0,
		reg1 when 1,
		reg2 when 2,
		reg3 when 3,
		reg4 when 4,
		reg5 when 5,
		reg6 when 6,
		reg7 when 7,
		reg8 when 8,
		reg9 when 9,
		reg10 when 10,
		reg11 when 11,
		reg12 when 12,
		reg13 when 13,
		reg14 when 14,
		reg15 when 15,
		reg16 when 16,
		reg17 when 17,
		reg18 when 18,
		reg19 when 19,
		reg20 when 20,
		reg21 when 21,
		reg22 when 22,
		reg23 when 23,
		reg24 when 24,
		reg25 when 25,
		reg26 when 26,
		reg27 when 27,
		reg28 when 28,
		reg29 when 29,
		reg30 when 30,
		reg31 when 31;

	with SR2 select Data_Out2 <=
		reg0 when 0,
		reg1 when 1,
		reg2 when 2,
		reg3 when 3,
		reg4 when 4,
		reg5 when 5,
		reg6 when 6,
		reg7 when 7,
		reg8 when 8,
		reg9 when 9,
		reg10 when 10,
		reg11 when 11,
		reg12 when 12,
		reg13 when 13,
		reg14 when 14,
		reg15 when 15,
		reg16 when 16,
		reg17 when 17,
		reg18 when 18,
		reg19 when 19,
		reg20 when 20,
		reg21 when 21,
		reg22 when 22,
		reg23 when 23,
		reg24 when 24,
		reg25 when 25,
		reg26 when 26,
		reg27 when 27,
		reg28 when 28,
		reg29 when 29,
		reg30 when 30,
		reg31 when 31;
--
--		with RegW select Reg2 <= 
--			Reg_In when '1',
--			to_unsigned(4294901760,32) when '0';
		
	process (Reg_In)
	begin
		if (Reg_In /= "00000000000000000000000000000000") then 
			case DR is
				when 0 => reg0 <= Reg_In;
				when 1 => reg1 <= Reg_In;
				when 2 => reg2 <= Reg_In;
				when 3 => reg3 <= Reg_In;
				when 4 => reg4 <= Reg_In;
				when 5 => reg5 <= Reg_In;
				when 6 => reg6 <= Reg_In;
				when 7 => reg7 <= Reg_In;
				when 8 => reg8 <= Reg_In;
				when 9 => reg9 <= Reg_In;
				when 10 => reg10 <= Reg_In;
				when 11 => reg11 <= Reg_In;
				when 12 => reg12 <= Reg_In;
				when 13 => reg13 <= Reg_In;
				when 14 => reg14 <= Reg_In;
				when 15 => reg15 <= Reg_In;
				when 16 => reg16 <= Reg_In;
				when 17 => reg17 <= Reg_In;
				when 18 => reg18 <= Reg_In;
				when 19 => reg19 <= Reg_In;
				when 20 => reg20 <= Reg_In;
				when 21 => reg21 <= Reg_In;
				when 22 => reg22 <= Reg_In;
				when 23 => reg23 <= Reg_In;
				when 24 => reg24 <= Reg_In;
				when 25 => reg25 <= Reg_In;
				when 26 => reg26 <= Reg_In;
				when 27 => reg27 <= Reg_In;
				when 28 => reg28 <= Reg_In;
				when 29 => reg29 <= Reg_In;
				when 30 => reg30 <= Reg_In;
				when 31 => reg31 <= Reg_In;
			end case;
		end if;
	end process;


end architecture arch;
