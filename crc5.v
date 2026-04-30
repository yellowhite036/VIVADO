`timescale 1ns / 1ps

// 模組名稱：crc5_random
// 功能：使用 CRC-5 結構，data_in 固定為1，輸出限制為 0~3
module crc5_random(
    input clk,
    input rst,
    input enable,           // 輸入1時才更新
    output reg [1:0] out    // 只輸出 0~3
);

    reg [4:0] lfsr;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr <= 5'b00000;   // CRC 初始值通常設 0*
            out  <= 2'b00;
        end
        else if (enable) begin
            wire feedback = 1'b1 ^ lfsr[4];   // data_in 永遠為 1

            // CRC-5 更新 (x^5 + x^2 + 1)
            lfsr[0] <= feedback;
            lfsr[1] <= lfsr[0] ^ feedback;    // x^2 位置
            lfsr[2] <= lfsr[1];
            lfsr[3] <= lfsr[2];
            lfsr[4] <= lfsr[3];

            // 只取低兩位作為輸出 (0~3)
            out <= {lfsr[1] ^ feedback, feedback};   // 使用更新後的值
        end
    end

endmodule