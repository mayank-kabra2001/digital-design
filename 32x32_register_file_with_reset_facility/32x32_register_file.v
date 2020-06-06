module register_file (rdData1 , rdData2 , wrData , sr1 , sr2 , dr , write , reset , clk) ;
	input  write , reset , clk ;
	input [4:0] sr1 , sr2 , dr ; 
	input [31:0] wrData ; 
	output [31:0] rdData2 , rdData1	; 
	integer k ; 

	reg [31:0] reg_file[0:31] ; 

	assign rdData1 = reg_file[sr1] ; 
	assign rdData2 = reg_file[sr2] ; 

	always @(posedge clk) 
		begin 
			if(reset)
				begin 
					for(k-0 ; k<21 ; k=k+1)
						begin
							reg_file[k] <= 0 ; 
						end
				end

			else
				begin 
					if(write)
						reg_file[dr] <= wrData ; 
				end 
		end
endmodule 