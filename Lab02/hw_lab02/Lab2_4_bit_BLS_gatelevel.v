/*
Gi = Ai'Bi
Pi = (Ai ⊕ Bi)'
Di = (Pi ⊕ Ci)'
*/

module Lab2_4_bit_BLS_gatelevel (input [3:0] A, B, input bin, output [3:0] D, output bout);

    wire [3:0] G, P, C;
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
    
    //[3:0] Gi = Ai'Bi
    wire [3:0]temp;
    not G1(temp[0], A[0]);
    not G2(temp[1], A[1]);
    not G3(temp[2], A[2]);
    not G4(temp[3], A[3]);

    and #(2) G5(G[0], temp[0], B[0]);
    and #(2) G6(G[1], temp[1], B[1]);
    and #(2) G7(G[2], temp[2], B[2]);
    and #(2) G8(G[3], temp[3], B[3]);
    
    //[3:0] Pi = (Ai ⊕ Bi)'
    xnor #(4) G9(P[0], A[0], B[0]);
    xnor #(4) G10(P[1], A[1], B[1]);
    xnor #(4) G11(P[2], A[2], B[2]);
    xnor #(4) G12(P[3], A[3], B[3]);

    //[3:0] Di = (Pi ⊕ Ci)'
    xnor #(4) G13(D[0], P[0], C[0]);
    xnor #(4) G14(D[1], P[1], C[1]);
    xnor #(4) G15(D[2], P[2], C[2]);
    xnor #(4) G16(D[3], P[3], C[3]);

    //C[0] = bin
    buf Gate(C[0], bin);

    //C[1] = G[0] + P[0]C[0]
    and #(2) G17(w1, P[0], C[0]);
    or #(2) G18(C[1], G[0], w1);

    //C[2] = G[1] + P[1]G[0] + P[1]P[0]C[0]
    and #(2) G19(w2, P[1], G[0]);
    and #(2) G20(w3, P[1], P[0], C[0]);
    or #(2) G21(C[2], G[1], w2, w3);

    //C[3] = G[2] + P[2]G[1] + P[2]P[1]G[0] + P[2]P[1]P[0]C[0]
    and #(2) G22(w4, P[2], G[1]);
    and #(2) G23(w5, P[2], P[1], G[0]);
    and #(2) G24(w6, P[2], P[1], P[0], C[0]);
    or #(2) G25(C[3], G[2], w4, w5, w6);

    //bout = G[3] + P[3]G[2] + P[3]P[2]G[1] + P[3]P[2]P[1]G[0] + P[3]P[2]P[1]P[0]C[0]
    and #(2) G26(w7, P[3], G[2]);
    and #(2) G27(w8, P[3], P[2], G[1]);
    and #(2) G28(w9, P[3], P[2], P[1], G[0]);
    and #(2) G29(w10, P[3], P[2], P[1], P[0], C[0]);
    or #(2) G30(bout, w7, w8, w9, w10, G[3]);

endmodule