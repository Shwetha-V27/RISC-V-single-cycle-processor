module riscv_core(
	input  clk, reset,
	input  [31:0] instr, read_data,
	output mem_write,
	output [31:0] pc, alu_result, write_data
	);
	
	wire alu_src, reg_write, pc_src, zero;
	wire [1:0] result_src, imm_src;
	wire [2:0] alu_control;
	
	controller c(zero, instr[30], instr[14:12], instr[6:0], mem_write, 
					 pc_src, alu_src, reg_write, result_src, imm_src, alu_control);
	
	datapath  dp(clk, reset, pc_src, alu_src, reg_write, result_src, imm_src, 
				    alu_control, instr, read_data, zero, pc, alu_result, write_data);

endmodule
	