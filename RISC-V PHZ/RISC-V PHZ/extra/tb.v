`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:14:01 02/03/2021
// Design Name:   top_riskv
// Module Name:   G:/ise/risc-v/tb.v
// Project Name:  risc-v
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_riskv
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg clk;
	reg rst;
	wire[31:0] mem_data;
	wire [31:0] instr_in;

	// Outputs
	wire [31:0] iadrr;
	wire [31:0] daddr;
	wire [31:0] data_out;
	wire mem_en;

	// Instantiate the Unit Under Test (UUT)
	top_riskv uut (
		.clk(clk), 
		.rst(rst), 
		.iadrr(iadrr), 
		.daddr(daddr), 
		.data_out(data_out), 
		.mem_data(mem_data), 
		.instr_in(instr_in), 
		.mem_en(mem_en)
	);
   imem memi (
	.addr(iadrr),
	.instr(instr_in)
	);
	dmem memd(
	.clk(clk), 
	.data_in(data_out),
	.data_out(mem_data),
	.memwr(mem_en),
	.addr(daddr)
	
	);
	initial begin
		// Initialize Inputs
	
		rst = 1;
		
		// Wait 100 ns for global reset to finish
		#2000;
        
		 rst = 0;
		// Add stimulus here

	end
	always 
	begin 
	clk=0;
	#500;
	clk=1;
	#500;
	
	end
      
endmodule

