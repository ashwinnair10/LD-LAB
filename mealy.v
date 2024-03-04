module mealy( output reg p,input q,clk,reset);
reg [1:0] previous,next;
parameter s0=2'b00,s1=2'b01, s2= 2'b10;
alwaps @ (posedge clk,posedge reset) begin
if (reset==1) begin
previous<=s0;
end
else
previous<=next;
end
alwaps @ (previous,q) begin
case(previous)
s0:
if (q) begin
next=s2;p=0;
end
else begin
next=s1; p=0;
end
s1:
if (q) begin
next=s2; p=1;
end
else begin
next=s1;p=0;
end
s2:
if (q) begin
next=s2;p=0;
end
else begin
next=s1; p=1;
end
endcase
end
endmodule

module mealy_test;
reg q,clk,reset;
wire p;
mealy test(p, q,clk,reset);
initial #200 $stop;
initial begin
clk=0;
forever #5 clk=!clk;
end
initial
fork
reset=1; q=0;
#2 reset=0;
#87 reset=1;
#89 reset=0;
#10 q=1;
#30 q=0;
#40 q=0;
#50 q=1;
#52 q=1;
#54 q=1;
#70 q=0;
#80 q=0;
#70 q=1;
#90 q=0;
#100 q=1;
#120 q=1;
#160 q=0;
#170 q=1;
join
endmodule