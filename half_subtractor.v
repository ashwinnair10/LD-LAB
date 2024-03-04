module halfsub(a,b,diff,borrow);
	input a,b;
	output diff,borrow;
	wire c;

	xor(diff,a,b);
	not(c,a);
	and(borrow,c,b);
endmodule

module halfsub_test;
	reg a,b;
	wire diff,borrow;
	halfsub test(a,b,diff,borrow);
	integer count;
	initial begin
	for(count=0;count<4;count=count+1)begin
		{a,b}=count;
		#20;
		end
	end
endmodule


