module gcd_compilation_tb () ; 
	reg clk  , start ;   
	reg [15:0] data_in ;  
	wire done ;

	reg [15:0] A , B; 

	gcd_data_path DP (gt , lt , eq , ldA, ldB , sel1 , sel2 , sel_in , data_in , clk) ; 		
	controller CONT (ldA , ldB , sel1 , sel2 , sel_in , done , clk , lt , gt , eq ,start) ;

	initial 
		begin 
			clk = 1'b0 ; 
			#3 start = 1'b1 ; 
			#1000 $finish ; 
		end 

	always #5 clk = ~clk ; 

	initial 
		begin 
			#12 data_in = 143 ; 
			#10 data_in = 78 ; 
		end 

	initial 
		begin 
			$monitor($time  , " %d %b" , DP.Aout , done ) ; 
			$dumpfile ("gcd_out.out") ; 
			$dumpvars (0 , gcd_compilation_tb) ; 
		end
endmodule