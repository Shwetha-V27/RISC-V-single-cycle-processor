module main_dec(
	input  [6:0] opcode,
	output [1:0] result_src, imm_src, alu_op,
	output mem_write, branch, alu_src, reg_write, jump
	);
	
	reg [10:0] controls;
	
	assign reg_write = controls[10],
			 imm_src   = controls[9:8],
			 alu_src	  = controls[7],
			 mem_write = controls[6],
			 result_src= controls[5:4],
			 branch    = controls[3],
			 alu_op	  = controls[2:1],
			 jump 	  = controls[0];
	
	always@*
		case(opcode)
			7'b0000011: controls = 11'b1_00_1_0_01_0_00_0; //lw
			7'b0100011: controls = 11'b0_01_1_1_00_0_00_0; //sw
			7'b0110011: controls = 11'b1_xx_0_0_00_0_10_0; //R-type
			7'b1100011: controls = 11'b0_10_0_0_00_1_01_0; //beq
			7'b0010011: controls = 11'b1_00_1_0_00_0_10_0; //I-type alu
			7'b1101111: controls = 11'b1_11_0_0_10_0_00_1; //jal
			default:    controls = 11'bx;
		endcase

endmodule