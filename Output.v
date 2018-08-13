module Output(d, mem, data_reg, mem_reg, out_data_src, display, c, out, reset, out_tens_1, out_ones_1, out_neg1, out_tens_2, out_ones_2, out_neg2, out_tens_3, out_ones_3, out_neg3,
out_neg_ones1, out_neg_ones2, out_neg_ones3);
	
	input [15:0] mem, data_reg, mem_reg, display;		//a origem do dado de entrada será selecionada de acordo com out_data_src
	input [1:0] out_data_src;
	input c, d, out, reset;
	
	output wire [6:0] out_tens_1, out_ones_1,	//saídas para o display - uma para cada display por conta da pinagem
							out_tens_2, out_ones_2,
							out_tens_3, out_ones_3;
						  
	output out_neg_ones1, out_neg_ones2, out_neg_ones3, out_neg1, out_neg2, out_neg3;
	
	reg neg;
	
	wire [3:0] hundreds, tens, ones;							//conversão em bcd
	reg [15:0] data;
	
	reg [6:0] in_tens_1, in_ones_1, in_tens_2, in_ones_2, in_tens_3, in_ones_3;
	reg neg1, neg2, neg3;
						
	always@(posedge c) begin
			
		if(out) begin
		
			neg = 0;
			
			case(out_data_src)
				2'B01: data = mem;
				2'B10: data = data_reg;
				2'B11: data = mem_reg; 
			endcase
			
			if(data[15] == 1) begin								//se o número for negativo desconverte e indica o sinal no display
				data = ~data + 1;
				neg = 1;
			end
		end	
	end
	
	BCD_Converter bcd(data[7:0], hundreds, tens, ones);
	
	
	always@(posedge d) begin												//seleciona qual entrada de display recebe o novo valor
		
		case(display)
			
			1: begin in_tens_1 = tens; in_ones_1 = ones; neg1 = neg; end
			2: begin in_tens_2 = tens; in_ones_2 = ones; neg2 = neg; end
			3: begin in_tens_3 = tens; in_ones_3 = ones; neg3 = neg; end
			
		endcase
		
		if(reset) begin
			
			in_tens_1 = 7'B1111111; in_ones_1 = 7'B1111111; neg1 = 0;
			in_tens_2 = 7'B1111111; in_ones_2 = 7'B1111111; neg2 = 0;
			in_tens_3 = 7'B1111111; in_ones_3 = 7'B1111111; neg3 = 0;
			
		end
		
	end
	
	Display7seg d1_10(in_tens_1, out_tens_1, neg1, out_neg1);
	Display7seg d1_1(in_ones_1, out_ones_1, 0, out_neg_ones1);
	
	Display7seg d2_10(in_tens_2, out_tens_2, neg2, out_neg2);
	Display7seg d2_1(in_ones_2, out_ones_2, 0, out_neg_ones2);
	
	Display7seg d3_10(in_tens_3, out_tens_3, neg3, out_neg3);
	Display7seg d3_1(in_ones_3, out_ones_3, 0, out_neg_ones3);
		
endmodule
