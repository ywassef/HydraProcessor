module Mux5 (write_data_src, ALU, data_rg, mem_rg, mem, imm, out);
	
	input [2:0] write_data_src;
	input [15:0] ALU, data_rg, mem_rg, mem, imm;
	output reg [15:0] out;
	
	always@(write_data_src or data_rg or mem_rg or mem or imm or ALU)
		begin
			case(write_data_src)
				
				3'B000: out = ALU;
				3'B001: out = mem;
				3'B010: out = data_rg;
				3'B011: out = mem_rg;
				3'B100: out = imm;
				default: out = 0;
				
			endcase
		end
	
endmodule