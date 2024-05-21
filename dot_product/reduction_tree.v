// Reduction tree helper module
module reduction_tree #(parameter N = 8) (
    input [32*N-1:0] in,  // Packed vector of intermediate products
    output reg [31:0] sum // Final dot product result
);

reg [31:0] partial_sum [N-1:0];

// Function to calculate the number of reduction stages
function integer log2;
    input integer value;
    integer result;
    begin
        result = 0;
        while (value > 1) begin
            value = value >> 1;
            result = result + 1;
        end
        log2 = result;
    end
endfunction

localparam STAGES = log2(N);

integer i, j;

always @(*) begin
    // Initialize partial sums
    for (i = 0; i < N; i = i + 1) begin
        partial_sum[i] = in[32*i +: 32];
    end

    // Perform reduction in stages
    for (i = 0; i < STAGES; i = i + 1) begin
        for (j = 0; j < N; j = j + (2**(i+1))) begin
            if (j + (2**i) < N) begin
                partial_sum[j] = partial_sum[j] + partial_sum[j + (2**i)];
            end
        end
    end

    sum = partial_sum[0];
end

endmodule
