module MUX_test;
  reg [7:0] x;
  reg [2:0] s;
  wire z;
  MUX_8x1 M1 (x, s, z);
   initial
     begin
      $dumpfile ("mux_8x1_out.vcd"); 
      $dumpvars(0, tb_mux_8x1);
      $display("S2 S1 S0  \t d7 d6 d5 d4 d3 d2 d1 d0 \t Y");
      $monitor("%b  %b  %b   \t %b  %b  %b  %b  %b  %b  %b  %b \t %b", s[2], s[1], s[0], x[7], x[6], x[5], x[4], x[3], x[2], x[1], x[0], z);
      x = 8'h01; s = 3'b000;
      #5 x = 8'h02; s = 3'b001;
      #5 x = 8'h04; s = 3'b010;
      #5 x = 8'h08; s = 3'b011;
      #5 x = 8'h10; s = 3'b100;
      #5 x = 8'h20; s = 3'b101;
      #5 x = 8'h40; s = 3'b110;
      #5 x = 8'h80; s = 3'b111;
      #5 x = 8'hFe; s = 3'b000;
      #5 x = 8'hFd; s = 3'b001;
      #5 x = 8'hFb; s = 3'b010;
      #5 x = 8'hF7; s = 3'b011;
      #5 x = 8'heF; s = 3'b100;
      #5 x = 8'hdF; s = 3'b101;
      #5 x = 8'hbF; s = 3'b110;
      #5 x = 8'h7F; s = 3'b111;
     
      #5 $finish;
    end
endmodule