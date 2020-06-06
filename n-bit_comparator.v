module compare(a , b , th , gt, eq) ; 
	parameter word_size = 16 ; 
	input [word_size - 1:0] a , b ; 
	output lt , gt , eq ; 
	always @(*)
		begin 
			gt = 0 ; lt = 0 ; eq = 0 ;
			
			if (a > b) gt = 1 ; 
			else if (a < b) lt = 1 ; 
			else eq = 1 
		end 
endmodule 