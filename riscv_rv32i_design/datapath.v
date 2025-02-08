module datapath(
	input  clk, reset, pc_src, alu_src, reg_write,
	input  [1:0]  result_src, imm_src,
	input  [2:0]  alu_control,
	input  [31:0] instr, read_data,
	output zero,
	output [31:0] pc, alu_result, write_data
	);
	
	wire [31:0] pc_next, pc_plus4, pc_target, extend_out, src_a, src_b, result;
	
	pc pc_reg(clk, reset, pc_next, pc);
	
	adder pc_add4(pc, 32'd4, pc_plus4);
	
	adder pc_add_branch(pc, extend_out, pc_target);
	
	mux2 pc_mux(pc_src, pc_plus4, pc_target, pc_next);
	
	mux2 srcb_mux(alu_src, write_data, extend_out, src_b);
	
	mux3 result_mux(result_src, alu_result, read_data, pc_plus4, result);
	
	extend ext (instr[31:7], imm_src, extend_out);
	
	alu alu(src_a, src_b, alu_control, alu_result, zero);
	
	reg_file rf(clk, reg_write, instr[19:15], instr[24:20], instr[11:7], result, src_a, write_data);

endmodule
