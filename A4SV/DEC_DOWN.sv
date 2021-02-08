// 十进制倒计数
module DEC_DOWN(input logic clk, input logic rst, output logic[3:0] out[5:0]);

initial begin
    out[5] <= 0;
    out[4] <= 0;
    out[3] <= 9;
    out[2] <= 9;
    out[1] <= 9;
    out[0] <= 9;
end

always_ff@(posedge clk, negedge rst) begin
    if(rst == 0) begin
        out[3] <= 9;
        out[2] <= 9;
        out[1] <= 9;
        out[0] <= 9;
    end
    else begin
        // 递减
        if(out[0] != 0) out[0]<=out[0]-1'd1;
        else begin
            if(out[1] != 0) begin
                out[1] <= out[1]-1'd1;
                out[0] <= 9;
            end
            else begin
                if(out[2] != 0) begin
                    out[2] <= out[2]-1'd1;
                    out[1] <= 9;
                    out[0] <= 9;
                end
                else if(out[3] != 0) begin
                    out[3] <= out[3]-1'd1;
                    out[2] <= 9;
                    out[1] <= 9;
                    out[0] <= 9;
                end
            end
        end
    end
end

endmodule
