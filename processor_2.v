module q2(input[15:0] ip1,ip2,output reg[15:0] op,input r,w1,w2,reset,clk);
	reg[15:0] def=16'b0;
	reg c=-1;
	always@(posedge clk or posedge reset)begin
		if(reset)
			def<=16'b0;
		else begin
			if(c==-1&&w1==1)begin
				c<=1;
				def<=ip1;
			end
			else if(c==-1&&w2==1)begin
				c<=0;
				def<=ip2;
			end
			if(w1==1&&c==0)begin
				def<=ip1;
				c<=1;
			end
			if(w2==1&&c==1)begin
				def<=ip2;
				c<=0;
			end
			else if(((w1&&~w2&&c)&&r)||((w2&&~w1&&~c)&&r)||((~w1&&~w2)&&r))
				op<=def;
		end
	end
endmodule
					
module q2_t;
	reg[15:0] ip1,ip2;
	reg reset,clk,r,w1,w2;
	wire[15:0] op;
	q2 t(ip1,ip2,op,r,w1,w2,reset,clk);
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
		#10 w1=1;r=1;ip1=16'b1;
		#10 w1=1;w2=1;r=1;ip1=16'b1;ip2=16'b0010011010011010;
		#10 r=1;w1=0;w2=0;ip1=16'b0110010001110101;
		#10 r=1;ip2=16'b1;
		#10 r=1;w1=1;ip1=16'b0;
		#10 r=1;w2=1;ip2=16'b0110111110100111;
		#10 r=1;w1=0;w2=0;ip1=16'bx;
	end
endmodule