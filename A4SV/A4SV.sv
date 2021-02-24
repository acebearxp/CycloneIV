module A4SV(input logic rst, input logic clk, input logic irx,
            output logic [0:5] sel, output logic[7:0] seg,
            output logic tm1s, output logic led2);

logic clk8k, clk4096, clk910k;

logic[2:0] clk1k;
logic[11:0] clk1s;

logic clkIR; // 外红采样时钟8倍

// PLL 50MHz -> 8kHz & 4096Hz & 910k
PLL pll8k(.inclk0(clk), .c0(clk8k), .c1(clk4096), .c2(clk910k));
// CLK_DIV2N 8kHz -> 1kHz
CLK_DIV2N#(3) clkDiv1k(.clk(clk8k), .clkout(clk1k));
// CLK_DIV2N 4096Hz -> 1Hz
CLK_DIV2N#(12) clkDiv1s(.clk(clk4096), .clkout(clk1s));
// CLK_DIV2N 910k -> 8x
CLK_DIV2N#(6) clkIR8x(.clk(clk910k), .clkout(clkIR));

logic[3:0] dispSix[5:0]; // 6个数码管
logic[3:0] disp_ms[5:0]; // 数值寄存器

// 倒计时器, 千分之一秒
DEC_DOWN d1(.clk(clk1k[2]), .rst(rst), .out(disp_ms));

// 红外
logic[3:0] irCode[2:0];
IR_RX ir(.clk(clkIR), .ir(irx), .code(irCode));

// 倒计时器用3位,另外3位用于调试
assign dispSix[5] = irCode[2];
assign dispSix[4] = irCode[1];
assign dispSix[3] = irCode[0];

assign dispSix[2] = disp_ms[3];
assign dispSix[1] = disp_ms[2];
assign dispSix[0] = disp_ms[1];

DIG6_SHOW s1(.clk(clk8k), .in(dispSix), .sel(sel), .seg(seg));

assign tm1s = clk1s[11];
assign led2 = ~irx;
    
endmodule
