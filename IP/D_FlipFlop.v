module D_FlipFlop(input d, input clk, input clr, output reg q, output reg qn);

always @ (posedge clk or negedge clr)
if(clr==0)
    {q, qn} <= 2'b01;
else
    {q, qn} <= {d, ~d};

endmodule
