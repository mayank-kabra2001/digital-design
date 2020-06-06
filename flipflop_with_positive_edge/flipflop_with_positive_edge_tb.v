`timescale 1ns/1ps 

module testbench() ;
	reg in ; 
	reg clk ; 
	output out ; 

	flip_flop dut(.d(in) , .clk(clk) , .q(out)) ; 

	initial begin 
		clk = 0 ; 
			forever #10 clk = ~clk ; 
	end 

	initial begin
		$dumpfile ("flip_flop_out.vcd"); 
		$dumpvars(0, testbench);
		$monitor($time , "  in = %b , clk = %b , out = %b " , in , clk , out) ; 

		#10 in = 0 ; 
		#10 in = 1 ; 
		#10 in = 1 ; 
		#10 in = 1 ; 
		#10 in = 0 ; 

		#10 $finish ;

	end 
endmodule

		
