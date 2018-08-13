module ALU (ALUop, op1, op2, out_op, out_branch);

	input [4:0] ALUop;			// codigo de operacao da ALU
	input signed [15:0] op1, op2;		// operandos de entrada
	output reg signed [15:0] out_op;		// operando de saida para aritmeticos e sets
	output reg out_branch;			// sinal de saida para branch
	
	parameter WIDTH = 16;
   reg [WIDTH-1:0] a1,b1;
   reg [WIDTH:0] p1;   
   integer i;
	
	always@(*)
		begin
			
			case(ALUop[4:2])
			
				3'B000:	// aritmetico
					begin
						
						if (ALUop[1:0] == 2'B00)		//adicao
							begin
								out_op = op1 + op2;
								out_branch = 0;
							end
							
						else if (ALUop[1:0] == 2'B01) // subtracao
							begin
								out_op = op1 - op2;
								out_branch = 0;
							end
						else if (ALUop[1:0] == 2'B10) // multiplicacao
							begin
								out_op = op1 * op2;
								out_branch = 0;
							end
						else if (ALUop[1:0] == 2'B11) // divisao
							begin
							  //initialize the variables.
							  a1 = op1;
							  b1 = op2;
							  p1= 0;
							  for(i=0;i < WIDTH;i=i+1)    begin //start the for loop
									p1 = {p1[WIDTH-2:0],a1[WIDTH-1]};
									a1[WIDTH-1:1] = a1[WIDTH-2:0];
									p1 = p1-b1;
									if(p1[WIDTH-1] == 1)    begin
										 a1[0] = 0;
										 p1 = p1 + b1;   end
									else
										 a1[0] = 1;
							  end
						  out_op = a1;
						  out_branch = 0;
					 end 
					end
					
				3'B001:	// shift
					begin
						
						case(ALUop[1:0])
							
							2'B00:	// shift logical left
								begin
									out_op = op1 << 1;			// posso usar o op2 como quantidade de shifts a serem feitos?
									out_branch = 0;
								end
								
							2'B01:	// shift logical right
								begin
									out_op = op1 >> 1;
									out_branch = 0;
								end
								
							2'B10:	//shift arithmetic left
								begin
									out_op = op1 <<< 1;
									out_branch = 0;
								end
								
							2'B11:	//shift arithmetic right
								begin
									out_op = op1 >>> 1;
									out_branch = 0;
								end							
						endcase
						
					end
				
				3'B010:	//logico
					begin
						case(ALUop[1:0])
							
							2'B00:	// and
								begin
									out_op = op1 & op2;
									out_branch = 0;
								end
								
							2'B01:	// not
								begin
									out_op = ~op1;
									out_branch = 0;
								end
								
							2'B10:	// or
								begin
									out_op = op1 | op2;
									out_branch = 0;
								end
								
							2'B11:	// xor
								begin
									out_op = op1 ^ op2;
									out_branch = 0;
								end							
						endcase
					end
				
				3'B011:	// set
					begin
						
						if (ALUop[1:0] == 2'B00)		// set less than
							begin
								if (op1 < op2)
									out_op = 1;
								else
									out_op = 0;
									
								out_branch = 0;
							end
							
						else if (ALUop[1:0] == 2'B01) // set if equal
							begin
								if (op1 == op2)
									out_op = 1;
								else
									out_op = 0;
									
								out_branch = 0;
							end
					end
					
				3'B101:	//branch
					begin
						case(ALUop[1:0])
							
							2'B00:	// branch if less than
								begin
									if (op1 < op2)
										out_branch = 1;
									else
										out_branch = 0;
									out_op = 0;
								end
								
							2'B01:	// branch if greater than
								begin
									if (op1 > op2)
										out_branch = 1;
									else
										out_branch = 0;
									out_op = 0;
								end
								
							2'B10:	// branch if equal
								begin
									if (op1 == op2)
										out_branch = 1;
									else
										out_branch = 0;
									out_op = 0;
								end							
						endcase
					end
					
				default:	// nao é operacao da ALU
					begin
						out_op = 0;
						out_branch = 0;
					end
				
			endcase
		end
endmodule
