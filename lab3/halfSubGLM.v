module halfSubGLM (
    a, b, bor, diff
);

input a, b;
output bor, diff;
wire w1;

xor x1(diff, a, b);
not n1(w1, a);
and a1(bor, w1, b);
    
endmodule

module halfSubGLMTestBench;
reg a,b;
wire bor, diff;

halfSubGLM i(a,b,bor,diff);

initial begin 
    a=1'b0;
    b=1'b0;

    $monitor("Time: %0t, a=%b, b=%b, bor=%b, diff=%b", $time, a, b, bor, diff);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;

end
endmodule