//This is a Johnson counter
//0, 1, 3, 7, F, E, C, 8, 0, repeat

module dff(q,d, reset, clk);
	output q;
	input d,clk,reset;
	reg q;

	always@(posedge clk or reset)
		begin
			if (reset==1) q = 0;
			else q = d;
		end
endmodule



module counter(q,reset,clk);
	output [3:0]q;
	input clk,reset;
	wire w;


	not n1(w , q[3]);
	dff f1(q[0],w,reset,clk);
	dff f2(q[1],q[0],reset,clk);
	dff f3(q[2],q[1],reset,clk);
	dff f4(q[3],q[2],reset,clk);
		
endmodule

`timescale 10ns/1ps

module tb_johnson();
    // Inputs
    reg clock;
    reg r;
    // Outputs
    wire [3:0] Count_out;


//in this following notation you have to pass the signals in the same order
//as in the original module
	//counter uut (Count_out,clock,r); 


//alternately, the following notation means that clk in the module connects to clock in the testbench.
//reset connects to r, and q to Count_out.
//In this notation, you can pass signals in any order, as you are explicitly mentioning 
//the signal connections

	counter uut(.clk(clock), .reset(r), .q(Count_out));

	always 
		#3 clock =~ clock ;

	initial 
		begin
			clock = 0;
			r=1;
			#50 r=0;  //reset=1 never shows up on the waveform -- why?
		end 

	initial
		begin
			$dumpfile("counter_out.vcd"); 
			$dumpvars(0, tb_johnson);
			$monitor( $time, " clk=%b, out= %b, reset=%b", clock , Count_out , r);
  			#150  $stop; 
		end

//initial #300 $finish;

endmodule

