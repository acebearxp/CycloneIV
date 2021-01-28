module D_FF(d, clk, clr, q, qn);

input d, clk, clr;
output reg q;
output reg qn;

always @ (posedge clk or posedge clr)
if(clr == 1) begin
    q <= 0;
    qn <= 1;
end
else begin
    q <= d;
    qn <= ~d;
end


endmodule