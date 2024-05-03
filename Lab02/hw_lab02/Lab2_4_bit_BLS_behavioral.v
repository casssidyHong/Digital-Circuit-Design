/*
Gi = Ai'Bi
Pi = (Ai ⊕ Bi)'
Di = (Pi ⊕ Ci)'
Ci = Gi-1 + (Ci-1 ‧ Pi-1')
*/

module Lab2_4_bit_BLS_behavioral(input [3:0] A, B, input bin, output reg [3:0] D, output reg bout);

    reg [3:0] G, P, C, Q;
    always @(A or B or bin)
    begin
        
        G = (~A) & B;
        P = A ^ B;
        Q = ~P;
        
        C[0] = bin;
        C[1] = G[0] | (Q[0]&C[0]);
        C[2] = G[1] | (Q[1]&C[1]);
        C[3] = G[2] | (Q[2]&C[2]);
        bout = G[3] | (Q[3]&C[3]);
        
        D = P ^ C;

    end

endmodule