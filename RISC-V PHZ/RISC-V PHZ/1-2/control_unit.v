`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:32 02/01/2021 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(
	 input [31:0] instr_w,
	 input [31:0] instr_m,
    input [31:0] instr_x,
    input eq_br,
    input lt_br,
    output [1:0] wb_sel,
    output pc_sel,
    output mem_rw,
    output reg_wn,
    output br_un,
    output [1:0] alu_sel,
    output b_sel,
    output a_sel,
    output [1:0] imm_sel
    );
	 assign a_sel =instr_x[6]^instr_x[3]^instr_x[2];
	 assign b_sel =! (instr_x[5]&instr_x[4]);
	 assign alu_sel[1]= (instr_x[13]&instr_x[14])&(instr_x[4]);
	 assign alu_sel[0]= ((instr_x[30]&instr_x[5])|instr_x[12])&(instr_x[4]);
	 assign mem_rw =(!instr_m[6])&(!instr_m[4])&instr_m[5];
	 assign reg_wn= (instr_w[2]|instr_w[3]|instr_w[4]|(!instr_w[5]));
    assign pc_sel=instr_x[6]&(instr_x[2]|((instr_x[12]^eq_br)|(instr_x[14]&lt_br)));
	 assign imm_sel[0]=(!instr_x[6])&instr_x[5]+instr_x[3];
    assign imm_sel[1]=(!instr_x[2])&instr_x[5];
	 assign br_un = instr_x[13];
	 assign wb_sel[1]=instr_m[6];
	 assign wb_sel[0]=instr_m[4];



	 

endmodule
