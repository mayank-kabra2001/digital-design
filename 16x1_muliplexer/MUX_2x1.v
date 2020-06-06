module MUX_2x1(a , b , sel ,out) ;
	input a , b  , sbar , sel;
	output wire t1 , t2 , out;

	not G1(sbar , sel) ; 
	and G2(t1 , a, sel) ;
	and G3(t2 , b ,sbar) ; 
	or G4(out , t1 , t2) ; 

endmodule 

