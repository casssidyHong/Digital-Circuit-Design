//asynchronous reset (又稱 direct reset) 之 D flip-flop 的電路模組
// active low

module D_ff_AR (input D, clock, reset, output Q);

    reg Q;

    always @(posedge clock, negedge reset)
        if(!reset) Q <= 1'b0;
        else Q <= D;

endmodule