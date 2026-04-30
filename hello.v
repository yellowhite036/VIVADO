`timescale 1ns / 1ps
module hello(
    input clk,
    output led
);
    reg [3:0] counter = 4'b0;
    always @(posedge clk) begin
        counter <= counter + 1;
    end
    assign led = counter[3];
endmodule