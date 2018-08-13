module Data_Memory (bneg, d, mem_read, mem_write, read_address1, read_address2, write_address, write_data, out_data1, out_data2, reset);
	
	input bneg, d, mem_read, mem_write, reset;	//sinais habilitadores de leitura e escrita e clocks
	
	input [15:0] read_address1, read_address2,	//enderecos de leitura
					 write_address, write_data;		//endereco de escrita e dado de escrita
					 
	output reg [15:0] out_data1, out_data2;		//saida de dados dos enderecos lidos em 1 e 2
					 
	reg [15:0] memory [0:69];							//declaracao de memoria - 256 é apenas um valor de teste
	
	integer i;
	
			
	always @(posedge bneg)					// ciclo de leitura da memoria é negedge de b pois no posedge teve que buscar os endereços de memória nos registradores
		begin
			if (mem_read)						//leitura habilitada
				begin
					out_data1 = memory[read_address1];
					out_data2 = memory[read_address2];			
				end	
		end
	
	 always@(posedge d)					//ciclo de escrita
		begin
			if (reset) begin			// inicializando a memoria
				for (i = 0; i < 49; i = i + 1) 
						memory[i] = 0;
				
				//caso teste
				//memory[23] = 5;
			end
			
			else if (mem_write)					//escrita habilitada
				begin
					memory[write_address] = write_data;
				end
		end
	
endmodule
