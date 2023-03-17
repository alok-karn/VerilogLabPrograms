module activeHigh3X8(
    en, a, b, c, d0, d4, d6, d7, out
);

input en, a, b, c;
output d0, d4, d6, d7;
// wire d0, d4, d6, d7;
output out;

assign d0 = en & ~a & ~b & ~c;
// assign d1 = en & ~a & ~b & c;
// assign d2 = en & ~a & b & ~c;
// assign d3 = en & ~a & b & c;
assign d4 = en & a & ~b & ~c;
// assign d5 = en & a & ~b & c;
assign d6 = en & a & b & ~c;
assign d7 = en & a & b & c;

assign out = d0 | d4 | d6 | d7;
    
endmodule

module activeHighDecoder3X8_tb;
reg en, a, b, c;
wire d0, d4, d6, d7, out;

activeHigh3X8 exp(en, a, b, c, d0, d4, d6, d7, out);

initial begin
    en=1'b1; a=1'b0; b=1'b0; c=1'b0;
    $monitor("Time:%f, en=%b a=%b b=%b c=%b, d0=%b, d4=%b, d6=%b, d7=%b, out=%b", $time, en, a, b, c, d0, d4, d6, d7, out );
    #5 en=1'b1; a=1'b0; b=1'b0; c=1'b0;
    #5 en=1'b1; a=1'b0; b=1'b0; c=1'b1;
    #5 en=1'b1; a=1'b0; b=1'b1; c=1'b0;
    #5 en=1'b1; a=1'b0; b=1'b1; c=1'b1;
    #5 en=1'b1; a=1'b1; b=1'b0; c=1'b0;
    #5 en=1'b1; a=1'b1; b=1'b0; c=1'b1;
    #5 en=1'b1; a=1'b1; b=1'b1; c=1'b0;
    #5 en=1'b1; a=1'b1; b=1'b1; c=1'b1;
end
endmodule
