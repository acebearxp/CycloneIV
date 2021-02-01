// basic SR-Latch

module SR_Latch(input s, input r, output reg q, output reg qn);

always@(s or r)
if(r)
    {q, qn} <= 2'b01;
else if(s)
    {q, qn} <= 2'b10;

endmodule
