// 6位数码管显示
module DIG6_SHOW(input logic clk, input logic[3:0] in[5:0], output logic[0:5] sel, output logic[7:0] seg);

logic[2:0] c; // 当前显示跟踪
logic[3:0] dig;  // 当前输出数字

logic dot;
DIG_DEC x1(dig, dot, seg);

initial begin
    // 电路板上定义SEL0~5从左到右依次对应
    sel <= ~6'b000001;
    c <= 3'd0;
    dot <= 0;
end

always_comb
    dig <= in[c];

always_ff@(posedge clk) begin
    // circular shift
    sel <= {sel[1:5], sel[0]};

    if(c==3'd5) c <= 3'd0;
    else c <= c+3'd1;
    
    if(c==3'd1) dot <=1;
    else dot <=0;
end

endmodule
