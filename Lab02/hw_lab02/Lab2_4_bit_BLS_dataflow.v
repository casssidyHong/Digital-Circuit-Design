/*
Gi = Ai'Bi
Pi = (Ai ⊕ Bi)'
Di = (Pi ⊕ Ci)'
Ci = Gi-1 + (Ci-1 ‧ Pi-1')
*/
module Lab2_4_bit_BLS_dataflow (input [3:0] A, B, input bin, output [3:0] D, output bout);

    wire [3:0] G, P, C, Q;

    assign G = (~A) & B;
    assign P = A ^ B;
    assign Q = ~P;
    assign D = P ^ C;

    assign C[0] = bin;
    assign C[1] = G[0] | (Q[0]&C[0]);
    assign C[2] = G[1] | (Q[1]&C[1]);
    assign C[3] = G[2] | (Q[2]&C[2]);
    assign bout = G[3] | (Q[3]&C[3]);

endmodule