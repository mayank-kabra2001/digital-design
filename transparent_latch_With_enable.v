module latch (q , qbar , din , enable) ; 
	input din , enable ; 
	output reg q ; 
	output qbar ; 
	assign qbar = ~q ; 

	always @(din or enable)
	begin 
		if(enable) q = din 
	end
endmodule 

// ###########################
// or use this
// ###########################


// module latch (q , qbar , din , enable) ; 
// 	input din , enable ; 
// 	output reg q ; 
// 	output reg qbar ;

// 	always @(din or enable)
// 	begin 
// 		if(enable) q = din , qbar = ~din ; 
// 	end
// endmodule 
