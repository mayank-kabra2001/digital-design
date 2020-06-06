
    // ADDR_WIDTH - address size in bits (default: 8)
    // DATA_WIDTH - data size in bits (default: 8)
    // DEPTH - number of items in the memory array (default: 256)


module ram (clk , write , data_in , addr , data_out) ;
	parameter = ADDR_WIDTH = 8 , DATA_WIDTH = 8 , DEPTH = 256 ; 

	input clk , write ; 
	input [ADDR_WIDTH - 1:0] addr ; 
	input [DATA_WIDTH - 1:0] data_in ; 
	output [DATA_WIDTH - 1:0] data_out ; 

	rag [DATA_WIDTH - 1:0] mem [0:DEPTH - 1] ; 

	always @(posedge clk) 
	begin 
		if(write)
		begin
			mem [addr] <= data_in ; 
		end 
		else 
		begin 
			data_out <= mem[addr] ; 
		end 
	end 
endmodule 

