module t_Lab3_Sequence_Recognizer();
    wire	z;
	reg		x, clock, reset;
	
	//instantiate device under test
    Lab3_Sequence_Recognizer_state_diagram M0(x, clock, reset, z);
    Lab3_Sequence_Recognizer_structure M1(x, clock, reset, z);

	//Generate stimulus for clock
    initial
        begin
            clock = 0;
            reset = 0;
            #5 reset = 1;
            repeat(16)
                #5 clock = ~clock;
        end

	//Generate stimulus for x, reset
    initial 
        begin
            x = 0;
            #15 x = 1;
            repeat(8)
                #10 x = ~x;
        end

    initial #100 $finish;

	//dump the result of simulation
	initial begin
		$dumpfile("Sequence_Recognizer.vcd");
		$dumpvars;
	end

endmodule