`timescale 1ns / 1ps

module main(ledCLK, ledLatch, ledFF, clk50M, kSR, rst);

input clk50M, kSR, rst;
output ledCLK, ledLatch, ledFF;

// 降频到1Hz方便观察
CLK_DIV#(32'd50_000_000) clkDiv1S(clk50M, ledCLK);

wire x;
assign ledLatch = x;

// SR锁存器
SR_Latch S1(.s(~kSR), .r(~rst), .q(x));

// D触发器
D_FlipFlop D1(.d(x), .clk(ledCLK), .clr(1), .q(ledFF));

endmodule
