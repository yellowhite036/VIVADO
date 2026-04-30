`timescale 1ns / 1ps
module traffic_tb;
    reg clk;
    reg rst;
    wire [1:0] light;

    traffic uut (
        .clk(clk),
        .rst(rst),
        .light(light)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1;
        #20;
        rst = 0;
        #1000;
        $finish;
    end
endmodule