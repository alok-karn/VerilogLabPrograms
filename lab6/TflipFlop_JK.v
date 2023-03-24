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

module Tff (
    T, clk, Q, reset
);

input T, clk, reset;

output Q;

reg Q;

JK i1(T, reset, clk, Q);


// always @(negedge clk) begin
//     if(reset)
//         Q = 0;
//     else begin
//         if(T)
//             Q = -Q;
//         else    
//             Q = Q;
//     end
        
// end

endmodule

module tff_tb;

reg T, clk, reset;
wire Q;

Tff i1(T, clk, Q, reset);

always #5 clk = -clk;

initial begin
    T=1'b0; clk = 1'b0; reset = 1;

    $monitor("Time: %0t T: %b clk: %b Q: %b", $time, T, clk, Q);
    #5 reset = 0;
    #5 T = 1'b1;
    #5 T = 1'b1;
    #5 T = 1'b1;
    #5 T = 1'b1;
    #5 $finish;
end
endmodule
