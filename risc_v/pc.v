`timescale 1ns / 1ps

module pc(
    input clk,
    input rst,
    input [31:0] pcin,
    output reg [31:0] pcout
    );

	always @(posedge (rst) or posedge (clk))
			if (rst) pcout <= 0;
			else 		pcout <= pcin;
	
endmodule
