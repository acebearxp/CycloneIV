`timescale 1ns / 1ps

module A3State(y, x, clk, clr);

input x, clk, clr;
output reg y;

reg [1:0] state = 2'b00;
parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;

always @ (posedge clk)
begin
    if(clr == 1) state <= A;
    else begin
        if(x == 0)
            case (state)
                A: state <= A;
                B: state <= A;
                C: state <= D;
                D: state <= A;
            endcase
        else
            case (state)
                A: state <= B;
                B: state <= C;
                C: state <= C;
                D: state <= B;
            endcase
        
        if((x==1) && (state == D))
            y <= 1;
        else
            y <= 0;
    end
end

endmodule