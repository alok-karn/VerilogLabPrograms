module halfAdderGate (
    a,b,sum, carry;
);
input a, b;
output sum, carry;
and g1(carry, a, b);
xor g2(sum, a, b);
    
endmodule

module fullAdderUsingHalfAdder (
    a, b, c, sum, carry
);
input a, b, c;
output sum, carry;
wire w1, w2, w3;

halfAdderGate i1(a, b, w1, w2);
halfAdderGate i2(w1, c, sum, w3);
or g1(carry, w2, w3);
endmodule

module fullAdderTestBench;
reg a, b, c;
wire sum, carry;
fullAdderUsingHalfAdder i(a, b, c, sum, carry);

initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;

    $monitor("Time: %0t a=%b b=%b c=%b sum=%b carry=%b", $time, a, b, c, sum, carry);
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