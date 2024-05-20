// testbench_dot_product.v
module testbench;
    parameter N = 8;
    reg [32*N-1:0] a;  // Packed vector for Vector A
    reg [32*N-1:0] b;  // Packed vector for Vector B
    wire [31:0] result; // Dot product result

    // Instantiate the dot_product module
    dot_product #(N) uut (
        .a(a), .b(b), .result(result)
    );

    integer i;

    initial begin
        // Initialize test vectors
        for (i = 0; i < N; i = i + 1) begin
            a[32*i +: 32] = i + 1;
            b[32*i +: 32] = (i + 1) * 2;
        end

        #10;

        $display("Vector A:");
        for (i = 0; i < N; i = i + 1) begin
            $display("a[%0d] = %d", i, a[32*i +: 32]);
        end

        $display("Vector B:");
        for (i = 0; i < N; i = i + 1) begin
            $display("b[%0d] = %d", i, b[32*i +: 32]);
        end

        #1;

        $display("Dot Product Result: %d", result);

        $finish;
    end
endmodule
