`timescale 1ns / 1ps

module branchcomp(
    input [31:0] ina,
    input [31:0] inb,
    output reg breq
    );
	
	always @(*)
		if (ina == inb)
			begin
				breq = 1'b1;
			end
		else
			begin
				breq = 1'b0;
			end
endmodule
