`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:22 02/02/2021 
// Design Name: 
// Module Name:    imm-gen 
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
module imm_gen(
    input [31:7] instr,
    input [1:0] imm_sel,
    output [31:0] imm
    );
   wire internal ;
 assign internal= imm_sel[1]?instr[7]:instr[20];	
 assign imm [10:5]=instr[30:25];
 assign imm [31:20]={12{instr[31]}};
 assign imm[4:1]= imm_sel[1]?instr[11:8]:instr[24:21];
 assign imm[19:12]= (imm_sel==2'b01)? instr[19:12]:{8{instr[31]}};
 assign imm[0]= (imm_sel[1]^ imm_sel[0])?1'b0:internal;
 assign imm[11]= (imm_sel[1]^ imm_sel[0])?internal:instr[31];
endmodule
