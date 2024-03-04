module multiplier(output[7:0] op,input[3:0] a,b);
 assign op[0]=a[0]&b[0];
 wire[16:0] x;
 half o1(op[1],x[0],(a[1]&b[0]),(a[0]&b[1]));
 full o2(x[1],x[2],a[1]&b[1],(a[0]&b[2]),x[0]);
 full o3(x[3],x[4],(a[1]&b[2]),(a[0]&b[3]),x[2]);
 half o4(x[5],x[6],(a[1]&b[3]),x[4]);
 half o5(op[2],x[14],x[1],(a[2]&b[0]));
 full o6(x[13],x[15],x[3],(a[2]&b[1]),x[14]);
 full o7(x[12],x[16],x[5],(a[2]&b[2]),x[15]);
 full o8(x[8],x[7],x[6],(a[2]&b[3]),x[16]);
 half o9(op[3],x[11],x[13],(a[3]&b[0]));
 full o0(op[4],x[10],x[12],(a[3]&b[1]),x[11]);
 full p1(op[5],x[9],x[8],(a[3]&b[2]),x[10]);
 full p2(op[6],op[7],x[7],(a[3]&b[3]),x[9]);
endmodule
module half(s,c,a,b);
 output reg s,c;
 input a,b;
 always @(*)
 begin
 case ({a,b})
 2'b00:s=0;
 2'b01:s=1;
 2'b10:s=1;
 2'b11:s=0;
 default:s=0;
 endcase
 case ({a,b})
 2'b00:c=0;
 2'b01:c=0;
 2'b10:c=0;
 2'b11:c=1;
 default:c=0;
 endcase
 end 
endmodule
module full(s,c,a,b,cin);
 output reg s,c;
 input a,b,cin;
 always @(*)
 begin
 case ({a,b,cin})
 3'b000:s=0;
 3'b001:s=1;
 3'b010:s=1;
 3'b011:s=0;
 3'b100:s=1;
 3'b101:s=0;
 3'b110:s=0;
 3'b111:s=1;
 default:s=0;
 endcase
 case ({a,b,cin})
 3'b000:c=0;
 3'b001:c=0;
 3'b010:c=0;
 3'b011:c=1;
 3'b100:c=0;
 3'b101:c=1;
 3'b110:c=1;
 3'b111:c=1;
 default:c=0;
 endcase
 end 
endmodule

module multipliertb; 
 reg [3:0]a;
 reg [3:0]b; 
 wire [7:0]op; 
 multiplier test(op,a,b);
 initial begin
 a=10;
 b=12;
 #30 ;
 a=13;
 b=12;
 #30 ;
 
 a=10;
 b=22;
 #30 ;
 
 a=11;
 b=22;
 #30 ;
 
 a=12;
 b=15;
 #30 ;
 
 end
endmodule
