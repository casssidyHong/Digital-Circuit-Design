module Lab1_gatelevel (F, A, B, C, D);

    output F;
    input A,B,C,D;
    wire w1,w2,w3,w4,w5,w6,w7;

    and G3(w3, B, C);
    and G5(w5, w2, C);
    and G7(w7, w6, A);
    not G1(w1, B);
    not G4(w4, D);
    or G2(w2, A, w1);
    or G6(w6, w3, w4);
    or G8(F, w5, w7);

endmodule