//電路有 reset 輸入訊號，可設定電路至初始狀態 S0 (000)
module Lab3_Sequence_Recognizer_structure (input x, clock, reset, output z);

    D_ff_AR Ma(Da, clock, reset, a);
    D_ff_AR Mb(Db, clock, reset, b);
    D_ff_AR Mc(Dc, clock, reset, c);

    wire Da, Db, Dc;
    wire a, b, c;

    assign Da = a&(~x) | (~c)&x | b&c&(~x);
    assign Db = a&b | c&x | a&c | b&(~x);
    assign Dc = (~a)&(~c)&(~x) | (~b)&(~c)&(~x) | (~a)&(~b)&(~x);
    assign z = (~a)&b&(~c)&(~x);

endmodule