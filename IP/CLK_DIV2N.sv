// 分频,支持按2的n次幂分频
module CLK_DIV2N
    #(parameter n=1)
    (input logic clk, output logic [n-1:0] clkout);

initial begin
    clkout = 0;
end

always_ff @( negedge clk ) begin : div2N
    clkout <= clkout+1'd1;
end

endmodule
