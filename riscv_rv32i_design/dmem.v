module dmem(
	input  clk, we,
	input  [31:0]addr, data_in,
	output [31:0]read_out
	);
	
	reg [31:0] dmem [63:0];
	
	always@(posedge clk)
		if(we)	dmem[addr[7:2]] <= data_in;
	
	assign read_out = dmem[addr[7:2]];

endmodule
