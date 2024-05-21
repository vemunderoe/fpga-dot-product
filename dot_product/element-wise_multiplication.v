// Element-wise multiplication helper module
module elementwise_multiplication #(parameter N = 8) (
    input [32*N-1:0] vector_a,  // Vector A
    input [32*N-1:0] vector_b,  // Vector B
    output [32*N-1:0] result_vector  // Result Vector
);

genvar i;

generate
    for (i = 0; i < N; i = i + 1) begin : elementwise_mult
        assign result_vector[32*i +: 32] = vector_a[32*i +: 32] * vector_b[32*i +: 32];
    end
endgenerate

endmodule
