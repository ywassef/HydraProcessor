module Instruction_Memory (PC, a, out1, out2, reset);
	
	input [15:0] PC;								// program counter contem o endereco da instrução
	input a, reset;											// ciclo para instruction fetch
	
	output reg [15:0] out1, out2;				//saida da instrução em duas partes: out1 = opcode, optype e op1 / out2 = op2 e op3
	
	reg [15:0] inst_memory [0:609];			//declaracao de memoria - cabe 40 instruções para teste
	integer i;
	
	always@(reset==1)											// inicializando a memoria com todas as posições contendo nop
		begin
			
						
		end
			

	always@(posedge a)							//ciclo de instruction fetch é no posedge do a
		begin
		
			if (reset) begin
				
				for (i = 0; i < 609; i = i + 1) begin
					if (i % 2 == 0)
						inst_memory[i] = 16'B1111000000000000;		//Cada instrução ocupa duas posições de memória.
					else														//Logo, para colocar nops, preciso colocar a primeira e a segunda parte separado
						inst_memory[i] = 0;
				end
				
				
				 //escrever as instruções manualmente aqui
				 
				//-------------------------------------------------------------------------
				
				//ALGORITMO SINTÉTICO - COMPLEMENTAR À P.A.
				
				/*
				
				//in [r52]
				inst_memory[0] = 16'B1000010011110100;
				inst_memory[1] = 0;

				//sub r26, [r52], 4
				inst_memory[2] = 16'B0000111000011010;
				inst_memory[3] = 16'B1111010000000100;

				//sll r26, r26
				inst_memory[4] = 16'B0010011000011010;
				inst_memory[5] = 16'B0001101000000000;

				//sal r26, r26
				inst_memory[6] = 16'B0011011000011010;
				inst_memory[7] = 16'B0001101000000000;

				//out disp1, r26
				inst_memory[8] = 16'B1000101000000001;
				inst_memory[9] = 16'B0001101000000000;

				//sar r26, r26
				inst_memory[10] = 16'B0011111000011010;
				inst_memory[11] = 16'B0001101000000000;

				//and r26, r26, 4
				inst_memory[12] = 16'B0100011000011010;
				inst_memory[13] = 16'B0001101000000100;

				//slr [r52], r26
				inst_memory[14] = 16'B0010111011110100;
				inst_memory[15] = 16'B0001101000000000;

				//blt X, [r52], r26
				inst_memory[16] = 16'B1010001100001100;
				inst_memory[17] = 16'B1111010000011010;

				//X: out disp2, r26
				inst_memory[24] = 16'B1000101000000010;
				inst_memory[25] = 16'B0001101000000000;
				
				//seq r10, r26, 4
				inst_memory[26] = 16'B0110111000001010;
				inst_memory[27] = 16'B0001101000000100;

				//bgt Y, r10, 0
				inst_memory[28] = 16'B1010101000010100;
				inst_memory[29] = 16'B0000101000000000;

				//Y: slt r10, r26, 1
				inst_memory[40] = 16'B0110011000001010;
				inst_memory[41] = 16'B0001101000000001;

				//out disp3, r10
				inst_memory[42] = 16'B1000101000000011;
				inst_memory[43] = 16'B0000101000000000;

				//not r10, r10
				inst_memory[44] = 16'B0100111000001010;
				inst_memory[45] = 16'B0000101000000000;
				
				//xor r10, r10, -3
				inst_memory[46] = 16'B0101111000001010;
				inst_memory[47] = 16'B0000101011111101;

				//or r10, r10, 1
				inst_memory[48] = 16'B0101011000001010;
				inst_memory[49] = 16'B0000101000000001;
				
				//out disp3, r10
				inst_memory[50] = 16'B1000101000000011;
				inst_memory[51] = 16'B0000101000000000;
				
				*/
								 
				//-------------------------------------------------------------------------
				 
				/*
				
				//P.A:
				
				//in r20						número de termos da PA
				inst_memory[0] = 16'B1000010000010100;
				inst_memory[1] = 0;
				
				//mov r15, 1				inicializa o contador
				inst_memory[2] = 16'B1100010000001111;
				inst_memory[3] = 16'B0000000000000001;
				
				//in r9						razão da PA
				inst_memory[4] = 16'B1000010000001001;
				inst_memory[5] = 0;
				
				//mov r48, 15
				inst_memory[6] = 16'B1100010000110000;
				inst_memory[7] = 16'B0000000000001111;
												
				//mov [r48], 0				primeiro termo
				inst_memory[8] = 16'B1100010011110000;
				inst_memory[9] = 0;
				
				//K: beq 10, r15, r20 ---- vai pra posição 22
				inst_memory[10] = 16'B1010101100001011;
				inst_memory[11] = 16'B0000111100010100;
				
				//add r10, [r48], r9
				inst_memory[12] = 16'B0000011100001010;
				inst_memory[13] = 16'B1111000000001001;
				
				//copy [r48], r10
				inst_memory[14] = 16'B1100111011110000;
				inst_memory[15] = 16'B0000101000000000;
				
				//out disp1, r10
				inst_memory[16] = 16'B1000101000000001;
				inst_memory[17] = 16'B0000101000000000;
				
				//add r15, r15, 1
				inst_memory[18] = 16'B0000011000001111;
				inst_memory[19] = 16'B0000111100000001;
				
				//jmp K
				inst_memory[20] = 16'B1011100000000000;
				inst_memory[21] = 16'B0000000000000101;
				
				//X: halt
				inst_memory[22] = 16'B1111000000000000;
				inst_memory[23] = 0;
				
				*/
				 
				//-------------------------------------------------------------------------
				
				/*
				
				//FIBONACCI
				 
				//in r20
				inst_memory[0] = 16'B1000010000010100;
				inst_memory[1] = 0;
				
				//mov r15, 2
				inst_memory[2] = 16'B1100010000001111;
				inst_memory[3] = 16'B0000000000000010;
				
				//mov [r48], 0
				inst_memory[4] = 16'B1100010011110000;
				inst_memory[5] = 0;
				
				//mov [r52], 1
				inst_memory[6] = 16'B1100010011110100;
				inst_memory[7] = 16'B0000000000000001;
				
				//beq Y, r20, 1
				inst_memory[8] = 16'B1010101000010010;
				inst_memory[9] = 16'B0001010000000001;
				
				//beq Z, r10, 2
				inst_memory[10] = 16'B1010101000001111;
				inst_memory[11] = 16'B0001010000000010;
				
				//out disp1, [r48]
				inst_memory[12] = 16'B1000101000000001;
				inst_memory[13] = 16'B1111000000000000;
				
				//out disp1, [r52]
				inst_memory[14] = 16'B1000101000000001;
				inst_memory[15] = 16'B1111010000000000;
				
				//K: beq X, r15, r20
				inst_memory[16] = 16'B1010101100001111;
				inst_memory[17] = 16'B0000111100010100;
				
				//add r10, [r48], [r52]
				inst_memory[18] = 16'B0000011100001010;
				inst_memory[19] = 16'B1111000011110100;
				
				//copy [r48], [r52]
				inst_memory[20] = 16'B1100111011110000;
				inst_memory[21] = 16'B1111010000000000;
				
				//copy [r52], r10
				inst_memory[22] = 16'B1100111011110100;
				inst_memory[23] = 16'B0000101000000000;
				
				//out disp1, r10
				inst_memory[24] = 16'B1000101000000001;
				inst_memory[25] = 16'B0000101000000000;
				
				//add r15, r15, 1
				inst_memory[26] = 16'B0000011000001111;
				inst_memory[27] = 16'B0000111100000001;
				
				//jmp K
				inst_memory[28] = 16'B1011100000000000;
				inst_memory[29] = 16'B0000000000001000;
				
				//Z: out disp1, [r48]
				inst_memory[30] = 16'B1000101000000001;
				inst_memory[31] = 16'B1111000000000000;
				
				//out disp1, [r52]
				inst_memory[32] = 16'B1000101000000001;
				inst_memory[33] = 16'B1111010000000000;
				
				//jmp X
				inst_memory[34] = 16'B1011100000000000;
				inst_memory[35] = 16'B0000000000010100;
				
				//Y: out disp1, [r48]
				inst_memory[36] = 16'B1000101000000001;
				inst_memory[37] = 16'B1111000000000000;
				
				//jmp X
				inst_memory[38] = 16'B1011100000000000;
				inst_memory[39] = 16'B0000000000010100;
				
				//X: halt
				inst_memory[40] = 16'B1111000000000000;
				inst_memory[41] = 0;
				
				*/
				
				//-------------------------------------------------------------
				
								//mov r31, -1
				inst_memory[0] = 16'B1100010000011111;
				inst_memory[1] = 16'B1111111111111111;

				//jmp MAIN
				inst_memory[2] = 16'B1011100000000000;
				inst_memory[3] = 16'B0000000101110110;

				//F000:
				inst_memory[4] = 16'B1111100000000000;
				inst_memory[5] = 0;

				//add r31, r31 2
				inst_memory[6] = 16'B0000011000011111;
				inst_memory[7] = 16'B0001111100000010;

				//add r29, r29, 1
				inst_memory[8] = 16'B0000011000011101;
				inst_memory[9] = 16'B0001110100000001;

				//sub r0, r31, 1
				inst_memory[10] = 16'B0000111000000000;
				inst_memory[11] = 16'B0001111100000001;

				//copy r32, r0
				inst_memory[12] = 16'B1100111000100000;
				inst_memory[13] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[14] = 16'B1100111000111111;
				inst_memory[15] = 16'B0001110100000000;

				//copy [r32], [r63]
				inst_memory[16] = 16'B1100111011100000;
				inst_memory[17] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[18] = 16'B0000011000011101;
				inst_memory[19] = 16'B0001110100000001;

				//sub r0, r31, 0
				inst_memory[20] = 16'B0000111000000000;
				inst_memory[21] = 16'B0001111100000000;

				//copy r32, r0
				inst_memory[22] = 16'B1100111000100000;
				inst_memory[23] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[24] = 16'B1100111000111111;
				inst_memory[25] = 16'B0001110100000000;

				//copy [r32], [r63]
				inst_memory[26] = 16'B1100111011100000;
				inst_memory[27] = 16'B1111111100000000;

				//sub r0, r31, 1
				inst_memory[28] = 16'B0000111000000000;
				inst_memory[29] = 16'B0001111100000001;

				//copy r32, r0
				inst_memory[30] = 16'B1100111000100000;
				inst_memory[31] = 16'B0000000000000000;

				//seq r0, [r32], 0
				inst_memory[32] = 16'B0110111000000000;
				inst_memory[33] = 16'B1110000000000000;

				//mov r1, L000
				inst_memory[34] = 16'B1100010000000001;
				inst_memory[35] = 16'B0000000000101110;

				//jmprc r1, r0
				inst_memory[36] = 16'B0111101100000000;
				inst_memory[37] = 16'B0000000100000000;

				//sub r1, r31, 0
				inst_memory[38] = 16'B0000111000000001;
				inst_memory[39] = 16'B0001111100000000;

				//copy r32, r1
				inst_memory[40] = 16'B1100111000100000;
				inst_memory[41] = 16'B0000000100000000;

				//copy r30, [r32]
				inst_memory[42] = 16'B1100111000011110;
				inst_memory[43] = 16'B1110000000000000;

				//jmp L001
				inst_memory[44] = 16'B1011100000000000;
				inst_memory[45] = 16'B0000000001100100;

				//L000:
				inst_memory[46] = 16'B1111100000000000;
				inst_memory[47] = 0;

				//copy r33, r63
				inst_memory[48] = 16'B1100111000100001;
				inst_memory[49] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[50] = 16'B0000111000011101;
				inst_memory[51] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[52] = 16'B1100111000111111;
				inst_memory[53] = 16'B0001110100000000;

				//sub r1, r31, 0
				inst_memory[54] = 16'B0000111000000001;
				inst_memory[55] = 16'B0001111100000000;

				//copy r34, r1
				inst_memory[56] = 16'B1100111000100010;
				inst_memory[57] = 16'B0000000100000000;

				//sub r1, r31, 0
				inst_memory[58] = 16'B0000111000000001;
				inst_memory[59] = 16'B0001111100000000;

				//copy r35, r1
				inst_memory[60] = 16'B1100111000100011;
				inst_memory[61] = 16'B0000000100000000;

				//sub r1, r31, 1
				inst_memory[62] = 16'B0000111000000001;
				inst_memory[63] = 16'B0001111100000001;

				//copy r36, r1
				inst_memory[64] = 16'B1100111000100100;
				inst_memory[65] = 16'B0000000100000000;

				//div r1, [r35], [r36]
				inst_memory[66] = 16'B0001111100000001;
				inst_memory[67] = 16'B1110001111100100;

				//sub r2, r31, 1
				inst_memory[68] = 16'B0000111000000010;
				inst_memory[69] = 16'B0001111100000001;

				//copy r35, r2
				inst_memory[70] = 16'B1100111000100011;
				inst_memory[71] = 16'B0000001000000000;

				//mult r2, r1, [r35]
				inst_memory[72] = 16'B0001011100000010;
				inst_memory[73] = 16'B0000000111100011;

				//sub r1, [r34], r2
				inst_memory[74] = 16'B0000111100000001;
				inst_memory[75] = 16'B1110001000000010;

				//sub r2, r31, 1
				inst_memory[76] = 16'B0000111000000010;
				inst_memory[77] = 16'B0001111100000001;

				//copy r34, r2
				inst_memory[78] = 16'B1100111000100010;
				inst_memory[79] = 16'B0000001000000000;

				//copy [r63], [r34]
				inst_memory[80] = 16'B1100111011111111;
				inst_memory[81] = 16'B1110001000000000;

				//sub r29, r29, 1
				inst_memory[82] = 16'B0000111000011101;
				inst_memory[83] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[84] = 16'B1100111000111111;
				inst_memory[85] = 16'B0001110100000000;

				//copy [r63], r1
				inst_memory[86] = 16'B1100111011111111;
				inst_memory[87] = 16'B0000000100000000;

				//sub r29, r29, 1
				inst_memory[88] = 16'B0000111000011101;
				inst_memory[89] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[90] = 16'B1100111000111111;
				inst_memory[91] = 16'B0001110100000000;

				//movr [r33], 1
				inst_memory[92] = 16'B1101010011100001;
				inst_memory[93] = 16'B0000000000000001;

				//jmp F000
				inst_memory[94] = 16'B1011100000000000;
				inst_memory[95] = 16'B0000000000000100;

				//copy r1, r30
				inst_memory[96] = 16'B1100111000000001;
				inst_memory[97] = 16'B0001111000000000;

				//copy r30, r1
				inst_memory[98] = 16'B1100111000011110;
				inst_memory[99] = 16'B0000000100000000;

				//L001:
				inst_memory[100] = 16'B1111100000000000;
				inst_memory[101] = 0;

				//sub r31, r31 2
				inst_memory[102] = 16'B0000111000011111;
				inst_memory[103] = 16'B0001111100000010;

				//add r29, r29, 1
				inst_memory[104] = 16'B0000011000011101;
				inst_memory[105] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[106] = 16'B1100111000111111;
				inst_memory[107] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[108] = 16'B1100111000000000;
				inst_memory[109] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[110] = 16'B0111001000000000;
				inst_memory[111] = 16'B0000000000000000;

				//F001:
				inst_memory[112] = 16'B1111100000000000;
				inst_memory[113] = 0;

				//add r31, r31 6
				inst_memory[114] = 16'B0000011000011111;
				inst_memory[115] = 16'B0001111100000110;

				//add r29, r29, 1
				inst_memory[116] = 16'B0000011000011101;
				inst_memory[117] = 16'B0001110100000001;

				//sub r0, r31, 1
				inst_memory[118] = 16'B0000111000000000;
				inst_memory[119] = 16'B0001111100000001;

				//copy r33, r0
				inst_memory[120] = 16'B1100111000100001;
				inst_memory[121] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[122] = 16'B1100111000111111;
				inst_memory[123] = 16'B0001110100000000;

				//copy [r33], [r63]
				inst_memory[124] = 16'B1100111011100001;
				inst_memory[125] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[126] = 16'B0000011000011101;
				inst_memory[127] = 16'B0001110100000001;

				//sub r0, r31, 0
				inst_memory[128] = 16'B0000111000000000;
				inst_memory[129] = 16'B0001111100000000;

				//copy r33, r0
				inst_memory[130] = 16'B1100111000100001;
				inst_memory[131] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[132] = 16'B1100111000111111;
				inst_memory[133] = 16'B0001110100000000;

				//copy [r33], [r63]
				inst_memory[134] = 16'B1100111011100001;
				inst_memory[135] = 16'B1111111100000000;

				//sub r0, r31, 2
				inst_memory[136] = 16'B0000111000000000;
				inst_memory[137] = 16'B0001111100000010;

				//copy r33, r0
				inst_memory[138] = 16'B1100111000100001;
				inst_memory[139] = 16'B0000000000000000;

				//mov [r33], 0
				inst_memory[140] = 16'B1100010011100001;
				inst_memory[141] = 16'B0000000000000000;

				//L002:
				inst_memory[142] = 16'B1111100000000000;
				inst_memory[143] = 0;

				//sub r0, r31, 2
				inst_memory[144] = 16'B0000111000000000;
				inst_memory[145] = 16'B0001111100000010;

				//copy r33, r0
				inst_memory[146] = 16'B1100111000100001;
				inst_memory[147] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[148] = 16'B0000111000000000;
				inst_memory[149] = 16'B0001111100000001;

				//copy r34, r0
				inst_memory[150] = 16'B1100111000100010;
				inst_memory[151] = 16'B0000000000000000;

				//sub r0, [r34], 1
				inst_memory[152] = 16'B0000111000000000;
				inst_memory[153] = 16'B1110001000000001;

				//slt r2, [r33], r0
				inst_memory[154] = 16'B0110011100000010;
				inst_memory[155] = 16'B1110000100000000;

				//mov r0, L003
				inst_memory[156] = 16'B1100010000000000;
				inst_memory[157] = 16'B0000000101101010;

				//jmprc r0, r2
				inst_memory[158] = 16'B0111101100000000;
				inst_memory[159] = 16'B0000000000000010;

				//sub r0, r31, 2
				inst_memory[160] = 16'B0000111000000000;
				inst_memory[161] = 16'B0001111100000010;

				//copy r33, r0
				inst_memory[162] = 16'B1100111000100001;
				inst_memory[163] = 16'B0000000000000000;

				//sub r0, r31, 4
				inst_memory[164] = 16'B0000111000000000;
				inst_memory[165] = 16'B0001111100000100;

				//copy r34, r0
				inst_memory[166] = 16'B1100111000100010;
				inst_memory[167] = 16'B0000000000000000;

				//copy [r34], [r33]
				inst_memory[168] = 16'B1100111011100010;
				inst_memory[169] = 16'B1110000100000000;

				//sub r0, r31, 2
				inst_memory[170] = 16'B0000111000000000;
				inst_memory[171] = 16'B0001111100000010;

				//copy r33, r0
				inst_memory[172] = 16'B1100111000100001;
				inst_memory[173] = 16'B0000000000000000;

				//add r0, [r33], 1
				inst_memory[174] = 16'B0000011000000000;
				inst_memory[175] = 16'B1110000100000001;

				//sub r3, r31, 3
				inst_memory[176] = 16'B0000111000000011;
				inst_memory[177] = 16'B0001111100000011;

				//copy r33, r3
				inst_memory[178] = 16'B1100111000100001;
				inst_memory[179] = 16'B0000001100000000;

				//copy [r33], r0
				inst_memory[180] = 16'B1100111011100001;
				inst_memory[181] = 16'B0000000000000000;

				//L004:
				inst_memory[182] = 16'B1111100000000000;
				inst_memory[183] = 0;

				//sub r0, r31, 3
				inst_memory[184] = 16'B0000111000000000;
				inst_memory[185] = 16'B0001111100000011;

				//copy r33, r0
				inst_memory[186] = 16'B1100111000100001;
				inst_memory[187] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[188] = 16'B0000111000000000;
				inst_memory[189] = 16'B0001111100000001;

				//copy r34, r0
				inst_memory[190] = 16'B1100111000100010;
				inst_memory[191] = 16'B0000000000000000;

				//slt r0, [r33], [r34]
				inst_memory[192] = 16'B0110011100000000;
				inst_memory[193] = 16'B1110000111100010;

				//mov r3, L005
				inst_memory[194] = 16'B1100010000000011;
				inst_memory[195] = 16'B0000000100000010;

				//jmprc r3, r0
				inst_memory[196] = 16'B0111101100000000;
				inst_memory[197] = 16'B0000001100000000;

				//sub r3, r31, 3
				inst_memory[198] = 16'B0000111000000011;
				inst_memory[199] = 16'B0001111100000011;

				//copy r33, r3
				inst_memory[200] = 16'B1100111000100001;
				inst_memory[201] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[202] = 16'B0000111000000011;
				inst_memory[203] = 16'B0001111100000000;

				//copy r34, r3
				inst_memory[204] = 16'B1100111000100010;
				inst_memory[205] = 16'B0000001100000000;

				//copy r4, [r34]
				inst_memory[206] = 16'B1100111000000100;
				inst_memory[207] = 16'B1110001000000000;

				//sub r4, r4, [r33]
				inst_memory[208] = 16'B0000111100000100;
				inst_memory[209] = 16'B0000010011100001;

				//copy r34, r4
				inst_memory[210] = 16'B1100111000100010;
				inst_memory[211] = 16'B0000010000000000;

				//sub r3, r31, 4
				inst_memory[212] = 16'B0000111000000011;
				inst_memory[213] = 16'B0001111100000100;

				//copy r35, r3
				inst_memory[214] = 16'B1100111000100011;
				inst_memory[215] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[216] = 16'B0000111000000011;
				inst_memory[217] = 16'B0001111100000000;

				//copy r36, r3
				inst_memory[218] = 16'B1100111000100100;
				inst_memory[219] = 16'B0000001100000000;

				//copy r4, [r36]
				inst_memory[220] = 16'B1100111000000100;
				inst_memory[221] = 16'B1110010000000000;

				//sub r4, r4, [r35]
				inst_memory[222] = 16'B0000111100000100;
				inst_memory[223] = 16'B0000010011100011;

				//copy r36, r4
				inst_memory[224] = 16'B1100111000100100;
				inst_memory[225] = 16'B0000010000000000;

				//slt r3, [r34], [r36]
				inst_memory[226] = 16'B0110011100000011;
				inst_memory[227] = 16'B1110001011100100;

				//mov r4, L006
				inst_memory[228] = 16'B1100010000000100;
				inst_memory[229] = 16'B0000000011110010;

				//jmprc r4, r3
				inst_memory[230] = 16'B0111101100000000;
				inst_memory[231] = 16'B0000010000000011;

				//sub r4, r31, 3
				inst_memory[232] = 16'B0000111000000100;
				inst_memory[233] = 16'B0001111100000011;

				//copy r34, r4
				inst_memory[234] = 16'B1100111000100010;
				inst_memory[235] = 16'B0000010000000000;

				//sub r4, r31, 4
				inst_memory[236] = 16'B0000111000000100;
				inst_memory[237] = 16'B0001111100000100;

				//copy r36, r4
				inst_memory[238] = 16'B1100111000100100;
				inst_memory[239] = 16'B0000010000000000;

				//copy [r36], [r34]
				inst_memory[240] = 16'B1100111011100100;
				inst_memory[241] = 16'B1110001000000000;

				//L006:
				inst_memory[242] = 16'B1111100000000000;
				inst_memory[243] = 0;

				//sub r3, r31, 3
				inst_memory[244] = 16'B0000111000000011;
				inst_memory[245] = 16'B0001111100000011;

				//copy r34, r3
				inst_memory[246] = 16'B1100111000100010;
				inst_memory[247] = 16'B0000001100000000;

				//add r3, [r34], 1
				inst_memory[248] = 16'B0000011000000011;
				inst_memory[249] = 16'B1110001000000001;

				//sub r4, r31, 3
				inst_memory[250] = 16'B0000111000000100;
				inst_memory[251] = 16'B0001111100000011;

				//copy r34, r4
				inst_memory[252] = 16'B1100111000100010;
				inst_memory[253] = 16'B0000010000000000;

				//copy [r34], r3
				inst_memory[254] = 16'B1100111011100010;
				inst_memory[255] = 16'B0000001100000000;

				//jmp L004
				inst_memory[256] = 16'B1011100000000000;
				inst_memory[257] = 16'B0000000010110110;

				//L005:
				inst_memory[258] = 16'B1111100000000000;
				inst_memory[259] = 0;

				//sub r0, r31, 2
				inst_memory[260] = 16'B0000111000000000;
				inst_memory[261] = 16'B0001111100000010;

				//copy r34, r0
				inst_memory[262] = 16'B1100111000100010;
				inst_memory[263] = 16'B0000000000000000;

				//sub r0, r31, 4
				inst_memory[264] = 16'B0000111000000000;
				inst_memory[265] = 16'B0001111100000100;

				//copy r36, r0
				inst_memory[266] = 16'B1100111000100100;
				inst_memory[267] = 16'B0000000000000000;

				//seq r0, [r36], [r34]
				inst_memory[268] = 16'B0110111100000000;
				inst_memory[269] = 16'B1110010011100010;

				//not r0, r0
				inst_memory[270] = 16'B0100111000000000;
				inst_memory[271] = 16'B0000000000000000;

				//mov r3, L007
				inst_memory[272] = 16'B1100010000000011;
				inst_memory[273] = 16'B0000000101011010;

				//jmprc r3, r0
				inst_memory[274] = 16'B0111101100000000;
				inst_memory[275] = 16'B0000001100000000;

				//sub r3, r31, 2
				inst_memory[276] = 16'B0000111000000011;
				inst_memory[277] = 16'B0001111100000010;

				//copy r34, r3
				inst_memory[278] = 16'B1100111000100010;
				inst_memory[279] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[280] = 16'B0000111000000011;
				inst_memory[281] = 16'B0001111100000000;

				//copy r36, r3
				inst_memory[282] = 16'B1100111000100100;
				inst_memory[283] = 16'B0000001100000000;

				//copy r4, [r36]
				inst_memory[284] = 16'B1100111000000100;
				inst_memory[285] = 16'B1110010000000000;

				//sub r4, r4, [r34]
				inst_memory[286] = 16'B0000111100000100;
				inst_memory[287] = 16'B0000010011100010;

				//copy r36, r4
				inst_memory[288] = 16'B1100111000100100;
				inst_memory[289] = 16'B0000010000000000;

				//sub r3, r31, 5
				inst_memory[290] = 16'B0000111000000011;
				inst_memory[291] = 16'B0001111100000101;

				//copy r37, r3
				inst_memory[292] = 16'B1100111000100101;
				inst_memory[293] = 16'B0000001100000000;

				//copy [r37], [r36]
				inst_memory[294] = 16'B1100111011100101;
				inst_memory[295] = 16'B1110010000000000;

				//sub r3, r31, 4
				inst_memory[296] = 16'B0000111000000011;
				inst_memory[297] = 16'B0001111100000100;

				//copy r36, r3
				inst_memory[298] = 16'B1100111000100100;
				inst_memory[299] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[300] = 16'B0000111000000011;
				inst_memory[301] = 16'B0001111100000000;

				//copy r37, r3
				inst_memory[302] = 16'B1100111000100101;
				inst_memory[303] = 16'B0000001100000000;

				//copy r4, [r37]
				inst_memory[304] = 16'B1100111000000100;
				inst_memory[305] = 16'B1110010100000000;

				//sub r4, r4, [r36]
				inst_memory[306] = 16'B0000111100000100;
				inst_memory[307] = 16'B0000010011100100;

				//copy r37, r4
				inst_memory[308] = 16'B1100111000100101;
				inst_memory[309] = 16'B0000010000000000;

				//sub r3, r31, 2
				inst_memory[310] = 16'B0000111000000011;
				inst_memory[311] = 16'B0001111100000010;

				//copy r38, r3
				inst_memory[312] = 16'B1100111000100110;
				inst_memory[313] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[314] = 16'B0000111000000011;
				inst_memory[315] = 16'B0001111100000000;

				//copy r39, r3
				inst_memory[316] = 16'B1100111000100111;
				inst_memory[317] = 16'B0000001100000000;

				//copy r4, [r39]
				inst_memory[318] = 16'B1100111000000100;
				inst_memory[319] = 16'B1110011100000000;

				//sub r4, r4, [r38]
				inst_memory[320] = 16'B0000111100000100;
				inst_memory[321] = 16'B0000010011100110;

				//copy r39, r4
				inst_memory[322] = 16'B1100111000100111;
				inst_memory[323] = 16'B0000010000000000;

				//copy [r39], [r37]
				inst_memory[324] = 16'B1100111011100111;
				inst_memory[325] = 16'B1110010100000000;

				//sub r3, r31, 5
				inst_memory[326] = 16'B0000111000000011;
				inst_memory[327] = 16'B0001111100000101;

				//copy r37, r3
				inst_memory[328] = 16'B1100111000100101;
				inst_memory[329] = 16'B0000001100000000;

				//sub r3, r31, 4
				inst_memory[330] = 16'B0000111000000011;
				inst_memory[331] = 16'B0001111100000100;

				//copy r39, r3
				inst_memory[332] = 16'B1100111000100111;
				inst_memory[333] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[334] = 16'B0000111000000011;
				inst_memory[335] = 16'B0001111100000000;

				//copy r40, r3
				inst_memory[336] = 16'B1100111000101000;
				inst_memory[337] = 16'B0000001100000000;

				//copy r4, [r40]
				inst_memory[338] = 16'B1100111000000100;
				inst_memory[339] = 16'B1110100000000000;

				//sub r4, r4, [r39]
				inst_memory[340] = 16'B0000111100000100;
				inst_memory[341] = 16'B0000010011100111;

				//copy r40, r4
				inst_memory[342] = 16'B1100111000101000;
				inst_memory[343] = 16'B0000010000000000;

				//copy [r40], [r37]
				inst_memory[344] = 16'B1100111011101000;
				inst_memory[345] = 16'B1110010100000000;

				//L007:
				inst_memory[346] = 16'B1111100000000000;
				inst_memory[347] = 0;

				//sub r0, r31, 2
				inst_memory[348] = 16'B0000111000000000;
				inst_memory[349] = 16'B0001111100000010;

				//copy r37, r0
				inst_memory[350] = 16'B1100111000100101;
				inst_memory[351] = 16'B0000000000000000;

				//add r0, [r37], 1
				inst_memory[352] = 16'B0000011000000000;
				inst_memory[353] = 16'B1110010100000001;

				//sub r3, r31, 2
				inst_memory[354] = 16'B0000111000000011;
				inst_memory[355] = 16'B0001111100000010;

				//copy r37, r3
				inst_memory[356] = 16'B1100111000100101;
				inst_memory[357] = 16'B0000001100000000;

				//copy [r37], r0
				inst_memory[358] = 16'B1100111011100101;
				inst_memory[359] = 16'B0000000000000000;

				//jmp L002
				inst_memory[360] = 16'B1011100000000000;
				inst_memory[361] = 16'B0000000010001110;

				//L003:
				inst_memory[362] = 16'B1111100000000000;
				inst_memory[363] = 0;

				//sub r31, r31 6
				inst_memory[364] = 16'B0000111000011111;
				inst_memory[365] = 16'B0001111100000110;

				//add r29, r29, 1
				inst_memory[366] = 16'B0000011000011101;
				inst_memory[367] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[368] = 16'B1100111000111111;
				inst_memory[369] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[370] = 16'B1100111000000000;
				inst_memory[371] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[372] = 16'B0111001000000000;
				inst_memory[373] = 16'B0000000000000000;

				//MAIN:
				inst_memory[374] = 16'B1111100000000000;
				inst_memory[375] = 0;

				//add r29, 0, 69
				inst_memory[376] = 16'B0000010000011101;
				inst_memory[377] = 16'B0000000001000101;

				//copy r63, r29
				inst_memory[378] = 16'B1100111000111111;
				inst_memory[379] = 16'B0001110100000000;

				//add r31, r31 6
				inst_memory[380] = 16'B0000011000011111;
				inst_memory[381] = 16'B0001111100000110;

				//input r0
				inst_memory[382] = 16'B1000010000000000;
				inst_memory[383] = 16'B0000000000000000;

				//sub r2, r31, 0
				inst_memory[384] = 16'B0000111000000010;
				inst_memory[385] = 16'B0001111100000000;

				//copy r37, r2
				inst_memory[386] = 16'B1100111000100101;
				inst_memory[387] = 16'B0000001000000000;

				//copy [r37], r0
				inst_memory[388] = 16'B1100111011100101;
				inst_memory[389] = 16'B0000000000000000;

				//sub r0, r31, 0
				inst_memory[390] = 16'B0000111000000000;
				inst_memory[391] = 16'B0001111100000000;

				//copy r37, r0
				inst_memory[392] = 16'B1100111000100101;
				inst_memory[393] = 16'B0000000000000000;

				//seq r0, [r37], 1
				inst_memory[394] = 16'B0110111000000000;
				inst_memory[395] = 16'B1110010100000001;

				//mov r2, L008
				inst_memory[396] = 16'B1100010000000010;
				inst_memory[397] = 16'B0000001000011000;

				//jmprc r2, r0
				inst_memory[398] = 16'B0111101100000000;
				inst_memory[399] = 16'B0000001000000000;

				//sub r2, r31, 1
				inst_memory[400] = 16'B0000111000000010;
				inst_memory[401] = 16'B0001111100000001;

				//copy r37, r2
				inst_memory[402] = 16'B1100111000100101;
				inst_memory[403] = 16'B0000001000000000;

				//mov [r37], 0
				inst_memory[404] = 16'B1100010011100101;
				inst_memory[405] = 16'B0000000000000000;

				//L010:
				inst_memory[406] = 16'B1111100000000000;
				inst_memory[407] = 0;

				//sub r0, r31, 1
				inst_memory[408] = 16'B0000111000000000;
				inst_memory[409] = 16'B0001111100000001;

				//copy r37, r0
				inst_memory[410] = 16'B1100111000100101;
				inst_memory[411] = 16'B0000000000000000;

				//slt r0, [r37], 4
				inst_memory[412] = 16'B0110011000000000;
				inst_memory[413] = 16'B1110010100000100;

				//mov r2, L011
				inst_memory[414] = 16'B1100010000000010;
				inst_memory[415] = 16'B0000000111001010;

				//jmprc r2, r0
				inst_memory[416] = 16'B0111101100000000;
				inst_memory[417] = 16'B0000001000000000;

				//input r2
				inst_memory[418] = 16'B1000010000000010;
				inst_memory[419] = 16'B0000000000000000;

				//sub r3, r31, 1
				inst_memory[420] = 16'B0000111000000011;
				inst_memory[421] = 16'B0001111100000001;

				//copy r37, r3
				inst_memory[422] = 16'B1100111000100101;
				inst_memory[423] = 16'B0000001100000000;

				//add r3, 2, [r37]
				inst_memory[424] = 16'B0000010100000011;
				inst_memory[425] = 16'B0000001011100101;

				//sub r3, r31, r3
				inst_memory[426] = 16'B0000111100000011;
				inst_memory[427] = 16'B0001111100000011;

				//copy r40, r3
				inst_memory[428] = 16'B1100111000101000;
				inst_memory[429] = 16'B0000001100000000;

				//copy [r40], r2
				inst_memory[430] = 16'B1100111011101000;
				inst_memory[431] = 16'B0000001000000000;

				//sub r2, r31, 1
				inst_memory[432] = 16'B0000111000000010;
				inst_memory[433] = 16'B0001111100000001;

				//copy r40, r2
				inst_memory[434] = 16'B1100111000101000;
				inst_memory[435] = 16'B0000001000000000;

				//add r2, 2, [r40]
				inst_memory[436] = 16'B0000010100000010;
				inst_memory[437] = 16'B0000001011101000;

				//sub r2, r31, r2
				inst_memory[438] = 16'B0000111100000010;
				inst_memory[439] = 16'B0001111100000010;

				//copy r41, r2
				inst_memory[440] = 16'B1100111000101001;
				inst_memory[441] = 16'B0000001000000000;

				//output [r41]
				inst_memory[442] = 16'B1000101000000001;
				inst_memory[443] = 16'B1110100100000000;

				//sub r2, r31, 1
				inst_memory[444] = 16'B0000111000000010;
				inst_memory[445] = 16'B0001111100000001;

				//copy r42, r2
				inst_memory[446] = 16'B1100111000101010;
				inst_memory[447] = 16'B0000001000000000;

				//add r2, [r42], 1
				inst_memory[448] = 16'B0000011000000010;
				inst_memory[449] = 16'B1110101000000001;

				//sub r3, r31, 1
				inst_memory[450] = 16'B0000111000000011;
				inst_memory[451] = 16'B0001111100000001;

				//copy r42, r3
				inst_memory[452] = 16'B1100111000101010;
				inst_memory[453] = 16'B0000001100000000;

				//copy [r42], r2
				inst_memory[454] = 16'B1100111011101010;
				inst_memory[455] = 16'B0000001000000000;

				//jmp L010
				inst_memory[456] = 16'B1011100000000000;
				inst_memory[457] = 16'B0000000110010110;

				//L011:
				inst_memory[458] = 16'B1111100000000000;
				inst_memory[459] = 0;

				//copy r42, r63
				inst_memory[460] = 16'B1100111000101010;
				inst_memory[461] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[462] = 16'B0000111000011101;
				inst_memory[463] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[464] = 16'B1100111000111111;
				inst_memory[465] = 16'B0001110100000000;

				//sub r0, r31, 2
				inst_memory[466] = 16'B0000111000000000;
				inst_memory[467] = 16'B0001111100000010;

				//copy r43, r0
				inst_memory[468] = 16'B1100111000101011;
				inst_memory[469] = 16'B0000000000000000;

				//copy [r63], r0
				inst_memory[470] = 16'B1100111011111111;
				inst_memory[471] = 16'B0000000000000000;

				//sub r29, r29, 1
				inst_memory[472] = 16'B0000111000011101;
				inst_memory[473] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[474] = 16'B1100111000111111;
				inst_memory[475] = 16'B0001110100000000;

				//mov [r63], 4
				inst_memory[476] = 16'B1100010011111111;
				inst_memory[477] = 16'B0000000000000100;

				//sub r29, r29, 1
				inst_memory[478] = 16'B0000111000011101;
				inst_memory[479] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[480] = 16'B1100111000111111;
				inst_memory[481] = 16'B0001110100000000;

				//movr [r42], 1
				inst_memory[482] = 16'B1101010011101010;
				inst_memory[483] = 16'B0000000000000001;

				//jmp F001
				inst_memory[484] = 16'B1011100000000000;
				inst_memory[485] = 16'B0000000001110000;

				//copy r0, r30
				inst_memory[486] = 16'B1100111000000000;
				inst_memory[487] = 16'B0001111000000000;

				//sub r2, r31, 1
				inst_memory[488] = 16'B0000111000000010;
				inst_memory[489] = 16'B0001111100000001;

				//copy r42, r2
				inst_memory[490] = 16'B1100111000101010;
				inst_memory[491] = 16'B0000001000000000;

				//mov [r42], 0
				inst_memory[492] = 16'B1100010011101010;
				inst_memory[493] = 16'B0000000000000000;

				//L012:
				inst_memory[494] = 16'B1111100000000000;
				inst_memory[495] = 0;

				//sub r0, r31, 1
				inst_memory[496] = 16'B0000111000000000;
				inst_memory[497] = 16'B0001111100000001;

				//copy r42, r0
				inst_memory[498] = 16'B1100111000101010;
				inst_memory[499] = 16'B0000000000000000;

				//slt r0, [r42], 4
				inst_memory[500] = 16'B0110011000000000;
				inst_memory[501] = 16'B1110101000000100;

				//mov r2, L013
				inst_memory[502] = 16'B1100010000000010;
				inst_memory[503] = 16'B0000001000010100;

				//jmprc r2, r0
				inst_memory[504] = 16'B0111101100000000;
				inst_memory[505] = 16'B0000001000000000;

				//sub r2, r31, 1
				inst_memory[506] = 16'B0000111000000010;
				inst_memory[507] = 16'B0001111100000001;

				//copy r42, r2
				inst_memory[508] = 16'B1100111000101010;
				inst_memory[509] = 16'B0000001000000000;

				//add r2, 2, [r42]
				inst_memory[510] = 16'B0000010100000010;
				inst_memory[511] = 16'B0000001011101010;

				//sub r2, r31, r2
				inst_memory[512] = 16'B0000111100000010;
				inst_memory[513] = 16'B0001111100000010;

				//copy r44, r2
				inst_memory[514] = 16'B1100111000101100;
				inst_memory[515] = 16'B0000001000000000;

				//output [r44]
				inst_memory[516] = 16'B1000101000000001;
				inst_memory[517] = 16'B1110110000000000;

				//sub r2, r31, 1
				inst_memory[518] = 16'B0000111000000010;
				inst_memory[519] = 16'B0001111100000001;

				//copy r45, r2
				inst_memory[520] = 16'B1100111000101101;
				inst_memory[521] = 16'B0000001000000000;

				//add r2, [r45], 1
				inst_memory[522] = 16'B0000011000000010;
				inst_memory[523] = 16'B1110110100000001;

				//sub r3, r31, 1
				inst_memory[524] = 16'B0000111000000011;
				inst_memory[525] = 16'B0001111100000001;

				//copy r45, r3
				inst_memory[526] = 16'B1100111000101101;
				inst_memory[527] = 16'B0000001100000000;

				//copy [r45], r2
				inst_memory[528] = 16'B1100111011101101;
				inst_memory[529] = 16'B0000001000000000;

				//jmp L012
				inst_memory[530] = 16'B1011100000000000;
				inst_memory[531] = 16'B0000000111101110;

				//L013:
				inst_memory[532] = 16'B1111100000000000;
				inst_memory[533] = 0;

				//jmp L009
				inst_memory[534] = 16'B1011100000000000;
				inst_memory[535] = 16'B0000001001010110;

				//L008:
				inst_memory[536] = 16'B1111100000000000;
				inst_memory[537] = 0;

				//input r0
				inst_memory[538] = 16'B1000010000000000;
				inst_memory[539] = 16'B0000000000000000;

				//sub r2, r31, 1
				inst_memory[540] = 16'B0000111000000010;
				inst_memory[541] = 16'B0001111100000001;

				//copy r45, r2
				inst_memory[542] = 16'B1100111000101101;
				inst_memory[543] = 16'B0000001000000000;

				//copy [r45], r0
				inst_memory[544] = 16'B1100111011101101;
				inst_memory[545] = 16'B0000000000000000;

				//input r0
				inst_memory[546] = 16'B1000010000000000;
				inst_memory[547] = 16'B0000000000000000;

				//sub r2, r31, 0
				inst_memory[548] = 16'B0000111000000010;
				inst_memory[549] = 16'B0001111100000000;

				//copy r45, r2
				inst_memory[550] = 16'B1100111000101101;
				inst_memory[551] = 16'B0000001000000000;

				//copy [r45], r0
				inst_memory[552] = 16'B1100111011101101;
				inst_memory[553] = 16'B0000000000000000;

				//copy r45, r63
				inst_memory[554] = 16'B1100111000101101;
				inst_memory[555] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[556] = 16'B0000111000011101;
				inst_memory[557] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[558] = 16'B1100111000111111;
				inst_memory[559] = 16'B0001110100000000;

				//sub r0, r31, 0
				inst_memory[560] = 16'B0000111000000000;
				inst_memory[561] = 16'B0001111100000000;

				//copy r46, r0
				inst_memory[562] = 16'B1100111000101110;
				inst_memory[563] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[564] = 16'B0000111000000000;
				inst_memory[565] = 16'B0001111100000001;

				//copy r47, r0
				inst_memory[566] = 16'B1100111000101111;
				inst_memory[567] = 16'B0000000000000000;

				//copy [r63], [r47]
				inst_memory[568] = 16'B1100111011111111;
				inst_memory[569] = 16'B1110111100000000;

				//sub r29, r29, 1
				inst_memory[570] = 16'B0000111000011101;
				inst_memory[571] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[572] = 16'B1100111000111111;
				inst_memory[573] = 16'B0001110100000000;

				//copy [r63], [r46]
				inst_memory[574] = 16'B1100111011111111;
				inst_memory[575] = 16'B1110111000000000;

				//sub r29, r29, 1
				inst_memory[576] = 16'B0000111000011101;
				inst_memory[577] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[578] = 16'B1100111000111111;
				inst_memory[579] = 16'B0001110100000000;

				//movr [r45], 1
				inst_memory[580] = 16'B1101010011101101;
				inst_memory[581] = 16'B0000000000000001;

				//jmp F000
				inst_memory[582] = 16'B1011100000000000;
				inst_memory[583] = 16'B0000000000000100;

				//copy r0, r30
				inst_memory[584] = 16'B1100111000000000;
				inst_memory[585] = 16'B0001111000000000;

				//sub r2, r31, 0
				inst_memory[586] = 16'B0000111000000010;
				inst_memory[587] = 16'B0001111100000000;

				//copy r45, r2
				inst_memory[588] = 16'B1100111000101101;
				inst_memory[589] = 16'B0000001000000000;

				//copy [r45], r0
				inst_memory[590] = 16'B1100111011101101;
				inst_memory[591] = 16'B0000000000000000;

				//sub r0, r31, 0
				inst_memory[592] = 16'B0000111000000000;
				inst_memory[593] = 16'B0001111100000000;

				//copy r45, r0
				inst_memory[594] = 16'B1100111000101101;
				inst_memory[595] = 16'B0000000000000000;

				//output [r45]
				inst_memory[596] = 16'B1000101000000001;
				inst_memory[597] = 16'B1110110100000000;

				//L009:
				inst_memory[598] = 16'B1111100000000000;
				inst_memory[599] = 0;

				//
				inst_memory[600] = 16'B1111100000000000;
				inst_memory[601] = 0;


				
				
			end
				
			else begin	
			
				out1 = inst_memory[PC];
				out2 = inst_memory[PC+1];
				
			end
			
		end
	
endmodule
