module halfAdderDFM (
    a, b, s, cout
);
input a, b;
output s, cout;
wire w1, w2, w3;

assign s = a^b;
assign cout = a&b;
    
endmodule

module halfAdderDFMTestBench;
reg a,b;
wire s, cout;

halfAdderDFM i(a,b,s,cout);

initial begin
    a=1'b0;
    b=1'b0;

    $monitor("Time: %0t, a=%b, b=%b, s=%b, cout=%b", $time, a, b, s, cout);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;

end
endmodule