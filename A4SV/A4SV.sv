module A4SV(input logic rst, input logic clk, output logic [0:5] sel, output logic[7:0] dig, output logic tm1s);

logic clk8k;
logic[2:0] clk1k;

// PLL 50MHz -> 8kHz
PLL pll8k(.inclk0(clk), .c0(clk8k));
// CLK_DIV2N 8kHz -> 1kHz
CLK_DIV2N#(3) clkDiv1k(.clk(clk8k), .clkout(clk1k));
// CLK_DIV 1kHz -> 1Hz
CLK_DIV#(2000) clkDiv1s(.clk(clk1k), .clkdiv(tm1s));

logic[2:0] c; // 当前显示跟踪
logic[3:0] disp_ms[5:0]; // 6位显示
logic[7:0] out_ms[5:0]; // 输出寄存器

DIG_DEC decX0(disp_ms[0], out_ms[0]);
DIG_DEC decX1(disp_ms[1], out_ms[1]);
DIG_DEC decX2(disp_ms[2], out_ms[2]);
DIG_DEC decX3(disp_ms[3], out_ms[3]);
DIG_DEC decX4(disp_ms[4], out_ms[4]);
DIG_DEC decX5(disp_ms[5], out_ms[5]);

initial begin
    // 电路板上定义SEL0~5从左到右依次对应
    sel <= ~6'b000001;
    c <= 3'd0;

    disp_ms[5] <= 0;
    disp_ms[3] <= 0;
    disp_ms[3] <= 9;
    disp_ms[2] <= 9;
    disp_ms[1] <= 9;
    disp_ms[0] <= 9;
end

always_comb
    dig <= out_ms[c];

always_ff@(posedge clk1k[2], negedge rst) begin : block1kHz
    if(rst == 0) begin
        disp_ms[5] <= 0;
        disp_ms[4] <= 0;
        disp_ms[3] <= 9;
        disp_ms[2] <= 9;
        disp_ms[1] <= 9;
        disp_ms[0] <= 9;
    end
    else begin
        // 递减
        if(disp_ms[0] != 0) disp_ms[0]<=disp_ms[0]-1'd1;
        else begin
            if(disp_ms[1] != 0) begin
                disp_ms[1] <= disp_ms[1]-1'd1;
                disp_ms[0] <= 9;
            end
            else begin
                if(disp_ms[2] != 0) begin
                    disp_ms[2] <= disp_ms[2]-1'd1;
                    disp_ms[1] <= 9;
                    disp_ms[0] <= 9;
                end
                else if(disp_ms[3] != 0) begin
                    disp_ms[3] <= disp_ms[3]-1'd1;
                    disp_ms[2] <= 9;
                    disp_ms[1] <= 9;
                    disp_ms[0] <= 9;
                end
            end
        end
    end
end

always_ff@(posedge clk8k) begin : block8kHz
    // circular shift
    sel <= {sel[1:5], sel[0]};

    if(c==3'd5) c <= 3'd0;
    else c <= c+3'd1;
end
    
endmodule
