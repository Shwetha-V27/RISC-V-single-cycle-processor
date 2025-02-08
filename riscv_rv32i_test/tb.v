module tb;
	reg  clk, reset;
	wire mem_write;
	wire [31:0] write_data, data_adr;
	
	riscv_rv32i_sc dut(clk, reset, mem_write, write_data, data_adr);
	
	initial
		begin
			clk   = 1'b0;
			reset = 1'b1;
			#15 reset = 1'b0;
		end
	
	always #5 clk = ~clk;
	
			
	always@(negedge clk)
		begin
			if(mem_write)
				begin
					if(data_adr === 100 & write_data === 25)
						begin
							$display("Simulation succeeded");
							$stop;
						end
							else if(data_adr !== 96) begin
								$display("Simulation failed");
								$stop;
							end
						end
					end

endmodule