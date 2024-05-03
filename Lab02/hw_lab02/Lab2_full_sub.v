/*全減器( Full Subtractor):
設計一個全減器(full subtractor, FS)，有三個輸入變數及 兩個輸出變數。
輸入變數為被減數 a、減數 b、及借位輸入 bin; 輸出變數為差值 diff 與借位輸出 bout。
請利用(a)中的 gate-level 半減器來建構全減器。
電路中 AND 與 OR 邏輯閘之延 遲設為 2 個單位時間，XOR 與 XNOR 邏輯閘之延遲設為 4 個單位時間，NOT 邏輯閘之延遲則忽略之。*/

module Lab2_full_sub(input a, b, bin, output diff, bout);

    wire w1, w2, w3;

    Lab2_half_sub_gatelevel M1(a, b, w1, w3);
    Lab2_half_sub_gatelevel M0(w1, bin, diff, w2);
    
    or	#(2) G1(bout, w2, w3);

endmodule