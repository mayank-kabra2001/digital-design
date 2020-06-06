module state_machine(inp , clk , reset , out) ; 
	input inp , clk , reset ; 
	output reg out ; 

	reg [2:0] state  ; 
	parameter A = 2'b00 , B = 2'b01 , C = 2'b10 ;  

	always @(posedge clk)
		begin
			if(!reset)
				case(state) 
					A : 	  if(inp == 0) 
							  	begin
							  		state <= B ; 
							  		out <= 0 ;
							  	end   
							  else
							  	begin
							  		state <= C ; 
							  		out <= 0 ;  
							  	end

					B : 	 if(inp == 0) 
							  	begin
							  		state <= B ; 
							  		out <= 0 ;
							  	end   
							  else
							  	begin
							  		state <= C ; 
							  		out <= 1 ;  
							  	end
					
					C : 	  if(inp == 0) 
							  	begin
							  		state <= B ; 
							  		out <= 1 ;
							  	end   
							  else
							  	begin
							  		state <= C ; 
							  		out <= 0 ;  
							  	end
					
					default : begin
								state <= A ; 
								out <= 0 ; 
							  end 
				endcase

			else 
				begin	
					state <=  A ; 
					out <= 0 ; 
				end 
		end
endmodule	