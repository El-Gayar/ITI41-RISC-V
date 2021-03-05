`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:46:43 02/01/2021 
// Design Name: 
// Module Name:    reg_file 
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
module reg_file(
    input clk ,
    input reg_wn,
    input [31:0] data_in ,
    input [4:0] addr_a,
    input [4:0] addr_b,
    input [4:0] addr_d,
    output [31:0] data_a,
    output [31:0] data_b
    );
	 reg [31:0] registers[31:0];
	 //reg [31:0] data_a_reg,data_b_reg;

 assign #100 data_a=(addr_a==0)?32'h00000000:registers[addr_a];
 assign #100 data_b=(addr_b==0)?32'h00000000:registers[addr_b];

 always @ (negedge(clk))
begin  
if (reg_wn) 
 #100 registers[addr_d] <=data_in;

 end
//assign date_a= (addr_a==0)?32'h00000000:data_a_reg;
//assign date_b= (addr_b==0)?32'h00000000:data_b_reg;
endmodule
