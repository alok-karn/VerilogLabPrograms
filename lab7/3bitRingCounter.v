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




endmodule