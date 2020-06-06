module MUX_16x1(input [15:0]d , input [3:0]s , output out)
	wire[3:0] t ; 

	MUX_4x1 M1([3:0]d , [1:0]s , t[0]);
	MUX_4x1 M2([7:4]d , [1:0]s , t[1]);
	MUX_4x1 M3([11:8]d , [1:0]s , t[2]);
	MUX_4x1 M4([15:12]d , [1:0]s , t[3]);
	MUX_4x1 M5([3:0]t , [3:2]s , out);

endmodule