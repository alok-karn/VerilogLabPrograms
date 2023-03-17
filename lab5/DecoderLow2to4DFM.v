// d0=a+b+c
// d1=a+b+c'
// d2=a+b'+c
// d3=a+b'+c'

module decoder2to4_dl (
    en, a, b, d0, d1, d2, d3
);
input en, a, b;
output d0, d1, d2, d3;

assign d0 = en | a | b;
assign d1 = en | a | ~b;
assign d2 = en | ~a | b;
assign d3 = en | ~a | ~b;
    
endmodule

module decoder2to4_dl_tb;
reg en, a, b;
wire d0, d1, d2, d3;
decoder2to4_dl de1(en, a, b, d0, d1, d2, d3);

initial begin
    en=1'b0; a=1'b0; b=1'b0;
    $monitor("Time:%f, en=%b a=%b b=%b, d0=%b, d1=%b, d2=%b, d3=%b", $time, en, a, b, d0, d1, d2, d3 );
    #5 en=1'b0; a=1'b0; b=1'b0;
    #5 en=1'b0; a=1'b0; b=1'b1;
    #5 en=1'b0; a=1'b1; b=1'b0;
    #5 en=1'b0; a=1'b1; b=1'b1;
   
end
endmodule
