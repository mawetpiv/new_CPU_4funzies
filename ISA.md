| Name		| Type		| Desc	     	  | Opcode	|
|:---------:|:---------:|:---------------:|:---------:|
|ADD        |R          |Rd = Rn + Rm     |458        |
|ADDI       |I          |Rd = Rn + Imm    |488-489    |
|AND        |R          |Rd = Rn & Rm     |450        |
|ANDI       |I          |Rd = Rn & Imm    |490-491    |
|B          |B          |PC = PC + b_addr |0A0-0BF    |
|BL         |B          |B, R30 = PC + 4  |4A0-4BF    |
|CBNZ       |CB         |if(Rt != 0) B    |5A8-5AF    |
|CBZ        |CB         |if(Rt == 0) B    |5A0-5A7    |
|EOR        |R          |Rd = Rn ^ Rm     |650        |
|EORI       |I          |Rd = Rn ^ Imm    |690-691    |
|LDUR       |D          |Rt = M[Rn + d_addr]|7C2      |
|LSL        |R          |Rd = Rn << shamt |69B        |
|LSR        |R          |Rd = Rn >> shamt |69A        |
|ORR        |R          |Rd = Rn \| Rm    |550        |
|ORRI       |I          |Rd = Rn \| Imm   |590-591    |
|STUR       |D          |M[Rn + d_addr] = Rt|7C0      |
|SUB        |R          |Rd = Rn - Rm     |658        |
|SUBI       |I          |Rd = Rn - Imm    |688-689    |


R |31   opcode  21|20   Rm  16|15   shamt   10|9    Rn  5|4 Rd  0|
I |31  opcode  22|21          Imm           10|9    Rn  5|4 Rd  0|
D |31   opcode  21|20     d_addr     12|11 op 10|9  Rn  5|4 Rd  0|
B |31   opcode  26|25   b_addr  0|
CB |31  opcode  24|23   b_addr  5|4 Rt  0|

|Reg    |Use    |
|:-----:|:-----:|
|X0-X27 |GPR    |
|X28    |SP (stack point)|
|X29    |FP (frame point)|
|X30    |Return Addr|
|X31    |0      |
