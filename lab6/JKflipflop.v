module JK(
    J, K, clk, Q
);
input J, K, clk;
output Q;
reg Q;

always @(posedge clk) begin
    case ({ J, K })
        2'b00: Q = Q;
        2'b01: Q = 0;
        2'b10: Q = 1;
        2'b11: Q = -Q;
    endcase
end

endmodule


module JK_tb;
reg J, K, clk;
wire Q;

JK i1(J, K, clk, Q);

always #5 clk = -clk;

initial begin
    J=1'b0; K=1'b0; clk = 1'b0;

    $monitor("Time: %0t J: %b K: %b clk: %b Q: %b", $time, J, K, clk, Q);
    #5 J = 1'b0; K = 1'b1;
    #5 J = 1'b1; K = 1'b0;
    #5 J = 1'b1; K = 1'b1;
    #5 J = 1'b0; K = 1'b0;
    #5 $finish;
end
endmodule