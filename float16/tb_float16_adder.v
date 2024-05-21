module testbench;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] result;

    float16_adder uut (
        .a(a),
        .b(b),
        .result(result)
    );

    initial begin
        // Initialize values
        a = 16'b0100001100000000; // 3.5
        b = 16'b0100000100000000; // 2.5
        #10;
        
        // Display result
        $display("Result: %b", result); // Expected: 16'b0100010001000000 (6.0)
        
        // Another test case
        a = 16'b1100001100000000; // -3.5
        b = 16'b0100000100000000; // 2.5
        #10;
        
        // Display result
        $display("Result: %b, %h", result, result); // Expected: 16'b1011111000000000 (-1.0)

        // Finish simulation
        $finish;
    end
endmodule