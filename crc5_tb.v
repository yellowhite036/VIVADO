`timescale 1ns / 1ps
module random_tb;
    reg clk;
    reg rst;
    reg enable;
    wire [1:0] out;

    // 實例化修改後的 random 模組
    random uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .out(out)
    );

    initial clk = 0;
    always #5 clk = ~clk;     // 10ns 週期時脈

    integer i;
    initial begin
        rst = 1;
        enable = 0;
        #20;
        rst = 0;
        #10;

        // 連續產生50筆亂數
        for (i = 0; i < 50; i = i + 1) begin
            enable = 1;
            #10;
        end

        enable = 0;
        #20;
        $finish;
    end
endmodule