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


(* use_dsp = "yes" *)
module PE #(
    parameter DATA_WIDTH = 8
    )(
    input wire clk,rst,
    input wire [DATA_WIDTH-1:0] a_in,  // Input from left
    input wire [DATA_WIDTH-1:0] b_in,  // Input from top
    output reg [DATA_WIDTH-1:0] a_out, // Output to right
    output reg [DATA_WIDTH-1:0] b_out, // Output to bottom
    output reg [2*DATA_WIDTH:0] c_out // Output result
    );

    always @(posedge clk) begin
        if (rst) begin
            a_out <= 0;
            b_out <= 0;
            c_out <= 0;
        end
        else begin
            c_out <= c_out + a_in*b_in;
            a_out <= a_in;
            b_out <= b_in;
        end
    end
endmodule
