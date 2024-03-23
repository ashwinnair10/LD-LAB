module q4(input r1,r2,w,clk,reset,input [2:0]r1p,r2p,wp,input [7:0]ip,output reg[7:0]op1,op2);
	reg [7:0]register[0:7];
	always@(posedge clk or posedge reset)begin
		if(reset)begin
			integer i;
			for(i=0;i<8;i=i+1)
				register[i]=8'b0;
		end
		else begin
			if(w)begin
				register[wp]<=ip;
			end
			if(r1||r2) begin
				if(r1&&r1p!=wp)
					op1<=register[r1p];
				if(r2&&r2p!=wp)
					op2<=register[r2p];
			end
		end
	end
endmodule

module q4_tb;
    reg r1, r2, w, clk, reset;
    reg [2:0] r1p, r2p, wp;
    reg [7:0] ip;
    wire [7:0] op1, op2;
    q4 t(r1, r2, w, clk, reset, r1p, r2p, wp, ip, op1, op2);
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        r1 = 0; r2 = 0; w = 0;
        r1p = 3; r2p = 5; wp = 1;
        ip = 0;
        #10 reset = 0;
        #10 w = 1; wp = 0; ip = 10;
        #10 w = 1; wp = 1; ip = 20;
        #10 w = 1; wp = 2; ip = 30;
        #10 r1 = 1; r1p = 0;
        #10 r2 = 1; r2p = 1;
        #10 r1 = 0; r2 = 0;
        #10 w = 1; wp = 3; ip = 40;
        #10 w = 1; wp = 4; ip = 50;
        #10 r1 = 1; r1p = 3; r2 = 1; r2p = 4;
        #10 r1 = 0; r2 = 0;
        #10 w = 1; wp = 5; ip = 60;
        #10 w = 1; wp = 6; ip = 70;
        #10 r1 = 1; r1p = 5; r2 = 1; r2p = 6;
        #10 r1 = 0; r2 = 0;
        #10 w = 1; wp = 7; ip = 80;
        #10 r1 = 1; r1p = 7;
        #10 r1 = 0;
        #10 w = 1; wp = 0; ip = 90;
        #10 w = 1; wp = 1; ip = 100;
        #10 r1 = 1; r1p = 0; r2 = 1; r2p = 1;
        #10 $finish;
    end
endmodule

