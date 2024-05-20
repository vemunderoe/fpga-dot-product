// elementwise_multiplication.v
module elementwise_multiplication #(parameter N = 8) (
    input [32*N-1:0] a,  // Vector A
    input [32*N-1:0] b,  // Vector B
    output [32*N-1:0] c  // Result Vector C
);

genvar i;

generate
    for (i = 0; i < N; i = i + 1) begin : elementwise_mult
        assign c[32*i +: 32] = a[32*i +: 32] * b[32*i +: 32];
    end
endgenerate

endmodule
