`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:14:31 02/02/2021 
// Design Name: 
// Module Name:    in4_1mux 
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
module in4_1mux(
    input [31:0] in0,
	 input [31:0] in1,
	 input [31:0] in2,
	 input [31:0] in3,
    input [1:0] sel,
    output [31:0] out
    );
	 wire [31:0]out_0,out_1;
	 
  in2_1mux mux1(.in0(in0),.in1(in1),.sel(sel[0]),.out(out_0));
  in2_1mux mux2(.in0(in2),.in1(in3),.sel(sel[0]),.out(out_1));
  in2_1mux mux3(.in0(out_0),.in1(out_1),.sel(sel[1]),.out(out));
  

endmodule
