module test_parity() ; 
	reg clk , x ; 
	wire z ; 
	parity_gen PAR (x , clk ,z) ; 
	initial 
		begin 
			$dumpfile ("parity_out.out") ; 
			$dumpvars (0 , test_parity) ;
			clk = 1'b0 ; 
		end 

	always #5 clk = ~clk ; 

	initial 
		begin 
			$monitor ($time , " clk = %b , x = %b , z = %b  " ,clk , x, z) ;
			#2 x =0 ; #10 x=1 ; #10 x = 1 ; #10 x =1 ; 
			#10 x =0 ; #10 x=1 ; #10 x=1 ; #10 x= 0 ;
			#10 x =0 ; #10 x=1 ; #10 x=1 ; #10 x= 0 ;
			#10 $finish ; 
		end 
endmodule   