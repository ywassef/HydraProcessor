module Display7seg (in, out, neg_in, neg_out);
	input [3:0] in;
	input neg_in;
	output reg [6:0] out;
	output reg neg_out;
	always@(*)
		begin
			case(in)
				0: begin out <= 7'B1000000; end
				1: begin out <= 7'B1111001; end
				2: begin out <= 7'B0100100; end
				3: begin out <= 7'B0110000; end
				4: begin out <= 7'B0011001; end
				5: begin out <= 7'B0010010; end
				6: begin out <= 7'B0000010; end
				7: begin out <= 7'B1111000; end
				8: begin out <= 7'B0000000; end
				9: begin out <= 7'B0010000; end
				default: begin out <= 7'B1111111; end
			endcase
			if(neg_in)
				neg_out = 1;
			else
				neg_out = 0;
	end
endmodule
