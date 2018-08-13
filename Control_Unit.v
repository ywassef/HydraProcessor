module Control_Unit(inst1, inst2, data_reg_read, data_reg_write, mem_reg_read, mem_reg_write, mem_read, mem_write, op1src, op2src, write_data_src, jump, halt, out_data_src, reset, out, button_pause, out_wtf);
	
	input [15:0] inst1, inst2;																													//instrução
	input reset;
	output reg data_reg_read, data_reg_write, mem_reg_read, mem_reg_write, mem_read, mem_write, jump, out,  out_wtf;	//sinais de controle 1 bit
	output reg [1:0] op1src, op2src, out_data_src;																						//sinais de controle 2 bits
	output reg [2:0] write_data_src;																											//sinais de controle 3 bits
	output wire halt, button_pause;
	
	reg [4:0] opcode;
	reg [2:0] optype;
	reg [7:0] op1, op2, op3;
	
	assign halt = (inst1[15] && inst1[14] && inst1[13] && inst1[12] && (~inst1[11]) && (~reset));
	assign button_pause = inst1[15:11] == 5'B10000 || inst1[15:11] == 5'B10001 ? 1 : 0; //setando a pausa para IO caso seja uma instrução de in
	
	always@(*) begin
		
		opcode = inst1[15:11];
		optype = inst1[10:8];
		op1 = inst1[7:0];
		op2 = inst2[15:8];
		op3 = inst2[7:0];
		
		//data_reg_read
		
		if ((optype[1] && op2[7:6] == 2'B00) || (optype[0] && op3[7:6] == 2'B00))		// se op2 for um reg direto ou op3 for um reg direto então leio data_reg
			data_reg_read = 1;
			
		else
			data_reg_read = 0;
			
		//data_reg_write
		
		if(optype[2] && (op1[7:6] == 2'B00) && (op1[5:0] < 32))	//se op1 for um registrador e for acesso direto e o endereço de escrita for um dos data_reg (0 a 31) então escrevo em data_reg
			data_reg_write = 1;
		else
			data_reg_write = 0;
			
		//mem_reg_read e mem_read
		
		if((optype[1] && op2[7:6] == 2'B11) || (optype[0] && op3[7:6] == 2'B11)) begin //se op2 for um reg indireto ou op3 for um reg indireto então leio mem_reg e data_mem
			mem_reg_read = 1; mem_read = 1;
		end
		else begin
			mem_reg_read = 0; mem_read = 0;
		end
			
		//caso especial mem_reg_read: copy && out
		
		if(opcode == 5'B11001 || opcode == 5'B10001) begin
		
			if(optype[1] && (op2[5:0] >= 32)) // se o op2 (leitura) for um reg com acesso direto e endereço maior igual a 32, então é um mem_reg
				mem_reg_read = 1;
			else
				mem_reg_read = 0;
				
		end
		
		//mem_reg_write
		
		if(optype[2] && (op1[7:6] == 2'B00) && (op1[5:0] >= 32))	//se op1 for um registrador e for acesso direto e o endereço de escrita for um dos mem_reg (32 a 63) então escrevo em mem_reg
			mem_reg_write = 1;
		else
			mem_reg_write = 0;
			
			
		//mem_write
		
		if(op1[7:6] == 2'B11 && optype[2]) begin
			mem_write = 1; mem_reg_read = 1;
		end
		else
			mem_write = 0;
		
		//op1src -> depende do op2
		
		if(optype[1]) begin 			//se optype de op2 é 1, significa que é um registrador direto ou memória (registrador indireto)
			if(op2[7:6] == 2'B00)	//reg por acesso direto, portanto vem dos data_Reg
				op1src = 2'B00;
			else
				op1src = 2'B01;		//reg por acesso indireto, portanto vem da memória
		end
		else					//é um imediato
			op1src = 2'B10;
		
		//op2src -> depende do op3
		
		if(optype[0]) begin 			//se optype de op3 é 1, significa que é um registrador direto ou memória (registrador indireto)
			if(op3[7:6] == 2'B00)	//reg por acesso direto, portanto vem dos data_Reg
				op2src = 2'B00;
			else
				op2src = 2'B01;		//reg por acesso indireto, portanto vem da memória
		end
		else					//é um imediato
			op2src = 2'B10;
	
		//write_data_src
		
		if(optype[2] == 1) begin			//operando de escrita tem que ser um registrador, nem que seja indireto ou indireto
			
			if(opcode == 5'B10000)			//instrução in: dado vem das chaves
				write_data_src = 3'B101;
				
			else if(opcode == 5'B11000)	//instrução mov: vem do imediato de 16 bits da instrução
				write_data_src = 3'B100;
				
			else if (opcode == 5'B11001) begin	// instrução copy: pode vir dos data_reg, mem_reg ou da memória
				
				if(op2[5:0] < 32)						//está lendo o dado que tem que ser copiado de um data register (endereço < 32)
					write_data_src = 3'B010;
					
				else if(op2[5:0] >= 32 && op2[7:6] == 2'B00) //está lendo o dado que tem que ser copiado de um mem_reg com acesso direto
					write_data_src = 3'B011;
				
				else if (op2[5:0] >= 32 && op2[7:6] == 2'B11) // está lendo o dado que tem que ser copiado da memória
					write_data_src = 3'B001;
				
			end
			
			else
				write_data_src = 0;			//se não for nenhum dos anteriores ou não uma instrução válida ou é ALU
			
		end
		
		//jump
		
		if(opcode == 5'B10111 || opcode == 5'B01110)
			jump = 1;
		else
			jump = 0;
			
		//halt
		
		
			
		//out_data_src

		if(optype[1]) begin
			
			if (op2[7:6] == 2'B00 && op2[5:0] < 32)		//data registers
				out_data_src = 2'B10;
				
			else if (op2[7:6] == 2'B00 && op2[5:0] >= 32) //memory registers
				out_data_src = 2'B11;
			
			else if (op2[7:6] == 2'B11)						//memory
				out_data_src = 2'B01;
			
			else														//nada
				out_data_src = 2'B00;
			
		end
		
		//out
		
		if(opcode == 5'B10001) begin
				out = 1;
				out_wtf = 1;
			end
		else begin
				out = 0;
				out_wtf = 0;
			end
		//reset
		
		if (reset || opcode == 5'B11111 || opcode == 5'B11110) begin
		
			data_reg_read = 0; data_reg_write = 0; mem_reg_read = 0; mem_reg_write = 0;
			mem_read = 0; mem_write = 0; op1src = 0;	op2src = 0; write_data_src = 0;
			jump = 0; out_data_src = 0;
			
		end
		
	end
	
endmodule
