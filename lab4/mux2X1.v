module mux_2x1(a,b,sel,out);
input a, b, sel;
output out;
reg out;
output reg out;// this can also be written

always @(a or b or sel) // sensitivity list
begin
    if(sel==1)
        out=a;
    else
        out=b;
end
endmodule
