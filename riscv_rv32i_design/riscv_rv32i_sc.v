module riscv_rv32i_sc(
	input  clk, reset,
	output mem_write,
//	output [31:0] write_data, data_adr
	output reg[6:0]hex00, hex01, hex10, hex11
	);
	
	wire [31:0] pc, instr, read_data;
	wire [31:0] write_data, data_adr;
	riscv_core rvc(clk, reset, instr, read_data, 
						mem_write, pc, data_adr, write_data);
	
	imem imem(pc, instr);
	
	dmem dmem(clk, mem_write, data_adr, write_data, read_data);
	
	always@*
		case(write_data[3:0])
			4'b0000: hex00 = 7'b1000000;
			4'b0001: hex00 = 7'b1111001;
			4'b0010: hex00 = 7'b0100100;
			4'b0011: hex00 = 7'b0110000;
			4'b0100: hex00 = 7'b0011001;
			4'b0101: hex00 = 7'b0010010;
			4'b0110: hex00 = 7'b0000010;
			4'b0111: hex00 = 7'b0111000;
			4'b1000: hex00 = 7'b0000000;
			4'b1001: hex00 = 7'b0010000;
			4'b1010: hex00 = 7'b0001000;
			4'b1011: hex00 = 7'b0000011;
			4'b1100: hex00 = 7'b1000110;
			4'b1101: hex00 = 7'b0100001;
			4'b1110: hex00 = 7'b0000110;
			4'b1111: hex00 = 7'b0001110;
			default: hex00 = 7'b0111111;
		endcase
		
		always@*
		case(write_data[7:4])
			4'b0000: hex01 = 7'b1000000;
			4'b0001: hex01 = 7'b1111001;
			4'b0010: hex01 = 7'b0100100;
			4'b0011: hex01 = 7'b0110000;
			4'b0100: hex01 = 7'b0011001;
			4'b0101: hex01 = 7'b0010010;
			4'b0110: hex01 = 7'b0000010;
			4'b0111: hex01 = 7'b0111000;
			4'b1000: hex01 = 7'b0000000;
			4'b1001: hex01 = 7'b0010000;
			4'b1010: hex01 = 7'b0001000;
			4'b1011: hex01 = 7'b0000011;
			4'b1100: hex01 = 7'b1000110;
			4'b1101: hex01 = 7'b0100001;
			4'b1110: hex01 = 7'b0000110;
			4'b1111: hex01 = 7'b0001110;
			default: hex01 = 7'b0111111;
		endcase
		
		always@*
		case(data_adr[3:0])
			4'b0000: hex10 = 7'b1000000;
			4'b0001: hex10 = 7'b1111001;
			4'b0010: hex10 = 7'b0100100;
			4'b0011: hex10 = 7'b0110000;
			4'b0100: hex10 = 7'b0011001;
			4'b0101: hex10 = 7'b0010010;
			4'b0110: hex10 = 7'b0000010;
			4'b0111: hex10 = 7'b0111000;
			4'b1000: hex10 = 7'b0000000;
			4'b1001: hex10 = 7'b0010000;
			4'b1010: hex10 = 7'b0001000;
			4'b1011: hex10 = 7'b0000011;
			4'b1100: hex10 = 7'b1000110;
			4'b1101: hex10 = 7'b0100001;
			4'b1110: hex10 = 7'b0000110;
			4'b1111: hex10 = 7'b0001110;
			default: hex10 = 7'b0111111;
		endcase
		
		always@*
		case(data_adr[7:4])
			4'b0000: hex11 = 7'b1000000;
			4'b0001: hex11 = 7'b1111001;
			4'b0010: hex11 = 7'b0100100;
			4'b0011: hex11 = 7'b0110000;
			4'b0100: hex11 = 7'b0011001;
			4'b0101: hex11 = 7'b0010010;
			4'b0110: hex11 = 7'b0000010;
			4'b0111: hex11 = 7'b0111000;
			4'b1000: hex11 = 7'b0000000;
			4'b1001: hex11 = 7'b0010000;
			4'b1010: hex11 = 7'b0001000;
			4'b1011: hex11 = 7'b0000011;
			4'b1100: hex11 = 7'b1000110;
			4'b1101: hex11 = 7'b0100001;
			4'b1110: hex11 = 7'b0000110;
			4'b1111: hex11 = 7'b0001110;
			default: hex11 = 7'b0111111;
		endcase

endmodule
