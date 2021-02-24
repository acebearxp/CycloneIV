// 红外接收器
module IR_RX(input logic clk, input logic ir, output logic[3:0] code[2:0]);

initial begin
    code[2] <= 4'd0;
    code[1] <= 4'd0;
    code[0] <= 4'd0;
end

always_ff@(posedge clk) begin
    if(ir == 0) begin
        if(code[2] == 4'd9)
            code[2] <= 1'd0;
        else
            code[2] <= code[2]+1'd1;
    end
end

endmodule
