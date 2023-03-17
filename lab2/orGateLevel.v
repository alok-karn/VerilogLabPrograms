module orGateLevel (
    a,b,c
);
input a, b;
output c;
or o1(c,a,b);
    
endmodule

module orTestBench;
    reg a,b;
    wire c;

    orGateLevel i(a,b,c);

    initial begin
        a=1'b0;
        b=1'b0;
        $monitor("Time: %0t a=%b b=%b c=%b", $time, a, b, c);
        #5 a=1'b0; b=1'b0;
        #5 a=1'b0; b=1'b1;
        #5 a=1'b1; b=1'b0;
        #5 a=1'b1; b=1'b1;
    end
endmodule
