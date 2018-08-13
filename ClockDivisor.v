module ClockDivisor (input clock_full, output reg clock_divided);

reg [31:0] state;

initial begin
	state = 0;
	clock_divided = 0;
 end

	always @(posedge clock_full) begin

		 if (state == 390625) begin
			state = 0;
			clock_divided = ~clock_divided;
		 end
		 else begin
			state = state + 1;
		 end
    
	end

endmodule
