module Instruction_Memory (PC, a, out1, out2, reset);
	
	input [15:0] PC;								// program counter contem o endereco da instrução
	input a, reset;								// ciclo para instruction fetch
	
	output reg [15:0] out1, out2;				//saida da instrução em duas partes: out1 = opcode, optype e op1 / out2 = op2 e op3
	
	reg [15:0] inst_memory [0:2200];			//declaracao de memoria - cabe 40 instruções para teste;
	
	always@(posedge a)							//ciclo de instruction fetch é no posedge do a
		begin
		
			if (reset) begin
			
				//escrever as instruções manualmente aqui
				
									//mov r31, -1
				inst_memory[0] = 16'B1100010000011111;
				inst_memory[1] = 16'B1111111111111111;

				//jmp MAIN
				inst_memory[2] = 16'B1011100000000000;
				inst_memory[3] = 16'B0000010111100110;

				//F000:
				inst_memory[4] = 16'B1111100000000000;
				inst_memory[5] = 0;

				//add r31, r31 3
				inst_memory[6] = 16'B0000011000011111;
				inst_memory[7] = 16'B0001111100000011;

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

				//sub r0, r31, 2
				inst_memory[28] = 16'B0000111000000000;
				inst_memory[29] = 16'B0001111100000010;

				//copy r32, r0
				inst_memory[30] = 16'B1100111000100000;
				inst_memory[31] = 16'B0000000000000000;

				//mov [r32], 0
				inst_memory[32] = 16'B1100010011100000;
				inst_memory[33] = 16'B0000000000000000;

				//L000:
				inst_memory[34] = 16'B1111100000000000;
				inst_memory[35] = 0;

				//sub r0, r31, 2
				inst_memory[36] = 16'B0000111000000000;
				inst_memory[37] = 16'B0001111100000010;

				//copy r32, r0
				inst_memory[38] = 16'B1100111000100000;
				inst_memory[39] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[40] = 16'B0000111000000000;
				inst_memory[41] = 16'B0001111100000001;

				//copy r33, r0
				inst_memory[42] = 16'B1100111000100001;
				inst_memory[43] = 16'B0000000000000000;

				//slt r0, [r32], [r33]
				inst_memory[44] = 16'B0110011100000000;
				inst_memory[45] = 16'B1110000011100001;

				//mov r1, L001
				inst_memory[46] = 16'B1100010000000001;
				inst_memory[47] = 16'B0000000001010010;

				//jmprc r1, r0
				inst_memory[48] = 16'B0111101100000000;
				inst_memory[49] = 16'B0000000100000000;

				//input r1
				inst_memory[50] = 16'B1000010000000001;
				inst_memory[51] = 16'B0000000000000000;

				//sub r2, r31, 2
				inst_memory[52] = 16'B0000111000000010;
				inst_memory[53] = 16'B0001111100000010;

				//copy r32, r2
				inst_memory[54] = 16'B1100111000100000;
				inst_memory[55] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[56] = 16'B0000111000000010;
				inst_memory[57] = 16'B0001111100000000;

				//copy r33, r2
				inst_memory[58] = 16'B1100111000100001;
				inst_memory[59] = 16'B0000001000000000;

				//copy r3, [r33]
				inst_memory[60] = 16'B1100111000000011;
				inst_memory[61] = 16'B1110000100000000;

				//sub r3, r3, [r32]
				inst_memory[62] = 16'B0000111100000011;
				inst_memory[63] = 16'B0000001111100000;

				//copy r33, r3
				inst_memory[64] = 16'B1100111000100001;
				inst_memory[65] = 16'B0000001100000000;

				//copy [r33], r1
				inst_memory[66] = 16'B1100111011100001;
				inst_memory[67] = 16'B0000000100000000;

				//sub r1, r31, 2
				inst_memory[68] = 16'B0000111000000001;
				inst_memory[69] = 16'B0001111100000010;

				//copy r33, r1
				inst_memory[70] = 16'B1100111000100001;
				inst_memory[71] = 16'B0000000100000000;

				//add r1, [r33], 1
				inst_memory[72] = 16'B0000011000000001;
				inst_memory[73] = 16'B1110000100000001;

				//sub r2, r31, 2
				inst_memory[74] = 16'B0000111000000010;
				inst_memory[75] = 16'B0001111100000010;

				//copy r33, r2
				inst_memory[76] = 16'B1100111000100001;
				inst_memory[77] = 16'B0000001000000000;

				//copy [r33], r1
				inst_memory[78] = 16'B1100111011100001;
				inst_memory[79] = 16'B0000000100000000;

				//jmp L000
				inst_memory[80] = 16'B1011100000000000;
				inst_memory[81] = 16'B0000000000100010;

				//L001:
				inst_memory[82] = 16'B1111100000000000;
				inst_memory[83] = 0;

				//sub r31, r31 3
				inst_memory[84] = 16'B0000111000011111;
				inst_memory[85] = 16'B0001111100000011;

				//add r29, r29, 1
				inst_memory[86] = 16'B0000011000011101;
				inst_memory[87] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[88] = 16'B1100111000111111;
				inst_memory[89] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[90] = 16'B1100111000000000;
				inst_memory[91] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[92] = 16'B0111001000000000;
				inst_memory[93] = 16'B0000000000000000;

				//F001:
				inst_memory[94] = 16'B1111100000000000;
				inst_memory[95] = 0;

				//add r31, r31 3
				inst_memory[96] = 16'B0000011000011111;
				inst_memory[97] = 16'B0001111100000011;

				//add r29, r29, 1
				inst_memory[98] = 16'B0000011000011101;
				inst_memory[99] = 16'B0001110100000001;

				//sub r0, r31, 1
				inst_memory[100] = 16'B0000111000000000;
				inst_memory[101] = 16'B0001111100000001;

				//copy r33, r0
				inst_memory[102] = 16'B1100111000100001;
				inst_memory[103] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[104] = 16'B1100111000111111;
				inst_memory[105] = 16'B0001110100000000;

				//copy [r33], [r63]
				inst_memory[106] = 16'B1100111011100001;
				inst_memory[107] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[108] = 16'B0000011000011101;
				inst_memory[109] = 16'B0001110100000001;

				//sub r0, r31, 0
				inst_memory[110] = 16'B0000111000000000;
				inst_memory[111] = 16'B0001111100000000;

				//copy r33, r0
				inst_memory[112] = 16'B1100111000100001;
				inst_memory[113] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[114] = 16'B1100111000111111;
				inst_memory[115] = 16'B0001110100000000;

				//copy [r33], [r63]
				inst_memory[116] = 16'B1100111011100001;
				inst_memory[117] = 16'B1111111100000000;

				//sub r0, r31, 2
				inst_memory[118] = 16'B0000111000000000;
				inst_memory[119] = 16'B0001111100000010;

				//copy r33, r0
				inst_memory[120] = 16'B1100111000100001;
				inst_memory[121] = 16'B0000000000000000;

				//mov [r33], 0
				inst_memory[122] = 16'B1100010011100001;
				inst_memory[123] = 16'B0000000000000000;

				//L002:
				inst_memory[124] = 16'B1111100000000000;
				inst_memory[125] = 0;

				//sub r0, r31, 2
				inst_memory[126] = 16'B0000111000000000;
				inst_memory[127] = 16'B0001111100000010;

				//copy r33, r0
				inst_memory[128] = 16'B1100111000100001;
				inst_memory[129] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[130] = 16'B0000111000000000;
				inst_memory[131] = 16'B0001111100000001;

				//copy r34, r0
				inst_memory[132] = 16'B1100111000100010;
				inst_memory[133] = 16'B0000000000000000;

				//slt r0, [r33], [r34]
				inst_memory[134] = 16'B0110011100000000;
				inst_memory[135] = 16'B1110000111100010;

				//mov r1, L003
				inst_memory[136] = 16'B1100010000000001;
				inst_memory[137] = 16'B0000000010101010;

				//jmprc r1, r0
				inst_memory[138] = 16'B0111101100000000;
				inst_memory[139] = 16'B0000000100000000;

				//sub r1, r31, 2
				inst_memory[140] = 16'B0000111000000001;
				inst_memory[141] = 16'B0001111100000010;

				//copy r33, r1
				inst_memory[142] = 16'B1100111000100001;
				inst_memory[143] = 16'B0000000100000000;

				//sub r1, r31, 0
				inst_memory[144] = 16'B0000111000000001;
				inst_memory[145] = 16'B0001111100000000;

				//copy r34, r1
				inst_memory[146] = 16'B1100111000100010;
				inst_memory[147] = 16'B0000000100000000;

				//copy r2, [r34]
				inst_memory[148] = 16'B1100111000000010;
				inst_memory[149] = 16'B1110001000000000;

				//sub r2, r2, [r33]
				inst_memory[150] = 16'B0000111100000010;
				inst_memory[151] = 16'B0000001011100001;

				//copy r34, r2
				inst_memory[152] = 16'B1100111000100010;
				inst_memory[153] = 16'B0000001000000000;

				//output [r34]
				inst_memory[154] = 16'B1000101000000001;
				inst_memory[155] = 16'B1110001000000000;

				//sub r1, r31, 2
				inst_memory[156] = 16'B0000111000000001;
				inst_memory[157] = 16'B0001111100000010;

				//copy r34, r1
				inst_memory[158] = 16'B1100111000100010;
				inst_memory[159] = 16'B0000000100000000;

				//add r1, [r34], 1
				inst_memory[160] = 16'B0000011000000001;
				inst_memory[161] = 16'B1110001000000001;

				//sub r2, r31, 2
				inst_memory[162] = 16'B0000111000000010;
				inst_memory[163] = 16'B0001111100000010;

				//copy r34, r2
				inst_memory[164] = 16'B1100111000100010;
				inst_memory[165] = 16'B0000001000000000;

				//copy [r34], r1
				inst_memory[166] = 16'B1100111011100010;
				inst_memory[167] = 16'B0000000100000000;

				//jmp L002
				inst_memory[168] = 16'B1011100000000000;
				inst_memory[169] = 16'B0000000001111100;

				//L003:
				inst_memory[170] = 16'B1111100000000000;
				inst_memory[171] = 0;

				//sub r31, r31 3
				inst_memory[172] = 16'B0000111000011111;
				inst_memory[173] = 16'B0001111100000011;

				//add r29, r29, 1
				inst_memory[174] = 16'B0000011000011101;
				inst_memory[175] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[176] = 16'B1100111000111111;
				inst_memory[177] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[178] = 16'B1100111000000000;
				inst_memory[179] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[180] = 16'B0111001000000000;
				inst_memory[181] = 16'B0000000000000000;

				//F002:
				inst_memory[182] = 16'B1111100000000000;
				inst_memory[183] = 0;

				//add r31, r31 6
				inst_memory[184] = 16'B0000011000011111;
				inst_memory[185] = 16'B0001111100000110;

				//add r29, r29, 1
				inst_memory[186] = 16'B0000011000011101;
				inst_memory[187] = 16'B0001110100000001;

				//sub r0, r31, 1
				inst_memory[188] = 16'B0000111000000000;
				inst_memory[189] = 16'B0001111100000001;

				//copy r34, r0
				inst_memory[190] = 16'B1100111000100010;
				inst_memory[191] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[192] = 16'B1100111000111111;
				inst_memory[193] = 16'B0001110100000000;

				//copy [r34], [r63]
				inst_memory[194] = 16'B1100111011100010;
				inst_memory[195] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[196] = 16'B0000011000011101;
				inst_memory[197] = 16'B0001110100000001;

				//sub r0, r31, 0
				inst_memory[198] = 16'B0000111000000000;
				inst_memory[199] = 16'B0001111100000000;

				//copy r34, r0
				inst_memory[200] = 16'B1100111000100010;
				inst_memory[201] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[202] = 16'B1100111000111111;
				inst_memory[203] = 16'B0001110100000000;

				//copy [r34], [r63]
				inst_memory[204] = 16'B1100111011100010;
				inst_memory[205] = 16'B1111111100000000;

				//sub r0, r31, 2
				inst_memory[206] = 16'B0000111000000000;
				inst_memory[207] = 16'B0001111100000010;

				//copy r34, r0
				inst_memory[208] = 16'B1100111000100010;
				inst_memory[209] = 16'B0000000000000000;

				//mov [r34], 0
				inst_memory[210] = 16'B1100010011100010;
				inst_memory[211] = 16'B0000000000000000;

				//L004:
				inst_memory[212] = 16'B1111100000000000;
				inst_memory[213] = 0;

				//sub r0, r31, 2
				inst_memory[214] = 16'B0000111000000000;
				inst_memory[215] = 16'B0001111100000010;

				//copy r34, r0
				inst_memory[216] = 16'B1100111000100010;
				inst_memory[217] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[218] = 16'B0000111000000000;
				inst_memory[219] = 16'B0001111100000001;

				//copy r35, r0
				inst_memory[220] = 16'B1100111000100011;
				inst_memory[221] = 16'B0000000000000000;

				//sub r0, [r35], 1
				inst_memory[222] = 16'B0000111000000000;
				inst_memory[223] = 16'B1110001100000001;

				//slt r1, [r34], r0
				inst_memory[224] = 16'B0110011100000001;
				inst_memory[225] = 16'B1110001000000000;

				//mov r0, L005
				inst_memory[226] = 16'B1100010000000000;
				inst_memory[227] = 16'B0000000110110000;

				//jmprc r0, r1
				inst_memory[228] = 16'B0111101100000000;
				inst_memory[229] = 16'B0000000000000001;

				//sub r0, r31, 2
				inst_memory[230] = 16'B0000111000000000;
				inst_memory[231] = 16'B0001111100000010;

				//copy r34, r0
				inst_memory[232] = 16'B1100111000100010;
				inst_memory[233] = 16'B0000000000000000;

				//sub r0, r31, 4
				inst_memory[234] = 16'B0000111000000000;
				inst_memory[235] = 16'B0001111100000100;

				//copy r35, r0
				inst_memory[236] = 16'B1100111000100011;
				inst_memory[237] = 16'B0000000000000000;

				//copy [r35], [r34]
				inst_memory[238] = 16'B1100111011100011;
				inst_memory[239] = 16'B1110001000000000;

				//sub r0, r31, 2
				inst_memory[240] = 16'B0000111000000000;
				inst_memory[241] = 16'B0001111100000010;

				//copy r34, r0
				inst_memory[242] = 16'B1100111000100010;
				inst_memory[243] = 16'B0000000000000000;

				//add r0, [r34], 1
				inst_memory[244] = 16'B0000011000000000;
				inst_memory[245] = 16'B1110001000000001;

				//sub r2, r31, 3
				inst_memory[246] = 16'B0000111000000010;
				inst_memory[247] = 16'B0001111100000011;

				//copy r34, r2
				inst_memory[248] = 16'B1100111000100010;
				inst_memory[249] = 16'B0000001000000000;

				//copy [r34], r0
				inst_memory[250] = 16'B1100111011100010;
				inst_memory[251] = 16'B0000000000000000;

				//L006:
				inst_memory[252] = 16'B1111100000000000;
				inst_memory[253] = 0;

				//sub r0, r31, 3
				inst_memory[254] = 16'B0000111000000000;
				inst_memory[255] = 16'B0001111100000011;

				//copy r34, r0
				inst_memory[256] = 16'B1100111000100010;
				inst_memory[257] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[258] = 16'B0000111000000000;
				inst_memory[259] = 16'B0001111100000001;

				//copy r35, r0
				inst_memory[260] = 16'B1100111000100011;
				inst_memory[261] = 16'B0000000000000000;

				//slt r0, [r34], [r35]
				inst_memory[262] = 16'B0110011100000000;
				inst_memory[263] = 16'B1110001011100011;

				//mov r2, L007
				inst_memory[264] = 16'B1100010000000010;
				inst_memory[265] = 16'B0000000101001000;

				//jmprc r2, r0
				inst_memory[266] = 16'B0111101100000000;
				inst_memory[267] = 16'B0000001000000000;

				//sub r2, r31, 3
				inst_memory[268] = 16'B0000111000000010;
				inst_memory[269] = 16'B0001111100000011;

				//copy r34, r2
				inst_memory[270] = 16'B1100111000100010;
				inst_memory[271] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[272] = 16'B0000111000000010;
				inst_memory[273] = 16'B0001111100000000;

				//copy r35, r2
				inst_memory[274] = 16'B1100111000100011;
				inst_memory[275] = 16'B0000001000000000;

				//copy r3, [r35]
				inst_memory[276] = 16'B1100111000000011;
				inst_memory[277] = 16'B1110001100000000;

				//sub r3, r3, [r34]
				inst_memory[278] = 16'B0000111100000011;
				inst_memory[279] = 16'B0000001111100010;

				//copy r35, r3
				inst_memory[280] = 16'B1100111000100011;
				inst_memory[281] = 16'B0000001100000000;

				//sub r2, r31, 4
				inst_memory[282] = 16'B0000111000000010;
				inst_memory[283] = 16'B0001111100000100;

				//copy r36, r2
				inst_memory[284] = 16'B1100111000100100;
				inst_memory[285] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[286] = 16'B0000111000000010;
				inst_memory[287] = 16'B0001111100000000;

				//copy r37, r2
				inst_memory[288] = 16'B1100111000100101;
				inst_memory[289] = 16'B0000001000000000;

				//copy r3, [r37]
				inst_memory[290] = 16'B1100111000000011;
				inst_memory[291] = 16'B1110010100000000;

				//sub r3, r3, [r36]
				inst_memory[292] = 16'B0000111100000011;
				inst_memory[293] = 16'B0000001111100100;

				//copy r37, r3
				inst_memory[294] = 16'B1100111000100101;
				inst_memory[295] = 16'B0000001100000000;

				//slt r2, [r35], [r37]
				inst_memory[296] = 16'B0110011100000010;
				inst_memory[297] = 16'B1110001111100101;

				//mov r3, L008
				inst_memory[298] = 16'B1100010000000011;
				inst_memory[299] = 16'B0000000100111000;

				//jmprc r3, r2
				inst_memory[300] = 16'B0111101100000000;
				inst_memory[301] = 16'B0000001100000010;

				//sub r3, r31, 3
				inst_memory[302] = 16'B0000111000000011;
				inst_memory[303] = 16'B0001111100000011;

				//copy r35, r3
				inst_memory[304] = 16'B1100111000100011;
				inst_memory[305] = 16'B0000001100000000;

				//sub r3, r31, 4
				inst_memory[306] = 16'B0000111000000011;
				inst_memory[307] = 16'B0001111100000100;

				//copy r37, r3
				inst_memory[308] = 16'B1100111000100101;
				inst_memory[309] = 16'B0000001100000000;

				//copy [r37], [r35]
				inst_memory[310] = 16'B1100111011100101;
				inst_memory[311] = 16'B1110001100000000;

				//L008:
				inst_memory[312] = 16'B1111100000000000;
				inst_memory[313] = 0;

				//sub r2, r31, 3
				inst_memory[314] = 16'B0000111000000010;
				inst_memory[315] = 16'B0001111100000011;

				//copy r35, r2
				inst_memory[316] = 16'B1100111000100011;
				inst_memory[317] = 16'B0000001000000000;

				//add r2, [r35], 1
				inst_memory[318] = 16'B0000011000000010;
				inst_memory[319] = 16'B1110001100000001;

				//sub r3, r31, 3
				inst_memory[320] = 16'B0000111000000011;
				inst_memory[321] = 16'B0001111100000011;

				//copy r35, r3
				inst_memory[322] = 16'B1100111000100011;
				inst_memory[323] = 16'B0000001100000000;

				//copy [r35], r2
				inst_memory[324] = 16'B1100111011100011;
				inst_memory[325] = 16'B0000001000000000;

				//jmp L006
				inst_memory[326] = 16'B1011100000000000;
				inst_memory[327] = 16'B0000000011111100;

				//L007:
				inst_memory[328] = 16'B1111100000000000;
				inst_memory[329] = 0;

				//sub r0, r31, 2
				inst_memory[330] = 16'B0000111000000000;
				inst_memory[331] = 16'B0001111100000010;

				//copy r35, r0
				inst_memory[332] = 16'B1100111000100011;
				inst_memory[333] = 16'B0000000000000000;

				//sub r0, r31, 4
				inst_memory[334] = 16'B0000111000000000;
				inst_memory[335] = 16'B0001111100000100;

				//copy r37, r0
				inst_memory[336] = 16'B1100111000100101;
				inst_memory[337] = 16'B0000000000000000;

				//seq r0, [r37], [r35]
				inst_memory[338] = 16'B0110111100000000;
				inst_memory[339] = 16'B1110010111100011;

				//sub r0, r0, 1
				inst_memory[340] = 16'B0000111000000000;
				inst_memory[341] = 16'B0000000000000001;

				//mov r2, L009
				inst_memory[342] = 16'B1100010000000010;
				inst_memory[343] = 16'B0000000110100000;

				//jmprc r2, r0
				inst_memory[344] = 16'B0111101100000000;
				inst_memory[345] = 16'B0000001000000000;

				//sub r2, r31, 2
				inst_memory[346] = 16'B0000111000000010;
				inst_memory[347] = 16'B0001111100000010;

				//copy r35, r2
				inst_memory[348] = 16'B1100111000100011;
				inst_memory[349] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[350] = 16'B0000111000000010;
				inst_memory[351] = 16'B0001111100000000;

				//copy r37, r2
				inst_memory[352] = 16'B1100111000100101;
				inst_memory[353] = 16'B0000001000000000;

				//copy r3, [r37]
				inst_memory[354] = 16'B1100111000000011;
				inst_memory[355] = 16'B1110010100000000;

				//sub r3, r3, [r35]
				inst_memory[356] = 16'B0000111100000011;
				inst_memory[357] = 16'B0000001111100011;

				//copy r37, r3
				inst_memory[358] = 16'B1100111000100101;
				inst_memory[359] = 16'B0000001100000000;

				//sub r2, r31, 5
				inst_memory[360] = 16'B0000111000000010;
				inst_memory[361] = 16'B0001111100000101;

				//copy r38, r2
				inst_memory[362] = 16'B1100111000100110;
				inst_memory[363] = 16'B0000001000000000;

				//copy [r38], [r37]
				inst_memory[364] = 16'B1100111011100110;
				inst_memory[365] = 16'B1110010100000000;

				//sub r2, r31, 4
				inst_memory[366] = 16'B0000111000000010;
				inst_memory[367] = 16'B0001111100000100;

				//copy r37, r2
				inst_memory[368] = 16'B1100111000100101;
				inst_memory[369] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[370] = 16'B0000111000000010;
				inst_memory[371] = 16'B0001111100000000;

				//copy r38, r2
				inst_memory[372] = 16'B1100111000100110;
				inst_memory[373] = 16'B0000001000000000;

				//copy r3, [r38]
				inst_memory[374] = 16'B1100111000000011;
				inst_memory[375] = 16'B1110011000000000;

				//sub r3, r3, [r37]
				inst_memory[376] = 16'B0000111100000011;
				inst_memory[377] = 16'B0000001111100101;

				//copy r38, r3
				inst_memory[378] = 16'B1100111000100110;
				inst_memory[379] = 16'B0000001100000000;

				//sub r2, r31, 2
				inst_memory[380] = 16'B0000111000000010;
				inst_memory[381] = 16'B0001111100000010;

				//copy r39, r2
				inst_memory[382] = 16'B1100111000100111;
				inst_memory[383] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[384] = 16'B0000111000000010;
				inst_memory[385] = 16'B0001111100000000;

				//copy r40, r2
				inst_memory[386] = 16'B1100111000101000;
				inst_memory[387] = 16'B0000001000000000;

				//copy r3, [r40]
				inst_memory[388] = 16'B1100111000000011;
				inst_memory[389] = 16'B1110100000000000;

				//sub r3, r3, [r39]
				inst_memory[390] = 16'B0000111100000011;
				inst_memory[391] = 16'B0000001111100111;

				//copy r40, r3
				inst_memory[392] = 16'B1100111000101000;
				inst_memory[393] = 16'B0000001100000000;

				//copy [r40], [r38]
				inst_memory[394] = 16'B1100111011101000;
				inst_memory[395] = 16'B1110011000000000;

				//sub r2, r31, 5
				inst_memory[396] = 16'B0000111000000010;
				inst_memory[397] = 16'B0001111100000101;

				//copy r38, r2
				inst_memory[398] = 16'B1100111000100110;
				inst_memory[399] = 16'B0000001000000000;

				//sub r2, r31, 4
				inst_memory[400] = 16'B0000111000000010;
				inst_memory[401] = 16'B0001111100000100;

				//copy r40, r2
				inst_memory[402] = 16'B1100111000101000;
				inst_memory[403] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[404] = 16'B0000111000000010;
				inst_memory[405] = 16'B0001111100000000;

				//copy r41, r2
				inst_memory[406] = 16'B1100111000101001;
				inst_memory[407] = 16'B0000001000000000;

				//copy r3, [r41]
				inst_memory[408] = 16'B1100111000000011;
				inst_memory[409] = 16'B1110100100000000;

				//sub r3, r3, [r40]
				inst_memory[410] = 16'B0000111100000011;
				inst_memory[411] = 16'B0000001111101000;

				//copy r41, r3
				inst_memory[412] = 16'B1100111000101001;
				inst_memory[413] = 16'B0000001100000000;

				//copy [r41], [r38]
				inst_memory[414] = 16'B1100111011101001;
				inst_memory[415] = 16'B1110011000000000;

				//L009:
				inst_memory[416] = 16'B1111100000000000;
				inst_memory[417] = 0;

				//sub r0, r31, 2
				inst_memory[418] = 16'B0000111000000000;
				inst_memory[419] = 16'B0001111100000010;

				//copy r38, r0
				inst_memory[420] = 16'B1100111000100110;
				inst_memory[421] = 16'B0000000000000000;

				//add r0, [r38], 1
				inst_memory[422] = 16'B0000011000000000;
				inst_memory[423] = 16'B1110011000000001;

				//sub r2, r31, 2
				inst_memory[424] = 16'B0000111000000010;
				inst_memory[425] = 16'B0001111100000010;

				//copy r38, r2
				inst_memory[426] = 16'B1100111000100110;
				inst_memory[427] = 16'B0000001000000000;

				//copy [r38], r0
				inst_memory[428] = 16'B1100111011100110;
				inst_memory[429] = 16'B0000000000000000;

				//jmp L004
				inst_memory[430] = 16'B1011100000000000;
				inst_memory[431] = 16'B0000000011010100;

				//L005:
				inst_memory[432] = 16'B1111100000000000;
				inst_memory[433] = 0;

				//sub r31, r31 6
				inst_memory[434] = 16'B0000111000011111;
				inst_memory[435] = 16'B0001111100000110;

				//add r29, r29, 1
				inst_memory[436] = 16'B0000011000011101;
				inst_memory[437] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[438] = 16'B1100111000111111;
				inst_memory[439] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[440] = 16'B1100111000000000;
				inst_memory[441] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[442] = 16'B0111001000000000;
				inst_memory[443] = 16'B0000000000000000;

				//F003:
				inst_memory[444] = 16'B1111100000000000;
				inst_memory[445] = 0;

				//add r31, r31 4
				inst_memory[446] = 16'B0000011000011111;
				inst_memory[447] = 16'B0001111100000100;

				//add r29, r29, 1
				inst_memory[448] = 16'B0000011000011101;
				inst_memory[449] = 16'B0001110100000001;

				//sub r0, r31, 1
				inst_memory[450] = 16'B0000111000000000;
				inst_memory[451] = 16'B0001111100000001;

				//copy r38, r0
				inst_memory[452] = 16'B1100111000100110;
				inst_memory[453] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[454] = 16'B1100111000111111;
				inst_memory[455] = 16'B0001110100000000;

				//copy [r38], [r63]
				inst_memory[456] = 16'B1100111011100110;
				inst_memory[457] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[458] = 16'B0000011000011101;
				inst_memory[459] = 16'B0001110100000001;

				//sub r0, r31, 0
				inst_memory[460] = 16'B0000111000000000;
				inst_memory[461] = 16'B0001111100000000;

				//copy r38, r0
				inst_memory[462] = 16'B1100111000100110;
				inst_memory[463] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[464] = 16'B1100111000111111;
				inst_memory[465] = 16'B0001110100000000;

				//copy [r38], [r63]
				inst_memory[466] = 16'B1100111011100110;
				inst_memory[467] = 16'B1111111100000000;

				//sub r0, r31, 2
				inst_memory[468] = 16'B0000111000000000;
				inst_memory[469] = 16'B0001111100000010;

				//copy r38, r0
				inst_memory[470] = 16'B1100111000100110;
				inst_memory[471] = 16'B0000000000000000;

				//mov [r38], 0
				inst_memory[472] = 16'B1100010011100110;
				inst_memory[473] = 16'B0000000000000000;

				//sub r0, r31, 3
				inst_memory[474] = 16'B0000111000000000;
				inst_memory[475] = 16'B0001111100000011;

				//copy r38, r0
				inst_memory[476] = 16'B1100111000100110;
				inst_memory[477] = 16'B0000000000000000;

				//mov [r38], 0
				inst_memory[478] = 16'B1100010011100110;
				inst_memory[479] = 16'B0000000000000000;

				//L010:
				inst_memory[480] = 16'B1111100000000000;
				inst_memory[481] = 0;

				//sub r0, r31, 2
				inst_memory[482] = 16'B0000111000000000;
				inst_memory[483] = 16'B0001111100000010;

				//copy r38, r0
				inst_memory[484] = 16'B1100111000100110;
				inst_memory[485] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[486] = 16'B0000111000000000;
				inst_memory[487] = 16'B0001111100000001;

				//copy r41, r0
				inst_memory[488] = 16'B1100111000101001;
				inst_memory[489] = 16'B0000000000000000;

				//slt r0, [r38], [r41]
				inst_memory[490] = 16'B0110011100000000;
				inst_memory[491] = 16'B1110011011101001;

				//mov r1, L011
				inst_memory[492] = 16'B1100010000000001;
				inst_memory[493] = 16'B0000001000011000;

				//jmprc r1, r0
				inst_memory[494] = 16'B0111101100000000;
				inst_memory[495] = 16'B0000000100000000;

				//sub r1, r31, 3
				inst_memory[496] = 16'B0000111000000001;
				inst_memory[497] = 16'B0001111100000011;

				//copy r38, r1
				inst_memory[498] = 16'B1100111000100110;
				inst_memory[499] = 16'B0000000100000000;

				//sub r1, r31, 2
				inst_memory[500] = 16'B0000111000000001;
				inst_memory[501] = 16'B0001111100000010;

				//copy r41, r1
				inst_memory[502] = 16'B1100111000101001;
				inst_memory[503] = 16'B0000000100000000;

				//sub r1, r31, 0
				inst_memory[504] = 16'B0000111000000001;
				inst_memory[505] = 16'B0001111100000000;

				//copy r42, r1
				inst_memory[506] = 16'B1100111000101010;
				inst_memory[507] = 16'B0000000100000000;

				//copy r2, [r42]
				inst_memory[508] = 16'B1100111000000010;
				inst_memory[509] = 16'B1110101000000000;

				//sub r2, r2, [r41]
				inst_memory[510] = 16'B0000111100000010;
				inst_memory[511] = 16'B0000001011101001;

				//copy r42, r2
				inst_memory[512] = 16'B1100111000101010;
				inst_memory[513] = 16'B0000001000000000;

				//add r1, [r38], [r42]
				inst_memory[514] = 16'B0000011100000001;
				inst_memory[515] = 16'B1110011011101010;

				//sub r2, r31, 3
				inst_memory[516] = 16'B0000111000000010;
				inst_memory[517] = 16'B0001111100000011;

				//copy r38, r2
				inst_memory[518] = 16'B1100111000100110;
				inst_memory[519] = 16'B0000001000000000;

				//copy [r38], r1
				inst_memory[520] = 16'B1100111011100110;
				inst_memory[521] = 16'B0000000100000000;

				//sub r1, r31, 2
				inst_memory[522] = 16'B0000111000000001;
				inst_memory[523] = 16'B0001111100000010;

				//copy r38, r1
				inst_memory[524] = 16'B1100111000100110;
				inst_memory[525] = 16'B0000000100000000;

				//add r1, [r38], 1
				inst_memory[526] = 16'B0000011000000001;
				inst_memory[527] = 16'B1110011000000001;

				//sub r2, r31, 2
				inst_memory[528] = 16'B0000111000000010;
				inst_memory[529] = 16'B0001111100000010;

				//copy r38, r2
				inst_memory[530] = 16'B1100111000100110;
				inst_memory[531] = 16'B0000001000000000;

				//copy [r38], r1
				inst_memory[532] = 16'B1100111011100110;
				inst_memory[533] = 16'B0000000100000000;

				//jmp L010
				inst_memory[534] = 16'B1011100000000000;
				inst_memory[535] = 16'B0000000111100000;

				//L011:
				inst_memory[536] = 16'B1111100000000000;
				inst_memory[537] = 0;

				//sub r0, r31, 3
				inst_memory[538] = 16'B0000111000000000;
				inst_memory[539] = 16'B0001111100000011;

				//copy r38, r0
				inst_memory[540] = 16'B1100111000100110;
				inst_memory[541] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[542] = 16'B0000111000000000;
				inst_memory[543] = 16'B0001111100000001;

				//copy r42, r0
				inst_memory[544] = 16'B1100111000101010;
				inst_memory[545] = 16'B0000000000000000;

				//div r0, [r38], [r42]
				inst_memory[546] = 16'B0001111100000000;
				inst_memory[547] = 16'B1110011011101010;

				//copy r30, r0
				inst_memory[548] = 16'B1100111000011110;
				inst_memory[549] = 16'B0000000000000000;

				//sub r31, r31 4
				inst_memory[550] = 16'B0000111000011111;
				inst_memory[551] = 16'B0001111100000100;

				//add r29, r29, 1
				inst_memory[552] = 16'B0000011000011101;
				inst_memory[553] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[554] = 16'B1100111000111111;
				inst_memory[555] = 16'B0001110100000000;

				//copy r1, [r63]
				inst_memory[556] = 16'B1100111000000001;
				inst_memory[557] = 16'B1111111100000000;

				//jmpr r1
				inst_memory[558] = 16'B0111001000000000;
				inst_memory[559] = 16'B0000000100000000;

				//F004:
				inst_memory[560] = 16'B1111100000000000;
				inst_memory[561] = 0;

				//add r31, r31 5
				inst_memory[562] = 16'B0000011000011111;
				inst_memory[563] = 16'B0001111100000101;

				//add r29, r29, 1
				inst_memory[564] = 16'B0000011000011101;
				inst_memory[565] = 16'B0001110100000001;

				//sub r1, r31, 1
				inst_memory[566] = 16'B0000111000000001;
				inst_memory[567] = 16'B0001111100000001;

				//copy r38, r1
				inst_memory[568] = 16'B1100111000100110;
				inst_memory[569] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[570] = 16'B1100111000111111;
				inst_memory[571] = 16'B0001110100000000;

				//copy [r38], [r63]
				inst_memory[572] = 16'B1100111011100110;
				inst_memory[573] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[574] = 16'B0000011000011101;
				inst_memory[575] = 16'B0001110100000001;

				//sub r1, r31, 0
				inst_memory[576] = 16'B0000111000000001;
				inst_memory[577] = 16'B0001111100000000;

				//copy r38, r1
				inst_memory[578] = 16'B1100111000100110;
				inst_memory[579] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[580] = 16'B1100111000111111;
				inst_memory[581] = 16'B0001110100000000;

				//copy [r38], [r63]
				inst_memory[582] = 16'B1100111011100110;
				inst_memory[583] = 16'B1111111100000000;

				//sub r1, r31, 2
				inst_memory[584] = 16'B0000111000000001;
				inst_memory[585] = 16'B0001111100000010;

				//copy r38, r1
				inst_memory[586] = 16'B1100111000100110;
				inst_memory[587] = 16'B0000000100000000;

				//mov [r38], 1
				inst_memory[588] = 16'B1100010011100110;
				inst_memory[589] = 16'B0000000000000001;

				//sub r1, r31, 0
				inst_memory[590] = 16'B0000111000000001;
				inst_memory[591] = 16'B0001111100000000;

				//copy r38, r1
				inst_memory[592] = 16'B1100111000100110;
				inst_memory[593] = 16'B0000000100000000;

				//copy r2, [r38]
				inst_memory[594] = 16'B1100111000000010;
				inst_memory[595] = 16'B1110011000000000;

				//sub r2, r2, 0
				inst_memory[596] = 16'B0000111000000010;
				inst_memory[597] = 16'B0000001000000000;

				//copy r38, r2
				inst_memory[598] = 16'B1100111000100110;
				inst_memory[599] = 16'B0000001000000000;

				//sub r1, r31, 3
				inst_memory[600] = 16'B0000111000000001;
				inst_memory[601] = 16'B0001111100000011;

				//copy r42, r1
				inst_memory[602] = 16'B1100111000101010;
				inst_memory[603] = 16'B0000000100000000;

				//copy [r42], [r38]
				inst_memory[604] = 16'B1100111011101010;
				inst_memory[605] = 16'B1110011000000000;

				//sub r1, r31, 0
				inst_memory[606] = 16'B0000111000000001;
				inst_memory[607] = 16'B0001111100000000;

				//copy r38, r1
				inst_memory[608] = 16'B1100111000100110;
				inst_memory[609] = 16'B0000000100000000;

				//copy r2, [r38]
				inst_memory[610] = 16'B1100111000000010;
				inst_memory[611] = 16'B1110011000000000;

				//sub r2, r2, 0
				inst_memory[612] = 16'B0000111000000010;
				inst_memory[613] = 16'B0000001000000000;

				//copy r38, r2
				inst_memory[614] = 16'B1100111000100110;
				inst_memory[615] = 16'B0000001000000000;

				//sub r1, r31, 4
				inst_memory[616] = 16'B0000111000000001;
				inst_memory[617] = 16'B0001111100000100;

				//copy r42, r1
				inst_memory[618] = 16'B1100111000101010;
				inst_memory[619] = 16'B0000000100000000;

				//copy [r42], [r38]
				inst_memory[620] = 16'B1100111011101010;
				inst_memory[621] = 16'B1110011000000000;

				//L012:
				inst_memory[622] = 16'B1111100000000000;
				inst_memory[623] = 0;

				//sub r1, r31, 2
				inst_memory[624] = 16'B0000111000000001;
				inst_memory[625] = 16'B0001111100000010;

				//copy r38, r1
				inst_memory[626] = 16'B1100111000100110;
				inst_memory[627] = 16'B0000000100000000;

				//sub r1, r31, 1
				inst_memory[628] = 16'B0000111000000001;
				inst_memory[629] = 16'B0001111100000001;

				//copy r42, r1
				inst_memory[630] = 16'B1100111000101010;
				inst_memory[631] = 16'B0000000100000000;

				//slt r1, [r38], [r42]
				inst_memory[632] = 16'B0110011100000001;
				inst_memory[633] = 16'B1110011011101010;

				//mov r2, L013
				inst_memory[634] = 16'B1100010000000010;
				inst_memory[635] = 16'B0000001011101100;

				//jmprc r2, r1
				inst_memory[636] = 16'B0111101100000000;
				inst_memory[637] = 16'B0000001000000001;

				//sub r2, r31, 2
				inst_memory[638] = 16'B0000111000000010;
				inst_memory[639] = 16'B0001111100000010;

				//copy r38, r2
				inst_memory[640] = 16'B1100111000100110;
				inst_memory[641] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[642] = 16'B0000111000000010;
				inst_memory[643] = 16'B0001111100000000;

				//copy r42, r2
				inst_memory[644] = 16'B1100111000101010;
				inst_memory[645] = 16'B0000001000000000;

				//copy r3, [r42]
				inst_memory[646] = 16'B1100111000000011;
				inst_memory[647] = 16'B1110101000000000;

				//sub r3, r3, [r38]
				inst_memory[648] = 16'B0000111100000011;
				inst_memory[649] = 16'B0000001111100110;

				//copy r42, r3
				inst_memory[650] = 16'B1100111000101010;
				inst_memory[651] = 16'B0000001100000000;

				//sub r2, r31, 3
				inst_memory[652] = 16'B0000111000000010;
				inst_memory[653] = 16'B0001111100000011;

				//copy r43, r2
				inst_memory[654] = 16'B1100111000101011;
				inst_memory[655] = 16'B0000001000000000;

				//slt r2, [r42], [r43]
				inst_memory[656] = 16'B0110011100000010;
				inst_memory[657] = 16'B1110101011101011;

				//mov r3, L014
				inst_memory[658] = 16'B1100010000000011;
				inst_memory[659] = 16'B0000001010101100;

				//jmprc r3, r2
				inst_memory[660] = 16'B0111101100000000;
				inst_memory[661] = 16'B0000001100000010;

				//sub r3, r31, 2
				inst_memory[662] = 16'B0000111000000011;
				inst_memory[663] = 16'B0001111100000010;

				//copy r42, r3
				inst_memory[664] = 16'B1100111000101010;
				inst_memory[665] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[666] = 16'B0000111000000011;
				inst_memory[667] = 16'B0001111100000000;

				//copy r43, r3
				inst_memory[668] = 16'B1100111000101011;
				inst_memory[669] = 16'B0000001100000000;

				//copy r4, [r43]
				inst_memory[670] = 16'B1100111000000100;
				inst_memory[671] = 16'B1110101100000000;

				//sub r4, r4, [r42]
				inst_memory[672] = 16'B0000111100000100;
				inst_memory[673] = 16'B0000010011101010;

				//copy r43, r4
				inst_memory[674] = 16'B1100111000101011;
				inst_memory[675] = 16'B0000010000000000;

				//sub r3, r31, 3
				inst_memory[676] = 16'B0000111000000011;
				inst_memory[677] = 16'B0001111100000011;

				//copy r44, r3
				inst_memory[678] = 16'B1100111000101100;
				inst_memory[679] = 16'B0000001100000000;

				//copy [r44], [r43]
				inst_memory[680] = 16'B1100111011101100;
				inst_memory[681] = 16'B1110101100000000;

				//jmp L015
				inst_memory[682] = 16'B1011100000000000;
				inst_memory[683] = 16'B0000001011011100;

				//L014:
				inst_memory[684] = 16'B1111100000000000;
				inst_memory[685] = 0;

				//sub r3, r31, 2
				inst_memory[686] = 16'B0000111000000011;
				inst_memory[687] = 16'B0001111100000010;

				//copy r43, r3
				inst_memory[688] = 16'B1100111000101011;
				inst_memory[689] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[690] = 16'B0000111000000011;
				inst_memory[691] = 16'B0001111100000000;

				//copy r44, r3
				inst_memory[692] = 16'B1100111000101100;
				inst_memory[693] = 16'B0000001100000000;

				//copy r4, [r44]
				inst_memory[694] = 16'B1100111000000100;
				inst_memory[695] = 16'B1110110000000000;

				//sub r4, r4, [r43]
				inst_memory[696] = 16'B0000111100000100;
				inst_memory[697] = 16'B0000010011101011;

				//copy r44, r4
				inst_memory[698] = 16'B1100111000101100;
				inst_memory[699] = 16'B0000010000000000;

				//sub r3, r31, 4
				inst_memory[700] = 16'B0000111000000011;
				inst_memory[701] = 16'B0001111100000100;

				//copy r45, r3
				inst_memory[702] = 16'B1100111000101101;
				inst_memory[703] = 16'B0000001100000000;

				//slt r3, [r45], [r44]
				inst_memory[704] = 16'B0110011100000011;
				inst_memory[705] = 16'B1110110111101100;

				//mov r4, L016
				inst_memory[706] = 16'B1100010000000100;
				inst_memory[707] = 16'B0000001011011010;

				//jmprc r4, r3
				inst_memory[708] = 16'B0111101100000000;
				inst_memory[709] = 16'B0000010000000011;

				//sub r4, r31, 2
				inst_memory[710] = 16'B0000111000000100;
				inst_memory[711] = 16'B0001111100000010;

				//copy r44, r4
				inst_memory[712] = 16'B1100111000101100;
				inst_memory[713] = 16'B0000010000000000;

				//sub r4, r31, 0
				inst_memory[714] = 16'B0000111000000100;
				inst_memory[715] = 16'B0001111100000000;

				//copy r45, r4
				inst_memory[716] = 16'B1100111000101101;
				inst_memory[717] = 16'B0000010000000000;

				//copy r5, [r45]
				inst_memory[718] = 16'B1100111000000101;
				inst_memory[719] = 16'B1110110100000000;

				//sub r5, r5, [r44]
				inst_memory[720] = 16'B0000111100000101;
				inst_memory[721] = 16'B0000010111101100;

				//copy r45, r5
				inst_memory[722] = 16'B1100111000101101;
				inst_memory[723] = 16'B0000010100000000;

				//sub r4, r31, 4
				inst_memory[724] = 16'B0000111000000100;
				inst_memory[725] = 16'B0001111100000100;

				//copy r46, r4
				inst_memory[726] = 16'B1100111000101110;
				inst_memory[727] = 16'B0000010000000000;

				//copy [r46], [r45]
				inst_memory[728] = 16'B1100111011101110;
				inst_memory[729] = 16'B1110110100000000;

				//L016:
				inst_memory[730] = 16'B1111100000000000;
				inst_memory[731] = 0;

				//L015:
				inst_memory[732] = 16'B1111100000000000;
				inst_memory[733] = 0;

				//sub r2, r31, 2
				inst_memory[734] = 16'B0000111000000010;
				inst_memory[735] = 16'B0001111100000010;

				//copy r45, r2
				inst_memory[736] = 16'B1100111000101101;
				inst_memory[737] = 16'B0000001000000000;

				//add r2, [r45], 1
				inst_memory[738] = 16'B0000011000000010;
				inst_memory[739] = 16'B1110110100000001;

				//sub r3, r31, 2
				inst_memory[740] = 16'B0000111000000011;
				inst_memory[741] = 16'B0001111100000010;

				//copy r45, r3
				inst_memory[742] = 16'B1100111000101101;
				inst_memory[743] = 16'B0000001100000000;

				//copy [r45], r2
				inst_memory[744] = 16'B1100111011101101;
				inst_memory[745] = 16'B0000001000000000;

				//jmp L012
				inst_memory[746] = 16'B1011100000000000;
				inst_memory[747] = 16'B0000001001101110;

				//L013:
				inst_memory[748] = 16'B1111100000000000;
				inst_memory[749] = 0;

				//sub r1, r31, 3
				inst_memory[750] = 16'B0000111000000001;
				inst_memory[751] = 16'B0001111100000011;

				//copy r45, r1
				inst_memory[752] = 16'B1100111000101101;
				inst_memory[753] = 16'B0000000100000000;

				//output [r45]
				inst_memory[754] = 16'B1000101000000001;
				inst_memory[755] = 16'B1110110100000000;

				//sub r1, r31, 4
				inst_memory[756] = 16'B0000111000000001;
				inst_memory[757] = 16'B0001111100000100;

				//copy r45, r1
				inst_memory[758] = 16'B1100111000101101;
				inst_memory[759] = 16'B0000000100000000;

				//output [r45]
				inst_memory[760] = 16'B1000101000000001;
				inst_memory[761] = 16'B1110110100000000;

				//sub r31, r31 5
				inst_memory[762] = 16'B0000111000011111;
				inst_memory[763] = 16'B0001111100000101;

				//add r29, r29, 1
				inst_memory[764] = 16'B0000011000011101;
				inst_memory[765] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[766] = 16'B1100111000111111;
				inst_memory[767] = 16'B0001110100000000;

				//copy r1, [r63]
				inst_memory[768] = 16'B1100111000000001;
				inst_memory[769] = 16'B1111111100000000;

				//jmpr r1
				inst_memory[770] = 16'B0111001000000000;
				inst_memory[771] = 16'B0000000100000000;

				//F005:
				inst_memory[772] = 16'B1111100000000000;
				inst_memory[773] = 0;

				//add r31, r31 6
				inst_memory[774] = 16'B0000011000011111;
				inst_memory[775] = 16'B0001111100000110;

				//add r29, r29, 1
				inst_memory[776] = 16'B0000011000011101;
				inst_memory[777] = 16'B0001110100000001;

				//sub r1, r31, 2
				inst_memory[778] = 16'B0000111000000001;
				inst_memory[779] = 16'B0001111100000010;

				//copy r45, r1
				inst_memory[780] = 16'B1100111000101101;
				inst_memory[781] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[782] = 16'B1100111000111111;
				inst_memory[783] = 16'B0001110100000000;

				//copy [r45], [r63]
				inst_memory[784] = 16'B1100111011101101;
				inst_memory[785] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[786] = 16'B0000011000011101;
				inst_memory[787] = 16'B0001110100000001;

				//sub r1, r31, 1
				inst_memory[788] = 16'B0000111000000001;
				inst_memory[789] = 16'B0001111100000001;

				//copy r45, r1
				inst_memory[790] = 16'B1100111000101101;
				inst_memory[791] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[792] = 16'B1100111000111111;
				inst_memory[793] = 16'B0001110100000000;

				//copy [r45], [r63]
				inst_memory[794] = 16'B1100111011101101;
				inst_memory[795] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[796] = 16'B0000011000011101;
				inst_memory[797] = 16'B0001110100000001;

				//sub r1, r31, 0
				inst_memory[798] = 16'B0000111000000001;
				inst_memory[799] = 16'B0001111100000000;

				//copy r45, r1
				inst_memory[800] = 16'B1100111000101101;
				inst_memory[801] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[802] = 16'B1100111000111111;
				inst_memory[803] = 16'B0001110100000000;

				//copy [r45], [r63]
				inst_memory[804] = 16'B1100111011101101;
				inst_memory[805] = 16'B1111111100000000;

				//sub r1, r31, 1
				inst_memory[806] = 16'B0000111000000001;
				inst_memory[807] = 16'B0001111100000001;

				//copy r45, r1
				inst_memory[808] = 16'B1100111000101101;
				inst_memory[809] = 16'B0000000100000000;

				//sub r1, r31, 5
				inst_memory[810] = 16'B0000111000000001;
				inst_memory[811] = 16'B0001111100000101;

				//copy r46, r1
				inst_memory[812] = 16'B1100111000101110;
				inst_memory[813] = 16'B0000000100000000;

				//copy [r46], [r45]
				inst_memory[814] = 16'B1100111011101110;
				inst_memory[815] = 16'B1110110100000000;

				//sub r1, r31, 1
				inst_memory[816] = 16'B0000111000000001;
				inst_memory[817] = 16'B0001111100000001;

				//copy r45, r1
				inst_memory[818] = 16'B1100111000101101;
				inst_memory[819] = 16'B0000000100000000;

				//sub r1, r31, 0
				inst_memory[820] = 16'B0000111000000001;
				inst_memory[821] = 16'B0001111100000000;

				//copy r46, r1
				inst_memory[822] = 16'B1100111000101110;
				inst_memory[823] = 16'B0000000100000000;

				//copy r2, [r46]
				inst_memory[824] = 16'B1100111000000010;
				inst_memory[825] = 16'B1110111000000000;

				//sub r2, r2, [r45]
				inst_memory[826] = 16'B0000111100000010;
				inst_memory[827] = 16'B0000001011101101;

				//copy r46, r2
				inst_memory[828] = 16'B1100111000101110;
				inst_memory[829] = 16'B0000001000000000;

				//sub r1, r31, 4
				inst_memory[830] = 16'B0000111000000001;
				inst_memory[831] = 16'B0001111100000100;

				//copy r47, r1
				inst_memory[832] = 16'B1100111000101111;
				inst_memory[833] = 16'B0000000100000000;

				//copy [r47], [r46]
				inst_memory[834] = 16'B1100111011101111;
				inst_memory[835] = 16'B1110111000000000;

				//sub r1, r31, 1
				inst_memory[836] = 16'B0000111000000001;
				inst_memory[837] = 16'B0001111100000001;

				//copy r46, r1
				inst_memory[838] = 16'B1100111000101110;
				inst_memory[839] = 16'B0000000100000000;

				//add r1, [r46], 1
				inst_memory[840] = 16'B0000011000000001;
				inst_memory[841] = 16'B1110111000000001;

				//sub r2, r31, 3
				inst_memory[842] = 16'B0000111000000010;
				inst_memory[843] = 16'B0001111100000011;

				//copy r46, r2
				inst_memory[844] = 16'B1100111000101110;
				inst_memory[845] = 16'B0000001000000000;

				//copy [r46], r1
				inst_memory[846] = 16'B1100111011101110;
				inst_memory[847] = 16'B0000000100000000;

				//L017:
				inst_memory[848] = 16'B1111100000000000;
				inst_memory[849] = 0;

				//sub r1, r31, 3
				inst_memory[850] = 16'B0000111000000001;
				inst_memory[851] = 16'B0001111100000011;

				//copy r46, r1
				inst_memory[852] = 16'B1100111000101110;
				inst_memory[853] = 16'B0000000100000000;

				//sub r1, r31, 2
				inst_memory[854] = 16'B0000111000000001;
				inst_memory[855] = 16'B0001111100000010;

				//copy r47, r1
				inst_memory[856] = 16'B1100111000101111;
				inst_memory[857] = 16'B0000000100000000;

				//slt r1, [r46], [r47]
				inst_memory[858] = 16'B0110011100000001;
				inst_memory[859] = 16'B1110111011101111;

				//mov r2, L018
				inst_memory[860] = 16'B1100010000000010;
				inst_memory[861] = 16'B0000001110100110;

				//jmprc r2, r1
				inst_memory[862] = 16'B0111101100000000;
				inst_memory[863] = 16'B0000001000000001;

				//sub r2, r31, 3
				inst_memory[864] = 16'B0000111000000010;
				inst_memory[865] = 16'B0001111100000011;

				//copy r46, r2
				inst_memory[866] = 16'B1100111000101110;
				inst_memory[867] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[868] = 16'B0000111000000010;
				inst_memory[869] = 16'B0001111100000000;

				//copy r47, r2
				inst_memory[870] = 16'B1100111000101111;
				inst_memory[871] = 16'B0000001000000000;

				//copy r3, [r47]
				inst_memory[872] = 16'B1100111000000011;
				inst_memory[873] = 16'B1110111100000000;

				//sub r3, r3, [r46]
				inst_memory[874] = 16'B0000111100000011;
				inst_memory[875] = 16'B0000001111101110;

				//copy r47, r3
				inst_memory[876] = 16'B1100111000101111;
				inst_memory[877] = 16'B0000001100000000;

				//sub r2, r31, 4
				inst_memory[878] = 16'B0000111000000010;
				inst_memory[879] = 16'B0001111100000100;

				//copy r48, r2
				inst_memory[880] = 16'B1100111000110000;
				inst_memory[881] = 16'B0000001000000000;

				//slt r2, [r47], [r48]
				inst_memory[882] = 16'B0110011100000010;
				inst_memory[883] = 16'B1110111111110000;

				//mov r3, L019
				inst_memory[884] = 16'B1100010000000011;
				inst_memory[885] = 16'B0000001110010110;

				//jmprc r3, r2
				inst_memory[886] = 16'B0111101100000000;
				inst_memory[887] = 16'B0000001100000010;

				//sub r3, r31, 3
				inst_memory[888] = 16'B0000111000000011;
				inst_memory[889] = 16'B0001111100000011;

				//copy r47, r3
				inst_memory[890] = 16'B1100111000101111;
				inst_memory[891] = 16'B0000001100000000;

				//sub r3, r31, 0
				inst_memory[892] = 16'B0000111000000011;
				inst_memory[893] = 16'B0001111100000000;

				//copy r48, r3
				inst_memory[894] = 16'B1100111000110000;
				inst_memory[895] = 16'B0000001100000000;

				//copy r4, [r48]
				inst_memory[896] = 16'B1100111000000100;
				inst_memory[897] = 16'B1111000000000000;

				//sub r4, r4, [r47]
				inst_memory[898] = 16'B0000111100000100;
				inst_memory[899] = 16'B0000010011101111;

				//copy r48, r4
				inst_memory[900] = 16'B1100111000110000;
				inst_memory[901] = 16'B0000010000000000;

				//sub r3, r31, 4
				inst_memory[902] = 16'B0000111000000011;
				inst_memory[903] = 16'B0001111100000100;

				//copy r49, r3
				inst_memory[904] = 16'B1100111000110001;
				inst_memory[905] = 16'B0000001100000000;

				//copy [r49], [r48]
				inst_memory[906] = 16'B1100111011110001;
				inst_memory[907] = 16'B1111000000000000;

				//sub r3, r31, 3
				inst_memory[908] = 16'B0000111000000011;
				inst_memory[909] = 16'B0001111100000011;

				//copy r48, r3
				inst_memory[910] = 16'B1100111000110000;
				inst_memory[911] = 16'B0000001100000000;

				//sub r3, r31, 5
				inst_memory[912] = 16'B0000111000000011;
				inst_memory[913] = 16'B0001111100000101;

				//copy r49, r3
				inst_memory[914] = 16'B1100111000110001;
				inst_memory[915] = 16'B0000001100000000;

				//copy [r49], [r48]
				inst_memory[916] = 16'B1100111011110001;
				inst_memory[917] = 16'B1111000000000000;

				//L019:
				inst_memory[918] = 16'B1111100000000000;
				inst_memory[919] = 0;

				//sub r2, r31, 3
				inst_memory[920] = 16'B0000111000000010;
				inst_memory[921] = 16'B0001111100000011;

				//copy r48, r2
				inst_memory[922] = 16'B1100111000110000;
				inst_memory[923] = 16'B0000001000000000;

				//add r2, [r48], 1
				inst_memory[924] = 16'B0000011000000010;
				inst_memory[925] = 16'B1111000000000001;

				//sub r3, r31, 3
				inst_memory[926] = 16'B0000111000000011;
				inst_memory[927] = 16'B0001111100000011;

				//copy r48, r3
				inst_memory[928] = 16'B1100111000110000;
				inst_memory[929] = 16'B0000001100000000;

				//copy [r48], r2
				inst_memory[930] = 16'B1100111011110000;
				inst_memory[931] = 16'B0000001000000000;

				//jmp L017
				inst_memory[932] = 16'B1011100000000000;
				inst_memory[933] = 16'B0000001101010000;

				//L018:
				inst_memory[934] = 16'B1111100000000000;
				inst_memory[935] = 0;

				//sub r1, r31, 5
				inst_memory[936] = 16'B0000111000000001;
				inst_memory[937] = 16'B0001111100000101;

				//copy r48, r1
				inst_memory[938] = 16'B1100111000110000;
				inst_memory[939] = 16'B0000000100000000;

				//copy r30, [r48]
				inst_memory[940] = 16'B1100111000011110;
				inst_memory[941] = 16'B1111000000000000;

				//sub r31, r31 6
				inst_memory[942] = 16'B0000111000011111;
				inst_memory[943] = 16'B0001111100000110;

				//add r29, r29, 1
				inst_memory[944] = 16'B0000011000011101;
				inst_memory[945] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[946] = 16'B1100111000111111;
				inst_memory[947] = 16'B0001110100000000;

				//copy r1, [r63]
				inst_memory[948] = 16'B1100111000000001;
				inst_memory[949] = 16'B1111111100000000;

				//jmpr r1
				inst_memory[950] = 16'B0111001000000000;
				inst_memory[951] = 16'B0000000100000000;

				//F006:
				inst_memory[952] = 16'B1111100000000000;
				inst_memory[953] = 0;

				//add r31, r31 2
				inst_memory[954] = 16'B0000011000011111;
				inst_memory[955] = 16'B0001111100000010;

				//add r29, r29, 1
				inst_memory[956] = 16'B0000011000011101;
				inst_memory[957] = 16'B0001110100000001;

				//sub r1, r31, 1
				inst_memory[958] = 16'B0000111000000001;
				inst_memory[959] = 16'B0001111100000001;

				//copy r49, r1
				inst_memory[960] = 16'B1100111000110001;
				inst_memory[961] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[962] = 16'B1100111000111111;
				inst_memory[963] = 16'B0001110100000000;

				//copy [r49], [r63]
				inst_memory[964] = 16'B1100111011110001;
				inst_memory[965] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[966] = 16'B0000011000011101;
				inst_memory[967] = 16'B0001110100000001;

				//sub r1, r31, 0
				inst_memory[968] = 16'B0000111000000001;
				inst_memory[969] = 16'B0001111100000000;

				//copy r49, r1
				inst_memory[970] = 16'B1100111000110001;
				inst_memory[971] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[972] = 16'B1100111000111111;
				inst_memory[973] = 16'B0001110100000000;

				//copy [r49], [r63]
				inst_memory[974] = 16'B1100111011110001;
				inst_memory[975] = 16'B1111111100000000;

				//sub r1, r31, 1
				inst_memory[976] = 16'B0000111000000001;
				inst_memory[977] = 16'B0001111100000001;

				//copy r49, r1
				inst_memory[978] = 16'B1100111000110001;
				inst_memory[979] = 16'B0000000100000000;

				//seq r1, [r49], 0
				inst_memory[980] = 16'B0110111000000001;
				inst_memory[981] = 16'B1111000100000000;

				//mov r2, L020
				inst_memory[982] = 16'B1100010000000010;
				inst_memory[983] = 16'B0000001111100010;

				//jmprc r2, r1
				inst_memory[984] = 16'B0111101100000000;
				inst_memory[985] = 16'B0000001000000001;

				//sub r2, r31, 0
				inst_memory[986] = 16'B0000111000000010;
				inst_memory[987] = 16'B0001111100000000;

				//copy r49, r2
				inst_memory[988] = 16'B1100111000110001;
				inst_memory[989] = 16'B0000001000000000;

				//copy r30, [r49]
				inst_memory[990] = 16'B1100111000011110;
				inst_memory[991] = 16'B1111000100000000;

				//jmp L021
				inst_memory[992] = 16'B1011100000000000;
				inst_memory[993] = 16'B0000010000011000;

				//L020:
				inst_memory[994] = 16'B1111100000000000;
				inst_memory[995] = 0;

				//copy r50, r63
				inst_memory[996] = 16'B1100111000110010;
				inst_memory[997] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[998] = 16'B0000111000011101;
				inst_memory[999] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1000] = 16'B1100111000111111;
				inst_memory[1001] = 16'B0001110100000000;

				//sub r2, r31, 0
				inst_memory[1002] = 16'B0000111000000010;
				inst_memory[1003] = 16'B0001111100000000;

				//copy r51, r2
				inst_memory[1004] = 16'B1100111000110011;
				inst_memory[1005] = 16'B0000001000000000;

				//sub r2, r31, 0
				inst_memory[1006] = 16'B0000111000000010;
				inst_memory[1007] = 16'B0001111100000000;

				//copy r52, r2
				inst_memory[1008] = 16'B1100111000110100;
				inst_memory[1009] = 16'B0000001000000000;

				//sub r2, r31, 1
				inst_memory[1010] = 16'B0000111000000010;
				inst_memory[1011] = 16'B0001111100000001;

				//copy r53, r2
				inst_memory[1012] = 16'B1100111000110101;
				inst_memory[1013] = 16'B0000001000000000;

				//div r2, [r52], [r53]
				inst_memory[1014] = 16'B0001111100000010;
				inst_memory[1015] = 16'B1111010011110101;

				//sub r3, r31, 1
				inst_memory[1016] = 16'B0000111000000011;
				inst_memory[1017] = 16'B0001111100000001;

				//copy r52, r3
				inst_memory[1018] = 16'B1100111000110100;
				inst_memory[1019] = 16'B0000001100000000;

				//mult r3, r2, [r52]
				inst_memory[1020] = 16'B0001011100000011;
				inst_memory[1021] = 16'B0000001011110100;

				//sub r2, [r51], r3
				inst_memory[1022] = 16'B0000111100000010;
				inst_memory[1023] = 16'B1111001100000011;

				//sub r3, r31, 1
				inst_memory[1024] = 16'B0000111000000011;
				inst_memory[1025] = 16'B0001111100000001;

				//copy r51, r3
				inst_memory[1026] = 16'B1100111000110011;
				inst_memory[1027] = 16'B0000001100000000;

				//copy [r63], [r51]
				inst_memory[1028] = 16'B1100111011111111;
				inst_memory[1029] = 16'B1111001100000000;

				//sub r29, r29, 1
				inst_memory[1030] = 16'B0000111000011101;
				inst_memory[1031] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1032] = 16'B1100111000111111;
				inst_memory[1033] = 16'B0001110100000000;

				//copy [r63], r2
				inst_memory[1034] = 16'B1100111011111111;
				inst_memory[1035] = 16'B0000001000000000;

				//sub r29, r29, 1
				inst_memory[1036] = 16'B0000111000011101;
				inst_memory[1037] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1038] = 16'B1100111000111111;
				inst_memory[1039] = 16'B0001110100000000;

				//movr [r50], 1
				inst_memory[1040] = 16'B1101010011110010;
				inst_memory[1041] = 16'B0000000000000001;

				//jmp F006
				inst_memory[1042] = 16'B1011100000000000;
				inst_memory[1043] = 16'B0000001110111000;

				//copy r2, r30
				inst_memory[1044] = 16'B1100111000000010;
				inst_memory[1045] = 16'B0001111000000000;

				//copy r30, r2
				inst_memory[1046] = 16'B1100111000011110;
				inst_memory[1047] = 16'B0000001000000000;

				//L021:
				inst_memory[1048] = 16'B1111100000000000;
				inst_memory[1049] = 0;

				//sub r31, r31 2
				inst_memory[1050] = 16'B0000111000011111;
				inst_memory[1051] = 16'B0001111100000010;

				//add r29, r29, 1
				inst_memory[1052] = 16'B0000011000011101;
				inst_memory[1053] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1054] = 16'B1100111000111111;
				inst_memory[1055] = 16'B0001110100000000;

				//copy r1, [r63]
				inst_memory[1056] = 16'B1100111000000001;
				inst_memory[1057] = 16'B1111111100000000;

				//jmpr r1
				inst_memory[1058] = 16'B0111001000000000;
				inst_memory[1059] = 16'B0000000100000000;

				//F007:
				inst_memory[1060] = 16'B1111100000000000;
				inst_memory[1061] = 0;

				//add r31, r31 5
				inst_memory[1062] = 16'B0000011000011111;
				inst_memory[1063] = 16'B0001111100000101;

				//add r29, r29, 1
				inst_memory[1064] = 16'B0000011000011101;
				inst_memory[1065] = 16'B0001110100000001;

				//sub r1, r31, 0
				inst_memory[1066] = 16'B0000111000000001;
				inst_memory[1067] = 16'B0001111100000000;

				//copy r50, r1
				inst_memory[1068] = 16'B1100111000110010;
				inst_memory[1069] = 16'B0000000100000000;

				//copy r63, r29
				inst_memory[1070] = 16'B1100111000111111;
				inst_memory[1071] = 16'B0001110100000000;

				//copy [r50], [r63]
				inst_memory[1072] = 16'B1100111011110010;
				inst_memory[1073] = 16'B1111111100000000;

				//sub r1, r31, 0
				inst_memory[1074] = 16'B0000111000000001;
				inst_memory[1075] = 16'B0001111100000000;

				//copy r50, r1
				inst_memory[1076] = 16'B1100111000110010;
				inst_memory[1077] = 16'B0000000100000000;

				//slt r1, 0, [r50]
				inst_memory[1078] = 16'B0110010100000001;
				inst_memory[1079] = 16'B0000000011110010;

				//sub r1, r1, 1
				inst_memory[1080] = 16'B0000111000000001;
				inst_memory[1081] = 16'B0000000100000001;

				//mov r3, L022
				inst_memory[1082] = 16'B1100010000000011;
				inst_memory[1083] = 16'B0000010001000010;

				//jmprc r3, r1
				inst_memory[1084] = 16'B0111101100000000;
				inst_memory[1085] = 16'B0000001100000001;

				//mov r30, 0
				inst_memory[1086] = 16'B1100010000011110;
				inst_memory[1087] = 16'B0000000000000000;

				//jmp L023
				inst_memory[1088] = 16'B1011100000000000;
				inst_memory[1089] = 16'B0000010010110010;

				//L022:
				inst_memory[1090] = 16'B1111100000000000;
				inst_memory[1091] = 0;

				//sub r3, r31, 0
				inst_memory[1092] = 16'B0000111000000011;
				inst_memory[1093] = 16'B0001111100000000;

				//copy r50, r3
				inst_memory[1094] = 16'B1100111000110010;
				inst_memory[1095] = 16'B0000001100000000;

				//seq r3, [r50], 1
				inst_memory[1096] = 16'B0110111000000011;
				inst_memory[1097] = 16'B1111001000000001;

				//mov r4, L024
				inst_memory[1098] = 16'B1100010000000100;
				inst_memory[1099] = 16'B0000010001010010;

				//jmprc r4, r3
				inst_memory[1100] = 16'B0111101100000000;
				inst_memory[1101] = 16'B0000010000000011;

				//mov r30, 1
				inst_memory[1102] = 16'B1100010000011110;
				inst_memory[1103] = 16'B0000000000000001;

				//jmp L025
				inst_memory[1104] = 16'B1011100000000000;
				inst_memory[1105] = 16'B0000010010110000;

				//L024:
				inst_memory[1106] = 16'B1111100000000000;
				inst_memory[1107] = 0;

				//sub r4, r31, 1
				inst_memory[1108] = 16'B0000111000000100;
				inst_memory[1109] = 16'B0001111100000001;

				//copy r50, r4
				inst_memory[1110] = 16'B1100111000110010;
				inst_memory[1111] = 16'B0000010000000000;

				//mov [r50], 0
				inst_memory[1112] = 16'B1100010011110010;
				inst_memory[1113] = 16'B0000000000000000;

				//sub r0, r31, 4
				inst_memory[1114] = 16'B0000111000000000;
				inst_memory[1115] = 16'B0001111100000100;

				//copy r50, r0
				inst_memory[1116] = 16'B1100111000110010;
				inst_memory[1117] = 16'B0000000000000000;

				//mov [r50], 1
				inst_memory[1118] = 16'B1100010011110010;
				inst_memory[1119] = 16'B0000000000000001;

				//sub r0, r31, 2
				inst_memory[1120] = 16'B0000111000000000;
				inst_memory[1121] = 16'B0001111100000010;

				//copy r50, r0
				inst_memory[1122] = 16'B1100111000110010;
				inst_memory[1123] = 16'B0000000000000000;

				//mov [r50], 1
				inst_memory[1124] = 16'B1100010011110010;
				inst_memory[1125] = 16'B0000000000000001;

				//L026:
				inst_memory[1126] = 16'B1111100000000000;
				inst_memory[1127] = 0;

				//sub r0, r31, 4
				inst_memory[1128] = 16'B0000111000000000;
				inst_memory[1129] = 16'B0001111100000100;

				//copy r50, r0
				inst_memory[1130] = 16'B1100111000110010;
				inst_memory[1131] = 16'B0000000000000000;

				//sub r0, r31, 0
				inst_memory[1132] = 16'B0000111000000000;
				inst_memory[1133] = 16'B0001111100000000;

				//copy r51, r0
				inst_memory[1134] = 16'B1100111000110011;
				inst_memory[1135] = 16'B0000000000000000;

				//slt r0, [r50], [r51]
				inst_memory[1136] = 16'B0110011100000000;
				inst_memory[1137] = 16'B1111001011110011;

				//mov r1, L027
				inst_memory[1138] = 16'B1100010000000001;
				inst_memory[1139] = 16'B0000010010101000;

				//jmprc r1, r0
				inst_memory[1140] = 16'B0111101100000000;
				inst_memory[1141] = 16'B0000000100000000;

				//sub r1, r31, 2
				inst_memory[1142] = 16'B0000111000000001;
				inst_memory[1143] = 16'B0001111100000010;

				//copy r50, r1
				inst_memory[1144] = 16'B1100111000110010;
				inst_memory[1145] = 16'B0000000100000000;

				//sub r1, r31, 3
				inst_memory[1146] = 16'B0000111000000001;
				inst_memory[1147] = 16'B0001111100000011;

				//copy r51, r1
				inst_memory[1148] = 16'B1100111000110011;
				inst_memory[1149] = 16'B0000000100000000;

				//copy [r51], [r50]
				inst_memory[1150] = 16'B1100111011110011;
				inst_memory[1151] = 16'B1111001000000000;

				//sub r1, r31, 2
				inst_memory[1152] = 16'B0000111000000001;
				inst_memory[1153] = 16'B0001111100000010;

				//copy r50, r1
				inst_memory[1154] = 16'B1100111000110010;
				inst_memory[1155] = 16'B0000000100000000;

				//sub r1, r31, 1
				inst_memory[1156] = 16'B0000111000000001;
				inst_memory[1157] = 16'B0001111100000001;

				//copy r51, r1
				inst_memory[1158] = 16'B1100111000110011;
				inst_memory[1159] = 16'B0000000100000000;

				//add r1, [r50], [r51]
				inst_memory[1160] = 16'B0000011100000001;
				inst_memory[1161] = 16'B1111001011110011;

				//sub r4, r31, 2
				inst_memory[1162] = 16'B0000111000000100;
				inst_memory[1163] = 16'B0001111100000010;

				//copy r50, r4
				inst_memory[1164] = 16'B1100111000110010;
				inst_memory[1165] = 16'B0000010000000000;

				//copy [r50], r1
				inst_memory[1166] = 16'B1100111011110010;
				inst_memory[1167] = 16'B0000000100000000;

				//sub r1, r31, 3
				inst_memory[1168] = 16'B0000111000000001;
				inst_memory[1169] = 16'B0001111100000011;

				//copy r50, r1
				inst_memory[1170] = 16'B1100111000110010;
				inst_memory[1171] = 16'B0000000100000000;

				//sub r1, r31, 1
				inst_memory[1172] = 16'B0000111000000001;
				inst_memory[1173] = 16'B0001111100000001;

				//copy r51, r1
				inst_memory[1174] = 16'B1100111000110011;
				inst_memory[1175] = 16'B0000000100000000;

				//copy [r51], [r50]
				inst_memory[1176] = 16'B1100111011110011;
				inst_memory[1177] = 16'B1111001000000000;

				//sub r1, r31, 4
				inst_memory[1178] = 16'B0000111000000001;
				inst_memory[1179] = 16'B0001111100000100;

				//copy r50, r1
				inst_memory[1180] = 16'B1100111000110010;
				inst_memory[1181] = 16'B0000000100000000;

				//add r1, [r50], 1
				inst_memory[1182] = 16'B0000011000000001;
				inst_memory[1183] = 16'B1111001000000001;

				//sub r4, r31, 4
				inst_memory[1184] = 16'B0000111000000100;
				inst_memory[1185] = 16'B0001111100000100;

				//copy r50, r4
				inst_memory[1186] = 16'B1100111000110010;
				inst_memory[1187] = 16'B0000010000000000;

				//copy [r50], r1
				inst_memory[1188] = 16'B1100111011110010;
				inst_memory[1189] = 16'B0000000100000000;

				//jmp L026
				inst_memory[1190] = 16'B1011100000000000;
				inst_memory[1191] = 16'B0000010001100110;

				//L027:
				inst_memory[1192] = 16'B1111100000000000;
				inst_memory[1193] = 0;

				//sub r0, r31, 2
				inst_memory[1194] = 16'B0000111000000000;
				inst_memory[1195] = 16'B0001111100000010;

				//copy r50, r0
				inst_memory[1196] = 16'B1100111000110010;
				inst_memory[1197] = 16'B0000000000000000;

				//copy r30, [r50]
				inst_memory[1198] = 16'B1100111000011110;
				inst_memory[1199] = 16'B1111001000000000;

				//L025:
				inst_memory[1200] = 16'B1111100000000000;
				inst_memory[1201] = 0;

				//L023:
				inst_memory[1202] = 16'B1111100000000000;
				inst_memory[1203] = 0;

				//sub r31, r31 5
				inst_memory[1204] = 16'B0000111000011111;
				inst_memory[1205] = 16'B0001111100000101;

				//add r29, r29, 1
				inst_memory[1206] = 16'B0000011000011101;
				inst_memory[1207] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1208] = 16'B1100111000111111;
				inst_memory[1209] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[1210] = 16'B1100111000000000;
				inst_memory[1211] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[1212] = 16'B0111001000000000;
				inst_memory[1213] = 16'B0000000000000000;

				//F008:
				inst_memory[1214] = 16'B1111100000000000;
				inst_memory[1215] = 0;

				//add r31, r31 1
				inst_memory[1216] = 16'B0000011000011111;
				inst_memory[1217] = 16'B0001111100000001;

				//add r29, r29, 1
				inst_memory[1218] = 16'B0000011000011101;
				inst_memory[1219] = 16'B0001110100000001;

				//sub r0, r31, 0
				inst_memory[1220] = 16'B0000111000000000;
				inst_memory[1221] = 16'B0001111100000000;

				//copy r51, r0
				inst_memory[1222] = 16'B1100111000110011;
				inst_memory[1223] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[1224] = 16'B1100111000111111;
				inst_memory[1225] = 16'B0001110100000000;

				//copy [r51], [r63]
				inst_memory[1226] = 16'B1100111011110011;
				inst_memory[1227] = 16'B1111111100000000;

				//sub r0, r31, 0
				inst_memory[1228] = 16'B0000111000000000;
				inst_memory[1229] = 16'B0001111100000000;

				//copy r51, r0
				inst_memory[1230] = 16'B1100111000110011;
				inst_memory[1231] = 16'B0000000000000000;

				//slt r0, [r51], 2
				inst_memory[1232] = 16'B0110011000000000;
				inst_memory[1233] = 16'B1111001100000010;

				//mov r1, L028
				inst_memory[1234] = 16'B1100010000000001;
				inst_memory[1235] = 16'B0000010011011010;

				//jmprc r1, r0
				inst_memory[1236] = 16'B0111101100000000;
				inst_memory[1237] = 16'B0000000100000000;

				//mov r30, 1
				inst_memory[1238] = 16'B1100010000011110;
				inst_memory[1239] = 16'B0000000000000001;

				//jmp L029
				inst_memory[1240] = 16'B1011100000000000;
				inst_memory[1241] = 16'B0000010011111100;

				//L028:
				inst_memory[1242] = 16'B1111100000000000;
				inst_memory[1243] = 0;

				//copy r51, r63
				inst_memory[1244] = 16'B1100111000110011;
				inst_memory[1245] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1246] = 16'B0000111000011101;
				inst_memory[1247] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1248] = 16'B1100111000111111;
				inst_memory[1249] = 16'B0001110100000000;

				//sub r1, r31, 0
				inst_memory[1250] = 16'B0000111000000001;
				inst_memory[1251] = 16'B0001111100000000;

				//copy r52, r1
				inst_memory[1252] = 16'B1100111000110100;
				inst_memory[1253] = 16'B0000000100000000;

				//sub r1, [r52], 1
				inst_memory[1254] = 16'B0000111000000001;
				inst_memory[1255] = 16'B1111010000000001;

				//copy [r63], r1
				inst_memory[1256] = 16'B1100111011111111;
				inst_memory[1257] = 16'B0000000100000000;

				//sub r29, r29, 1
				inst_memory[1258] = 16'B0000111000011101;
				inst_memory[1259] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1260] = 16'B1100111000111111;
				inst_memory[1261] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1262] = 16'B1101010011110011;
				inst_memory[1263] = 16'B0000000000000001;

				//jmp F008
				inst_memory[1264] = 16'B1011100000000000;
				inst_memory[1265] = 16'B0000010010111110;

				//copy r1, r30
				inst_memory[1266] = 16'B1100111000000001;
				inst_memory[1267] = 16'B0001111000000000;

				//sub r3, r31, 0
				inst_memory[1268] = 16'B0000111000000011;
				inst_memory[1269] = 16'B0001111100000000;

				//copy r51, r3
				inst_memory[1270] = 16'B1100111000110011;
				inst_memory[1271] = 16'B0000001100000000;

				//mult r3, r1, [r51]
				inst_memory[1272] = 16'B0001011100000011;
				inst_memory[1273] = 16'B0000000111110011;

				//copy r30, r3
				inst_memory[1274] = 16'B1100111000011110;
				inst_memory[1275] = 16'B0000001100000000;

				//L029:
				inst_memory[1276] = 16'B1111100000000000;
				inst_memory[1277] = 0;

				//sub r31, r31 1
				inst_memory[1278] = 16'B0000111000011111;
				inst_memory[1279] = 16'B0001111100000001;

				//add r29, r29, 1
				inst_memory[1280] = 16'B0000011000011101;
				inst_memory[1281] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1282] = 16'B1100111000111111;
				inst_memory[1283] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[1284] = 16'B1100111000000000;
				inst_memory[1285] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[1286] = 16'B0111001000000000;
				inst_memory[1287] = 16'B0000000000000000;

				//F009:
				inst_memory[1288] = 16'B1111100000000000;
				inst_memory[1289] = 0;

				//add r31, r31 3
				inst_memory[1290] = 16'B0000011000011111;
				inst_memory[1291] = 16'B0001111100000011;

				//add r29, r29, 1
				inst_memory[1292] = 16'B0000011000011101;
				inst_memory[1293] = 16'B0001110100000001;

				//sub r0, r31, 2
				inst_memory[1294] = 16'B0000111000000000;
				inst_memory[1295] = 16'B0001111100000010;

				//copy r51, r0
				inst_memory[1296] = 16'B1100111000110011;
				inst_memory[1297] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[1298] = 16'B1100111000111111;
				inst_memory[1299] = 16'B0001110100000000;

				//copy [r51], [r63]
				inst_memory[1300] = 16'B1100111011110011;
				inst_memory[1301] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[1302] = 16'B0000011000011101;
				inst_memory[1303] = 16'B0001110100000001;

				//sub r0, r31, 1
				inst_memory[1304] = 16'B0000111000000000;
				inst_memory[1305] = 16'B0001111100000001;

				//copy r51, r0
				inst_memory[1306] = 16'B1100111000110011;
				inst_memory[1307] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[1308] = 16'B1100111000111111;
				inst_memory[1309] = 16'B0001110100000000;

				//copy [r51], [r63]
				inst_memory[1310] = 16'B1100111011110011;
				inst_memory[1311] = 16'B1111111100000000;

				//add r29, r29, 1
				inst_memory[1312] = 16'B0000011000011101;
				inst_memory[1313] = 16'B0001110100000001;

				//sub r0, r31, 0
				inst_memory[1314] = 16'B0000111000000000;
				inst_memory[1315] = 16'B0001111100000000;

				//copy r51, r0
				inst_memory[1316] = 16'B1100111000110011;
				inst_memory[1317] = 16'B0000000000000000;

				//copy r63, r29
				inst_memory[1318] = 16'B1100111000111111;
				inst_memory[1319] = 16'B0001110100000000;

				//copy [r51], [r63]
				inst_memory[1320] = 16'B1100111011110011;
				inst_memory[1321] = 16'B1111111100000000;

				//sub r0, r31, 2
				inst_memory[1322] = 16'B0000111000000000;
				inst_memory[1323] = 16'B0001111100000010;

				//copy r51, r0
				inst_memory[1324] = 16'B1100111000110011;
				inst_memory[1325] = 16'B0000000000000000;

				//seq r0, [r51], 1
				inst_memory[1326] = 16'B0110111000000000;
				inst_memory[1327] = 16'B1111001100000001;

				//mov r1, L030
				inst_memory[1328] = 16'B1100010000000001;
				inst_memory[1329] = 16'B0000010101000010;

				//jmprc r1, r0
				inst_memory[1330] = 16'B0111101100000000;
				inst_memory[1331] = 16'B0000000100000000;

				//sub r1, r31, 0
				inst_memory[1332] = 16'B0000111000000001;
				inst_memory[1333] = 16'B0001111100000000;

				//copy r51, r1
				inst_memory[1334] = 16'B1100111000110011;
				inst_memory[1335] = 16'B0000000100000000;

				//sub r1, r31, 1
				inst_memory[1336] = 16'B0000111000000001;
				inst_memory[1337] = 16'B0001111100000001;

				//copy r52, r1
				inst_memory[1338] = 16'B1100111000110100;
				inst_memory[1339] = 16'B0000000100000000;

				//add r1, [r51], [r52]
				inst_memory[1340] = 16'B0000011100000001;
				inst_memory[1341] = 16'B1111001111110100;

				//copy r30, r1
				inst_memory[1342] = 16'B1100111000011110;
				inst_memory[1343] = 16'B0000000100000000;

				//jmp L031
				inst_memory[1344] = 16'B1011100000000000;
				inst_memory[1345] = 16'B0000010111011010;

				//L030:
				inst_memory[1346] = 16'B1111100000000000;
				inst_memory[1347] = 0;

				//sub r4, r31, 2
				inst_memory[1348] = 16'B0000111000000100;
				inst_memory[1349] = 16'B0001111100000010;

				//copy r51, r4
				inst_memory[1350] = 16'B1100111000110011;
				inst_memory[1351] = 16'B0000010000000000;

				//seq r4, [r51], 2
				inst_memory[1352] = 16'B0110111000000100;
				inst_memory[1353] = 16'B1111001100000010;

				//mov r5, L032
				inst_memory[1354] = 16'B1100010000000101;
				inst_memory[1355] = 16'B0000010101011100;

				//jmprc r5, r4
				inst_memory[1356] = 16'B0111101100000000;
				inst_memory[1357] = 16'B0000010100000100;

				//sub r5, r31, 0
				inst_memory[1358] = 16'B0000111000000101;
				inst_memory[1359] = 16'B0001111100000000;

				//copy r51, r5
				inst_memory[1360] = 16'B1100111000110011;
				inst_memory[1361] = 16'B0000010100000000;

				//sub r5, r31, 1
				inst_memory[1362] = 16'B0000111000000101;
				inst_memory[1363] = 16'B0001111100000001;

				//copy r52, r5
				inst_memory[1364] = 16'B1100111000110100;
				inst_memory[1365] = 16'B0000010100000000;

				//sub r5, [r51], [r52]
				inst_memory[1366] = 16'B0000111100000101;
				inst_memory[1367] = 16'B1111001111110100;

				//copy r30, r5
				inst_memory[1368] = 16'B1100111000011110;
				inst_memory[1369] = 16'B0000010100000000;

				//jmp L033
				inst_memory[1370] = 16'B1011100000000000;
				inst_memory[1371] = 16'B0000010111011000;

				//L032:
				inst_memory[1372] = 16'B1111100000000000;
				inst_memory[1373] = 0;

				//sub r6, r31, 2
				inst_memory[1374] = 16'B0000111000000110;
				inst_memory[1375] = 16'B0001111100000010;

				//copy r51, r6
				inst_memory[1376] = 16'B1100111000110011;
				inst_memory[1377] = 16'B0000011000000000;

				//seq r6, [r51], 3
				inst_memory[1378] = 16'B0110111000000110;
				inst_memory[1379] = 16'B1111001100000011;

				//mov r7, L034
				inst_memory[1380] = 16'B1100010000000111;
				inst_memory[1381] = 16'B0000010101110110;

				//jmprc r7, r6
				inst_memory[1382] = 16'B0111101100000000;
				inst_memory[1383] = 16'B0000011100000110;

				//sub r7, r31, 0
				inst_memory[1384] = 16'B0000111000000111;
				inst_memory[1385] = 16'B0001111100000000;

				//copy r51, r7
				inst_memory[1386] = 16'B1100111000110011;
				inst_memory[1387] = 16'B0000011100000000;

				//sub r7, r31, 1
				inst_memory[1388] = 16'B0000111000000111;
				inst_memory[1389] = 16'B0001111100000001;

				//copy r52, r7
				inst_memory[1390] = 16'B1100111000110100;
				inst_memory[1391] = 16'B0000011100000000;

				//mult r7, [r51], [r52]
				inst_memory[1392] = 16'B0001011100000111;
				inst_memory[1393] = 16'B1111001111110100;

				//copy r30, r7
				inst_memory[1394] = 16'B1100111000011110;
				inst_memory[1395] = 16'B0000011100000000;

				//jmp L035
				inst_memory[1396] = 16'B1011100000000000;
				inst_memory[1397] = 16'B0000010111010110;

				//L034:
				inst_memory[1398] = 16'B1111100000000000;
				inst_memory[1399] = 0;

				//sub r8, r31, 2
				inst_memory[1400] = 16'B0000111000001000;
				inst_memory[1401] = 16'B0001111100000010;

				//copy r51, r8
				inst_memory[1402] = 16'B1100111000110011;
				inst_memory[1403] = 16'B0000100000000000;

				//seq r8, [r51], 4
				inst_memory[1404] = 16'B0110111000001000;
				inst_memory[1405] = 16'B1111001100000100;

				//mov r9, L036
				inst_memory[1406] = 16'B1100010000001001;
				inst_memory[1407] = 16'B0000010110010000;

				//jmprc r9, r8
				inst_memory[1408] = 16'B0111101100000000;
				inst_memory[1409] = 16'B0000100100001000;

				//sub r9, r31, 0
				inst_memory[1410] = 16'B0000111000001001;
				inst_memory[1411] = 16'B0001111100000000;

				//copy r51, r9
				inst_memory[1412] = 16'B1100111000110011;
				inst_memory[1413] = 16'B0000100100000000;

				//sub r9, r31, 1
				inst_memory[1414] = 16'B0000111000001001;
				inst_memory[1415] = 16'B0001111100000001;

				//copy r52, r9
				inst_memory[1416] = 16'B1100111000110100;
				inst_memory[1417] = 16'B0000100100000000;

				//div r9, [r51], [r52]
				inst_memory[1418] = 16'B0001111100001001;
				inst_memory[1419] = 16'B1111001111110100;

				//copy r30, r9
				inst_memory[1420] = 16'B1100111000011110;
				inst_memory[1421] = 16'B0000100100000000;

				//jmp L037
				inst_memory[1422] = 16'B1011100000000000;
				inst_memory[1423] = 16'B0000010111010100;

				//L036:
				inst_memory[1424] = 16'B1111100000000000;
				inst_memory[1425] = 0;

				//sub r10, r31, 2
				inst_memory[1426] = 16'B0000111000001010;
				inst_memory[1427] = 16'B0001111100000010;

				//copy r51, r10
				inst_memory[1428] = 16'B1100111000110011;
				inst_memory[1429] = 16'B0000101000000000;

				//seq r10, [r51], 5
				inst_memory[1430] = 16'B0110111000001010;
				inst_memory[1431] = 16'B1111001100000101;

				//mov r11, L038
				inst_memory[1432] = 16'B1100010000001011;
				inst_memory[1433] = 16'B0000010110110110;

				//jmprc r11, r10
				inst_memory[1434] = 16'B0111101100000000;
				inst_memory[1435] = 16'B0000101100001010;

				//sub r11, r31, 0
				inst_memory[1436] = 16'B0000111000001011;
				inst_memory[1437] = 16'B0001111100000000;

				//copy r51, r11
				inst_memory[1438] = 16'B1100111000110011;
				inst_memory[1439] = 16'B0000101100000000;

				//sub r11, r31, 0
				inst_memory[1440] = 16'B0000111000001011;
				inst_memory[1441] = 16'B0001111100000000;

				//copy r52, r11
				inst_memory[1442] = 16'B1100111000110100;
				inst_memory[1443] = 16'B0000101100000000;

				//sub r11, r31, 1
				inst_memory[1444] = 16'B0000111000001011;
				inst_memory[1445] = 16'B0001111100000001;

				//copy r53, r11
				inst_memory[1446] = 16'B1100111000110101;
				inst_memory[1447] = 16'B0000101100000000;

				//div r11, [r52], [r53]
				inst_memory[1448] = 16'B0001111100001011;
				inst_memory[1449] = 16'B1111010011110101;

				//sub r12, r31, 1
				inst_memory[1450] = 16'B0000111000001100;
				inst_memory[1451] = 16'B0001111100000001;

				//copy r52, r12
				inst_memory[1452] = 16'B1100111000110100;
				inst_memory[1453] = 16'B0000110000000000;

				//mult r12, r11, [r52]
				inst_memory[1454] = 16'B0001011100001100;
				inst_memory[1455] = 16'B0000101111110100;

				//sub r11, [r51], r12
				inst_memory[1456] = 16'B0000111100001011;
				inst_memory[1457] = 16'B1111001100001100;

				//copy r30, r11
				inst_memory[1458] = 16'B1100111000011110;
				inst_memory[1459] = 16'B0000101100000000;

				//jmp L039
				inst_memory[1460] = 16'B1011100000000000;
				inst_memory[1461] = 16'B0000010111010010;

				//L038:
				inst_memory[1462] = 16'B1111100000000000;
				inst_memory[1463] = 0;

				//sub r12, r31, 2
				inst_memory[1464] = 16'B0000111000001100;
				inst_memory[1465] = 16'B0001111100000010;

				//copy r51, r12
				inst_memory[1466] = 16'B1100111000110011;
				inst_memory[1467] = 16'B0000110000000000;

				//seq r12, [r51], 6
				inst_memory[1468] = 16'B0110111000001100;
				inst_memory[1469] = 16'B1111001100000110;

				//mov r13, L040
				inst_memory[1470] = 16'B1100010000001101;
				inst_memory[1471] = 16'B0000010111010000;

				//jmprc r13, r12
				inst_memory[1472] = 16'B0111101100000000;
				inst_memory[1473] = 16'B0000110100001100;

				//sub r13, r31, 0
				inst_memory[1474] = 16'B0000111000001101;
				inst_memory[1475] = 16'B0001111100000000;

				//copy r51, r13
				inst_memory[1476] = 16'B1100111000110011;
				inst_memory[1477] = 16'B0000110100000000;

				//sub r13, r31, 1
				inst_memory[1478] = 16'B0000111000001101;
				inst_memory[1479] = 16'B0001111100000001;

				//copy r52, r13
				inst_memory[1480] = 16'B1100111000110100;
				inst_memory[1481] = 16'B0000110100000000;

				//mult r13, [r51], [r52]
				inst_memory[1482] = 16'B0001011100001101;
				inst_memory[1483] = 16'B1111001111110100;

				//div r14, r13, 100
				inst_memory[1484] = 16'B0001111000001110;
				inst_memory[1485] = 16'B0000110101100100;

				//copy r30, r14
				inst_memory[1486] = 16'B1100111000011110;
				inst_memory[1487] = 16'B0000111000000000;

				//L040:
				inst_memory[1488] = 16'B1111100000000000;
				inst_memory[1489] = 0;

				//L039:
				inst_memory[1490] = 16'B1111100000000000;
				inst_memory[1491] = 0;

				//L037:
				inst_memory[1492] = 16'B1111100000000000;
				inst_memory[1493] = 0;

				//L035:
				inst_memory[1494] = 16'B1111100000000000;
				inst_memory[1495] = 0;

				//L033:
				inst_memory[1496] = 16'B1111100000000000;
				inst_memory[1497] = 0;

				//L031:
				inst_memory[1498] = 16'B1111100000000000;
				inst_memory[1499] = 0;

				//sub r31, r31 3
				inst_memory[1500] = 16'B0000111000011111;
				inst_memory[1501] = 16'B0001111100000011;

				//add r29, r29, 1
				inst_memory[1502] = 16'B0000011000011101;
				inst_memory[1503] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1504] = 16'B1100111000111111;
				inst_memory[1505] = 16'B0001110100000000;

				//copy r0, [r63]
				inst_memory[1506] = 16'B1100111000000000;
				inst_memory[1507] = 16'B1111111100000000;

				//jmpr r0
				inst_memory[1508] = 16'B0111001000000000;
				inst_memory[1509] = 16'B0000000000000000;

				//MAIN:
				inst_memory[1510] = 16'B1111100000000000;
				inst_memory[1511] = 0;

				//add r29, 0, 69
				inst_memory[1512] = 16'B0000010000011101;
				inst_memory[1513] = 16'B0000000001000101;

				//copy r63, r29
				inst_memory[1514] = 16'B1100111000111111;
				inst_memory[1515] = 16'B0001110100000000;

				//add r31, r31 9
				inst_memory[1516] = 16'B0000011000011111;
				inst_memory[1517] = 16'B0001111100001001;

				//input r0
				inst_memory[1518] = 16'B1000010000000000;
				inst_memory[1519] = 16'B0000000000000000;

				//sub r4, r31, 0
				inst_memory[1520] = 16'B0000111000000100;
				inst_memory[1521] = 16'B0001111100000000;

				//copy r51, r4
				inst_memory[1522] = 16'B1100111000110011;
				inst_memory[1523] = 16'B0000010000000000;

				//copy [r51], r0
				inst_memory[1524] = 16'B1100111011110011;
				inst_memory[1525] = 16'B0000000000000000;

				//L041:
				inst_memory[1526] = 16'B1111100000000000;
				inst_memory[1527] = 0;

				//sub r0, r31, 0
				inst_memory[1528] = 16'B0000111000000000;
				inst_memory[1529] = 16'B0001111100000000;

				//copy r51, r0
				inst_memory[1530] = 16'B1100111000110011;
				inst_memory[1531] = 16'B0000000000000000;

				//slt r0, 0, [r51]
				inst_memory[1532] = 16'B0110010100000000;
				inst_memory[1533] = 16'B0000000011110011;

				//mov r4, L042
				inst_memory[1534] = 16'B1100010000000100;
				inst_memory[1535] = 16'B0000100001011010;

				//jmprc r4, r0
				inst_memory[1536] = 16'B0111101100000000;
				inst_memory[1537] = 16'B0000010000000000;

				//sub r4, r31, 0
				inst_memory[1538] = 16'B0000111000000100;
				inst_memory[1539] = 16'B0001111100000000;

				//copy r51, r4
				inst_memory[1540] = 16'B1100111000110011;
				inst_memory[1541] = 16'B0000010000000000;

				//seq r4, [r51], 1
				inst_memory[1542] = 16'B0110111000000100;
				inst_memory[1543] = 16'B1111001100000001;

				//mov r6, L043
				inst_memory[1544] = 16'B1100010000000110;
				inst_memory[1545] = 16'B0000011001000110;

				//jmprc r6, r4
				inst_memory[1546] = 16'B0111101100000000;
				inst_memory[1547] = 16'B0000011000000100;

				//copy r51, r63
				inst_memory[1548] = 16'B1100111000110011;
				inst_memory[1549] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1550] = 16'B0000111000011101;
				inst_memory[1551] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1552] = 16'B1100111000111111;
				inst_memory[1553] = 16'B0001110100000000;

				//sub r6, r31, 4
				inst_memory[1554] = 16'B0000111000000110;
				inst_memory[1555] = 16'B0001111100000100;

				//copy r52, r6
				inst_memory[1556] = 16'B1100111000110100;
				inst_memory[1557] = 16'B0000011000000000;

				//copy [r63], r6
				inst_memory[1558] = 16'B1100111011111111;
				inst_memory[1559] = 16'B0000011000000000;

				//sub r29, r29, 1
				inst_memory[1560] = 16'B0000111000011101;
				inst_memory[1561] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1562] = 16'B1100111000111111;
				inst_memory[1563] = 16'B0001110100000000;

				//mov [r63], 5
				inst_memory[1564] = 16'B1100010011111111;
				inst_memory[1565] = 16'B0000000000000101;

				//sub r29, r29, 1
				inst_memory[1566] = 16'B0000111000011101;
				inst_memory[1567] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1568] = 16'B1100111000111111;
				inst_memory[1569] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1570] = 16'B1101010011110011;
				inst_memory[1571] = 16'B0000000000000001;

				//jmp F000
				inst_memory[1572] = 16'B1011100000000000;
				inst_memory[1573] = 16'B0000000000000100;

				//copy r5, r30
				inst_memory[1574] = 16'B1100111000000101;
				inst_memory[1575] = 16'B0001111000000000;

				//copy r51, r63
				inst_memory[1576] = 16'B1100111000110011;
				inst_memory[1577] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1578] = 16'B0000111000011101;
				inst_memory[1579] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1580] = 16'B1100111000111111;
				inst_memory[1581] = 16'B0001110100000000;

				//sub r6, r31, 4
				inst_memory[1582] = 16'B0000111000000110;
				inst_memory[1583] = 16'B0001111100000100;

				//copy r53, r6
				inst_memory[1584] = 16'B1100111000110101;
				inst_memory[1585] = 16'B0000011000000000;

				//copy [r63], r6
				inst_memory[1586] = 16'B1100111011111111;
				inst_memory[1587] = 16'B0000011000000000;

				//sub r29, r29, 1
				inst_memory[1588] = 16'B0000111000011101;
				inst_memory[1589] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1590] = 16'B1100111000111111;
				inst_memory[1591] = 16'B0001110100000000;

				//mov [r63], 5
				inst_memory[1592] = 16'B1100010011111111;
				inst_memory[1593] = 16'B0000000000000101;

				//sub r29, r29, 1
				inst_memory[1594] = 16'B0000111000011101;
				inst_memory[1595] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1596] = 16'B1100111000111111;
				inst_memory[1597] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1598] = 16'B1101010011110011;
				inst_memory[1599] = 16'B0000000000000001;

				//jmp F001
				inst_memory[1600] = 16'B1011100000000000;
				inst_memory[1601] = 16'B0000000001011110;

				//copy r5, r30
				inst_memory[1602] = 16'B1100111000000101;
				inst_memory[1603] = 16'B0001111000000000;

				//jmp L044
				inst_memory[1604] = 16'B1011100000000000;
				inst_memory[1605] = 16'B0000100001001100;

				//L043:
				inst_memory[1606] = 16'B1111100000000000;
				inst_memory[1607] = 0;

				//sub r6, r31, 0
				inst_memory[1608] = 16'B0000111000000110;
				inst_memory[1609] = 16'B0001111100000000;

				//copy r51, r6
				inst_memory[1610] = 16'B1100111000110011;
				inst_memory[1611] = 16'B0000011000000000;

				//seq r6, [r51], 3
				inst_memory[1612] = 16'B0110111000000110;
				inst_memory[1613] = 16'B1111001100000011;

				//mov r8, L045
				inst_memory[1614] = 16'B1100010000001000;
				inst_memory[1615] = 16'B0000011010001100;

				//jmprc r8, r6
				inst_memory[1616] = 16'B0111101100000000;
				inst_memory[1617] = 16'B0000100000000110;

				//copy r51, r63
				inst_memory[1618] = 16'B1100111000110011;
				inst_memory[1619] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1620] = 16'B0000111000011101;
				inst_memory[1621] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1622] = 16'B1100111000111111;
				inst_memory[1623] = 16'B0001110100000000;

				//sub r8, r31, 4
				inst_memory[1624] = 16'B0000111000001000;
				inst_memory[1625] = 16'B0001111100000100;

				//copy r54, r8
				inst_memory[1626] = 16'B1100111000110110;
				inst_memory[1627] = 16'B0000100000000000;

				//copy [r63], r8
				inst_memory[1628] = 16'B1100111011111111;
				inst_memory[1629] = 16'B0000100000000000;

				//sub r29, r29, 1
				inst_memory[1630] = 16'B0000111000011101;
				inst_memory[1631] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1632] = 16'B1100111000111111;
				inst_memory[1633] = 16'B0001110100000000;

				//mov [r63], 5
				inst_memory[1634] = 16'B1100010011111111;
				inst_memory[1635] = 16'B0000000000000101;

				//sub r29, r29, 1
				inst_memory[1636] = 16'B0000111000011101;
				inst_memory[1637] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1638] = 16'B1100111000111111;
				inst_memory[1639] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1640] = 16'B1101010011110011;
				inst_memory[1641] = 16'B0000000000000001;

				//jmp F002
				inst_memory[1642] = 16'B1011100000000000;
				inst_memory[1643] = 16'B0000000010110110;

				//copy r5, r30
				inst_memory[1644] = 16'B1100111000000101;
				inst_memory[1645] = 16'B0001111000000000;

				//copy r51, r63
				inst_memory[1646] = 16'B1100111000110011;
				inst_memory[1647] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1648] = 16'B0000111000011101;
				inst_memory[1649] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1650] = 16'B1100111000111111;
				inst_memory[1651] = 16'B0001110100000000;

				//sub r8, r31, 4
				inst_memory[1652] = 16'B0000111000001000;
				inst_memory[1653] = 16'B0001111100000100;

				//copy r55, r8
				inst_memory[1654] = 16'B1100111000110111;
				inst_memory[1655] = 16'B0000100000000000;

				//copy [r63], r8
				inst_memory[1656] = 16'B1100111011111111;
				inst_memory[1657] = 16'B0000100000000000;

				//sub r29, r29, 1
				inst_memory[1658] = 16'B0000111000011101;
				inst_memory[1659] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1660] = 16'B1100111000111111;
				inst_memory[1661] = 16'B0001110100000000;

				//mov [r63], 5
				inst_memory[1662] = 16'B1100010011111111;
				inst_memory[1663] = 16'B0000000000000101;

				//sub r29, r29, 1
				inst_memory[1664] = 16'B0000111000011101;
				inst_memory[1665] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1666] = 16'B1100111000111111;
				inst_memory[1667] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1668] = 16'B1101010011110011;
				inst_memory[1669] = 16'B0000000000000001;

				//jmp F001
				inst_memory[1670] = 16'B1011100000000000;
				inst_memory[1671] = 16'B0000000001011110;

				//copy r5, r30
				inst_memory[1672] = 16'B1100111000000101;
				inst_memory[1673] = 16'B0001111000000000;

				//jmp L046
				inst_memory[1674] = 16'B1011100000000000;
				inst_memory[1675] = 16'B0000100001001010;

				//L045:
				inst_memory[1676] = 16'B1111100000000000;
				inst_memory[1677] = 0;

				//sub r8, r31, 0
				inst_memory[1678] = 16'B0000111000001000;
				inst_memory[1679] = 16'B0001111100000000;

				//copy r51, r8
				inst_memory[1680] = 16'B1100111000110011;
				inst_memory[1681] = 16'B0000100000000000;

				//seq r8, [r51], 4
				inst_memory[1682] = 16'B0110111000001000;
				inst_memory[1683] = 16'B1111001100000100;

				//mov r10, L047
				inst_memory[1684] = 16'B1100010000001010;
				inst_memory[1685] = 16'B0000011011000010;

				//jmprc r10, r8
				inst_memory[1686] = 16'B0111101100000000;
				inst_memory[1687] = 16'B0000101000001000;

				//copy r51, r63
				inst_memory[1688] = 16'B1100111000110011;
				inst_memory[1689] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1690] = 16'B0000111000011101;
				inst_memory[1691] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1692] = 16'B1100111000111111;
				inst_memory[1693] = 16'B0001110100000000;

				//sub r10, r31, 4
				inst_memory[1694] = 16'B0000111000001010;
				inst_memory[1695] = 16'B0001111100000100;

				//copy r56, r10
				inst_memory[1696] = 16'B1100111000111000;
				inst_memory[1697] = 16'B0000101000000000;

				//copy [r63], r10
				inst_memory[1698] = 16'B1100111011111111;
				inst_memory[1699] = 16'B0000101000000000;

				//sub r29, r29, 1
				inst_memory[1700] = 16'B0000111000011101;
				inst_memory[1701] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1702] = 16'B1100111000111111;
				inst_memory[1703] = 16'B0001110100000000;

				//mov [r63], 5
				inst_memory[1704] = 16'B1100010011111111;
				inst_memory[1705] = 16'B0000000000000101;

				//sub r29, r29, 1
				inst_memory[1706] = 16'B0000111000011101;
				inst_memory[1707] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1708] = 16'B1100111000111111;
				inst_memory[1709] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1710] = 16'B1101010011110011;
				inst_memory[1711] = 16'B0000000000000001;

				//jmp F003
				inst_memory[1712] = 16'B1011100000000000;
				inst_memory[1713] = 16'B0000000110111100;

				//copy r5, r30
				inst_memory[1714] = 16'B1100111000000101;
				inst_memory[1715] = 16'B0001111000000000;

				//sub r10, r31, 1
				inst_memory[1716] = 16'B0000111000001010;
				inst_memory[1717] = 16'B0001111100000001;

				//copy r51, r10
				inst_memory[1718] = 16'B1100111000110011;
				inst_memory[1719] = 16'B0000101000000000;

				//copy [r51], r5
				inst_memory[1720] = 16'B1100111011110011;
				inst_memory[1721] = 16'B0000010100000000;

				//sub r5, r31, 1
				inst_memory[1722] = 16'B0000111000000101;
				inst_memory[1723] = 16'B0001111100000001;

				//copy r51, r5
				inst_memory[1724] = 16'B1100111000110011;
				inst_memory[1725] = 16'B0000010100000000;

				//output [r51]
				inst_memory[1726] = 16'B1000101000000001;
				inst_memory[1727] = 16'B1111001100000000;

				//jmp L048
				inst_memory[1728] = 16'B1011100000000000;
				inst_memory[1729] = 16'B0000100001001000;

				//L047:
				inst_memory[1730] = 16'B1111100000000000;
				inst_memory[1731] = 0;

				//sub r5, r31, 0
				inst_memory[1732] = 16'B0000111000000101;
				inst_memory[1733] = 16'B0001111100000000;

				//copy r51, r5
				inst_memory[1734] = 16'B1100111000110011;
				inst_memory[1735] = 16'B0000010100000000;

				//seq r5, [r51], 5
				inst_memory[1736] = 16'B0110111000000101;
				inst_memory[1737] = 16'B1111001100000101;

				//mov r10, L049
				inst_memory[1738] = 16'B1100010000001010;
				inst_memory[1739] = 16'B0000011011111110;

				//jmprc r10, r5
				inst_memory[1740] = 16'B0111101100000000;
				inst_memory[1741] = 16'B0000101000000101;

				//copy r51, r63
				inst_memory[1742] = 16'B1100111000110011;
				inst_memory[1743] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1744] = 16'B0000111000011101;
				inst_memory[1745] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1746] = 16'B1100111000111111;
				inst_memory[1747] = 16'B0001110100000000;

				//sub r10, r31, 4
				inst_memory[1748] = 16'B0000111000001010;
				inst_memory[1749] = 16'B0001111100000100;

				//copy r57, r10
				inst_memory[1750] = 16'B1100111000111001;
				inst_memory[1751] = 16'B0000101000000000;

				//copy [r63], r10
				inst_memory[1752] = 16'B1100111011111111;
				inst_memory[1753] = 16'B0000101000000000;

				//sub r29, r29, 1
				inst_memory[1754] = 16'B0000111000011101;
				inst_memory[1755] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1756] = 16'B1100111000111111;
				inst_memory[1757] = 16'B0001110100000000;

				//mov [r63], 0
				inst_memory[1758] = 16'B1100010011111111;
				inst_memory[1759] = 16'B0000000000000000;

				//sub r29, r29, 1
				inst_memory[1760] = 16'B0000111000011101;
				inst_memory[1761] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1762] = 16'B1100111000111111;
				inst_memory[1763] = 16'B0001110100000000;

				//mov [r63], 5
				inst_memory[1764] = 16'B1100010011111111;
				inst_memory[1765] = 16'B0000000000000101;

				//sub r29, r29, 1
				inst_memory[1766] = 16'B0000111000011101;
				inst_memory[1767] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1768] = 16'B1100111000111111;
				inst_memory[1769] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1770] = 16'B1101010011110011;
				inst_memory[1771] = 16'B0000000000000001;

				//jmp F005
				inst_memory[1772] = 16'B1011100000000000;
				inst_memory[1773] = 16'B0000001100000100;

				//copy r0, r30
				inst_memory[1774] = 16'B1100111000000000;
				inst_memory[1775] = 16'B0001111000000000;

				//sub r5, r31, 1
				inst_memory[1776] = 16'B0000111000000101;
				inst_memory[1777] = 16'B0001111100000001;

				//copy r51, r5
				inst_memory[1778] = 16'B1100111000110011;
				inst_memory[1779] = 16'B0000010100000000;

				//copy [r51], r0
				inst_memory[1780] = 16'B1100111011110011;
				inst_memory[1781] = 16'B0000000000000000;

				//sub r0, r31, 1
				inst_memory[1782] = 16'B0000111000000000;
				inst_memory[1783] = 16'B0001111100000001;

				//copy r51, r0
				inst_memory[1784] = 16'B1100111000110011;
				inst_memory[1785] = 16'B0000000000000000;

				//output [r51]
				inst_memory[1786] = 16'B1000101000000001;
				inst_memory[1787] = 16'B1111001100000000;

				//jmp L050
				inst_memory[1788] = 16'B1011100000000000;
				inst_memory[1789] = 16'B0000100001000110;

				//L049:
				inst_memory[1790] = 16'B1111100000000000;
				inst_memory[1791] = 0;

				//sub r0, r31, 0
				inst_memory[1792] = 16'B0000111000000000;
				inst_memory[1793] = 16'B0001111100000000;

				//copy r51, r0
				inst_memory[1794] = 16'B1100111000110011;
				inst_memory[1795] = 16'B0000000000000000;

				//seq r0, [r51], 6
				inst_memory[1796] = 16'B0110111000000000;
				inst_memory[1797] = 16'B1111001100000110;

				//mov r5, L051
				inst_memory[1798] = 16'B1100010000000101;
				inst_memory[1799] = 16'B0000011100101000;

				//jmprc r5, r0
				inst_memory[1800] = 16'B0111101100000000;
				inst_memory[1801] = 16'B0000010100000000;

				//copy r51, r63
				inst_memory[1802] = 16'B1100111000110011;
				inst_memory[1803] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1804] = 16'B0000111000011101;
				inst_memory[1805] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1806] = 16'B1100111000111111;
				inst_memory[1807] = 16'B0001110100000000;

				//sub r5, r31, 4
				inst_memory[1808] = 16'B0000111000000101;
				inst_memory[1809] = 16'B0001111100000100;

				//copy r58, r5
				inst_memory[1810] = 16'B1100111000111010;
				inst_memory[1811] = 16'B0000010100000000;

				//copy [r63], r5
				inst_memory[1812] = 16'B1100111011111111;
				inst_memory[1813] = 16'B0000010100000000;

				//sub r29, r29, 1
				inst_memory[1814] = 16'B0000111000011101;
				inst_memory[1815] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1816] = 16'B1100111000111111;
				inst_memory[1817] = 16'B0001110100000000;

				//mov [r63], 5
				inst_memory[1818] = 16'B1100010011111111;
				inst_memory[1819] = 16'B0000000000000101;

				//sub r29, r29, 1
				inst_memory[1820] = 16'B0000111000011101;
				inst_memory[1821] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1822] = 16'B1100111000111111;
				inst_memory[1823] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1824] = 16'B1101010011110011;
				inst_memory[1825] = 16'B0000000000000001;

				//jmp F004
				inst_memory[1826] = 16'B1011100000000000;
				inst_memory[1827] = 16'B0000001000110000;

				//copy r5, r30
				inst_memory[1828] = 16'B1100111000000101;
				inst_memory[1829] = 16'B0001111000000000;

				//jmp L052
				inst_memory[1830] = 16'B1011100000000000;
				inst_memory[1831] = 16'B0000100001000100;

				//L051:
				inst_memory[1832] = 16'B1111100000000000;
				inst_memory[1833] = 0;

				//sub r10, r31, 0
				inst_memory[1834] = 16'B0000111000001010;
				inst_memory[1835] = 16'B0001111100000000;

				//copy r51, r10
				inst_memory[1836] = 16'B1100111000110011;
				inst_memory[1837] = 16'B0000101000000000;

				//seq r10, [r51], 7
				inst_memory[1838] = 16'B0110111000001010;
				inst_memory[1839] = 16'B1111001100000111;

				//mov r12, L053
				inst_memory[1840] = 16'B1100010000001100;
				inst_memory[1841] = 16'B0000011110000100;

				//jmprc r12, r10
				inst_memory[1842] = 16'B0111101100000000;
				inst_memory[1843] = 16'B0000110000001010;

				//input r12
				inst_memory[1844] = 16'B1000010000001100;
				inst_memory[1845] = 16'B0000000000000000;

				//sub r13, r31, 1
				inst_memory[1846] = 16'B0000111000001101;
				inst_memory[1847] = 16'B0001111100000001;

				//copy r51, r13
				inst_memory[1848] = 16'B1100111000110011;
				inst_memory[1849] = 16'B0000110100000000;

				//copy [r51], r12
				inst_memory[1850] = 16'B1100111011110011;
				inst_memory[1851] = 16'B0000110000000000;

				//input r12
				inst_memory[1852] = 16'B1000010000001100;
				inst_memory[1853] = 16'B0000000000000000;

				//sub r13, r31, 2
				inst_memory[1854] = 16'B0000111000001101;
				inst_memory[1855] = 16'B0001111100000010;

				//copy r51, r13
				inst_memory[1856] = 16'B1100111000110011;
				inst_memory[1857] = 16'B0000110100000000;

				//copy [r51], r12
				inst_memory[1858] = 16'B1100111011110011;
				inst_memory[1859] = 16'B0000110000000000;

				//input r12
				inst_memory[1860] = 16'B1000010000001100;
				inst_memory[1861] = 16'B0000000000000000;

				//sub r13, r31, 3
				inst_memory[1862] = 16'B0000111000001101;
				inst_memory[1863] = 16'B0001111100000011;

				//copy r51, r13
				inst_memory[1864] = 16'B1100111000110011;
				inst_memory[1865] = 16'B0000110100000000;

				//copy [r51], r12
				inst_memory[1866] = 16'B1100111011110011;
				inst_memory[1867] = 16'B0000110000000000;

				//copy r51, r63
				inst_memory[1868] = 16'B1100111000110011;
				inst_memory[1869] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1870] = 16'B0000111000011101;
				inst_memory[1871] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1872] = 16'B1100111000111111;
				inst_memory[1873] = 16'B0001110100000000;

				//sub r12, r31, 3
				inst_memory[1874] = 16'B0000111000001100;
				inst_memory[1875] = 16'B0001111100000011;

				//copy r59, r12
				inst_memory[1876] = 16'B1100111000111011;
				inst_memory[1877] = 16'B0000110000000000;

				//sub r12, r31, 2
				inst_memory[1878] = 16'B0000111000001100;
				inst_memory[1879] = 16'B0001111100000010;

				//copy r60, r12
				inst_memory[1880] = 16'B1100111000111100;
				inst_memory[1881] = 16'B0000110000000000;

				//sub r12, r31, 1
				inst_memory[1882] = 16'B0000111000001100;
				inst_memory[1883] = 16'B0001111100000001;

				//copy r61, r12
				inst_memory[1884] = 16'B1100111000111101;
				inst_memory[1885] = 16'B0000110000000000;

				//copy [r63], [r61]
				inst_memory[1886] = 16'B1100111011111111;
				inst_memory[1887] = 16'B1111110100000000;

				//sub r29, r29, 1
				inst_memory[1888] = 16'B0000111000011101;
				inst_memory[1889] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1890] = 16'B1100111000111111;
				inst_memory[1891] = 16'B0001110100000000;

				//copy [r63], [r60]
				inst_memory[1892] = 16'B1100111011111111;
				inst_memory[1893] = 16'B1111110000000000;

				//sub r29, r29, 1
				inst_memory[1894] = 16'B0000111000011101;
				inst_memory[1895] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1896] = 16'B1100111000111111;
				inst_memory[1897] = 16'B0001110100000000;

				//copy [r63], [r59]
				inst_memory[1898] = 16'B1100111011111111;
				inst_memory[1899] = 16'B1111101100000000;

				//sub r29, r29, 1
				inst_memory[1900] = 16'B0000111000011101;
				inst_memory[1901] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1902] = 16'B1100111000111111;
				inst_memory[1903] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1904] = 16'B1101010011110011;
				inst_memory[1905] = 16'B0000000000000001;

				//jmp F009
				inst_memory[1906] = 16'B1011100000000000;
				inst_memory[1907] = 16'B0000010100001000;

				//copy r12, r30
				inst_memory[1908] = 16'B1100111000001100;
				inst_memory[1909] = 16'B0001111000000000;

				//sub r13, r31, 1
				inst_memory[1910] = 16'B0000111000001101;
				inst_memory[1911] = 16'B0001111100000001;

				//copy r51, r13
				inst_memory[1912] = 16'B1100111000110011;
				inst_memory[1913] = 16'B0000110100000000;

				//copy [r51], r12
				inst_memory[1914] = 16'B1100111011110011;
				inst_memory[1915] = 16'B0000110000000000;

				//sub r12, r31, 1
				inst_memory[1916] = 16'B0000111000001100;
				inst_memory[1917] = 16'B0001111100000001;

				//copy r51, r12
				inst_memory[1918] = 16'B1100111000110011;
				inst_memory[1919] = 16'B0000110000000000;

				//output [r51]
				inst_memory[1920] = 16'B1000101000000001;
				inst_memory[1921] = 16'B1111001100000000;

				//jmp L054
				inst_memory[1922] = 16'B1011100000000000;
				inst_memory[1923] = 16'B0000100001000010;

				//L053:
				inst_memory[1924] = 16'B1111100000000000;
				inst_memory[1925] = 0;

				//sub r12, r31, 0
				inst_memory[1926] = 16'B0000111000001100;
				inst_memory[1927] = 16'B0001111100000000;

				//copy r51, r12
				inst_memory[1928] = 16'B1100111000110011;
				inst_memory[1929] = 16'B0000110000000000;

				//seq r12, [r51], 8
				inst_memory[1930] = 16'B0110111000001100;
				inst_memory[1931] = 16'B1111001100001000;

				//mov r13, L055
				inst_memory[1932] = 16'B1100010000001101;
				inst_memory[1933] = 16'B0000011110111100;

				//jmprc r13, r12
				inst_memory[1934] = 16'B0111101100000000;
				inst_memory[1935] = 16'B0000110100001100;

				//input r13
				inst_memory[1936] = 16'B1000010000001101;
				inst_memory[1937] = 16'B0000000000000000;

				//sub r15, r31, 1
				inst_memory[1938] = 16'B0000111000001111;
				inst_memory[1939] = 16'B0001111100000001;

				//copy r51, r15
				inst_memory[1940] = 16'B1100111000110011;
				inst_memory[1941] = 16'B0000111100000000;

				//copy [r51], r13
				inst_memory[1942] = 16'B1100111011110011;
				inst_memory[1943] = 16'B0000110100000000;

				//copy r51, r63
				inst_memory[1944] = 16'B1100111000110011;
				inst_memory[1945] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[1946] = 16'B0000111000011101;
				inst_memory[1947] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1948] = 16'B1100111000111111;
				inst_memory[1949] = 16'B0001110100000000;

				//sub r13, r31, 1
				inst_memory[1950] = 16'B0000111000001101;
				inst_memory[1951] = 16'B0001111100000001;

				//copy r59, r13
				inst_memory[1952] = 16'B1100111000111011;
				inst_memory[1953] = 16'B0000110100000000;

				//copy [r63], [r59]
				inst_memory[1954] = 16'B1100111011111111;
				inst_memory[1955] = 16'B1111101100000000;

				//sub r29, r29, 1
				inst_memory[1956] = 16'B0000111000011101;
				inst_memory[1957] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[1958] = 16'B1100111000111111;
				inst_memory[1959] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[1960] = 16'B1101010011110011;
				inst_memory[1961] = 16'B0000000000000001;

				//jmp F008
				inst_memory[1962] = 16'B1011100000000000;
				inst_memory[1963] = 16'B0000010010111110;

				//copy r13, r30
				inst_memory[1964] = 16'B1100111000001101;
				inst_memory[1965] = 16'B0001111000000000;

				//sub r15, r31, 2
				inst_memory[1966] = 16'B0000111000001111;
				inst_memory[1967] = 16'B0001111100000010;

				//copy r51, r15
				inst_memory[1968] = 16'B1100111000110011;
				inst_memory[1969] = 16'B0000111100000000;

				//copy [r51], r13
				inst_memory[1970] = 16'B1100111011110011;
				inst_memory[1971] = 16'B0000110100000000;

				//sub r13, r31, 2
				inst_memory[1972] = 16'B0000111000001101;
				inst_memory[1973] = 16'B0001111100000010;

				//copy r51, r13
				inst_memory[1974] = 16'B1100111000110011;
				inst_memory[1975] = 16'B0000110100000000;

				//output [r51]
				inst_memory[1976] = 16'B1000101000000001;
				inst_memory[1977] = 16'B1111001100000000;

				//jmp L056
				inst_memory[1978] = 16'B1011100000000000;
				inst_memory[1979] = 16'B0000100001000000;

				//L055:
				inst_memory[1980] = 16'B1111100000000000;
				inst_memory[1981] = 0;

				//sub r13, r31, 0
				inst_memory[1982] = 16'B0000111000001101;
				inst_memory[1983] = 16'B0001111100000000;

				//copy r51, r13
				inst_memory[1984] = 16'B1100111000110011;
				inst_memory[1985] = 16'B0000110100000000;

				//seq r13, [r51], 9
				inst_memory[1986] = 16'B0110111000001101;
				inst_memory[1987] = 16'B1111001100001001;

				//mov r15, L057
				inst_memory[1988] = 16'B1100010000001111;
				inst_memory[1989] = 16'B0000100000000110;

				//jmprc r15, r13
				inst_memory[1990] = 16'B0111101100000000;
				inst_memory[1991] = 16'B0000111100001101;

				//input r15
				inst_memory[1992] = 16'B1000010000001111;
				inst_memory[1993] = 16'B0000000000000000;

				//sub r16, r31, 1
				inst_memory[1994] = 16'B0000111000010000;
				inst_memory[1995] = 16'B0001111100000001;

				//copy r51, r16
				inst_memory[1996] = 16'B1100111000110011;
				inst_memory[1997] = 16'B0001000000000000;

				//copy [r51], r15
				inst_memory[1998] = 16'B1100111011110011;
				inst_memory[1999] = 16'B0000111100000000;

				//input r15
				inst_memory[2000] = 16'B1000010000001111;
				inst_memory[2001] = 16'B0000000000000000;

				//sub r16, r31, 2
				inst_memory[2002] = 16'B0000111000010000;
				inst_memory[2003] = 16'B0001111100000010;

				//copy r51, r16
				inst_memory[2004] = 16'B1100111000110011;
				inst_memory[2005] = 16'B0001000000000000;

				//copy [r51], r15
				inst_memory[2006] = 16'B1100111011110011;
				inst_memory[2007] = 16'B0000111100000000;

				//copy r51, r63
				inst_memory[2008] = 16'B1100111000110011;
				inst_memory[2009] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[2010] = 16'B0000111000011101;
				inst_memory[2011] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[2012] = 16'B1100111000111111;
				inst_memory[2013] = 16'B0001110100000000;

				//sub r15, r31, 2
				inst_memory[2014] = 16'B0000111000001111;
				inst_memory[2015] = 16'B0001111100000010;

				//copy r59, r15
				inst_memory[2016] = 16'B1100111000111011;
				inst_memory[2017] = 16'B0000111100000000;

				//sub r15, r31, 1
				inst_memory[2018] = 16'B0000111000001111;
				inst_memory[2019] = 16'B0001111100000001;

				//copy r60, r15
				inst_memory[2020] = 16'B1100111000111100;
				inst_memory[2021] = 16'B0000111100000000;

				//copy [r63], [r60]
				inst_memory[2022] = 16'B1100111011111111;
				inst_memory[2023] = 16'B1111110000000000;

				//sub r29, r29, 1
				inst_memory[2024] = 16'B0000111000011101;
				inst_memory[2025] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[2026] = 16'B1100111000111111;
				inst_memory[2027] = 16'B0001110100000000;

				//copy [r63], [r59]
				inst_memory[2028] = 16'B1100111011111111;
				inst_memory[2029] = 16'B1111101100000000;

				//sub r29, r29, 1
				inst_memory[2030] = 16'B0000111000011101;
				inst_memory[2031] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[2032] = 16'B1100111000111111;
				inst_memory[2033] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[2034] = 16'B1101010011110011;
				inst_memory[2035] = 16'B0000000000000001;

				//jmp F006
				inst_memory[2036] = 16'B1011100000000000;
				inst_memory[2037] = 16'B0000001110111000;

				//copy r15, r30
				inst_memory[2038] = 16'B1100111000001111;
				inst_memory[2039] = 16'B0001111000000000;

				//sub r16, r31, 3
				inst_memory[2040] = 16'B0000111000010000;
				inst_memory[2041] = 16'B0001111100000011;

				//copy r51, r16
				inst_memory[2042] = 16'B1100111000110011;
				inst_memory[2043] = 16'B0001000000000000;

				//copy [r51], r15
				inst_memory[2044] = 16'B1100111011110011;
				inst_memory[2045] = 16'B0000111100000000;

				//sub r15, r31, 3
				inst_memory[2046] = 16'B0000111000001111;
				inst_memory[2047] = 16'B0001111100000011;

				//copy r51, r15
				inst_memory[2048] = 16'B1100111000110011;
				inst_memory[2049] = 16'B0000111100000000;

				//output [r51]
				inst_memory[2050] = 16'B1000101000000001;
				inst_memory[2051] = 16'B1111001100000000;

				//jmp L058
				inst_memory[2052] = 16'B1011100000000000;
				inst_memory[2053] = 16'B0000100000111110;

				//L057:
				inst_memory[2054] = 16'B1111100000000000;
				inst_memory[2055] = 0;

				//sub r15, r31, 0
				inst_memory[2056] = 16'B0000111000001111;
				inst_memory[2057] = 16'B0001111100000000;

				//copy r51, r15
				inst_memory[2058] = 16'B1100111000110011;
				inst_memory[2059] = 16'B0000111100000000;

				//seq r15, [r51], 10
				inst_memory[2060] = 16'B0110111000001111;
				inst_memory[2061] = 16'B1111001100001010;

				//mov r16, L059
				inst_memory[2062] = 16'B1100010000010000;
				inst_memory[2063] = 16'B0000100000111100;

				//jmprc r16, r15
				inst_memory[2064] = 16'B0111101100000000;
				inst_memory[2065] = 16'B0001000000001111;

				//input r16
				inst_memory[2066] = 16'B1000010000010000;
				inst_memory[2067] = 16'B0000000000000000;

				//sub r17, r31, 1
				inst_memory[2068] = 16'B0000111000010001;
				inst_memory[2069] = 16'B0001111100000001;

				//copy r51, r17
				inst_memory[2070] = 16'B1100111000110011;
				inst_memory[2071] = 16'B0001000100000000;

				//copy [r51], r16
				inst_memory[2072] = 16'B1100111011110011;
				inst_memory[2073] = 16'B0001000000000000;

				//copy r51, r63
				inst_memory[2074] = 16'B1100111000110011;
				inst_memory[2075] = 16'B0011111100000000;

				//sub r29, r29, 1
				inst_memory[2076] = 16'B0000111000011101;
				inst_memory[2077] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[2078] = 16'B1100111000111111;
				inst_memory[2079] = 16'B0001110100000000;

				//sub r16, r31, 1
				inst_memory[2080] = 16'B0000111000010000;
				inst_memory[2081] = 16'B0001111100000001;

				//copy r59, r16
				inst_memory[2082] = 16'B1100111000111011;
				inst_memory[2083] = 16'B0001000000000000;

				//copy [r63], [r59]
				inst_memory[2084] = 16'B1100111011111111;
				inst_memory[2085] = 16'B1111101100000000;

				//sub r29, r29, 1
				inst_memory[2086] = 16'B0000111000011101;
				inst_memory[2087] = 16'B0001110100000001;

				//copy r63, r29
				inst_memory[2088] = 16'B1100111000111111;
				inst_memory[2089] = 16'B0001110100000000;

				//movr [r51], 1
				inst_memory[2090] = 16'B1101010011110011;
				inst_memory[2091] = 16'B0000000000000001;

				//jmp F007
				inst_memory[2092] = 16'B1011100000000000;
				inst_memory[2093] = 16'B0000010000100100;

				//copy r16, r30
				inst_memory[2094] = 16'B1100111000010000;
				inst_memory[2095] = 16'B0001111000000000;

				//sub r17, r31, 2
				inst_memory[2096] = 16'B0000111000010001;
				inst_memory[2097] = 16'B0001111100000010;

				//copy r51, r17
				inst_memory[2098] = 16'B1100111000110011;
				inst_memory[2099] = 16'B0001000100000000;

				//copy [r51], r16
				inst_memory[2100] = 16'B1100111011110011;
				inst_memory[2101] = 16'B0001000000000000;

				//sub r16, r31, 2
				inst_memory[2102] = 16'B0000111000010000;
				inst_memory[2103] = 16'B0001111100000010;

				//copy r51, r16
				inst_memory[2104] = 16'B1100111000110011;
				inst_memory[2105] = 16'B0001000000000000;

				//output [r51]
				inst_memory[2106] = 16'B1000101000000001;
				inst_memory[2107] = 16'B1111001100000000;

				//L059:
				inst_memory[2108] = 16'B1111100000000000;
				inst_memory[2109] = 0;

				//L058:
				inst_memory[2110] = 16'B1111100000000000;
				inst_memory[2111] = 0;

				//L056:
				inst_memory[2112] = 16'B1111100000000000;
				inst_memory[2113] = 0;

				//L054:
				inst_memory[2114] = 16'B1111100000000000;
				inst_memory[2115] = 0;

				//L052:
				inst_memory[2116] = 16'B1111100000000000;
				inst_memory[2117] = 0;

				//L050:
				inst_memory[2118] = 16'B1111100000000000;
				inst_memory[2119] = 0;

				//L048:
				inst_memory[2120] = 16'B1111100000000000;
				inst_memory[2121] = 0;

				//L046:
				inst_memory[2122] = 16'B1111100000000000;
				inst_memory[2123] = 0;

				//L044:
				inst_memory[2124] = 16'B1111100000000000;
				inst_memory[2125] = 0;

				//output 0
				inst_memory[2126] = 16'B1000100000000001;
				inst_memory[2127] = 16'B0000000000000000;

				//input r0
				inst_memory[2128] = 16'B1000010000000000;
				inst_memory[2129] = 16'B0000000000000000;

				//sub r4, r31, 0
				inst_memory[2130] = 16'B0000111000000100;
				inst_memory[2131] = 16'B0001111100000000;

				//copy r51, r4
				inst_memory[2132] = 16'B1100111000110011;
				inst_memory[2133] = 16'B0000010000000000;

				//copy [r51], r0
				inst_memory[2134] = 16'B1100111011110011;
				inst_memory[2135] = 16'B0000000000000000;

				//jmp L041
				inst_memory[2136] = 16'B1011100000000000;
				inst_memory[2137] = 16'B0000010111110110;

				//L042:
				inst_memory[2138] = 16'B1111100000000000;
				inst_memory[2139] = 0;

				//halt
				inst_memory[2140] = 16'B1111000000000000;
				inst_memory[2141] = 0;

				//
				inst_memory[2142] = 16'B1111100000000000;
				inst_memory[2143] = 0;

				
			end
				
			else begin	
			
				out1 = inst_memory[PC];
				out2 = inst_memory[PC+1];
				
			end
			
		end
	
endmodule