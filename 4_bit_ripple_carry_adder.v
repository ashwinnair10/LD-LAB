module ripple(a, b, s, c);
  input [3:0] a, b;
  output [3:0] s;
  output c;
  wire c1, c2, c3;
  
  full f0(s[0], c1, a[0], b[0], 0);
  full f1(s[1], c2, a[1], b[1], c1);
  full f2(s[2], c3, a[2], b[2], c2);
  full f3(s[3], c, a[3], b[3], c3);
endmodule

module full(s, c, a, b, d);
  input a, b, d;
  output s, c;
  wire s1, c1, c2;
  
  half h0(s1, c1, a, b);
  half h1(s, c2, s1, d);
  or o1(c, c1, c2);
endmodule

module half(s, c, a, b);
  input a, b;
  output s, c;
  xor x1(s, a, b);
  and a1(c, a, b);
endmodule


module ripple_test;
  reg [3:0]a,b;
  wire [3:0]s;
  wire c;
  ripple test(a,b,s,c);
  integer count;
  initial begin
     $dumpfile("dump.vcd");
            $dumpvars;
    for(count=0;count<256;count=count+1)begin
      {a,b}=count;
      #20;
    end
  end
endmodule
