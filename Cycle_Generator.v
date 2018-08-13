
module Cycle_Generator (clk, a, b, c, d, bneg, reset, button_state, button_pause, pause_t, enabled_t, out);
	
	input clk, reset;							//clock verdadeiro do sistema
	input button_state;						//estado do botão de IO
	input button_pause;						//sinal de controle da pausa de IO
	input out;
	output reg a, b, c, d, bneg;			//ciclos do processador
	output wire pause_t;
	output wire enabled_t;
	
	reg pause;									//estado interno do clock divisor com relação ao IO
	wire enabled;								//flag indicando se pode prosseguir
	
	assign enabled = pause == button_state;
	assign pause_t = pause;
	assign enabled_t = enabled;
	
	//reg aneg, bneg, cneg, dneg;	//auxiliares pra manter os ciclos durando apenas meio ciclo de clock
	
	initial begin
		a = 0;
		b = 0;
		c = 0;
		d = 1;
		pause = 0;
	end
		
	always@(posedge clk)
		begin
			if(reset) begin
				a = 0;
				b = 0;
				c = 0;
				d = 1;
			end
			if (enabled && ~reset) begin
				if (d) begin
					a = 1;
					d = 0;
				end
				
				else if (a) begin
					b = 1;
					a = 0;
				end
				
				else if (b) begin
					c = 1;
					b = 0;
				end
				
				else if (c) begin
					d = 1;
					c = 0;
				end
			end
		end
		
	always@(posedge b)
		begin
			if(reset) begin
				pause = 0;
			end
			if(button_pause) begin
				pause = ~pause;
			end
		end
		
	always@(negedge clk)
		begin
			if(b)
				bneg = 1;
			else
				bneg = 0;
		end
	
endmodule
