module ram_testbench();
	parameter = ADDR_WIDTH = 8 , DATA_WIDTH = 8 , DEPTH = 256 ; 

	reg clk , write ; 
	reg [ADDR_WIDTH - 1:0] addr ; 
	reg [DATA_WIDTH - 1:0] data_in ; 
	reg [DATA_WIDTH - 1:0] data_out ; 

	ram ram_test (clk , write , data_in , addr , data_out) ; 

	always begin 
		#5 clk = ~clk ;
	end 

	initial 
	begin 
		$display("sram test bench from timetoexplore.net.");
        clk = 1;

        #10 write_enable = 1;
        address = 0;
        data_in = 8'haa;  // 1010 1010
        #10 address = 1;
        data_in = 8'h55;  // 0101 0101

        #10 write_enable = 0;
        #10 $display("0x%02h", data_out);  // expect 0x55
        #10 address = 0;
        #10 $display("0x%02h", data_out);  // expect 0xaa
        #10 address = 1;
        #10 $display("0x%02h", data_out);  // expect 0x55

        #10 write_enable = 1;
        address = 1;
        data_in = 8'h2a;  // 0010 1010

        #10 write_enable = 0;
        #10 $display("0x%02h", data_out);  // expect 0x2a

        #40 $finish;
    end
endmodule



