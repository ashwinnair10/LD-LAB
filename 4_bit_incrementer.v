module incrementer4bit(a,s);
  	input[3:0] a;
  	output[4:0] s;
  	wire c1,c2,c3;
 	full f0(s[0],c1,a[0],1, 0);
  	full f1(s[1],c2,a[1],0,c1);
  	full f2(s[2],c3,a[2],0,c2);
  	full f3(s[3],s[4],a[3],0,c3);
endmodule

module full(s,c,a,b,d);
  	input a,b,d;
  	output s,c;
  	wire s1,c1,c2;
 	half h0(s1,c1,a,b);
  	half h1(s,c2,s1,d);
  	or_gate o1(c,c1,c2);
endmodule

module half(s,c,a,b);
  	input a,b;
  	output s,c;
  	xor_gate x1(s,a,b);
  	and_gate a1(c,a,b);
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

module xor_gate(output c,input a,b);
	wire x,y,z;
	nand(x,a,b);
	nand(y,a,x);
	nand(z,b,x);
	nand(c,y,z);
endmodule

module incrementer4bit_test;
  	reg [3:0]a;
  	wire [4:0]b;
  	incrementer4bit test(a,b);
  	integer count;
  	initial begin
     		$dumpfile("dump.vcd");
            	$dumpvars;
    		for(count=0;count<16;count=count+1)begin
      			{a}=count;
      			#20;
    		end
  	end
endmodule

