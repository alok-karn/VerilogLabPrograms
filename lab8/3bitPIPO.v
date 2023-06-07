module dff (
    D, clk, Q
);
    input D, clk;
    output Q;
    reg Q;
    always @(posedge clk)
        begin
            Q = D;
        end
    
endmodule

module pipo (
    in, out, clk
);
input in, clk;
output [3:0] out;

dff i(in, clk, out[0]);
dff i2(in, clk, out[1]);
dff i3(in, clk, out[2]);
dff i4(in, clk, out[3]);
    
endmodule

module pipo_tb;
reg in, clk;
wire [3:0] out;

pipo i(in, out, clk);

always #5 clk = ~clk;

initial begin
    in = 1'b0; clk = 1'b0;
    $monitor("Time: %f, in = %b, clk: %b, out = %b", $time, in, clk, out);
    #10 in = 1'b1;
    #10 in = 1'b0;                                                                                                                                                             
    #10 in = 1'b1;
    #10 in = 1'b0;
    #60 $finish;
end

endmodule