// dot_product.v
module dot_product #(parameter N = 8) (
    input [32*N-1:0] a,  // Packed vector for Vector A
    input [32*N-1:0] b,  // Packed vector for Vector B
    output [31:0] result // Dot product result
);

wire [32*N-1:0] products;

elementwise_multiplication #(N) elem_mult (
    .a(a),
    .b(b),
    .c(products)
);

reduction_tree #(N) red_tree (
    .in(products),
    .sum(result)
);

endmodule
