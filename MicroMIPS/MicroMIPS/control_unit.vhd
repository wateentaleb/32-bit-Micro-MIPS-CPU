library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity control is
	port (
		opcode: in std_logic_vector(5 downto 0);
		reg_dest,jump, branch, DataRead, mem_to_reg, DataWrite, alu_src, RegWrite: out std_logic;
		alu_op: out std_logic_vector(1 downto 0)
	);
end control;

architecture beh of control is
	begin

	-- The consequences of vhdl syntax 
	--				           R-types				        addi				           beq                            bne                            jump                           lw                               sw
	RegDest <= 	'1' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="000100"  else '0' when opcode="000101"  else '0' when opcode="000010"  else '0' when opcode="100011"  else '0' when opcode="101011"  else '0';
	jump <=			'0' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="000100"  else '0' when opcode="000101"  else '1' when opcode="000010"  else '0' when opcode="100011"  else '0' when opcode="101011"  else '0';
	branch <=		'0' when opcode="000000"  else '0' when opcode="001000"  else '1' when opcode="000100"  else '1' when opcode="000101"  else '0' when opcode="000010"  else '0' when opcode="100011"  else '0' when opcode="101011"  else '0';
	DataRead <=		'0' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="000100"  else '0' when opcode="000101"  else '0' when opcode="000010"  else '1' when opcode="100011"  else '0' when opcode="101011"  else '0';
	mem_to_reg <= 	'0' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="000100"  else '0' when opcode="000101"  else '0' when opcode="000010"  else '1' when opcode="100011"  else '0' when opcode="101011"  else '0';
	DataWrite <= 	'0' when opcode="000000"  else '0' when opcode="001000"  else '0' when opcode="000100"  else '0' when opcode="000101"  else '0' when opcode="000010"  else '0' when opcode="100011"  else '1' when opcode="101011"  else '0';
	alu_src <= 		'0' when opcode="000000"  else '1' when opcode="001000"  else '0' when opcode="000100"  else '0' when opcode="000101"  else '0' when opcode="000010"  else '1' when opcode="100011"  else '1' when opcode="101011"  else '0';
	RegWrite <= 	'1' when opcode="000000"  else '1' when opcode="001000"  else '0' when opcode="000100"  else '0' when opcode="000101"  else '0' when opcode="000010"  else '1' when opcode="100011"  else '0' when opcode="101011"  else '0';
	ALUSrc <= 		"10" when opcode="000000" else "00" when opcode="001000" else "01" when opcode="000100" else "11" when opcode="000101" else "00" when opcode="000010" else "00" when opcode="100011"  else "00" when opcode="101011"  else "00";
		
end beh;

-- find where to put ADDSUB 