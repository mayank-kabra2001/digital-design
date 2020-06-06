module ALU_4_bit(f , a, b , op) ;
	input [1:0] op ; 
	input [7:0] a , b ;
	output reg [7:0] f  ; 

	parameter ADD = 2'b00 , SUB = 2'b01 , MUL = 2'b10 , DIV = 2'b11

	always @(*)

		case(op)
			ADD : f = a + b ; 
			SUB : f = a - b ; 
			MUL : f = a * b ; 
			DIV : f = a / b ; 
		endcase 
endmodule 

// another ALU example with enable feature .. 

module alu_example(alu_out , a , b , op , en)
	input [2:0] op ; 
	input [7:0] a, b ; 
	input en ; 
	output [7:0] alu_out ; 
	output [7:0] alu_reg ; 

	assign alu_out = (en == 1) ? alu_reg : 4'bzzzz ; 
	always @(*)
		case(op)
			