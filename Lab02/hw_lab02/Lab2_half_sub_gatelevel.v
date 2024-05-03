module Lab2_half_sub_gatelevel(input a, b, output diff, bout);

    wire w1;

	and	#(2) G3(bout, w1, b);
    not G2(w1, a);
    xor #(4) G1(diff, a, b);

endmodule