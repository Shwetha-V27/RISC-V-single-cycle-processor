module alu(
	input [31:0]a,b,
	input [2:0] alu_control,
	output reg [31:0]alu_result,
	output 		zero
	);
	
	wire [31:0] comp_b;
	wire [31:0] sum;
	wire signed [31:0]sa, sb;
	 
	assign sa = a,
			 sb = b;
	
	assign comp_b = alu_control[0]? ~b: b;
	assign sum = a + comp_b + alu_control[0];
	
	always@*
		case(alu_control)
			3'b000: alu_result = sum;  //add
			3'b001: alu_result = sum;  //sub a+(~b)+1
			3'b010: alu_result = a&b;  //and
			3'b011: alu_result = a|b;  //or
			3'b101: alu_result = sa<sb;//slt
			default:alu_result = 32'b0;
		endcase
		
	assign zero = alu_result == 32'b0;
	
endmodule


