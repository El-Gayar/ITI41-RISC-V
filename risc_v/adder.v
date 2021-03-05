`timescale 1ns / 1ps

module adder(
    input [31:0] in_a,
    input [31:0] in_b,
    output [31:0] sum
    );

	assign sum = in_a + in_b;

endmodule
