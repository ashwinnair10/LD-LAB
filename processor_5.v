module q5(input r1,r2,r3,r4,w1,w2,clk,reset,input[4:0] r1p,r2p,r3p,r4p,w1p,w2p,output reg[63:0] op1,op2,op3,op4,input[63:0] ip1,ip2);
	reg [63:0]register[0:31];
	always@(posedge clk or posedge reset)begin
		if(reset)begin
			integer i;
			for(i=0;i<32;i=i+1)
				register[i]=64'b0;
		end
		else begin
			if(w1)
				register[w1p]<=ip1;
			else if(w2)
				register[w2p]<=ip2;
			else begin
				if(r1)
					op1<=register[r1p];
				if(r2)
					op2<=register[r2p];
				if(r3)
					op3<=register[r3p];
				if(r4)
					op4<=register[r4p];
			end
		end
	end
endmodule

module q5_tb;

    reg r1, r2, r3, r4, w1, w2, clk, reset;
    reg [4:0] r1p, r2p, r3p, r4p, w1p, w2p;
    reg [63:0] ip1, ip2;
    reg [63:0] op1, op2, op3, op4;
    q5 q5_inst(
        .r1(r1), .r2(r2), .r3(r3), .r4(r4),
        .w1(w1), .w2(w2),
        .clk(clk), .reset(reset),
        .r1p(r1p), .r2p(r2p), .r3p(r3p), .r4p(r4p),
        .w1p(w1p), .w2p(w2p),
        .ip1(ip1), .ip2(ip2),
        .op1(op1), .op2(op2), .op3(op3), .op4(op4)
    );
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        r1 = 0; r2 = 0; r3 = 0; r4 = 0;
        w1 = 0; w2 = 0;
        r1p = 0; r2p = 1; r3p = 2; r4p = 3; w1p = 4; w2p = 5;
        ip1 = 0; ip2 = 0;
        #10 reset = 0;
        #10 w1 = 1; w1p = 0; ip1 = 100;
        #10 r1 = 1; r1p = 0;
        #10 w1 = 1; w1p = 1; ip1 = 200;
        #10 r2 = 1; r2p = 1;
        #10 w1 = 1; w1p = 2; ip1 = 300;
        #10 r3 = 1; r3p = 2;
        #10 w1 = 1; w1p = 3; ip1 = 400;
        #10 r4 = 1; r4p = 3;
        #10 w1 = 1; w1p = 4; ip1 = 500;
        #10 w2 = 1; w2p = 5; ip2 = 600;
        #10 r1 = 1; r2 = 1; r3 = 1; r4 = 1;
        #10 w1 = 1; w1p = 6; ip1 = 700;
        #10 w2 = 1; w2p = 7; ip2 = 800;
        #10 r1 = 1; r2 = 1; r3 = 1; r4 = 1;
        #10 w1 = 1; w1p = 8; ip1 = 900;
        #10 w2 = 1; w2p = 9; ip2 = 1000;
        #10 r1 = 1; r2 = 1; r3 = 1; r4 = 1;
        #10 w1 = 1; w1p = 10; ip1 = 1100;
        #10 r1 = 1; r2 = 1; r3 = 1; r4 = 1;
        #10 w2 = 1; w2p = 11; ip2 = 1200;
        #10 r1 = 1; r2 = 1; r3 = 1; r4 = 1;
        #10 $finish;
    end
endmodule
