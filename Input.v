module Input (data_in, halt_in, data_keys, halt_key);
	
	input halt_key;
	input [6:0] data_keys;
	output halt_in;
	output reg [15:0] data_in;
	
	always@(data_keys) begin
		data_in = $signed(data_keys);
	end
	
	assign halt_in = halt_key;
	
endmodule
