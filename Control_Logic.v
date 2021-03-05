`timescale 1ns / 1ps

module Control_Logic(
    input [31:0] instr,
    input breq,
    //input brlt,
    output reg pcsel,
    output reg [2:0] immsel,
    output reg regwen,
    //output reg brun,
    output reg asel,
    output reg bsel,
    output reg [3:0] alusel,
    output reg memrw,
    output reg [1:0] wbsel
    );

	always @(*)
		
		case (instr[6:0])
			7'b0110011 : //ADD,SUB,AND,OR
				begin 
					pcsel  = 0;
					immsel = 3'b000;
					regwen = 1'b1;
					asel   = 1'b0;
					bsel   = 1'b0;
					alusel = {instr[30],instr[14:12]};
					memrw  = 1'b1;
					wbsel  = 2'b01;
				end
				
			7'b0010011 : //ADDI,ANDI,ORI
				begin 
					pcsel  = 1'b0;
					immsel = 3'b001;
					regwen = 1'b1;
					asel   = 1'b0;
					bsel   = 1'b1;
					memrw  = 1'b1;
					wbsel  = 2'b01;
					alusel = {1'b0,instr[14:12]};
				end
				
			7'b0000011 : //LW
				begin 
					pcsel  = 1'b0;
					immsel = 3'b001;
					regwen = 1'b1;
					asel   = 1'b0;
					bsel   = 1'b1;
					memrw  = 1'b1;
					wbsel  = 2'b00;
					alusel = 4'b0000;
				end
				
			7'b1100111 : //JALR
				begin 
					pcsel  = 1'b1;
					immsel = 3'b001;
					regwen = 1'b1;
					asel   = 1'b0;
					bsel   = 1'b1;
					memrw  = 1'b1;
					wbsel  = 2'b10;
					alusel = 4'b0000;
				end
			
			7'b1100011 : //BEQ
				begin 
					immsel = 3'b011;
					regwen = 1'b0;
					asel   = 1'b1;
					bsel   = 1'b1;
					memrw  = 1'b1;
					wbsel  = 1'bx;
					alusel = 4'b0000;
					if (breq == 1'b0) 
						pcsel = 1'b0;
					else 
						pcsel = 1'b1;
				end
				
			7'b1100011 : //BNE
				begin 
					pcsel  = 1'bx;
					immsel = 3'b011;
					regwen = 1'b0;
					asel   = 1'b1;
					bsel   = 1'b1;
					memrw  = 1'b1;
					wbsel  = 2'bxx;
					alusel = 4'b0000;
					if (breq == 1'b0) 
						pcsel = 1'b1;
					else 
						pcsel = 1'b0;
				end
			
			7'b1101111 : //JAL
				begin 
					pcsel  = 1'b1;
					immsel = 3'b100;
					regwen = 1'b1;
					asel   = 1'b1;
					bsel   = 1'b1;
					memrw  = 1'b1;
					wbsel  = 2'b10;
					alusel = 4'b0000;
				end
				
			7'b1100011 : //SW
				begin 
					pcsel  = 1'b0;
					immsel = 3'b010;
					regwen = 1'b0;
					asel   = 1'b0;
					bsel   = 1'b1;
					memrw  = 1'b0;
					wbsel  = 1'bx;
					alusel = 4'b0000;
				end
			default:
				begin 
					pcsel  = 1'b0;
					immsel = 3'bxxx;
					regwen = 1'bx;
					asel   = 1'bx;
					bsel   = 1'bx;
					alusel = 4'b0000;
					memrw  = 1'bx;
					wbsel  = 2'bxx;
				end
		endcase
endmodule
