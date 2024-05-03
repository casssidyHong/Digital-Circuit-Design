module try (input x, clock, reset, output reg z);

    reg key;
    reg[2:0] state, next_state;
    parameter S0=3'b000, S1=3'b001, S2=3'b010,  S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110;

    initial
        begin 
            key <= 0;
        end
    
    //Form state transition-- State Register
    always @(posedge clock, negedge reset)
        if(reset==0) state <= S0; //Active-Low
        else state <= next_state;

    //Form the next state-- Next State Combinational Logic
    always @(state, x, key)
        case(state)
            S0: if(x) next_state = S4; else next_state = S1;
            S1: if(x) next_state = S2; else next_state = S1;
            S2: if(x) next_state = S4; else next_state = S3;
            S3: if(x) next_state = S2; else next_state = S6;
            S4: begin 
                    key = 1;
                    if(x) next_state = S4; 
                    else next_state = S5; 
                end
            S5: if(x) next_state = S2; else next_state = S6;
            S6: if(x) next_state = S6; else next_state = S6;
        endcase

    //Form the output-- Output Combinational Logic
    always @(state, x)
        case(state)
            S0: z = 0;
            S1: z = 0;
            S3: z = 0;
            S4: z = 0;
            S5: z = 0;
            S6: z = 0;
            S2: if(key) z = 0; else z = ~x;
        endcase

endmodule