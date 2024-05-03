module	t_Lab3_SR_Latch_gatelevel();
	wire	Q, Qb;
	reg		S, R;
	
	//instantiate device under test
	Lab3_SR_Latch_gatelevel M0(S, R, Q, Qb);

	//apply inputs one at a time
	initial	begin
		
        S = 1'b0; R = 1'b1;
        #30 S = 1'b1; R = 1'b0;
        #30 S = 1'b0; R = 1'b0;
        #30 S = 1'b1; R = 1'b0;
        #30 S = 1'b1; R = 1'b1;
        #50 S = 1'b0; R = 1'b0;
        #30 S = 1'b0; R = 1'b1;

	end
	initial #230 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("SR_Latch.vcd");
		$dumpvars;
	end
endmodule