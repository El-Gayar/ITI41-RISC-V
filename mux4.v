`timescale 1ns / 1ps

module mux4(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [1:0] wbsel,
    output reg [31:0] out
    );

	always @(*)
		case (wbsel)
			2'b00: out = in0;
			2'b01: out = in1;
			2'b10: out = in2;
			default : out = 32'bx;
		endcase
endmodule
