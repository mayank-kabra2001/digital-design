
//This is a Johnson counter
//0, 1, 3, 7, F, E, C, 8, 0, repeat

//here initialization in counter module was not done in correct order so we changed order in dff .
module dff(q,d,clk,reset);
output q;
input d,clk,reset;
reg q;

always@(posedge clk or reset)
begin
	if (reset==1) q=0;
	else q=d;
end
endmodule



module counter(q,reset,clk);
output [3:0]q;
input clk,reset;
reg w; // reg is wrong , it should e wire ..

initial begin
not n1 (q[3],w); // order of input and output is incorrect ..
dff f1(q[0],w,reset,clk);
dff f2(q[1],q[0],reset,clk);
dff f3(q[2],q[1],reset,clk);
dff f4(q[3],q[2],reset,clk);
end
endmodule

`timescale 10ns/1ps
module tb_johnson;
    // Inputs
    reg clock;
     reg r;
    // Outputs
    wire Count_out; // output is of multiple bits so it is wrong .


//in this following notation you have to pass the signals in the same order
//as in the original module
counter uut (Count_out,clock,r); 

// this instantiation of counter module is incorrect .. so we should use the below one module ..

//alternately, the following notation means that clk in the module connects to clock in the testbench.
//reset connects to r, and q to Count_out.
//In this notation, you can pass signals in any order, as you are explicitly mentioning 
//the signal connections

//  counter uut ( .clk(clock),  .reset(r),.q(Count_out) );


initial begin

// clk should should be replaced with clock everywhere while using the second type of instantiation ..
clk = 0;
r=1;
#50 r=0;  //reset=1 never shows up on the waveform -- why?

$dumpfile ("counter.vcd"); 
$dumpvars(0,counter_test);
// counter_test is wrong we should tb_johnson .
end

always 
#3 clk=~clk;


//initial #300 $finish;

endmodule

