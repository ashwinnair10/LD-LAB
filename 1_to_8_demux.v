module demux(a,p,q,r,f0,f1,f2,f3,f4,f5,f6,f7);
  input a,p,q,r;
  output f0,f1,f2,f3,f4,f5,f6,f7;
  wire x,y,z;
  
  not(x,p);
  not(y,q);
  not(z,r);
  
  and(f0,a,x,y,z);
  and(f1,a,x,y,r);
  and(f2,a,x,q,z);
  and(f3,a,x,q,r);
  and(f4,a,p,y,z);
  and(f5,a,p,y,r);
  and(f6,a,p,q,z);
  and(f7,a,p,q,r);
  
endmodule


module demux_test;
  reg a, p, q, r;
  wire f0,f1,f2,f3,f4,f5,f6,f7;
  demux test(a,p,q,r,f0,f1,f2,f3,f4,f5,f6,f7);
  integer count;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, demux_test);    
    for (count = 0; count < 16; count = count + 1) begin
      {p, q, r, a} = count;
      #20;
    end
    $finish;
  end
endmodule
