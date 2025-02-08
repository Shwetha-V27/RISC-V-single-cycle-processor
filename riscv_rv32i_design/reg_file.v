module reg_file(
	input clk, we,
	input [4:0] a1, a2, a3,
	input [31:0]data_in,
	output[31:0]data_out1, data_out2
	);
	
	reg [31:0] reg_file [31:0];
	
	always@(posedge clk)
		if(we) reg_file[a3] <= data_in;
	
	assign data_out1 = (a1==5'b0)?31'b0:reg_file[a1],
			 data_out2 = (a2==5'b0)?31'b0:reg_file[a2];

endmodule
