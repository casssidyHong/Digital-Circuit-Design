module	t_Lab3_NE_Dff_gatelevel();
	wire	Q, Qb;
	reg		D, clock;
	
	//instantiate device under test
	Lab3_NE_Dff_gatelevel M0(D, clock, Q, Qb);

	//apply inputs one at a time
	initial	begin
		
        D = 1'b0;
        #55 D = 1'b1;
        #42 D = 1'b0;
        #40 D = 1'b1;
        #28 D = 1'b0;
        #30 D = 1'b1;
        #60 D = 1'b0;

        end

        initial begin

        clock = 1'b0;
        forever #20 clock = ~clock;

	end

	initial #260 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("NE_Dff.vcd");
		$dumpvars;
	end
endmodule