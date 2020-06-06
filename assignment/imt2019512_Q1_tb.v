`timescale 1ns/1ps 

module Q1_tb ; 
	reg inp , rst ; 
	reg clk ; 
	output out ; 

	state_machine DUT(.inp(inp) , .clk(clk) , .reset(rst) , .out(out)) ; 

	initial 
		clk =0 ;

	always #10 clk = ~clk ;  

	initial 
		begin
			$dumpfile ("Q1_out.vcd"); 
			$dumpvars(0, Q1_tb);
			$monitor($time , " clk = %b , rst = %b , inp = %b , out = %b " , clk , rst , inp , out) ; 

			#20 inp = 0 ; rst = 0 ; 
			#20 inp = 0 ;
			#20 inp = 1 ; 
			#20 inp = 1 ;  
			#20 inp = 0 ; 
			#20 inp = 1 ; rst = 1 ; 
			#10 inp = 1 ; 

			#10 $finish ; 
		end 
endmodule 

