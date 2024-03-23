module q1(input[15:0] ip,output reg[15:0] op,input rw,reset,clk);
	reg[15:0] def=16'b0;
	always@(posedge clk or posedge reset)begin
		if(reset)
			def<=16'b0;
		else begin
			if(~rw)
				op<=def;
			else
				def<=ip;
		end
	end
endmodule
					
module q1_t;
	reg[15:0] ip;
	reg reset,clk,rw;
	wire[15:0] op;
	q1 t(ip,op,rw,reset,clk);
	initial begin
		clk=1;
		forever begin
			#5 clk=~clk;
		end
	end
	initial begin
		reset=0;
		#10 reset=1;
		#10 reset=0;
		#10 rw=0;ip=16'b1;
		#10 rw=1;ip=16'b1;
		#10 rw=0;ip=16'b0110010001110101;
		#10 rw=1;ip=16'b1;
		#10 rw=1;ip=16'b0;
		#10 rw=0;ip=16'b0110111110100111;
		#10 rw=1;ip=16'bx;
	end
endmodule