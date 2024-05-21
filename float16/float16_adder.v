module float16_adder (
    input [15:0] a, // First 16-bit floating-point number
    input [15:0] b, // Second 16-bit floating-point number
    output reg [15:0] result // Result of the addition
);
    // Extract sign, exponent, and significand fields
    wire sign_a = a[15];
    wire sign_b = b[15];
    wire [4:0] exp_a = a[14:10];
    wire [4:0] exp_b = b[14:10];
    wire [10:0] sig_a = (exp_a == 0) ? {1'b0, a[9:0]} : {1'b1, a[9:0]}; // Implicit 1 in normalized numbers
    wire [10:0] sig_b = (exp_b == 0) ? {1'b0, b[9:0]} : {1'b1, b[9:0]}; // Implicit 1 in normalized numbers

    // Intermediate variables
    reg [4:0] exp_diff;
    reg [10:0] sig_a_aligned, sig_b_aligned;
    reg [4:0] exp_max;
    reg [11:0] sig_sum;
    reg result_sign;
    reg [4:0] exp_result;
    reg [10:0] sig_result;
    reg [4:0] shift_amount;

    always @* begin
        // Align the significands
        if (exp_a > exp_b) begin
            exp_diff = exp_a - exp_b;
            sig_a_aligned = sig_a;
            sig_b_aligned = sig_b >> exp_diff;
            exp_max = exp_a;
        end else begin
            exp_diff = exp_b - exp_a;
            sig_a_aligned = sig_a >> exp_diff;
            sig_b_aligned = sig_b;
            exp_max = exp_b;
        end

        // Add/subtract significands
        if (sign_a == sign_b) begin
            sig_sum = sig_a_aligned + sig_b_aligned;
            result_sign = sign_a;
        end else begin
            if (sig_a_aligned > sig_b_aligned) begin
                sig_sum = sig_a_aligned - sig_b_aligned;
                result_sign = sign_a;
            end else begin
                sig_sum = sig_b_aligned - sig_a_aligned;
                result_sign = sign_b;
            end
        end

        // Normalize result
        if (sig_sum[11]) begin
            sig_result = sig_sum[11:1];
            exp_result = exp_max + 1;
        end else begin
            sig_result = sig_sum[10:0];
            exp_result = exp_max;
            // Normalize if leading bits are zero
            while (sig_result[10] == 0 && exp_result > 0) begin
                sig_result = sig_result << 1;
                exp_result = exp_result - 1;
            end
        end

        // Handle underflow case
        if (exp_result == 0) begin
            result = 16'b0;
        end else begin
            // Compose final result
            result = {result_sign, exp_result, sig_result[9:0]};
        end
    end
endmodule