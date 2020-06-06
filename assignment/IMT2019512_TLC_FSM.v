
module TLC(clock , TA , TB , lightA , lightB , cond , reset ) ; 
	input clock , cond , reset ; 
	input TA , TB  ; 
	output reg[1:0] lightA , lightB ; 
	reg [2:0] state ;
	reg delay , count_delay , count ; 

	parameter S0 = 3'b001 ,
			  S1 = 3'b010 ,
			  S2 = 3'b011 , 
			  S3 = 3'b100 ,
			  S4 = 3'b101 , 
			  S5 = 3'b110 ;

	parameter RED			= 2'b00 ,
			  YELLOW 		= 2'b01 , 
			  GREEN			= 2'b10 ;

	initial 
		state <= S0 ;

	always @(posedge clock)
	begin 
		if(!reset)
		 	case(state)
		 		S0 			: begin 
			 					  if(TA == 0 && cond == 1) state = S2 ;
			 					  else if (TA == 0) state = S1 ; 
			 					  else state = S0 ; 
			 					  lightA = GREEN ;
			 					  lightB = RED ;
			 				  end 

		 		S1 			: begin 
			 					  state = S4 ;
			 					  lightA = YELLOW 	; 
			 					  lightB = RED 	; 
			 				  end 

		 		S2 			: begin 
		 						delay = 1 ;
		 						if(count_delay == 1)
		 							state = S4 ;
		 						lightA = YELLOW	; 
		 						lightB = RED 	;
		 					  end 

		 		S3 			: begin 
			 					  state = S0 ; 
			 		  			  lightA = RED	; 
			 		  			  lightB = YELLOW ;
			 		  		  end 
			 		  		  	  	
		 		S4 			: begin 
			 					  if(TB == 0 && cond == 1) state = S5 ;
			 					  else if (TB == 0) state = S3 ; 
			 					  else state = S4 ; 
			 					  lightA = RED 	; 
			 					  lightB = GREEN ;
			 				  end 

		 		S5 			: begin 
		 						delay = 1 ;
		 						if(count_delay == 1)
		 							state = S0 ;
		 						lightA = RED ;
		 						lightB = YELLOW ;
		 					  end 	  

		 		default 	: state <= S0 ; 
		 	endcase 

		else
			state <= S0 ; 
	end 

	always @(posedge clock)
		begin 
			if(delay) 
				count <= count + 1 ; 
				if(count == 2)
					count_delay = 1 ;
					count <= 0  ; 
		end
endmodule 


`timescale 1ns/1ps 

module TLC_test ; 
	reg clock , cond , reset , count , TA , TB ;
	output [1:0] lightA , lightB ; 

	TLC test(clock , TA , TB , lightA , lightB , cond , reset ) ; 

	initial 
	begin 
		clock = 1'b0 ;
		reset = 1'b0 ;
		cond = 1'b0 ; 
	end  

	always #5 clock = ~clock ; 

	initial 
		begin
			$dumpfile ("TLC_out.vcd"); 
			$dumpvars(0, TLC_test);
			$monitor($time , " clock = %b , rst = %b , TA = %b ,  TB = %b , lightA = %2b  , lightB = %2b ", clock , reset , TA , TB , lightA , lightB) ; 

			#5 TA = 1 ;
			#20 TA = 0  ;
			#20 TB = 0 ; TA = 1 ;
			#20	cond = 1 ; TB = 1 ;
			#1 ;
			#20 TB = 0 ;TA = 1 ; 
			#20 $finish ; 
		end 
endmodule 
