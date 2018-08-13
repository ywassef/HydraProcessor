module Program_Counter (d, imm_branch, imm_jump, branch, jump, halt, PC_in, PC_out, reset);
	
	//o registrador PC vai ficar na CPU. Esse módulo só serve pra calcular o valor do PC baseado no valor anterior
	// e nos sinais de controle
	
	input [15:0] imm_branch, imm_jump, PC_in;		// imediatos para jump e branch a valor anterior do PC
	input branch, jump, d, halt, reset;				// sinais de controle e ciclo de atualização do PC
	output reg [15:0] PC_out;							// valor de saída do Pc
	
	always@(posedge d)
		begin
			
			if (jump)
				PC_out = imm_jump;
			else if (branch)
				PC_out = imm_branch;				//salto do branch não é relativo ao PC
			else if (halt)
				PC_out = PC_in;
			else if (reset)
				PC_out = 0;
			else
				PC_out = PC_in + 2;
			
		end
	
endmodule
