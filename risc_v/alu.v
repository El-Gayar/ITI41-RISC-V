`timescale 1ns / 1ps

module alu(
    input [31:0] ina,
    input [31:0] inb,
    input [3:0] alusel,
    output reg [31:0] aluout
    );

	always @(*)
		case (alusel)
			4'b0000: aluout = ina + inb;
			4'b1000: aluout = ina - inb;
			4'b0111: aluout = ina & inb;
			4'b0110: aluout = ina | inb;
			default: aluout = 32'bx;
		endcase
endmodule
