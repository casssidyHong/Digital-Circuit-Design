/*
v = E[3]⊕E[2] + E[3]E[1]'E[0]' + E[3]'E[1]E[0]
B[3] = E[3]E[1]E[0] + E[3]E[2]
B[2] = E[2]'E[1]' + E[2]'E[0]' + E[2]E[1]E[0]
B[1] = E[1] ⊕ E[0]
B[0] = E[0]'
*/
module Lab2_converter_4bit_dataflow (input [3:0] E, output [3:0] B, output v);

    wire [3:0] n;

    assign n = (~E);

    assign B[0] = ~E[0];
    assign B[1] = E[1] ^ E[0];
    assign B[2] = (~E[2])&(~E[1]) | (~E[2])&(~E[0]) | E[2]&E[1]&E[0];
    assign B[3] = E[3]&E[1]&E[0] | E[3]&E[2];
    assign v = E[3]^E[2] | E[3]&(~E[1])&(~E[0]) | (~E[3])&E[1]&E[0];

endmodule