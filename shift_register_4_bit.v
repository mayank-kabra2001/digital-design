//##############################
// using blocking assignments 
//################################

module shift_4_bit_register(clk , clr , a , e) ;
	input clk , clr , a ; 
	output reg e ; 
	reg b , c,  d ;  

	always @(posedge clk or negedge clr)
		begin 
			if(!clr) 
				begin
					b= 0 ; c =0 ; d =0  ;e =0  ;
				end 
			else
				begin 
					e = d ; 
					d = c ; 
					c = b ; 
					b = a ; 
				end 
		end 
endmodule 

// now suppose you change the order then it will not work as a shift register but as a single d flipflop 

// module shift_4_bit_register(clk , clr , a , e) ;
// 	input clk , clr , a ; 
// 	output reg e ; 
// 	reg b , c,  d ;  

// 	always @(posedge clk or negedge clr)
// 		begin 
// 			if(!clr) 
// 				begin
// 					b= 0 ; c =0 ; d =0  ;e =0  ;
// 				end 
// 			else
// 				begin 
// 					b = a ; 
// 					c = b ; 
// 					d = c ; 
// 					e = d ;
// 				end 
// 		end 
// endmodule 

// ##################################################
// using non blocking statement
// ##################################################

// so instead of this blocking statement use a non blocking statement and use in any order 

// module shift_4_bit_register(clk , clr , a , e) ; 
// 	input clk , clr , a ; 
// 	output reg e ; 
// 	reg b , c,  d ;  

// 	always @(posedge clk or negedge clr)
// 		begin 
// 			if(!clr) 
// 				begin
// 					b= 0 ; c =0 ; d =0  ;e =0  ;
// 				end 
// 			else
// 				begin 
// 					e <= d ;
// 					c <= b ; 
// 					b <= a ; 
// 					d <= c ;
// 				end 
// 		end 
// endmodule 