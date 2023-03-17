module halfSubGate (
    a, b, diff, borrow
);
input a, b;
output diff, borrow;
wire abar, w1, w2;
not g1(abar, a);
and g2(borrow, abar, b);
xor(diff, a, b);
    
endmodule

module FullSubUsingHalfAdd (
    a, b, c, diff, borrow
);
input a, b, c;
output diff, borrow;
wire w1, w2, w3;

halfSubGate i1(a, b, w1, w2);
halfSubGate i2(w1, c, diff, w3);
or g1(borrow, w2, w3);

endmodule

module FullSubTestBench;
reg a, b, c;
wire diff, borrow;

FullSubUsingHalfAdd i(a, b, c, diff, borrow);

initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;

    $monitor("Time: %0t a=%b b=%b c=%b diff=%b borrow=%b", $time, a, b, c, diff, borrow);
    #5 a=1'b0; b=1'b0; c=1'b0;
    #5 a=1'b0; b=1'b0; c=1'b1;
    #5 a=1'b0; b=1'b1; c=1'b0;
    #5 a=1'b0; b=1'b1; c=1'b1;
    #5 a=1'b1; b=1'b0; c=1'b0;
    #5 a=1'b1; b=1'b0; c=1'b1;
    #5 a=1'b1; b=1'b1; c=1'b0;
    #5 a=1'b1; b=1'b1; c=1'b1;

end
endmodule