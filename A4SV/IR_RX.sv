// 红外接收器
module IR_RX(input logic clk, input logic ir, output logic[3:0] code[2:0]);

logic state;
logic clkIR;
logic clkSample;
logic sample;
logic vx;

logic[7:0] counter;

// 红外采样
SAM8 sampler(.clk(clkIR), .in(ir), .clkout(clkSample), .out(vx));
          
initial begin
    code[2] <= 4'd0;
    code[1] <= 4'd0;
    code[0] <= 4'd0;
end

always_ff@(posedge clkSample) begin
    if(counter == 8'd127) begin
        counter <= 8'd0;
        
        code[2] <= code[2]+1'd1;
    end
    else
        counter <= counter + 1'd1;
end

always_comb begin
    state = (counter == 8'd0) & (~ir) || (counter != 8'd0);
    
    clkIR = (clk & state);
end

endmodule
