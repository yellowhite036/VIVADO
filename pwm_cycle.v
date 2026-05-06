`timescale 1ns / 1ps

module pwm(
    input clk,
    input rst,
    input [3:0] input_val,    // 輸入 1~9，對應 Duty Cycle 10%~90%
    output reg pwm_out
);

// PWM 週期 = 10 格（每格 10%）
// counter 0~9，共 10 拍為一個完整週期
// Duty Cycle = input_val / 10
// 例：input_val=3 → counter < 3 時 HIGH，其餘 LOW

parameter PERIOD = 4'd9;   // counter 從 0 數到 9，共 10 拍

reg [3:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
        pwm_out <= 0;
    end else begin
        if (counter == PERIOD) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end

        // counter < input_val 時輸出 HIGH
        if (counter < input_val)
            pwm_out <= 1;
        else
            pwm_out <= 0;
    end
end

endmodule