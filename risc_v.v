`timescale 1ns / 1ps

module risc_v(
    input clk,
    input rst,
    input [31:0] instr,
    input [31:0] datar,
    output memrw,
	 output [7:0] addri,
	 output [7:0] addrd,
	 output [31:0] dataw
	 
    );
	 
 wire [31:0] pc4;	 
 wire [31:0] aluout;	 
 wire [31:0] pcout;	 
 wire [31:0] pcin;	 
 wire [31:0] imm;	 
 wire [31:0] dataa;	 
 wire [31:0] datab;	 
 wire [31:0] aluin0;	 
 wire [31:0] aluin1;	 
 wire [31:0] datad;
 wire [3:0]  alusel;
 wire [2:0]  immsel;
 wire [1:0]  wbsel;
 wire pcsel;
 wire breq;
 wire asel;
 wire bsel;
		assign addri = pcout[9:2];
		assign addrd = aluout[7:0];
		assign dataw = datab;
 mux mux_1(.in0(pc4),.in1(aluout),.sel(pcsel),.out(pcin));
 pc pc_1(.clk(clk),.rst(rst),.pcin(pcin),.pcout(pcout));
 adder adder_inst(.in_a(32'b0100),.in_b(pcout),.sum(pc4));
 regf regf_1(.clk(clk),.datad(datad),.addrd(instr[11:7]),.addra(instr[19:15]),.addrb(instr[24:20]),.regwn(regwn),.dataa(dataa),.datab(datab));
 immgen immgen_int(.instr(instr),.immsel(immsel),.imm(imm));
 branchcomp branchcomp_inst(.ina(dataa),.inb(datab),.breq(breq));
 mux mux_2(.in0(dataa),.in1(pcout),.sel(asel),.out(aluin0));
 mux mux_3(.in0(datab),.in1(imm),.sel(bsel),.out(aluin1)); 
 alu alu_inst(.ina(aluin0),.inb(aluin1),.alusel(alusel),.aluout(aluout));	 
 mux4 mux4_1(.in0(datar),.in1(aluout),.in2(pc4),.wbsel(wbsel),.out(datad));
 Control_Logic crtl(.instr(instr),.breq(breq),.pcsel(pcsel),.immsel(immsel),.regwen(regwn),.asel(asel),.bsel(bsel),.alusel(alusel),.memrw(memrw),.wbsel(wbsel));

endmodule
