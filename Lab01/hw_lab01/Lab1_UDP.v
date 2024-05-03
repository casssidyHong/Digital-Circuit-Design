primitive Lab1_UDP (out, x, y, z);
	output out;
	input x, y, z;

	table
	    // x y z : out
		   0 0 0 : 0;
		   0 0 1 : 0;
		   0 1 0 : 0;
	       1 0 0 : 0;
		   0 1 1 : 1;
		   1 0 1 : 1;
		   1 1 0 : 0;
		   1 1 1 : 1;
	endtable
    
endprimitive