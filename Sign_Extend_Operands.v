module Sign_Extend_Operands (optype, op1_in, op2_in, op3_in, op1_out, op2_out, op3_out);
	
	input [2:0] optype;
	input signed [7:0] op1_in, op2_in, op3_in;
	output reg  signed [15:0] op1_out, op2_out, op3_out;
	
	always@(*)
		begin
			if (optype[2] == 1) begin					//se o operando for um endereço de registrador, os dois primeirs bits indicam o modo de acesso, por isso tem que remover
				op1_out = op1_in[5:0];					//se for um registrador, então esse operador é um endereço portanto não tem sinal (não existe registrador negativo)
			end
			else begin										//caso contrário, o operando inteiro é um imediato e pode ser usado como constante
				op1_out = $signed(op1_in[7:0]);
			end
			
				
			if(optype[1] == 1) begin
				op2_out = op2_in[5:0];
			end
			else begin
				op2_out = $signed(op2_in[7:0]);
			end
				
							
			if(optype[0] == 1) begin
				op3_out = op3_in[5:0];
			end
			else begin
				op3_out = $signed(op3_in[7:0]);
			end
		end
		
	
endmodule
