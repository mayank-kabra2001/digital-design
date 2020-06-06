// module cyclic_lamp(clock , light) ;
// 	input clock ; 
// 	output reg [0:2] light ; 
// 	parameter s0 = 0 , s1 = 1 , s2 = 2 ; 
// 	parameter red = 3'b100 , green = 3'b010 , yellow = 3'b001 ;
// 	reg [0:1] state ; 

// 	always @(posedge clock)
// 		case(state)
// 			s0 : begin
// 				light <= green ; 
// 				state <= s1 ; 
// 				end

// 			s1 : begin 
// 				light <= yellow ; 
// 				state <= s2 ;
// 				end  

// 			s2 : begin 
// 				light <= red ; 
// 				state <= s0 ;
// 				end 

// 			default : begin 
// 				light <= red ; 
// 				state <= s0 ; 
// 				end
// 		endcase   
// endmodule 


// now this will generate a 5 flip flop structure in which 2 are used for states and 3 for lights 
// but as we see we dont need flipflops for lights ... so .... we modify out design . 


module cyclic_lamp(clock , light) ;
	input clock ; 
	output reg [0:2] light ; 
	parameter s0 = 0 , s1 = 1 , s2 = 2 ; 
	parameter red = 3'b100 , green = 3'b010 , yellow = 3'b001 ;
	reg [0:2] state ; 

	always @(posedge clock)

		case(state)
			s0 : state <= s1 ;

			s1 : state <= s2 ;

			s2: state <= s0 ;

			default : state <= s0 ;
		endcase

	always @(state)
		case(state)
			s0 : light = green ; 

			s1 : light = yellow ; 				

			s2 : light = red ; 

			default : light = red ; 
		endcase   

		
endmodule 

