module exp5 (
    a,b,c, out;
);
input a,b,c;
output out;
wire w1, w2;

not n1(w1, a);
or o1(w2, b,c);
nand n2(out, w1, w2);
    
endmodule

module exp5_testBench;
reg a,b,c;
wire out;    

exp5 i(a,b,c,out);
initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;

    $monitor("Time: %0t, a=%b, b=%b, c=%b, out=%b", $time, a, b, c, out);
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