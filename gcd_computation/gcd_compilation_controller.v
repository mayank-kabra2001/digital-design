module controller(ldA , ldB , sel1 , sel2 , sel_in , done , clk , lt , gt , eq ,start) ;
	input clk , lt , gt , eq , start ; 
	output reg ldA ,ldB ,sel1 ,sel2 , sel_in , done ; 

	reg [2:0] state ; 
	parameter S0 = 3'b000 , S1 = 3'b001 , S2 = 3'b010 , S3 = 3'b011 , S4 = 3'b100 , S5 = 3'b101 ; 

	always @(posedge clk) 
		begin 
			case(start) 
				S0 		 : if(start) state <= S1 ; 
				S1 		 : state <= S2 ; 
				S2 		 :  #2 if(eq) state <= S5 ; 
							   else if (lt) state <= S3 ; 
							   else if(gt) state <= S4 ; 	
				S3 		 : #2 if(eq) state <= S5 ; 
							   else if (lt) state <= S3 ; 
							   else if(gt) state <= S4 ; 
				S4 		 : #2 if(eq) state <= S5 ; 
							   else if (lt) state <= S3 ; 
							   else if(gt) state <= S4 ; 
				S5 		 : state <= S5 ; 
				default  : state <= S0 ; 
			endcase 
		end

	always @(state) 
		begin 
			case(state) 
				S0		: begin  sel_in = 1; ldA = 1 ;  ldB = 0 ; done =0 ; end 
				S1 		: begin  sel_in = 1; ldA = 0 ;  ldB = 0 ; end
				S2 		: if (eq) done =1 ; 
						  else if (lt) begin 
						  		sel1 =1 ; sel2 = 0; sel_in	= 0 ; 
						  		#1 ldA = 0; ldB = 1 ; 
						  		end
						  else if (gt) begin 
						  		sel1 =0 ; sel2 = 1; sel_in	= 0 ; 
						  		#1 ldA = 1; ldB = 0 ;
						  		end 

				S3		: if (eq) done =1 ; 
						  else if (lt) begin 
						  		sel1 =1 ; sel2 = 0; sel_in	= 0 ; 
						  		#1 ldA = 0; ldB = 1 ; 
						  		end
						  else if (gt) begin 
						  		sel1 =0 ; sel2 = 1; sel_in	= 0 ; 
						  		#1 ldA = 1; ldB = 0 ;
						  		end 

				S4		: if (eq) done =1 ; 
						  else if (lt) begin 
						  		sel1 = 1 ; sel2 = 0; sel_in	= 0 ; 
						  		#1 ldA = 0; ldB = 1 ; 
						  		end
						  else if (gt) begin 
						  		sel1 =0 ; sel2 = 1; sel_in	= 0 ; 
						  		#1 ldA = 1; ldB = 0 ;
						  		end 

				S5		: begin done = 1; sel1 =0 ; sel2 = 0 ; ldB = 0 ; ldA =0 ; end 

				default : begin ldA = 0 ; ldB =0 ; end 
			endcase 
		end 
endmodule 


//now this becomes very lengthy to write everytime the state ..
// so reduce this problem we should create a new state variable which will take care that state is equal to next state  everytime and next state is take care by second always block ..

// module controller(ldA , ldB , sel1 , sel2 , sel_in , done , clk , lt , gt , eq ,start) ;
// 	input clk , lt , gt , eq , start ; 
// 	output ldA ,ldB ,sel1 ,sel2 , sel_in , done ; 

// 	reg [2:0] state , next_state ; 
// 	parameter S0 = 3'b000 , S1 = 3'b001 , S2 = 3'b010 , S3 = 3'b011 , S4 = 3'b100 , S5 = 3'b101 ; 

// 	always @(posedge clk) 
// 		begin 
// 			state <= next_state ; 
// 		end

// 	always @(state) 
// 		begin 	
// 			case(state) 
// 				S0		: begin  sel_in = 1; ldA = 1 ;  ldB = 0 ; done =0 ; end 
// 				S1 		: begin  sel_in = 1; ldA = 0 ;  ldB = 0 ; end
// 				S2 		: if (eq) begin done =1 ; next_state = S5 ; end 
// 						  else if (lt) begin 
// 						  		sel1 =1 ; sel2 = 0; sel_in	= 0 ; next_state = S3 ; 
// 						  		#1 ldA = 0; ldB = 1 ; 
// 						  		end
// 						  else if (gt) begin 
// 						  		sel1 =0 ; sel2 = 1; sel_in	= 0 ; next_state = S4 ; 
// 						  		#1 ldA = 1; ldB = 0 ;
// 						  		end 

// 				S3		: if (eq) begin done =1 ; next_state = S5 ; end 
// 						  else if (lt) begin 
// 						  		sel1 =1 ; sel2 = 0; sel_in	= 0 ; next_state = S3 ; 
// 						  		#1 ldA = 0; ldB = 1 ; 
// 						  		end
// 						  else if (gt) begin 
// 						  		sel1 =0 ; sel2 = 1; sel_in	= 0 ;  next_state = S4 ; 
// 						  		#1 ldA = 1; ldB = 0 ;
// 						  		end 

// 				S4		: if (eq) begin done =1 ; next_state = S5 ; end 
// 						  else if (lt) begin 
// 						  		sel1 = 1 ; sel2 = 0; sel_in	= 0 ; next_state = S3 ; 
// 						  		#1 ldA = 0; ldB = 1 ; 
// 						  		end
// 						  else if (gt) begin 
// 						  		sel1 =0 ; sel2 = 1; sel_in	= 0 ; ext_state = S4 ; 
// 						  		#1 ldA = 1; ldB = 0 ;
// 						  		end 

// 				S5		: begin done = 1; sel1 =0 ; sel2 = 0 ; ldB = 0 ; ldA =0 ; next_state = S5 ; end 

// 				default : begin ldA = 0 ; ldB =0 ; next_state = 0 ; end 
// 			endcase 
// 		end 
// endmodule 

