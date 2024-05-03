/*
v = E[3]⊕E[2] + E[3]E[1]'E[0]' + E[3]'E[1]E[0]
B[3] = E[3]E[1]E[0] + E[3]E[2]
B[2] = E[2]'E[1]' + E[2]'E[0]' + E[2]E[1]E[0]
B[1] = E[1] ⊕ E[0]
B[0] = E[0]'
*/
module Lab2_converter_4bit_behavioral (input [3:0] E, output reg [3:0] B, output reg v);

    reg [3:0] n;
    always @(E or n)
    begin
        n = (~E);

        B[0] = ~E[0];
        B[1] = E[1] ^ E[0];
        B[2] = (~E[2])&(~E[1]) | (~E[2])&(~E[0]) | E[2]&E[1]&E[0];
        B[3] = E[3]&E[1]&E[0] | E[3]&E[2];
        v = E[3]^E[2] | E[3]&(~E[1])&(~E[0]) | (~E[3])&E[1]&E[0];
        
    end

endmodule