module flip_flop(clk , d, q, clr) ;
	input clk , d, clr; 
	output reg q; 

	always @(posedge clk )

	begin
		if(clr)
			q <= 1'b0 ;
		else
			q <= d; 

	end 
endmodule 

// for asynchronous use always @(posedge clk or posedge clr) .
// in testbench write similar thing for clr as clk .
