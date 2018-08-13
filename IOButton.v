module IOButton (input wire button, input wire button_pause, output reg state);

initial begin
	state = 0;
end

always @ (negedge button) begin
	if(button_pause) begin
		state <= ~state;
	end
end

endmodule
