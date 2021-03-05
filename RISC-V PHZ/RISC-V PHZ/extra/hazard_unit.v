`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:17 02/08/2021 
// Design Name: 
// Module Name:    hazard_unit 
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
module hazard_unit(

    input [31:0] instr,
	 input clk,
	 input pc_sel,
	 input reg_wn,
	 input mem_we,
	 input [31:0] instr_x,
	 input [31:0] instr_d,
	 output reg_wn_out,
	 output mem_we_out,
    output reg [1:0] a_sel_h,
	 output reg pc_stall_sel,
    output reg [1:0] b_sel_h
    );
reg  [1:0] a1,b1,a2,b2;
reg pc1,pc2,pc3,pc4;
always @*
begin
pc_stall_sel=1; 
if ((instr[19:15]==instr_d[11:7])&&instr[19:15]!=5'b00000&&(pc1==0) )
begin
a1=2'b01;
pc_stall_sel=instr_d[4]|instr_d[4]|(!instr_d[1]);
end
else if ((instr[19:15]==instr_x[11:7])&&instr[19:15]!=5'b00000&&(pc1==0)&&(pc2==0) )
a1=2'b10;
else
a1=2'b00;



if (instr[24:20]==instr_d[11:7]&&instr[24:20]!=5'b00000&&(pc1==0))
begin 
b1=2'b01;
pc_stall_sel=instr_d[5]|instr_d[4]|(!instr_d[1]);
end
else if ((instr[24:20]==instr_x[11:7])&&instr[24:20]!=5'b00000&&(pc1==0)&&(pc2==0))
b1=2'b10;
else
b1=2'b00;




end
always @ (posedge clk)
begin 
a2<=a1;
b2<=b1;
a_sel_h<=a2;
b_sel_h<=b2;
pc1<=pc_sel;
pc2<=pc1;
pc3<=pc2;
pc4<=pc3;
end 
assign mem_we_out=mem_we| !(pc2|pc3);
assign reg_wn_out=reg_wn| !(pc4|pc3);
endmodule
