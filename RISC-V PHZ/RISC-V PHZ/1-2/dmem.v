`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:40 02/03/2021 
// Design Name: 
// Module Name:    dmem 
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
module dmem(
    input clk,
    input [31:0] data_in,
    input [31:0] addr,
    output [31:0] data_out,
    input memwr
    );
	 	 reg [31:0]mem[255:0];
assign #200 data_out = mem[addr[9:2]];
	 
	always @(posedge clk)
	begin 
	if (memwr)
	 mem[addr[9:2]]<=data_in;
	end


endmodule
