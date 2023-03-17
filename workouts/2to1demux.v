module gates( a , b , c, f);
input a, b, c;
reg d, e;
output f;
reg f;

always @(a or b or c or d or e or f)
begin
    if (a==1'b0 && b==1'b0)
        d=1'b0;
    else
        d=1'b1;


    if ((b==1'b1 && c==1'b1 ))
        e=1'b0;
    else
        e=1'b1;


    if (e==1'b0 && d==1'b0)
        f=1'b1;
    else
        f=1'b0;
end
endmodule

module gates_tb;
reg a , b ,c;
wire f;

gates obj( a , b , c, f);
initial
begin
    a=1'b0;
    b=1'b0;
    $monitor("$time = %t A=%b B=%b C=%b F=%b" , $time , a , b, c, f);
    #10 a=1'b0 ; b= 1'b0 ; c=1'b0;
    #10 a=1'b0 ; b= 1'b0 ; c=1'b1;
    #10 a=1'b0 ; b= 1'b1 ; c=1'b0;
    #10 a=1'b0 ; b= 1'b1 ; c=1'b1;
    #10 a=1'b1 ; b= 1'b0 ; c=1'b0;
    #10 a=1'b1 ; b= 1'b0 ; c=1'b1;
    #10 a=1'b1 ; b= 1'b1 ; c=1'b0; 
    #10 a=1'b1 ; b= 1'b1 ; c=1'b1;
end 
endmodule