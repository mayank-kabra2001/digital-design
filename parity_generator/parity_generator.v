module parity_gen(x , clk , z) ; 
	input x , clk  ; 
	output reg z ; 
	reg even_odd ; 
	parameter EVEN = 0 , ODD = 1 ;

	always @(posedge clk)
		case (even_odd)
			EVEN : begin 
				z <= x ? 1 : 0 ; 
				even_odd <= x ? ODD : EVEN ;
				end 

			ODD : begin
				z <= x ? 0 : 1 ;
				even_odd <= x ? EVEN : ODD ;
				end 

			default : even_odd <= EVEN ; 
		endcase 
endmodule 


// this is same as seen in previous case as excess flipflops will be reqd ..

// module parity_gen(x , cl , z) ; 
// 	input x , clk  ; 
// 	output regz ; 
// 	reg even_odd ; 
// 	parameter EVEN = 0 , ODD = 1 ;

// 	always @(posedge clk)
// 		case (even_odd)
// 			EVEN : even__odd <= x ? ODD : EVEN ;
// 			ODD : even_odd <= x ? EVEN : ODD ;
// 			default : even_odd <= EVEN ; 
// 		endcase 

// 	always @(even__odd)
// 		case(even_odd)
// 			EVEN : z=0 ; 
// 			ODD : z=1 ; 
// 		endcase
// endmodule 

