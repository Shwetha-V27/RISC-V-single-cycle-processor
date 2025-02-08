module extend(
	input [31:7]imm_data,
	input [1:0] immSrc,
	output reg [31:0]imm_data_out
	);

	always@*
		case(immSrc)
			2'b00: imm_data_out = {{20{imm_data[31]}}, imm_data[31:20]};
			2'b01: imm_data_out = {{20{imm_data[31]}}, imm_data[31:25], imm_data[11:7]};
			2'b10: imm_data_out = {{20{imm_data[31]}}, imm_data[7], imm_data[30:25], imm_data[11:8], 1'b0};
			2'b11: imm_data_out = {{12{imm_data[31]}}, imm_data[19:12], imm_data[20], imm_data[30:21], 1'b0};
			default: imm_data_out = 32'bx;
		endcase

endmodule
//conditions ImmSrc
//00 lw and I-type alu
//01 sw
//10 beq
//11 jal