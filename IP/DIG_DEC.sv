// 数字0~9解码8段数管
module DIG_DEC(input logic[3:0] dig, input logic dot, output logic[7:0] seg);

logic[7:0] seg2;

always_comb
case(dig)
	4'd0: seg2 <= ~8'b0011_1111;
	4'd1: seg2 <= ~8'b0000_0110;
	4'd2: seg2 <= ~8'b0101_1011;
	4'd3: seg2 <= ~8'b0100_1111;
	4'd4: seg2 <= ~8'b0110_0110;
	4'd5: seg2 <= ~8'b0110_1101;
	4'd6: seg2 <= ~8'b0111_1101;
	4'd7: seg2 <= ~8'b0000_0111;
	4'd8: seg2 <= ~8'b0111_1111;
	4'd9: seg2 <= ~8'b0110_1111;
	default:
		seg2 <= ~8'b0000_0000;
endcase

assign seg = {~dot, seg2[6:0]};

endmodule
