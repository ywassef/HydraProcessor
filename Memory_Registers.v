module Memory_Registers (b, d, mem_reg_read, mem_reg_write, read_address1, read_address2, read_address3, write_address, write_data, out_data1, out_data2, out_data3, reset);
	
	input b, d, mem_reg_read, mem_reg_write, reset;					//sinais habilitadores de leitura e escrita e clocks
	
	input [15:0] read_address1, read_address2, read_address3,	//enderecos de leitura
					 write_address, write_data;							//endereco de escrita e dado de escrita
					 
	output reg [15:0] out_data1, out_data2, out_data3;				//saida de dados dos enderecos lidos em 1 e 2
					 
	reg [15:0] memory_registers [32:63];								//declaracao de do banco de registradores - enderecos vao de 32 a 63 para continuar os data_registers
	
	integer i;
		
		
	always @(posedge b)						// ciclo de leitura
		begin
			if (mem_reg_read)					//leitura habilitada
				begin
					out_data1 = memory_registers[read_address1];
					out_data2 = memory_registers[read_address2];
					out_data3 = memory_registers[read_address3];
				end	
		end
	
	always@(posedge d)						//ciclo de escrita
		begin
			
			if(reset) begin					//inicializando
				for (i = 32; i < 64; i = i + 1) begin
					memory_registers[i] = 0;
				end
				
				//caso teste
				//memory_registers[48] = 23;
				//memory_registers[52] = 27;
			end
			
			else if (mem_reg_write)				//escrita habilitada
				begin
					memory_registers[write_address] = write_data;
				end
		end

	
endmodule
