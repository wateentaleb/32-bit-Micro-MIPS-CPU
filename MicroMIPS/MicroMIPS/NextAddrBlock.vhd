library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NextAddrBlock is
	port(
			rt, rs : in unsigned(31 downto 0);
			PC : in unsigned(29 downto 0);
			jta : in unsigned(25 downto 0);
			SysCallAddr : in unsigned(29 downto 0);
			PCSrc : in unsigned(1 downto 0);
			BrType : in unsigned(1 downto 0);
			IncrPC, NextPC : out unsigned(31 downto 0)
	);
end NextAddrBlock;

architecture arch of NextAddrBlock is
signal IncrPCInternal: unsigned (29 downto 0);
begin
	IncrPC <= IncrPCInternal & "00";

	process(BrType, rs, rt, pc)
	begin
		if (brtype = "01") then
			if rs = rt then IncrPCInternal <= (pc + 1 + to_integer(jta(15 downto 0)));
			else IncrPCInternal <= (pc + 1);
			end if;
		elsif (brtype = "10") then
			if rs /= rt then IncrPCInternal <= (pc + 1 - to_integer(jta(15 downto 0)) - to_integer(jta(15 downto 0)) - to_integer(jta(15 downto 0)) - to_integer(jta(15 downto 0)));
			else IncrPCInternal <= (pc + 1);
			end if;
		elsif (brtype = "11") then
			if rs < 0 then IncrPCInternal <= (pc + 1 + to_integer(jta(15 downto 0)));
			else IncrPCInternal <= (pc + 1);
			end if;
		else
			IncrPCInternal <= (pc + 1);
		end if;
	end process;

	with pcsrc select nextPC <=
		incrPCInternal & "00" when "00",
		incrPCInternal(29 downto 26) & jta & "00" when "01",
		rs(31 downto 2) & "00" when "10",
		sysCallAddr & "00" when "11";

end arch;