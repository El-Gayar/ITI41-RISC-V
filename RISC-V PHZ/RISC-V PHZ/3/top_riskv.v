`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:29 02/03/2021 
// Design Name: 
// Module Name:    top_riskv 
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
module top_riskv(
input clk,
input rst,
output [31:0] iadrr,
output [31:0]daddr,
output [31:0]data_out,
input [31:0] mem_data,
input [31:0]instr_in,
output mem_en
    );
wire [31:0] alu_out,op_a,op_b,pc,pc_4,instr,imm,alu_in_a,alu_in_b,wb,mem_Out,dummy,ah_reg,bh_reg;
wire pc_sel,br_un,brlt,breq,reg_wn,mem_wr,b_sel,a_sel;
wire [1:0] wb_sel,alu_sel,imm_sel,b_h,a_h;
wire pc_stall;
reg [31:0] pc_d,instr_d,pc_x,instr_x,op_a_x,op_b_x,pc_m,instr_m,alu_out_m,op_b_m,instr_w,wb_w;

always@ (posedge(clk)or posedge(rst))
begin
if(rst)
begin
pc_d<=32'bx;
instr_d<=32'bx;
pc_x<=32'bx;
instr_x<=32'bx;
op_a_x<=32'bx;
op_b_x<=32'bx;
pc_m<=32'bx;
instr_m<=32'bx;
op_b_m<=32'bx;
alu_out_m<=32'bx;
instr_w<=32'bx;
wb_w<=32'bx;
end
else
	begin 
	pc_d<=pc;
	if (pc_stall)
	instr_d<=instr;
	else
	instr_d<=19;
	pc_x<=pc_d;
	instr_x<=instr_d;
	op_a_x<=op_a;
	op_b_x<=op_b;	
	pc_m<=pc_x;
	instr_m<=instr_x;
	op_b_m<=bh_reg;
	alu_out_m<=alu_out;
	instr_w<=instr_m;
	wb_w<=wb;

	end 
end
alu          alu1      (.alu_sel(alu_sel),.op1(alu_in_a),.op2(alu_in_b),.res(alu_out)); 
reg_file     registers (.clk(clk),.addr_a(instr_d[19:15]),.addr_b(instr_d[24:20]),.addr_d(instr_w[11:7]),.data_a(op_a),.data_b(op_b),.data_in(wb_w),.reg_wn(reg_wn));
pc_reg       prg_cntr  (.clk(clk),.rst(rst),.stall_sel(pc_stall),.alu_out(alu_out),.pc(pc),.pc_4(pc_4),.pc_sel(pc_sel));
control_unit cnt_unt   (.instr_m(instr_m),.instr_w(instr_w),.instr_x(instr_x),.eq_br(breq),.lt_br(brlt),.mem_rw(mem_wr),.pc_sel(pc_sel),.wb_sel(wb_sel),.reg_wn(reg_wn),.alu_sel(alu_sel),.br_un(br_un),.a_sel(a_sel),.b_sel(b_sel),.imm_sel(imm_sel));
in2_1mux     mux2_1    (.in0(ah_reg),.in1(pc_x),.sel(a_sel),.out(alu_in_a));
in2_1mux     mux2_2    (.in0(bh_reg),.in1(imm),.sel(b_sel),.out(alu_in_b));

in4_1mux     mux4_1    (.in0(mem_data),.in1(alu_out_m),.in2(pc_m+4),.in3(pc_m+4),.sel(wb_sel),.out(wb));
hazard_unit  hz_unt    (.clk(clk),.instr_x(instr_x),.instr(instr),.instr_d(instr_d),.a_sel_h(a_h),.b_sel_h(b_h),.pc_stall_sel(pc_stall));
branch_comp  br_cmp    (.c_s_un(br_un),.op1(ah_reg),.op2(bh_reg),.eq_flag(breq),.lt_flag(brlt));
imm_gen      imm_gen1  (.instr(instr_x[31:7]),.imm(imm),.imm_sel(imm_sel));
in4_1mux     mux4_h1    (.in0(op_a_x),.in1(alu_out_m),.in2(wb_w),.in3(wb_w),.sel(a_h),.out(ah_reg));
in4_1mux     mux4_h2    (.in0(op_b_x),.in1(alu_out_m),.in2(wb_w),.in3(wb_w),.sel(b_h),.out(bh_reg));

assign iadrr=pc;
assign daddr=alu_out_m;
assign data_out=op_b_m;
//assign mem_out=mem_data;
assign instr=instr_in;
assign mem_en=mem_wr;
endmodule
