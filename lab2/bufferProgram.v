module buffer (
    A, B
);
input A;
output B;
assign B = A;  
endmodule

module TestTB;
reg A;
wire B;

buffer T1(A, B);
initial begin
    A=1'b1;
    $monitor("Time = %0t, A = %b, B = %b", $time, A, B);
    #5 A=1'b0;
    #5 A=1'b1;
end
endmodule