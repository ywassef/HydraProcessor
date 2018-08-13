module Sign_Extend_Shift_Left_2 (op1, op1_extended);
	
	input [7:0] op1;
	output signed [15:0] op1_extended;
	
	
	 assign op1_extended = ($signed(op1)) << 1;
	
endmodule
