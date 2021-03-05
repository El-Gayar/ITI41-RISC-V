`timescale 1ns / 1ps

module immgen(
    input [31:0] instr,
    input [2:0] immsel,
    output reg [31:0] imm
    );

always @ (*)	 
	case (immsel)
		3'b000: imm = 'b0;
		3'b001: imm = {{21{instr[31]}},instr[30:20]};
		3'b010: imm = {{21{instr[31]}},instr[30:25],instr[4:0]};
		3'b011: imm = {{20{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0};
		3'b100: imm = {{12{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0};
		default : imm = 32'bx;
	endcase

endmodule
