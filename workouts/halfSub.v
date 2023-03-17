module halfSub (
    a, b, diff, bin
);   

input a, b;
output diff, bin;
reg diff, bin;

always @(a or b or diff or bin) begin
    if(a == 1'b1 ^ b == 1'b1)
        diff = 1'b1;
    else
        diff = 1'b0;

    if(a == 1'b1 && b == 1'b0)
        bin = 1'b1;
    else
        bin = 1'b0;
    
end
    
endmodule