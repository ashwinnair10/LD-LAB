module add(a, b, s, c);
  input [3:0] a, b;
  output [3:0] s;
  output c;
  wire c1, c2, c3,c4,c22,c33,c44,s2,s3,s4,co1,co2,co3;
  
  half h0(s[0],c1,a[0],b[0]);
  
  half h2(s2,c2,a[1],b[1]);
  half h3(s[1],c22,s2,c1);
  or(co1,c2,c22);
  
  half h4(s3,c3,a[2],b[2]);
  half h5(s[2],c33,s3,co1);
  or(co2,c3,c33);
  
  half h6(s4,c4,a[3],b[3]);
  half h7(s[3],c44,s4,co2);
  or(c,c4,c44);
  
endmodule

module half(s, c, a, b);
  input a, b;
  output s, c;
  xor xor_gate(s, a, b);
  and and_gate(c, a, b);
endmodule


module add_test;
  reg [3:0]a,b;
  wire [3:0]s;
  wire c;
  add test(a,b,s,c);
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
