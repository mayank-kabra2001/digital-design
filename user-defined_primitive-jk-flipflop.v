primitive JKFF(q , j , k , clk , clr)  ;
	input j , k , clk , clr ; 
	output reg q ; 

	table 
	//  J 	k 	clk 	clr 	 	q 	 	q_new
		?	?	 ?		 1		:	?	:	  0		;	// clear
		?	?	 ?		 r 		:	?	:	  -	 	;	// no change
		0	0	(10)	 0 		:	?	:	  -		;	// no change
		0	1	(10)	 0 		:	?	:	  0		;	// reset
		1	0	 r 		 0 		:	?	:  	  1		;	// set condn
		1	1	 r 		 0 		:	0	:  	  1		;	// toggle condn 
		1	1	 r 		 0 		:	1	:	  0		;	// toggle condn 
		?	?	(01)	 0 		:	?	:	  -		;	// no change

	endtable 
endprimitive