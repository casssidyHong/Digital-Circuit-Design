module Lab1_dataflow (F, A, B, C, D);

    output F;
    input A, B, C, D;
    wire W1, W2, W3, W4, W5, W6, W7;

    assign W1 = ~B;
    assign W2 = A || W1;
    assign W3 = B&&C;
    assign W4 = ~D;
    assign W5 = W2&&C;
    assign W6 = W3 || W4;
    assign W7 = W6&&A;
    assign F = W5 || W7;

endmodule