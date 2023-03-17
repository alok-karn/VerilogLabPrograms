module mux4to1_gate(out,in,sel);
  input [0:3] in; 
  input [0:1] sel; 
  output out;
  wire a,b,c,d,n1,n2,a1,a2,a3,a4;
  not n(n1,sel[1]); 
  not nn(n2,sel[0]);
  and (a1,in[0],n1,n2);
  and (a2,in[1],n2,sel[1]);
  and (a3,in[2],sel[0],n1); 
  and (a4,in[3],sel[0],sel[1]);
  or or1(out,a1,a2,a3,a4);
 
endmodule


module mux16to1(out,in,sel); 
 input [0:15] in; 
 input [0:3] sel;
 output out;
 wire [0:3] ma;
 mux4to1_gate mux1(ma[0],in[0:3],sel[2:3]);
 mux4to1_gate mux2(ma[1],in[4:7],sel[2:3]);
 mux4to1_gate mux3(ma[2],in[8:11],sel[2:3]);
 mux4to1_gate mux4(ma[3],in[12:15],sel[2:3]);
 mux4to1_gate mux5(out,ma,sel[0:1]);
endmodule


module testbenchmux_16X1; 
reg [0:15] in; 
reg [0:3] sel; 
wire out;
mux16to1 mux(out,in,sel);
initial
begin
$monitor("Time: %f | in=%b | sel=%b | out=%b",$time, in,sel,out);
end
initial
begin
    in=16'b1000000000000000; sel=4'b0000; 
    #5 in=16'b0100000000000000; sel=4'b0001; 
    #5 in=16'b0010000000000000; sel=4'b0010;
    #5 in=16'b0001000000000000; sel=4'b0011;
    #5 in=16'b0000100000000000; sel=4'b0100; 
    #5 in=16'b0000010000000000; sel=4'b0101; 
    #5 in=16'b0000001000000000; sel=4'b0110;
    #5 in=16'b0000000100000000; sel=4'b0111;
    #5 in=16'b0000000010000000; sel=4'b1000;
    #5 in=16'b0000000001000000; sel=4'b1001;
    #5 in=16'b0000000000100000; sel=4'b1010; 
    #5 in=16'b0000000000010000; sel=4'b1011;
    #5 in=16'b0000000000001000; sel=4'b1100; 
    #5 in=16'b0000000000000100; sel=4'b1101; 
    #5 in=16'b0000000000000010; sel=4'b1110; 
    #5 in=16'b0000000000000001; sel=4'b1111;

end 
endmodule