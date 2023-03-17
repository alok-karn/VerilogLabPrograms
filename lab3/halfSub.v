module halfSubGateLevel (
    a, b, diff, borrow
);

input a, b;
output diff, borrow;
wire abar, w1, w2;
not g1(abar, a);
and g2(borrow, abar, b);
xor(diff, a, b);

endmodule

module halfSubTestBench;
reg a, b;
wire diff, borrow;
halfSubGateLevel i(a, b, diff, borrow);

initial begin
    a=1'b0;
    b=1'b0;

    $monitor("Time: %0t a=%b b=%b diff=%b borrow=%b", $time, a, b, diff, borrow);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;
end
endmodule