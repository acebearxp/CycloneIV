
`timescale 1ns / 1ps

module main(d, clk, clr, q, tx);

input d, clk, clr;
output q, tx;

wire qn;
wire clk2;

CLK_DIV#(.div(32'd50_000_000)) CLK1S(clk, clk2);
D_FF ffx(~d, tx, ~clr, q);
assign tx = clk2;

endmodule