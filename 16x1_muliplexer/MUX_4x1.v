module MUX_4x1(input i0 , i1, i2, i3, s0 , s1 , output out) ;
	wire t1 , t2 ; 

	MUX_2x1 M1(i0 , i1 ,s0 , t1) ;
	MUX_2x1 M2(i2 , i3, s0 , t2) ; 
	MUX_2x1 M3(t1 , t2 , s1 ,out) ; 

endmodule 