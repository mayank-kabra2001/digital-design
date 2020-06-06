//if select line s=00101, out=a+b
//if s=00110, out= a-b;
//if s=01000, a*b
//01011 --> a/b


module alu (a,b,s,out);
input [39:0]a,b;
input [4:0]s;
input clk;
reg [39:0]c,d; // this is not reqd
output [39:0]out; // it should be of reg type .

reg i; //this is not req .

always @ (posedge clk)
begin
if (s==5'b00101)
out = a+b;
else if (s==5'b1000) // value written is wrong , it should 010000 . 
begin
out= a*b;
else if (s==5'b00110)
out = a-b;
else if (s==5'b01011)
out = a/b;
end
endmodule


`timescale 1ns/1ps
module alu_test;
reg [39:0]a,b;
reg clk;
reg [4:0]select; // this should be s .
wire out;
alu uut (a,b,out,select); // order is not correct .
initial
begin
$dumpfile("alua.vcd");
$dumpvars(0, alu_test);
a= 40'h000000000b;
b= 40'h0000000003;
clk=0;
s= 5'b00101;
end

always
begin
#3 clk=~clk;
end

always
begin

s = 5'b00111;
#10 s = 5'b00110;
#10 s = 5'b01000;
#10 s = 5'b01011;

end

endmodule
