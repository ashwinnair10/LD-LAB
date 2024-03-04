module mux(input a0,a1,a2,a3,a4,a5,a6,a7, p, q, r,output f);
  wire var0,var1,var2,var3,var4,var5,var6,var7;
  wire x, y, z;
  
  not (x, p);
  not (y, q);
  not (z, r);
  
  and g1(var0, a0, x, y, z);
  and g2(var1, a1, x, y, r);
  and g3(var2, a2, x, q, z);
  and g4(var3, a3, x, q, r);
  and g5(var4, a4, p, y, z);
  and g6(var5, a5, p, y, r);
  and g7(var6, a6, p, q, z);
  and g8(var7, a7, p, q, r);
  
  or o1(f, var0, var1, var2, var3, var4, var5, var6, var7);
  
endmodule


module mux_test;
  reg p, q, r,a0,a1,a2,a3,a4,a5,a6,a7;
  wire f;
  mux test(a0,a1,a2,a3,a4,a5,a6,a7,p,q,r,f);
  integer count;
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;    
    for (count = 0; count < 2048; count = count + 1) begin
      {p, q, r, a0,a1,a2,a3,a4,a5,a6,a7} = count;
      #20;
    end
    $finish;
  end
endmodule
