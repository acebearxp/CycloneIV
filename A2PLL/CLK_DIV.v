module CLK_DIV #(parameter div = 32'd50_000_000)(input clk, output clkdiv);

reg [31:0] counter = 32'd1;
reg clkout = 0;

always @ (posedge clk)
begin
    if(counter == div) begin
	    counter <= 32'd1;
		 clkout <= ~clkout;
	 end
	 else
	     counter <= counter + 1'd1;
end

assign clkdiv = clkout;

endmodule
