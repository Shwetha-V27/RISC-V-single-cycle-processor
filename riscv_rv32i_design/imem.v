module imem(
	input  [31:0]addr,
	output [31:0]read_out
	);

	reg [31:0] imem [63:0]; // can go upto 2^32 locations
	
	initial
		begin
			$readmemh("C:/Users/ranji/OneDrive/Documents/Quartus_Projects/internship/riscv_rv32i_sc/riscv_test_program.txt",imem,0,20);
		end
	
	assign read_out = imem[addr[7:2]]; //using only 6bits because we have only 64 locations in imem
	
endmodule