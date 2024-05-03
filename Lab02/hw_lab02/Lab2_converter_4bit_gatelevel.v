module Lab2_converter_4bit_gatelevel (input [3:0] E, output [3:0] B, output v);

    wire [3:0] n;
    not G1(n[0], E[0]);
    not G2(n[1], E[1]);
    not G3(n[2], E[2]);
    not G4(n[3], E[3]);

    //v = E[3]⊕E[2] + E[3]E[1]'E[0]' + E[3]'E[1]E[0]

    wire [3:0] vc;
    xor G5(vc[0], E[3], E[2]);
    and G7(vc[1], E[3], n[1], n[0]);
    and G8(vc[2], n[3], E[1], E[0]);
    or G9(v, vc[0], vc[1], vc[2]);

    //B[3] = E[3]E[1]E[0] + E[3]E[2]

    wire [1:0] bc_3;
    and G10(bc_3[0], E[3], E[1], E[0]);
    and G11(bc_3[1], E[3], E[2]);
    or G12(B[3], bc_3[0], bc_3[1]);

    //B[2] = E[2]'E[1]' + E[2]'E[0]' + E[2]E[1]E[0]

    wire [2:0] bc_2;
    and G13(bc_2[0], n[2], n[1]);
    and G14(bc_2[1], n[2], n[0]);
    and G15(bc_2[2], E[2], E[1], E[0]);
    or G16(B[2], bc_2[0], bc_2[1], bc_2[2]);

    //B[1] = E[1] ⊕ E[0]

    xor G17(B[1], E[1], E[0]);

    //B[0] = E[0]'

    not G18(B[0], E[0]);
    

endmodule