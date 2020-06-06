`timescale 1ns/1ps 

module testbench() ;
	reg in ; 
	reg clk ; 
	reg rst ; 
	output out ; 

	flip_flop dut(.d(in) , .clk(clk) , .q(out) , .clr(rst)) ; 

	initial begin 
		clk = 0 ; 
			forever #10 clk = ~clk ; 
	end 

	initial begin
		$dumpfile ("flip_flop_out.vcd"); 
		$dumpvars(0, testbench);
		$monitor($time , "  in = %b , clk = %b , rst = %b , out = %b " , in , clk , rst , out) ; 

		#20 in =0 ; rst = 0 ; 
		#20 in =1 ; 
		#20 in = 0 ; 
		#20 in = 1 ; rst =0 ; 
		#10 in = 1 ; rst = 1 ;

		#10 $finish ; 
	end 
endmodule