module fullsub(a,b,bin,diff,bout);
	input a,b,bin;
	output diff,bout;
	wire c,d,e;

	halfsub h1(a,b,c,d);
	halfsub h2(c,bin,diff,e);
	or(bout,d,e);
endmodule

module halfsub(a,b,diff,bout);
	input a,b;
	output diff,bout;
	wire c;

	xor(diff,a,b);
	not(c,a);
	and(bout,c,b);
endmodule

module fullsub_test;
	reg a,b,bin;
	wire diff,bout;

	fullsub test(a,b,bin,diff,bout);
	integer count;
	initial begin
	for(count=0;count<8;count=count+1)begin
		{a,b,bin}=count;
		#20;
		end
	end
endmodule