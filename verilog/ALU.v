`define AND 4'b0000 //0
`define OR 4'b0001 //1
`define EOR 4'b0010 //2
`define ADD 4'b0100 //4
`define SUB 4'b0101 //5
`define LSL 4'b0110 //6
`define LSR 4'b0111 //7
`define B 3'b000 //8
`define BL 3'b001 //9
`define CBZ 3'b010 //A
`define CBNZ 3'b011 //B
`define passB 4'b1111 //F

module ALU(busA, busB, ALUop, result, branch);

	output [15:0] result;
	output branch;
	input [15:0] busA;
	input [15:0] busB;
	input [3:0] ALUop;
	reg [15:0] result;
	reg branchR;

	// result block
	always @(ALUop or busA or busB) begin
		case(ALUop)
			`AND: result <= busA & busB;
			`OR: result <= busA | busB;
			`EOR: result <= busA ^ busB;
			`ADD: result <= busA + busB;
			`SUB: result <= busA - busB;
			`LSL: result <= busA << busB;
			`LSR: result <= busA >> busB;
			`passB: result <= busB;
			default: result <= 15'b0;
		endcase
	end

	// branch determination
	always @(ALUop or busA or busB) begin
		case(ALUop[2:0])
			`B: branchR <= 1;
			`BL: branchR <= 1;
			`CBZ: branchR <= (busB == 0);
			`CBNZ: branchR <= !(busB == 0);
			default: branchR <= 0;
		endcase
	end

	assign branch = ALUop[3] & branchR;

endmodule
