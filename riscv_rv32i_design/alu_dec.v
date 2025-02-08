module alu_dec(
	input opb5, funct7b5,
	input [1:0] alu_op,
	input [2:0] funct3,
	output reg [2:0] alu_control
	);
	
	wire RtypeSub;
	assign RtypeSub = funct7b5 & opb5;
	
	always@*
		case(alu_op)
			2'b00: alu_control = 3'b000; //add
			2'b01: alu_control = 3'b001; //sub
			default: case(funct3)
							3'b000: if(RtypeSub)	alu_control = 3'b001; //sub
									  else	   	alu_control = 3'b000; //add, addi
							3'b010: alu_control = 3'b101; //slt, slti
							3'b110: alu_control = 3'b011; //or, ori
							3'b111: alu_control = 3'b010; //and, andi
							default:alu_control = 3'bx;
						endcase
		endcase


endmodule