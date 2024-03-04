module register8bit(clk,clr,pi,po);
input clk,clr;
input wire[7:0] pi;
output reg[7:0] po;
always @(posedge clk)begin
if(clr)
po<=8'b00000000;
else
po<=pi;
end
endmodule

module register8bittest;
reg clk,clr;
reg[7:0] pi;
wire[7:0] po;
register8bit test(clk,clr,pi,po);
initial begin
clk = 0;
clr = 0;
pi = 0;
#5 clr=1'b1;
#5 clr=1'b0;
#10 pi=8'b10011010;
#10 pi=8'b10101010;
#10 pi=8'b10111001;
#10 pi=8'b11100011;
#10 pi=8'b11110010;
#10 pi=8'b00001111;
end
always #5 clk = ~clk;
initial #90 $stop;
endmodule
