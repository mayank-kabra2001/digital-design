module MUX_8x1(input [7:0]d , input[2:0]s, output out) ;
	wire t1 , t2 ; 

	MUX_4x1 M1(d[0] , d[1] , d[2] , d[3] , s[0] , s[1] , t1) ;
	MUX_4x1 M2(d[4] , d[5] , d[6] , d[7] , s[0] , s[1] , t2) ; 
	MUX_2x1 M3(t1 , t2 , s[2] , out) ; 

endmodule 