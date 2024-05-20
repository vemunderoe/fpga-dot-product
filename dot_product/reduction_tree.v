// reduction_tree.v
module reduction_tree #(parameter N = 8) (
    input [32*N-1:0] in,  // Packed vector of intermediate products
    output reg [31:0] sum // Final dot product result
);

reg [31:0] partial_sum [N-1:0];

integer i;

always @(*) begin
    // Initialize partial sums
    for (i = 0; i < N; i = i + 1) begin
        partial_sum[i] = in[32*i +: 32];
    end

    // Perform reduction in parallel using a tree structure
    for (i = 1; i < N; i = i * 2) begin
        for (integer j = 0; j < N; j = j + 2*i) begin
            if (j + i < N) begin
                partial_sum[j] = partial_sum[j] + partial_sum[j + i];
            end
        end
    end

    sum = partial_sum[0];
end

endmodule
