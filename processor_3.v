module q3 #(parameter width=16)
(input[width-1:0] ip,output reg[width-1:0] op,input r,w,reset,clk);
	reg[width-1:0] def=0;
	always@(posedge clk or posedge reset)begin
		if(reset)
			def<=0;
		else begin
			if(r&~w)
				op<=def;
			else
				if(r)
				op=def;
				def<=ip;
		end
	end
endmodule
					
module q3_t;
	parameter width=16;
	reg[width-1:0] ip;
	reg reset,clk,r,w;
	wire[width-1:0] op;
	q3 t(ip,op,r,w,reset,clk);
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
		#10 r=0;w=0;ip=3;
		#10 r=0;w=1;ip=34;
		#10 r=1;w=0;ip=12;
		#10 r=1;w=1;ip=16;
		#10 r=1;w=1;ip=27;
		#10 r=1;w=0;ip=51;
		#10 r=1;w=1;ip=1;
		#10 r=1;w=0;ip=90;
	end
endmodule