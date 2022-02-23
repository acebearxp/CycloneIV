// 中段取样,8个时钟周期,第3个取样,第4个输出
module SAM8(input logic clk, input logic in, output logic clkout, output logic out);

logic[2:0] counter = 0;

initial begin
    clkout <= 0;
end

always_ff@(posedge clk) begin
    counter <= counter + 3'd1;
    
    if(counter == 3)
        out <= in;
    else if(counter == 4)
        clkout = ~clkout;
    else if(counter == 7)
        clkout = ~clkout;
end

endmodule
