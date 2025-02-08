module mux2(
	input s,
	input [31:0] in1, in2,
	output[31:0] out
	);
	
	assign out = s? in2: in1; 
	// s=0 -> in1
	// s=1 -> in2

endmodule

///////////////////////////////////////////////

module mux3(
	input [1:0]s,
	input [31:0] in1, in2, in3,
	output[31:0] out
	);
	
	assign out = s[1]? in3: (s[0]? in2: in1);
	// s=00 -> in1
	// s=01 -> in2
	// s=10 -> in3
endmodule