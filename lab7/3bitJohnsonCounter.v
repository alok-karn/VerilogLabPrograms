module dFlipFlop (
    D, clk, Q, reset
);
input D, clk, reset;
output reg Q;

always @(posedge clk) begin
    if(reset) begin
        Q = 0;
    end
    else begin
        Q = D;
    end
end
    
endmodule

module JohnsonCounter (
    reset, clk, Q
);
input reset, clk;
output [3:0] Q;

dFlipFlop i1(~Q[0], clk, Q[3], reset);
dFlipFlop i2(Q[3], clk, Q[2], reset);
dFlipFlop i3(Q[2], clk, Q[1], reset);
dFlipFlop i4(Q[1], clk, Q[0], reset);

endmodule

module JohnsonCounter_tb;
reg reset, clk;
wire [3:0] Q;

JohnsonCounter i1(reset, clk, Q);

always #5 clk = ~clk;

initial begin
    clk = 1'b0; reset = 1'b1;
    $monitor("Time=%f, clk=%b, Q=%3b", $time, clk, Q);
    #10 reset = 0;
    #100 $finish;
end
endmodule