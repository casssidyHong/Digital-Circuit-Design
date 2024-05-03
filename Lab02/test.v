module	t_Lab2_4_bit_sub();

	wire	[3:0] D;
	wire	bout;
	reg		[3:0] A, B;
	reg		bin;
	
	//instantiate device under test
    //Lab2_4_bit_RBS M(A, B, bin, D, bout);
	//Lab2_4_bit_BLS_gatelevel M(A, B, bin, D, bout);
	Lab2_4_bit_BLS_dataflow M(A, B, bin, D, bout);
	//Lab2_4_bit_BLS_behavioral M(A, B, bin, D, bout);
	
	//apply inputs one at a time
	initial	begin
		A = 4'b0000; B = 4'b1100; bin = 1;
		#30 A = 4'b0001; B = 4'b0010; bin = 1;
		#30 A = 4'b0011; B = 4'b0110; bin = 1;
		#30 A = 4'b0101; B = 4'b1011; bin = 0;
		#30 A = 4'b0111; B = 4'b1010; bin = 1;
		#30 A = 4'b1000; B = 4'b0001; bin = 0;
		#30 A = 4'b1011; B = 4'b0110; bin = 0;
		#30 A = 4'b1111; B = 4'b1111; bin = 1;

	end
	initial #240 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("dataflow.vcd");
		$dumpvars;
	end
endmodule