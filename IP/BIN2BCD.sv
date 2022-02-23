/* BIN2BCD
   BCD码用4bits表示0~9十个数字,而4bits最大表示能力是16个数字,因此弃用过了六个
   算法由满10多跳6个改进
   左移位(相当于x2)前进行比较,如果发现大于或等于5,则在左移前增加3(这样移位后相当于+6)
 */
/*module BIN2BCD#(
            parameter n=3 // 二进制数位宽
        )
        (
            input  logic[n-1:0] bin, // 二进制数
            output logic[???] bcd // BCD码
        );

endmodule*/
