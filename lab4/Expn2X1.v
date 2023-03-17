// GIVEN EXPRESSION F = a'b' + a'b

module Exp2to1 (
   d0, d1, s, y
);

input d0, d1, s;
output y;
reg y;
not g1(d0bar, d0);
always @(d0 or d1 or s) begin
    if(s==1'b0)
        y = d0bar;
    else
        y = d0;
end

endmodule

module Exp2to1_tb;
reg d0, d1, s;
wire y;

Exp2to1 i(d0, d1, s, y);

initial

begin

s=1'b0; d0=1'b0; d1=1'b0;

$monitor("Time: %f, s:%b, d0:%b, d1:%b, y:%b", $time, s, d0, d1, y);

#5 s=1'b0; d0=1'b1; d1=1'b0;

#5 s=1'b0; d0=1'b0; d1=1'b1;

#5 s=1'b1; d0=1'b1; d1=1'b0;

#5 s=1'b1; d0=1'b0; d1=1'b1;

end

endmodule