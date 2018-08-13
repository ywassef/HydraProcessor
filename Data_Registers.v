module Data_Registers (b, d, data_reg_read, data_reg_write, read_address1, read_address2, write_address, write_data, out_data1, out_data2, reset);
	
	input b, d, data_reg_read, data_reg_write, reset;		//sinais habilitadores de leitura e escrita e clocks
	
	input [15:0] read_address1, read_address2,		//enderecos de leitura
					 write_address, write_data;			//endereco de escrita e dado de escrita
					 
	output reg [15:0] out_data1, out_data2;			//saida de dados dos enderecos lidos em 1 e 2
					 
	reg [15:0] data_registers [0:31];					//declaracao de do banco de resgitradores - 32 registradores
	
	integer i;
	

		
	always @(posedge b)									//ciclo de leitura
		begin
			if (data_reg_read)							//leitura habilitada
				begin
					out_data1 = data_registers[read_address1];
					out_data2 = data_registers[read_address2];			
				end
		end
	
	always@(posedge d)									//ciclo de escrita
		begin
			if (reset) begin								//inicializando os registradores
				for (i = 0; i < 32; i = i + 1) begin
					data_registers[i] = 0;
				end
				
				//caso teste
				//data_registers[1] = 15;
				
				//inicializando o ponteiro de pilha
				data_registers[29] = 69;
				
			end
			
			else if (data_reg_write)							//escrita habilitada
					data_registers[write_address] = write_data;	
		end
	 
	
endmodule
