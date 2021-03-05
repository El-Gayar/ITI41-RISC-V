`timescale 1ns / 1ps

module risc_v_tb;

	// Inputs
	reg clk;
	reg rst;
	wire [31:0] instr;
	wire [31:0] datar;

	// Outputs
	wire memrw;
	wire [7:0] addri;
	wire [7:0] addrd;
	wire [31:0] dataw;

	// Instantiate the Unit Under Test (UUT)
	risc_v uut (
		.clk(clk), 
		.rst(rst),  
		.instr(instr), 
		.datar(datar), 
		.memrw(memrw), 
		.addri(addri), 
		.addrd(addrd), 
		.dataw(dataw)
	);
	
 dmem dmem_tb(
    .addr(addrd),
    .dataw(dataw),
    .memrw(memrw),
    .datar(datar),
    .clk(clk)
    );
	 
 imem imem_tb(
	 .addr(addri),
    .instr(instr)
    );
	 
	initial 
		begin
			clk = 0;
			rst = 1;
			#1000
			rst = 0;
		end
	
	always
		begin
			#500 clk=~clk;
      end
endmodule

