module halfAdderGateLevel (
    a, b, sum, carry
);

input a, b;
output sum, carry;

and g1(carry, a, b);
xor g2(sum, a, b);

endmodule

module halfAdderTestBench;
reg a, b;
wire sum, carry;
halfAdderGateLevel i(a, b, sum, carry);

initial begin
    a=1'b0;
    b=1'b0;

    $monitor("Time: %0t a=%b b=%b sum=%b carry=%b", $time, a, b, sum, carry);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;
end
endmodule