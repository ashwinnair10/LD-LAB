module dlatch(input d,clk,pre,clr,output reg q,qnot);
always@(clk)begin
if(clr==1'b1)begin
q<=1'b0;
qnot<=1'b1;
end
else begin
if(pre==1'b1)begin
q<=1'b1;
qnot<=1'b0;
end
else begin
q<=d;
qnot<=~d;
end
end
end
endmodule

module dlatchtest;
reg d,pre,clr,clk;
wire q,qnot;
dlatch test(d,clk,pre,clr,q,qnot);
initial begin
 $dumpfile("dump.vcd");
 $dumpvars;
clk=0;
forever #10 clk=~clk;
end
initial begin
pre=0;clr=0;d<=0;
#100 pre=0;clr=0;d<=1;
#100 pre=0;clr=1;d<=0;
#100 pre=0;clr=1;d<=1;
#100 clr=0;pre=0;d<=0;
#100 clr=0;pre=0;d<=1;
#100 clr=0;pre=1;d<=0;
#100 clr=0;pre=1;d<=1;
#100 clr=0;pre=0;d<=0;
#100 clr=0;pre=0;d<=1;
end
endmodule
