module controller(
	input  zero, funct7b5,
	input  [2:0] funct3,
	input  [6:0] opcode,
	output mem_write, pc_src, alu_src, reg_write,
	output [1:0] result_src, imm_src,
	output [2:0] alu_control
	);
	
	wire [1:0] alu_op;
	wire jump, branch;
	
	main_dec md(opcode, result_src, imm_src, alu_op, mem_write, branch, alu_src, reg_write, jump);
	
	alu_dec  ad(opcode[5], funct7b5, alu_op, funct3, alu_control);
	
	assign pc_src = branch & zero | jump;

endmodule
