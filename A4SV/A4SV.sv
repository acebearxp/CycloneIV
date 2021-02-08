module A4SV(input logic rst, input logic clk, output logic [0:5] sel, output logic[7:0] dig, output logic tm1s);

logic clk8k, clk4096;
logic[2:0] clk1k;
logic[11:0] clk1s;

// PLL 50MHz -> 8kHz & 4096Hz
PLL pll8k(.inclk0(clk), .c0(clk8k), .c1(clk4096));
// CLK_DIV2N 8kHz -> 1kHz
CLK_DIV2N#(3) clkDiv1k(.clk(clk8k), .clkout(clk1k));
// CLK_DIV2N 4096Hz -> 1Hz
CLK_DIV2N#(12) clkDiv1s(.clk(clk4096), .clkout(clk1s));

logic[2:0] c; // 当前显示跟踪
logic[3:0] disp_ms[5:0]; // 数值寄存器
logic[3:0] disp_out;

DIG_DEC decX0(disp_out, dig);

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

always_comb begin
    disp_out <= disp_ms[c];
    tm1s <= clk1s[11];
end

always_ff@(posedge clk1k[2], negedge rst) begin : block1kHz
    if(rst == 0) begin
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
