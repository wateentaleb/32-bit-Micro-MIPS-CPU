# 32-bit MicroMIPS CPU
The project objective is to build a Single Cycle MicroMIPS CPU using VHDL and the Intel DE2–115 Board for simulation 
The MicroMIPS architecture is shown in the figure below: 
<img width="1135" alt="cpu-architecture" src="https://user-images.githubusercontent.com/16707828/74690058-9a683700-51ab-11ea-8807-7dc56ffaca1a.png">


## ALU 

The objective is to design and develop an ALU using the DE2-115 development board. The ALU subsystem performs all the arithmetic and logical. The ALU takes two thirty two bit inputs (X[31...0] and Y[31...0]) and performs an arithmetic operation on them based on the value of the Control signals. The ALU drives the two outputs S[31...0]and Ovfl based on the results of the arithmetic operation.

<img width="435" alt="ALU" src="https://user-images.githubusercontent.com/16707828/74689391-f2ea0500-51a8-11ea-9d2e-07e550789890.png">

### `Architecture`
The architecture of ALU is shown in the figure below. It has two main blocks, logic Unit and Adder. If Add’Sub signal is set to 1, the adder block perform the subtraction. The logic unit is controlled by two bit control signals which defined in the figure below. And the two bits function class’s signal show which signal should drives to the output of ALU.

<img width="920" alt="ALU-architecture" src="https://user-images.githubusercontent.com/16707828/74689494-5ecc6d80-51a9-11ea-954c-3c6ec01fa913.png">

### `Implementation`

The input data (X and Y) will be entered using the first 16 switches (SW15 downto SW0). Due to the limited amount of switches available on the DE2–115,each input to the ALU has to be entered separately and stored in two 16 bit registers. A clock signal and an enable pin are required for the registers. The registers are loaded with the 16 bit value when a push button is pressed ( i.e., set the 16 switches to the number you want than press the appropriate push button to store the data). It should be noted that the push buttons are active low therefore it's important to make sure the enable pin on the registers are active low aswell.Use button KEY0 and KEY1 to load the registers connected to SA and button KEY2 and KEY3 to load the registers connected to SB.

### `Displaying the Result and Register Values`

The outputs of the ALU (R[31..0]) and registers (SA[31..0], SB[31..0]) are to be displayed on the eight Hex displays: HEX7, HEX6, ..... and HEX0. The most significant nibble (4bits) is assigned to HEX7, and then work your way down so the least significant nibble is assigned to HEX0. The switches SW17 and SW16 are used to determine which output is to be displayed. Where 00 shows the result of the ALU, 01 shows what is in register A, and 10 shows what is in register B.

<img width="842" alt="board" src="https://user-images.githubusercontent.com/16707828/74689857-c33bfc80-51aa-11ea-88bb-2f20b7e6b16b.png">

## Data Cache
It consists of 128 memory locations, each location has 32 bits.

**Input and Output Requirements:** 
1. DATA_IN[31..0]: a write port which is a 32-bit input.
2. DATA_OUT[31..0]: a read port which is a 32-bit output.
3. ADDR[31..0]: an input which is a memory address for the input port DATA_IN[31..0]:
4. CS: a chip select input.
5. WE: a write enable input.
6. OE: a read enable input.

<img width="1165" alt="cache" src="https://user-images.githubusercontent.com/16707828/74689966-39406380-51ab-11ea-953e-78f9bcfa6ba0.png">

## Instruction Cache
It consists of 128 memory locations, each location has 8 bits.
**Input and Output Requirements:** 
1. ADDR [31..0]: a write port which is a 32-bit input.(Since it only has 128 locations, only 7 LSB of ADDR[31..0] are used)
2. Instruction [31..0]: a read port which is a 32-bit output.

## Next-Address Block:
This section is devoted to the design of the next-address block that is shown in the figure below. The output of this block is loaded into the program counter, it is derived in one of five ways mentioned below:
<img width="1157" alt="next-address-table" src="https://user-images.githubusercontent.com/16707828/74690134-d7ccc480-51ab-11ea-86a3-26868ff7b813.png">
**Next Address Architecture** 
<img width="1105" alt="next-address-architecture" src="https://user-images.githubusercontent.com/16707828/74690157-eb782b00-51ab-11ea-84b5-e6f1b1a5abdf.png">

**Input and Output Requirements:** 
1. rt[31...0] and rs[31..0] : two input ports which go to Branch Condition Checker .
2. PC[31..2]: is the upper 30 bits of program counter which is the part of PC that is modified by this block
3. BrType [1..0]: the control input for Branch Condition checker (its operation table is shown below )
4. BPCSrc [1..0]: the control input direct the multiplexer at the left edge of Fig 1 to send one of its 4 input to be written into the upper 30 bits of PC .
5. NextPC[30..0]: an output to be written at the upper 30 bits of program counter which is part of PC. (The LSBs of the program counter are always set to 0)
6. IncrPC[30..0]: an output to be (PC)31:2 + 1
7. SE: is the sign extention block which convert Imm[15..0] to 30 bit signal.
8. SysCallAddr: is a known constant associated with the location of an operating system routine.
<img width="489" alt="brtable" src="https://user-images.githubusercontent.com/16707828/74690198-1b273300-51ac-11ea-94a3-e2292ca2fd12.png">

## Control Unit 
In this section,Control Unit of MicroMIPS CPU is designed using VHDL. The table below shows the inputs to the Control Unit and the corresponding outputs of control signals for each of the MicroMIPS instructions. 
<img width="690" alt="control-unit-table" src="https://user-images.githubusercontent.com/16707828/74690265-6b9e9080-51ac-11ea-9b90-863384197d2a.png">
