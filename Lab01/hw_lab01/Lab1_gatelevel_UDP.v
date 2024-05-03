module Lab1_gatelevel_UDP (F, A, B, C, D);

    output F;
    input A, B, C, D;
    wire W1, W2, W3, W4, W5;

    and G2(W2, B, C);
    not G1(W1, B);
	not G3(W3, D);

    Lab1_UDP M0(W4, A, W1, C);
    Lab1_UDP M1(W5, W2, W3, A);

    or G4(F, W4, W5);

endmodule