`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.06.2024 15:10:39
// Design Name: 
// Module Name: PE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PE(
    input wire clk,
    input wire rst,
    input wire [15:0] a_in,  // Input from left
    input wire [15:0] b_in,  // Input from top
    input wire valid_in,     // Input data valid signal
    output reg [15:0] a_out, // Output to right
    output reg [15:0] b_out, // Output to bottom
    output reg [31:0] c_out, // Output result
    output reg valid_out     // Output data valid signal
    );

    reg [15:0] a_reg, b_reg;
    reg [31:0] mul_result, acc_reg;
    reg valid_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            a_reg <= 16'd0;
            b_reg <= 16'd0;
            acc_reg <= 32'd0;
            a_out <= 16'd0;
            b_out <= 16'd0;
            c_out <= 32'd0;
            valid_reg <= 1'b0;
            valid_out <= 1'b0;
        end else begin
            // Input stage
            a_reg <= a_in;
            b_reg <= b_in;
            valid_reg <= valid_in;

            // Multiply stage
            mul_result <= a_reg * b_reg;

            // Accumulate stage
            if (valid_reg)
                acc_reg <= acc_reg + mul_result;
            else
                acc_reg <= mul_result;

            // Output stage
            a_out <= a_reg;
            b_out <= b_reg;
            c_out <= acc_reg;
            valid_out <= valid_reg;
        end
    end
endmodule
