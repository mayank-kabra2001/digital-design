// we will be using datapath and control using fsm 

module MUL_datapath (eqz , ldA , ldB , ldP , clrP , decB , data_in , clk) ; 
	input ldA , ldB , ldP , clrP , decB , clk ; 
	input [15:0] data_in ; 
	output eqz ; 
	wire [15:0] X , Y , Z , Bout , Bus ; 

	PIPO1 A (X+ , Bus , ldA , clk) ; 
	PIPO2 P (Y , z , ldP , clrP , clk ) ; 
	CNTR B (Bout , Bus , ldB , decB , clk) ; 
	ADD AD (Z , X  , Y) ; 
	EQZ COMP (eqz , Bout) ; 
endmodule 

// there will be two data input A amd B ; 

// this will take data from data_in and give the value of A ; 
module PIPO1 (dout , din , ld , clk) ;
	input [15:0] din ; 
	input ld , clk ; 
	output reg [15:0] dout ; 

	always @(posedge clk)
		if (ld) dout <= din ; 
endmodule

//this will take the data Z which the sum of added A sequentially B no of times ;
module PIPO2 (dout , din , ld, clr , clk) ;
	input [15:0] din ; 
	input ld , clr , clk  ;
	output reg [15:0] dout ; 

	always @(posedge clk)
		if(clr) dout <= 16'b0 ; 
		else if (ld) dout <= din ; 
endmodule 

// it is the adder module ; 

module ADD (out , in1 , in2) ;
	input [15:0] in1 , in2 ; 
	output reg [15:0] out ; 

	always @(*)
		out = in1 + in2 ; 
endmodule 

// it is the comparator module 

module EQZ (eqz , data) ;
	input [15:0] data ; 
	output eqz ; 

	assign eqz = (data == 0) ; 
endmodule 

// this is for B which will decreased until it becomes 0 and a will be added that no of times to itself .
module CNTR(dout , din , ld , dec , clk) ;
	input [15:0] din ;
	input clk , ld , dec ;
	output reg [15:0] dout ; 

	always @(posedge clk) 
		if (ld) dout <= din ; 
		else if (dec) dout <= dout - 1 ;
endmodule 
 
