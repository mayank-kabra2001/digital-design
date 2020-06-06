module RCA(carry_out , sum , a, b, carry_in) ; 
	parameter N = 8 ; 
	input [N-1 : 0] a,  b ; 
	input carry_in ; 
	output [N-1 : 0] sum ; 
	output carry_out ; 
	wire[n:0] carry  ; 

	assign carry[0] = carry_in ; 
	assign carry_out = carry[N] ;

	genvar i ; 
	generate for(i=0 ; i<N ; i++) 
		begin fa_loop 
			wire t1 , t2 , t3 ;
			xor G1(t1 , a[i] , b[i] , c[i]) ;
			xor G2(sum[i] , t1 , carry[i]) ; 
			and G3(t2 , a[i] , b[i] , c[i]) ; 
			and G4(t3 , t1 , carry[i]) ; 
			or G5(carry[i+1] , t2 , t3) ; 
		end 
	endgenerate
endmodule

// this is how we create n times repeatitive block 