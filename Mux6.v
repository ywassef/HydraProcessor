module Mux6 (write_data_src, ALU, data_rg, mem_rg, mem, imm, data_in, out);
	
	input [2:0] write_data_src;
	input [15:0] ALU, data_rg, mem_rg, mem, imm, data_in;
	output reg [15:0] out;
	
	always@(write_data_src or data_rg or mem_rg or mem or imm or ALU or data_in)
		begin
			case(write_data_src)
				
				3'B000: out = ALU;
				3'B001: out = mem;
				3'B010: out = data_rg;
				3'B011: out = mem_rg;
				3'B100: out = imm;
				3'B101: out = data_in;
				default: out = 0;
				
			endcase
		end
	
endmodule
