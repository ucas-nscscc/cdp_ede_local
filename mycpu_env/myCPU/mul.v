module mul (
    input  [32:0] mul_src1  ,
    input  [32:0] mul_src2  ,
    output [63:0] mul_result
);

    assign mul_result = $signed(mul_src1) * $signed(mul_src2);

endmodule