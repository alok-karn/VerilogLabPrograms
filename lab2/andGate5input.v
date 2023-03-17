module andFiveInput (
    in1,in2,in3,in4,in5,out
);

input in1,in2,in3,in4,in5;
output out;
and  a1(out,in1,in2,in3,in4,in5);
endmodule

module andFiveTestBench;

reg in1,in2,in3,in4,in5;
wire out;

andFiveInput i(in1,in2,in3,in4,in5,out);
initial
begin
    in1=1'b0;
    in2=1'b0;
    in3=1'b0;
    in4=1'b0;
    in5=1'b0;
    $monitor("Time: %0t in1=%b in2=%b in3=%b in4=%b in5=%b out=%b", $time, in1, in2, in3, in4, in5, out);
    #5 in1=1'b0; in2=1'b0; in3=1'b0; in4=1'b0; in5=1'b0;
    #5 in1=1'b0; in2=1'b0; in3=1'b1; in4=1'b0; in5=1'b1;
    #5 in1=1'b1; in2=1'b1; in3=1'b1; in4=1'b1; in5=1'b1;
end
endmodule