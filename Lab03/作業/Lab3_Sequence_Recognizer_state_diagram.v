module Lab3_Sequence_Recognizer_state_diagram (input x, clock, reset, output z);

    reg z;
    reg[2:0] state, next_state;
    parameter S0=3'b000, S1=3'b001, S2=3'b010,  S3=3'b011, S4=3'b100, S5=3'b101, S6=3'b110;
    
    //Form state transition-- State Register
    always @(posedge clock, negedge reset)
        if(reset==0) state <= S0; //Active-Low
        else state <= next_state;

    //Form the next state-- Next State Combinational Logic
    always @(state, x)
        case(state)
            S0: if(x) next_state = S4; else next_state = S1;
            S1: if(x) next_state = S2; else next_state = S1;
            S2: if(x) next_state = S4; else next_state = S3;
            S3: if(x) next_state = S2; else next_state = S6;
            S4: if(x) next_state = S4; else next_state = S5;
            S5: if(x) next_state = S2; else next_state = S6;
            S6: if(x) next_state = S6; else next_state = S6;
        endcase

    //Form the output-- Output Combinational Logic
    always @(state, x)
        case(state)
            S0, S1, S3, S4, S5, S6: z = 0;
            S2: z = ~x;
        endcase

endmodule