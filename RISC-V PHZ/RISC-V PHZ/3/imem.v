`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:34 02/02/2021 
// Design Name: 
// Module Name:    imem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module imem(
    input [31:0] addr,
    output [31:0] instr
    );
	 reg [31:0]mem[255:0];
	 initial
	 begin
	 $readmemh ("prog.txt",mem);
	 end
	 
	 
assign #200 instr = mem[addr[9:2]];

endmodule
