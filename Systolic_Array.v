`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.07.2024 16:09:34
// Design Name: 
// Module Name: Systolic_Array
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: PE.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Systolic_Array #(
    parameter DATA_WIDTH = 8,
    parameter ARRAY_SIZE = 8
)(
    input wire clk_in, rst,
    input wire [DATA_WIDTH-1:0] a1, a9, a17, a25, a33, a41, a49, a57,  // Inputs from left
    input wire [DATA_WIDTH-1:0] b1, b2, b3, b4, b5, b6, b7, b8,  // Inputs from top
    output wire [2*DATA_WIDTH:0] c1, c2, c3, c4, c5, c6, c7, c8,
                                 c9, c10, c11, c12, c13, c14, c15, c16,
                                 c17, c18, c19, c20, c21, c22, c23, c24,
                                 c25, c26, c27, c28, c29, c30, c31, c32,
                                 c33, c34, c35, c36, c37, c38, c39, c40,
                                 c41, c42, c43, c44, c45, c46, c47, c48,
                                 c49, c50, c51, c52, c53, c54, c55, c56,
                                 c57, c58, c59, c60, c61, c62, c63, c64,
    output wire [DATA_WIDTH-1:0] a8, a16, a24, a32, a40, a48, a56, a64,  // Output from left
    output wire [DATA_WIDTH-1:0] b57, b58, b59, b60, b61, b62, b63, b64  // Output from top
);

    wire clk;
    IBUF clk_ibuf_inst (.I(clk_in), .O(clk));

    // Internal wires for PE connections
    wire [DATA_WIDTH-1:0] a_internal [ARRAY_SIZE-1:0][ARRAY_SIZE:0];
    wire [DATA_WIDTH-1:0] b_internal [ARRAY_SIZE:0][ARRAY_SIZE-1:0];
    wire [2*DATA_WIDTH:0] c_internal [ARRAY_SIZE-1:0][ARRAY_SIZE-1:0];

    // Generate the PE array
    genvar i, j;
    generate
        for (i = 0; i < ARRAY_SIZE; i = i + 1) begin : gen_row
            for (j = 0; j < ARRAY_SIZE; j = j + 1) begin : gen_col
                PE #(
                    .DATA_WIDTH(DATA_WIDTH)
                ) pe_inst (
                    .clk(clk),
                    .rst(rst),
                    .a_in(a_internal[i][j]),
                    .b_in(b_internal[i][j]),
                    .a_out(a_internal[i][j+1]),
                    .b_out(b_internal[i+1][j]),
                    .c_out(c_internal[i][j])
                );
            end
        end
    endgenerate

    // Connect input a to the first column of a_internal
    assign a_internal[0][0] = a1;
    assign a_internal[1][0] = a9;
    assign a_internal[2][0] = a17;
    assign a_internal[3][0] = a25;
    assign a_internal[4][0] = a33;
    assign a_internal[5][0] = a41;
    assign a_internal[6][0] = a49;
    assign a_internal[7][0] = a57;

    // Connect input b to the first row of b_internal
    assign b_internal[0][0] = b1;
    assign b_internal[0][1] = b2;
    assign b_internal[0][2] = b3;
    assign b_internal[0][3] = b4;
    assign b_internal[0][4] = b5;
    assign b_internal[0][5] = b6;
    assign b_internal[0][6] = b7;
    assign b_internal[0][7] = b8;

    // Connect the last column of a_internal to a_out
    assign a8 = a_internal[0][ARRAY_SIZE];
    assign a16 = a_internal[1][ARRAY_SIZE];
    assign a24 = a_internal[2][ARRAY_SIZE];
    assign a32 = a_internal[3][ARRAY_SIZE];
    assign a40 = a_internal[4][ARRAY_SIZE];
    assign a48 = a_internal[5][ARRAY_SIZE];
    assign a56 = a_internal[6][ARRAY_SIZE];
    assign a64 = a_internal[7][ARRAY_SIZE];

    // Connect the last row of b_internal to b_out
    assign b57 = b_internal[ARRAY_SIZE][0];
    assign b58 = b_internal[ARRAY_SIZE][1];
    assign b59 = b_internal[ARRAY_SIZE][2];
    assign b60 = b_internal[ARRAY_SIZE][3];
    assign b61 = b_internal[ARRAY_SIZE][4];
    assign b62 = b_internal[ARRAY_SIZE][5];
    assign b63 = b_internal[ARRAY_SIZE][6];
    assign b64 = b_internal[ARRAY_SIZE][7];


// Connect c_internal to output c
    assign c1 = c_internal[0][0];
    assign c2 = c_internal[0][1];
    assign c3 = c_internal[0][2];
    assign c4 = c_internal[0][3];
    assign c5 = c_internal[0][4];
    assign c6 = c_internal[0][5];
    assign c7 = c_internal[0][6];
    assign c8 = c_internal[0][7];
    
    assign c9 = c_internal[1][0];
    assign c10 = c_internal[1][1];
    assign c11 = c_internal[1][2];
    assign c12 = c_internal[1][3];
    assign c13 = c_internal[1][4];
    assign c14 = c_internal[1][5];
    assign c15 = c_internal[1][6];
    assign c16 = c_internal[1][7];
    
    assign c17 = c_internal[2][0];
    assign c18 = c_internal[2][1];
    assign c19 = c_internal[2][2];
    assign c20 = c_internal[2][3];
    assign c21 = c_internal[2][4];
    assign c22 = c_internal[2][5];
    assign c23 = c_internal[2][6];
    assign c24 = c_internal[2][7];
    
    assign c25 = c_internal[3][0];
    assign c26 = c_internal[3][1];
    assign c27 = c_internal[3][2];
    assign c28 = c_internal[3][3];
    assign c29 = c_internal[3][4];
    assign c30 = c_internal[3][5];
    assign c31 = c_internal[3][6];
    assign c32 = c_internal[3][7];
    
    assign c33 = c_internal[4][0];
    assign c34 = c_internal[4][1];
    assign c35 = c_internal[4][2];
    assign c36 = c_internal[4][3];
    assign c37 = c_internal[4][4];
    assign c38 = c_internal[4][5];
    assign c39 = c_internal[4][6];
    assign c40 = c_internal[4][7];
    
    assign c41 = c_internal[5][0];
    assign c42 = c_internal[5][1];
    assign c43 = c_internal[5][2];
    assign c44 = c_internal[5][3];
    assign c45 = c_internal[5][4];
    assign c46 = c_internal[5][5];
    assign c47 = c_internal[5][6];
    assign c48 = c_internal[5][7];
    
    assign c49 = c_internal[6][0];
    assign c50 = c_internal[6][1];
    assign c51 = c_internal[6][2];
    assign c52 = c_internal[6][3];
    assign c53 = c_internal[6][4];
    assign c54 = c_internal[6][5];
    assign c55 = c_internal[6][6];
    assign c56 = c_internal[6][7];
    
    assign c57 = c_internal[7][0];
    assign c58 = c_internal[7][1];
    assign c59 = c_internal[7][2];
    assign c60 = c_internal[7][3];
    assign c61 = c_internal[7][4];
    assign c62 = c_internal[7][5];
    assign c63 = c_internal[7][6];
    assign c64 = c_internal[7][7];
endmodule
