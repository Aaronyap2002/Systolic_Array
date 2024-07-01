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
    parameter DATA_WIDTH = 8
    )(
    input wire clk,rst,
    input wire [DATA_WIDTH-1:0] a1,a2,a3,b1,b2,b3,
    output wire [2*DATA_WIDTH:0] c1,c2,c3,c4,c5,c6,c7,c8,c9
    );
    wire [DATA_WIDTH-1:0] a12,a23,a45,a56,a78,a89,b14,b25,b36,b47,b58,b69;

    PE pe1 (.clk(clk),.rst(rst),.a_in(a1),.b_in(b1),.a_out(a12),.b_out(b14),.c_out(c1));
    PE pe2 (.clk(clk),.rst(rst),.a_in(a12),.b_in(b2),.a_out(a23),.b_out(b25),.c_out(c2));
    PE pe3 (.clk(clk),.rst(rst),.a_in(a23),.b_in(b3),.a_out(),.b_out(b36),.c_out(c3));
    PE pe4 (.clk(clk),.rst(rst),.a_in(a2),.b_in(b14),.a_out(a45),.b_out(b47),.c_out(c4));
    PE pe5 (.clk(clk),.rst(rst),.a_in(a45),.b_in(b25),.a_out(a56),.b_out(b58),.c_out(c5));
    PE pe6 (.clk(clk),.rst(rst),.a_in(a56),.b_in(b36),.a_out(),.b_out(b69),.c_out(c6));
    PE pe7 (.clk(clk),.rst(rst),.a_in(a3),.b_in(b47),.a_out(a78),.b_out(),.c_out(c7));
    PE pe8 (.clk(clk),.rst(rst),.a_in(a78),.b_in(b58),.a_out(a89),.b_out(),.c_out(c8));
    PE pe9 (.clk(clk),.rst(rst),.a_in(a89),.b_in(b69),.a_out(),.b_out(),.c_out(c9));
endmodule
