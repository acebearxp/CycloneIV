`timescale 1ns/1ps

module main_tb;

reg clk50M, kSet, kReset;
wire outA, outT, outR;

main UUT(.clk50M(clk50M), .kSR(kSet), .rst(kReset), .ledCLK(outA), .ledLatch(outT), .ledFF(outR));

initial begin
	clk50M = 0;
	kSet = 0;
	kReset = 0;

	// wait 100ns
	#100;
end

initial begin
    $display("\tclk1S \tkSet \tkReset \tLatch \tFF");
	 $monitor("\t%b \t%b \t%b \t%b \t%b \t%b", outA, kSet, kReset, outT, outR);
end

endmodule