// testbench.v
module testbench;
    parameter N = 8;
    reg [32*N-1:0] a;  // Packed vector for Vector A
    reg [32*N-1:0] b;  // Packed vector for Vector B
    wire [32*N-1:0] c; // Packed vector for Result Vector C

    // Instantiate the elementwise_multiplication module
    elementwise_multiplication #(N) uut (
        .a(a), .b(b), .c(c)
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

        $display("Element-wise Multiplication Result:");
        for (i = 0; i < N; i = i + 1) begin
            $display("c[%0d] = %d", i, c[32*i +: 32]);
        end

        $finish;
    end
endmodule
