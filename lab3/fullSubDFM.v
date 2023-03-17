module fullSubDFM (
    a, b, bin, bor, diff
);
input a, b, bin;
output bor, diff;

assign diff = a^b^bin;
assign bor = (~a&b)|(~a|b)&bin;
    
endmodule

module fullSubDFMTestBench;
reg a,b,bin;
wire bor, diff;

fullSubDFM i(a,b,bin,bor,diff);

initial begin
    a=1'b0;
    b=1'b0;
    bin=1'b0;

    $monitor("Time: %0t, a=%b, b=%b, bin=%b, diff=%b, bor=%b", $time, a, b, bin, diff, bor);
    #5 a=1'b0; b=1'b0; bin=1'b0;
    #5 a=1'b0; b=1'b0; bin=1'b1;
    #5 a=1'b0; b=1'b1; bin=1'b0;
    #5 a=1'b0; b=1'b1; bin=1'b1;
    #5 a=1'b1; b=1'b0; bin=1'b0;
    #5 a=1'b1; b=1'b0; bin=1'b1;
    #5 a=1'b1; b=1'b1; bin=1'b0;
    #5 a=1'b1; b=1'b1; bin=1'b1;

end
endmodule