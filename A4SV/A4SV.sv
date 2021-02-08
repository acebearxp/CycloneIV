module A4SV(input logic rst, input logic clk, output logic [0:5] sel, output logic[7:0] seg, output logic tm1s);

logic clk8k, clk4096;
logic[2:0] clk1k;
logic[11:0] clk1s;

// PLL 50MHz -> 8kHz & 4096Hz
PLL pll8k(.inclk0(clk), .c0(clk8k), .c1(clk4096));
// CLK_DIV2N 8kHz -> 1kHz
CLK_DIV2N#(3) clkDiv1k(.clk(clk8k), .clkout(clk1k));
// CLK_DIV2N 4096Hz -> 1Hz
CLK_DIV2N#(12) clkDiv1s(.clk(clk4096), .clkout(clk1s));

logic[3:0] disp_ms[5:0]; // 数值寄存器

DEC_DOWN d1(.clk(clk1k[2]), .rst(rst), .out(disp_ms));
DIG6_SHOW s1(.clk(clk8k), .in(disp_ms), .sel(sel), .seg(seg));

assign tm1s = clk1s[11];
    
endmodule
