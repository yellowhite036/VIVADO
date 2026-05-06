`timescale 1ns / 1ps

module pwm_tb;

    reg clk;
    reg rst;
    reg [3:0] input_val;
    wire pwm_out;

    pwm uut(
        .clk(clk),
        .rst(rst),
        .input_val(input_val),
        .pwm_out(pwm_out)
    );

    // 時脈：週期 10ns
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("pwm_tb.vcd");
        $dumpvars(0, pwm_tb);

        // ---- Reset ----
        rst       = 1;
        input_val = 4'd0;
        @(posedge clk);
        @(posedge clk);
        rst = 0;

        // ---- input=3，Duty Cycle 30% ----
        input_val = 4'd3;
        repeat(40) @(posedge clk);

        // ---- input=5，Duty Cycle 50% ----
        input_val = 4'd5;
        repeat(40) @(posedge clk);

        // ---- input=8，Duty Cycle 80% ----
        input_val = 4'd8;
        repeat(40) @(posedge clk);

        $display("模擬完成");
        $finish;
    end

endmodule