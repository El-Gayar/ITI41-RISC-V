`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:08:12 02/01/2021 
// Design Name: 
// Module Name:    pc_reg 
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
module pc_reg(
    input [31:0] alu_out,
    input clk,
    input rst,
    output [31:0] pc,
    output [31:0] pc_4,
    input pc_sel
    );
	reg [31:0]pc_reg;
assign pc_4=pc+4;
always @(posedge(clk) or posedge(rst))
begin 
if (rst)
pc_reg<=0;
else 
begin 
if (pc_sel)
pc_reg<=alu_out;
else 
pc_reg<=pc_4;
end 
end
assign pc[31:2]= pc_reg[31:2];
assign pc[1:0]= 2'b0;
endmodule
