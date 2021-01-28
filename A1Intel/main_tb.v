`timescale 1ns/1ps

module main_tb;

reg x1, x2;
wire y1, y2;

main UUT(.out1(y1), .out2(y2), .in1(x1), .in2(x2));

initial begin
	x1 = 0;
	x2 = 0;

	// wait 100ns
	#100;
	
	x1 = 1;
	x2 = 0;
	
	#100;
	
	x1 = 0;
	x2 = 0;
	
	#100;
	
	x1 = 0;
	x2 = 1;
	
	#100;
	
	x1 = 0;
	x2 = 0;
	
	# 100;
end

initial begin
    $display("\tx1 \tx2 \ty1 \ty2");
	 $monitor("\t%b \t%b \t%b \t%b", x1, x2, y1, y2);
end

endmodule