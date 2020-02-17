# 32-bit MicroMIPS CPU

## ALU 

The objective is to design and develop an ALU using the DE2-115 development board. The ALU subsystem performs all the arithmetic and logical. The ALU takes two thirty two bit inputs (X[31...0] and Y[31...0]) and performs an arithmetic operation on them based on the value of the Control signals. The ALU drives the two outputs S[31...0]and Ovfl based on the results of the arithmetic operation.


Architecture
The architecture of ALU is shown in Fig2. It has two main blocks, logic Unit and Adder. If Add’Sub signal is set to 1, the adder block perform the subtraction. The logic unit is controlled by two bit control signals which defined in Fig2. And the two bits function class’s signal show which signal should drives to the output of ALU.

