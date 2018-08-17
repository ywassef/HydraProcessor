module CPU (clk, reset, button_in, halt_key_in, data_keys, data_reg_read_t, data_reg_write_t, mem_reg_read_t, mem_reg_write_t, mem_read_t, mem_write_t, op1src_t, op2src_t, write_data_src_t, jump_t, halt_t,
				op1_test, op2_test, op3_test, write_data_test, PC_test, branch_test, a, b, c, d, bneg, opcode, optype, out_t, out_data_src_t, out_tens_1, out_ones_1, out_neg1, out_tens_2,
				out_ones_2, out_neg2, out_tens_3, out_ones_3, out_neg3, out_neg_ones1, out_neg_ones2, out_neg_ones3, imm_jump, mem_reg_value, button_io, reset_t, button_io_t, clock_div_t, PC_tens_out, PC_ones_out, PC_hundreds_out);
	
	output reg data_reg_read_t, data_reg_write_t, mem_reg_read_t, mem_reg_write_t, mem_read_t, mem_write_t; //saídas para teste
	output wire halt_t;
	output reg [1:0] op1src_t, op2src_t, out_data_src_t;
	output reg [2:0] write_data_src_t;
	output reg jump_t, out_t;
	output wire reset_t;
	output wire button_io_t;
	output wire clock_div_t;
	
	output reg [15:0] op1_test, op2_test, op3_test, write_data_test, PC_test;													
	output [4:0] opcode;
	output [2:0] optype;
	output wire a, b, c, d, bneg, branch_test;
	
	input [6:0] data_keys;																													//entrada
	input halt_key_in, reset, clk, button_in, button_io;
	
	output wire [6:0] out_tens_1, out_ones_1,																							//saídas para o display - uma para cada display por conta da pinagem
							out_tens_2, out_ones_2,
							out_tens_3, out_ones_3;
						  
	output out_neg_ones1, out_neg_ones2, out_neg_ones3, out_neg1, out_neg2, out_neg3;
	
	//----------------------------------------------0-ésimo passo: cycle generator pra criar os ciclos do processador-----------------------------------------------
	
	wire clk_debounced;
	wire clk_divided;
	wire button_io_debounced;
	wire button_state;

	assign reset_t = reset;
	
	Debouncer db_clk(.clk(clk), .n_reset(1), .button_in(button_in), .DB_out(clk_debounced));
	
	ClockDivisor cd (clk, clk_divided);
	
	assign clock_div_t = clk_divided;
	
	Debouncer db_io(.clk(clk), .n_reset(1), .button_in(button_io), .DB_out(button_io_debounced));
	
	assign button_io_t = ~button_io_debounced;
	
	//CONSERTAR CLK DE ENTRADA - NÃO USA O CLK_DEBOUNCED SÓ PRA SIMULAÇÃO
	Cycle_Generator cg (clk_divided, a, b, c, d, bneg, reset, button_state, button_pause, out_wtf);
	
	reg [15:0] PC = 0;
	
	wire [6:0] PC_hundreds, PC_tens, PC_ones;
	output wire [6:0] PC_tens_out, PC_ones_out, PC_hundreds_out;
	wire out_neg_pc, out_neg_ones_pc;

	
	BCD_Converter bcd(PC[7:0], PC_hundreds, PC_tens, PC_ones);

	Display7seg dPC100(PC_hundreds, PC_hundreds_out, 0, out_neg_pc);
	Display7seg dPC10(PC_tens, PC_tens_out, 0, out_neg_pc);
	Display7seg dPC1(PC_ones, PC_ones_out, 0, out_neg_ones_pc);
	
	//---------------------------------------------------------Ciclo A: instruction fetch and decode----------------------------------------------------------------
	
	//Instruction fetch
	
	wire [15:0] inst_mem_1, inst_mem_2;
	wire [15:0] inst1, inst2;
	
	Instruction_Memory im (PC, a, inst_mem_1, inst_mem_2, reset);
	
	assign inst1[10:0] = inst_mem_1[10:0];
	
	//se for movr substitui o imediato pelo PC + 2
	wire [4:0] temp_opcode;
	assign temp_opcode = inst_mem_1[15:11];
	
	wire [15:0] temp_imm;
	assign temp_imm = inst_mem_2;
	
	assign inst1[15:11] = temp_opcode == 5'B11010 ? 5'B11000 : temp_opcode;
	assign inst2 = temp_opcode == 5'B11010 ? (PC + 4) : temp_imm;
		
	assign opcode = inst1[15:11];
	assign optype = inst1[10:8];
	
	//Instruction decode - Control Unit
	
		
	wire data_reg_read, data_reg_write, mem_reg_read, mem_reg_write, mem_read, mem_write, halt;				//sinais habilitadores de leitura e escrita nos registradores e memória
	wire [1:0] op1src, op2src, out_data_src;																					//sinais seletores dos muxes
	wire [2:0] write_data_src;	
	wire jump, out, button_pause;																							//sinais seletores de jump, clock, habilitador de display e pausa de IO
	wire out_wtf;
	
	Control_Unit cu (inst1, inst2, data_reg_read, data_reg_write, mem_reg_read, mem_reg_write, mem_read, mem_write, op1src, op2src, write_data_src, jump, halt, out_data_src, reset, out, button_pause, out_wtf);
	
	//mudar na hora de testar na placa! Tem que ser o button_io_debounced
	IOButton iob (~button_io_debounced, button_pause, button_state);
	
	always@(*) begin
	
		data_reg_read_t = data_reg_read; data_reg_write_t = data_reg_write;		//atribuindo as saídas de teste
		mem_reg_read_t = mem_reg_read; mem_reg_write_t = mem_reg_write;
		mem_read_t = mem_read; mem_write_t = mem_write;
		op1src_t = op1src; op2src_t = op2src; out_data_src_t = out_data_src;
		write_data_src_t = write_data_src; out_t = out;
		
	end
	
	
	
	wire [15:0] op1, op2, op3;
	
	Sign_Extend_Operands seo (optype, inst1[7:0], inst2[15:8], inst2[7:0], op1, op2, op3);
	
			
	//---------------------------------------------------------Ciclo B: fetch operands------------------------------------------------------------------------------
	
	wire [15:0] write_data;											//fio de write_data é o mesmo para todos
	
	wire [15:0] rg_1, mem_1, imm_1, rg_2, mem_2, imm_2;					//saídas dos bancos de dados que vão para os muxes nas entradas da ALU
	wire [15:0] mem_address1, mem_address2, mem_address3;					//saídas dos memory registers que fornecem os endereços de memória
	
		
	Data_Registers dr (b, d, data_reg_read, data_reg_write, op2, op3, op1, write_data, rg_1, rg_2, reset);
	
	Memory_Registers mr (b, d, mem_reg_read, mem_reg_write, op2, op3, op1, op1, write_data, mem_address1, mem_address2, mem_address3, reset);
	
	Data_Memory dm (bneg, d, mem_read, mem_write, mem_address1, mem_address2, mem_address3, write_data, mem_1, mem_2, reset);
	
		
	assign imm_1 = op2;
	assign imm_2 = op3;
	
	wire [15:0] ALUop1, ALUop2;

	Mux3 ALU1 (op1src, rg_1, mem_1, imm_1, ALUop1);
	Mux3 ALU2 (op2src, rg_2, mem_2, imm_2, ALUop2);
	
	always@(ALUop1 or ALUop2 or op3)
		begin
			op1_test = ALUop1;
			op2_test = ALUop2;
			op3_test = op1;
		end
		
	//---------------------------------------------------------Ciclo C: Processamento dos dados---------------------------------------------------------------------
	
	wire branch;
	wire [15:0] out_ALU, imm_mux5;
	reg [15:0] imm_temp = 0;
	
	always@(op2 || op3) begin
		imm_temp = 0;
		imm_temp[7:0] = imm_temp[7:0] | op3;
		imm_temp[15:8] = imm_temp[15:8] | op2;
		// imm_temp = {op2, op3}
	end
	
	
	ALU alu(opcode, ALUop1, ALUop2, out_ALU, branch);
	
	assign imm_mux5 = inst2;											//o imediato de um mov é a junção do op2 e op3 em uma constante só
	
	wire [15:0] data_in;													//dados de entrada que serão escritos
	wire halt_in;
	
	Input inn(data_in, halt_in, data_keys, halt_key_in);
		
	Mux6 result(write_data_src, out_ALU, rg_1, mem_address1, mem_1, imm_mux5, data_in, write_data);
	
	Output outt(d, mem_1, rg_1, mem_address1, out_data_src, op1, c, out, reset, out_tens_1, out_ones_1, out_neg1, out_tens_2, out_ones_2, out_neg2, out_tens_3, out_ones_3,
					out_neg3,out_neg_ones1, out_neg_ones2, out_neg_ones3);
	
	always@(write_data)
		begin
			write_data_test = write_data;
		end
		
	assign branch_test = branch;
	
	//---------------------------------------------------------Ciclo D: Escrita e Update do PC----------------------------------------------------------------------
	
	//com os sinais habilitadores de escrita, os próprios módulos já vão habilitar a escrita quando for posedge d. Basta cuidar do PC agora
	
	//o op1 já recebeu o sign para poder ser usado nos bancos de registradores. Basta dar um shift left que ele está pronto pra ser usado no caso de branch
	
	// o imediato do jump corresponde à junção do op2 e op3 como uma constante só (endereço) - é igual ao imm_mux5 do ciclo anterior com shift de 1 bit para
	// virar um endereço válido
	
	wire [15:0] imm_branch = op1;
	
	always@(imm_branch)	//alteracao antes de entrar no Program Counter pra ver o valor antes e depois
		PC_test = PC;
		
	wire [15:0] PC_out;
	wire halt_total = halt || halt_in;
	assign halt_t = halt_total;
	
	//se for jmpr o valor da próxima instrução vem da pilha na memória
	output wire [15:0] imm_jump;
	output wire [15:0] mem_reg_value;
	
	assign imm_jump = (opcode == 5'B01110) || (opcode == 5'B01111) ? rg_1 : imm_mux5;
	
	assign jump_control = opcode == 5'B01111 && rg_2 == 0 ? 1 : jump;
	
	always@(*) begin 
		jump_t = jump_control;
	end

	assign mem_reg_value = mem_address1;
	
	Program_Counter pc (d, imm_branch, imm_jump, branch, jump_control, halt_total, PC, PC_out, reset);
	
	
	always@(PC_out)
		begin
			PC = PC_out;
		end
	
	
endmodule
