`timescale 1ns / 1ps

module regf(
    input clk,
    input [31:0] datad,
    input [4:0] addrd,
    input [4:0] addra,
    input [4:0] addrb,
    input regwn,
    output [31:0] dataa,
    output [31:0] datab
    );
	 
	reg [31:0] regf [31:0];
	assign dataa = addra?regf[addra]:0;
	assign datab = addrb?regf[addrb]:0;
	
	always @(posedge clk)
		if (regwn == 1'b1)
			regf[addrd] <= datad;
endmodule
