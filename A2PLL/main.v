`timescale 1ns / 1ps

module A2PLL(input rst, input clk, output clk2, output clk0, output clk1, output lxk);

// counter clk:50MHz -> clk2:1Hz
CLK_DIV#(32'd50_000_000) clk1S(clk, clk2);

// PLL clk:50MHz -> clk1M:1Mhz, clk2k:2kHz
wire clk1M, clk2k;
CLK_PLL pllX1(.inclk0(clk), .c0(clk1M), .c1(clk2k), .areset(~rst), .locked(lxk));
CLK_DIV#(32'd1_000_000) clk1Sp0(clk1M, clk0);
CLK_DIV#(32'd2000) clk1Sp1(clk2k, clk1);

endmodule