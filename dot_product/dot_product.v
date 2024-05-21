// Dot product module
module dot_product #(parameter N = 8) (
    input [32*N-1:0] vector_a,  // Packed vector for Vector A
    input [32*N-1:0] vector_b,  // Packed vector for Vector B
    output [31:0] result // Dot product result
);

wire [32*N-1:0] products;

elementwise_multiplication #(N) elem_mult (
    .vector_a(vector_a),
    .vector_b(vector_b),
    .result_vector(products)
);

reduction_tree #(N) red_tree (
    .in(products),
    .sum(result)
);

endmodule
