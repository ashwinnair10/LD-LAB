module bcdadder(a, b, sumf);
	input [3:0] a, b;
	wire [3:0] s,sum;
  output [7:0]sumf;
	wire carry;
	wire [3:0]c,d;
 
	adder4bit add1(s,c,a,b);

	wire x,y;
	and g1(x,s[3],s[2]);
	and g2(y,s[3],s[1]);
	or g3(carry,c[3],x,y);

	full f0(sum[0], d[0], s[0], 0, 0);
	full f1(sum[1], d[1], s[1], carry, d[0]);
	full f2(sum[2], d[2], s[2], carry, d[1]);
	full f3(sum[3], d[3], s[3], 0, d[2]);
	
	wire check,check1,check2;
	and(check1,a[3],a[1]);
	and(check2,a[3],a[2]);
	or(check,check1,check2);
	
	wire check_,check1_,check2_;
	and(check1_,b[3],b[1]);
	and(check2_,b[3],b[2]);
	or(check_,check1_,check2_);
	
	wire checkfinal;
	or(checkfinal,check,check_);
	mux m1(sum[0],checkfinal,sumf[0]);
	mux m2(sum[1],checkfinal,sumf[1]);
	mux m3(sum[2],checkfinal,sumf[2]);
	mux m4(sum[3],checkfinal,sumf[3]);
	 mux m5(carry,checkfinal,sumf[4]);
  	mux m6(0,checkfinal,sumf[5]);
  	mux m7(0,checkfinal,sumf[6]);
 	mux m8(0,checkfinal,sumf[7]);
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

module adder4bit(s,c,a,b);
	input [3:0]a,b;
	output [3:0]s,c;
	full f0(s[0], c[0], a[0], b[0], 0);
	full f1(s[1], c[1], a[1], b[1], c[0]);	
	full f2(s[2], c[2], a[2], b[2], c[1]);
	full f3(s[3], c[3], a[3], b[3], c[2]);
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

module bcdadder_test;
  	reg [3:0]a,b;
  wire [7:0]sumf;
  	bcdadder test(a,b,sumf);
  	integer count;
  	initial begin
    	for(count=0;count<256;count=count+1)begin
      	{a,b}=count;
			#20;
			end
  	end
endmodule