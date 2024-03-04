module negator4bit(input[3:0] a,output[3:0] b);
	notgate n0(b[0],a[0]);
	notgate n1(b[1],a[1]);
	notgate n2(b[2],a[2]);
	notgate n3(b[3],a[3]);
endmodule

module notgate(output b,input a);
	nand(b,a,a);
endmodule

module negator4bit_test;
  	reg [3:0]a;
  	wire [3:0]b;
  	negator4bit test(a,b);
  	integer count;
  	initial begin
    		for(count=0;count<16;count=count+1)begin
      			{a}=count;
      			#20;
    		end
  	end
endmodule
