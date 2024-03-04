module bcdxs3(a,c);
	input [3:0]a;
	output [3:0]c;
	wire [3:0]b;
	wire p,q,r,s,m,n,o,t,u;

	not(p,a[0]);
	not(q,a[1]);
	not(r,a[2]);
	not(s,a[3]);

	not(b[0],a[0]);
	xnor(b[1],a[0],a[1]);

	and(m,r,a[1]);
	and(n,r,a[0]);
	and(o,a[2],p,q);
	or(b[2],m,n,o);

	and(t,a[2],a[1]);
	and(u,a[2],a[0]);
	or(b[3],a[3],t,u);
	
	wire check,check1,check2;
	and(check1,a[3],a[1]);
	and(check2,a[3],a[2]);
	or(check,check1,check2);
	mux m1(b[0],check,c[0]);
	mux m2(b[1],check,c[1]);
	mux m3(b[2],check,c[2]);
	mux m4(b[3],check,c[3]);
	
endmodule

module mux(a,b,o);
	input a,b;
	output o;
	wire c,d,e;
	not(c,b);
	and(d,a,c);
	and(e,1'bx,b);
	or(o,d,e);
endmodule

module bcdxs3_test;
  	reg [3:0]a;
  	wire [3:0]b;
  	bcdxs3 test(a,b);
  	integer count;
  	initial begin
    	for(count=0;count<16;count=count+1)begin
      		{a}=count;
      		#20;
    		end
  	end
endmodule

