module srlatch(input s,r,output q,qnot);
	wire a,b;	
	nand(a,s,b);
	nand(b,r,a);
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

module srlatch_test;
  	reg s,r;
  	wire q,qnot;
  	srlatch test(s,r,q,qnot);
  	integer count;
  	initial begin
     		$dumpfile("dump.vcd");
            	$dumpvars;
    		for(count=0;count<4;count=count+1)begin
      			{s,r}=count;
      			#20;
    		end
  	end
endmodule

