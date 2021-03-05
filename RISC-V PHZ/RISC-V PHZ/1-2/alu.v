`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:01 02/01/2021 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] op1,
    input [31:0] op2,
    output [31:0] res,
    input [1:0] alu_sel
    );
	 reg [31:0] res_reg;
	 always @*
	 begin
	 case (alu_sel)
	 2'b00:
 	 res_reg=op1+op2;
	 2'b01:
	 begin
	 res_reg=op1-op2;
	 end
	 2'b10:
	 res_reg=op1|op2;
	 2'b11:
	 res_reg=op1&op2;
	 endcase
	 end
	 assign #200 res= res_reg;
	 endmodule
