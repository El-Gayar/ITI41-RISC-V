`timescale 1ns / 1ps

module imem(
    input [7:0] addr,
    output [31:0] instr
    );
	 
		reg [31:0] memi [255:0];
		initial
			begin
				$readmemh ("prog.txt",memi);
			end
				assign  instr = memi [addr];  
endmodule
