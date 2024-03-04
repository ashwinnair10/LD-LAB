module shreg(sin,clk,clr,sout);
input sin,clk,clr;
output reg[7:0] sout;
assign sout=8'b00000000;
always @(posedge clk or posedge clr)begin
if(~clr)begin
sout<={sin,sout[7:1]};
end
else
sout<= 8'b00000000;
end
endmodule

module shregtest;
reg clk,clr,sin;
wire[7:0] sout;
shreg test(sin,clk,clr,sout);
initial begin
clk=0;
repeat(18) #10 clk=~clk;
end
initial begin
repeat(9) begin
clr = 0;sin = 1;
#18;
clr=1;
end
end
endmodule
