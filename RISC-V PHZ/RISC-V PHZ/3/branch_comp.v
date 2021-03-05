`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:21 02/01/2021 
// Design Name: 
// Module Name:    branch_comp 
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
module branch_comp(
    input [31:0] op1,
    input [31:0] op2,
    input c_s_un,
    output eq_flag,
    output lt_flag
    );
	 
	 

assign lt_flag = c_s_un? op1<op2:($signed(op1) < $signed(op2));
assign eq_flag= (op1==op2)? 1'b1:1'b00; 
endmodule
