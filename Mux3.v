module Mux3 (opsource, rg, mem, imm, out);
	
	input [1:0] opsource;
	input [15:0] rg, mem, imm;
	output reg [15:0] out;
	
	always@(opsource or rg or mem or imm)
		begin
			case(opsource)
				
				2'B00: out = rg;
				2'B01: out = mem;
				2'B10: out = imm;
				default: out = 0;
				
			endcase
		end
	
endmodule
