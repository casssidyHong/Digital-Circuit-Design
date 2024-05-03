module Lab3_NE_Dff_gatelevel(input D, clock, output Q, Qb);

    wire w1, w2, w3, w4;

    Lab3_SR_Latch_gatelevel SR1(clock, w2, w4, w3);
    Lab3_SR_Latch_gatelevel SR2(w1, w3, Q, Qb);

    nor	#(10) G1(w1, w3, clock, w2);
    nor #(10) G2(w2, w1, D);

endmodule