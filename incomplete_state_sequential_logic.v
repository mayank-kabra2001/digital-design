module incom_state(curr_state , flag)
	input [0:1] curr_state ; 
	output reg [0:1] flag ; 

	always @(curr_state)
		case (curr_state)
			0,1 : flag = 2 ;
			3 : flag = 0 ; 
		endcase 
endmodule 

// in this case 2 is not defined so while performing it will take the previous values that means previous value is stored somewhere
// thats why its a sequential logic , but if it is like this then ther is a value of flag =0 which makes it combinational circuit

// ################################################
// module incom_state(curr_state , flag)
// 	input [0:1] curr_state ; 
// 	output reg [0:1] flag ; 

// 	always @(curr_state)
// 	begin 
// 		flag = 0 ; 
// 		case (curr_state)
// 			0,1 : flag = 2 ;
// 			3 : flag = 0 ; 
// 		endcase
// 	end  
// endmodule 

// ##################################################


// ###########################
// another example
// ###########################


// #####################################################################
// module xyz(input a, b, c , output reg f) ;
// 	always @(*)
// 		if (a == 1) f = b&c ; 
// endmodule
// #####################################################################


// again for value a =0 is not specified so there will a latch 


// ########################################################################
// module xyz(input a, b, c , output reg f) ;
// 	always @(*)
// 	begin
// 		f = c ; //when a == 0 
// 		if (a == 1) f = b&c ;
// 	end 
// endmodule