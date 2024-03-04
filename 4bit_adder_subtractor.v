module add_subtract(a,b,m,s,c);
  
  input [3:0]a,b;
  input m;
  output [3:0]s;
  output c;
  wire c1,c2,c3;
  wire [3:0]var;
  
  xor x1(var[0],b[0],m);
  xor x2(var[1],b[1],m);
  xor x3(var[2],b[2],m);
  xor x4(var[3],b[3],m);
  
  full f0(s[0],c1,a[0],var[0],m);
  full f1(s[1],c2,a[1],var[1],c1);
  full f2(s[2],c3,a[2],var[2],c2);
  full f3(s[3],c,a[3],var[3],c3);
  
endmodule
  
module full(s,c,a,b,d);
  
  input a,b,d;
  output s,c;
  wire s1,c1,c2;
  
  half h0(s1,c1,a,b);
  half h1(s,c2,s1,d);
  or o1(c,c1,c2);
  
endmodule

module half(s,c,a,b);
  
  input a,b;
  output s,c;
  xor(s,a,b);
  and(c,a,b);
  
endmodule


module add_subtract_test;
  reg [3:0]a,b;
  reg m;
  wire [3:0]s;
  wire c;
  add_subtract test(a,b,m,s,c);
  integer count;
  initial begin
     $dumpfile("dump.vcd");
            $dumpvars;
    for(count=0;count<512;count=count+1)begin
      {m,a,b}=count;
      #20;
    end
  end
endmodule