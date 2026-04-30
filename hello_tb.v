`timescale 1ns / 1ps
module hello_tb;
    reg clk;
    wire led;
    hello uut (
        .clk(clk),
        .led(led)
    );
    initial clk = 0;
    always #5 clk = ~clk;
    initial begin
        #200;
        $finish;
    end
endmodule