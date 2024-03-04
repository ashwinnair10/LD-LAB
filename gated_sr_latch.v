module gatedsrlatch(input s,r,en,output q,qnot);
	wire a,b;
  	wire r1,s1;
  	nand(s1,en,s);
  	nand(r1,en,r);
  	nand(a,s1,b);
  	nand(b,r1,a);
	wire check,c;
	nand(c,a,b);
	nand(check,c,c);
	mux m1(q,a,check);
	mux m2(qnot,b,check);
endmodule

module mux(o,a,b);
	input a,b;
	output o;
	wire c,d,e;
	not_gate n1(c,b);
	and_gate a1(d,a,c);
	and_gate a2(e,1'bx,b);
	or_gate o1(o,d,e);
endmodule

module or_gate(output c,input a,b);
	wire x;
	nor(x,a,b);
	nor(c,x,x);
endmodule

module and_gate(output c,input a,b);
	wire x;
	nand(x,a,b);
	nand(c,x,x);
endmodule

module not_gate(output a,input b);
	nand(a,b,b);
endmodule

module gatedsrlatch_test;
  	reg s,r,en;
  	wire q,qnot;
  	gatedsrlatch test(s,r,en,q,qnot);
  	integer count;
  	initial begin
      		for(count=0;count<8;count=count+1)begin
        		{en,s,r}=count;
      			#20;
    		end
  	end
endmodule