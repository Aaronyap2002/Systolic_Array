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
    input wire clk_in,rst,
    input wire [DATA_WIDTH-1:0] a1,a9,a17,a25,a33,a41,a49,a57, // Inputs from left
    input wire [DATA_WIDTH-1:0] b1,b2,b3,b4,b5,b6,b7,b8, // Inputs from top
    output wire [2*DATA_WIDTH:0]    c1,c2,c3,c4,c5,c6,c7,c8,
                                    c9,c10,c11,c12,c13,c14,c15,c16,
                                    c17,c18,c19,c20,c21,c22,c23,c24,
                                    c25,c26,c27,c28,c29,c30,c31,c32,
                                    c33,c34,c35,c36,c37,c38,c39,c40,
                                    c41,c42,c43,c44,c45,c46,c47,c48,
                                    c49,c50,c51,c52,c53,c54,c55,c56,
                                    c57,c58,c59,c60,c61,c62,c63,c64,
    output wire [DATA_WIDTH-1:0] a8,a16,a24,a32,a40,a48,a56,a64, // Output from left
    output wire [DATA_WIDTH-1:0] b57,b58,b59,b60,b61,b62,b63,b64 // Output from top
    );
    wire clk;   
    // Instantiate an input buffer
    IBUF clk_ibuf_inst (.I(clk_in), .O(clk));

    // Instantiate PEs wires for horizontal connections
    wire [DATA_WIDTH-1:0]   a1_2,a2_3,a3_4,a4_5,a5_6,a6_7,a7_8,
                            a9_10,a10_11,a11_a12,a12_13,a13_14,a14_15,a15_16,
                            a17_18,a18_19,a19_20,a20_21,a21_22,a22_23,a23_24,
                            a25_26,a26_27,a27_28,a28_29,a29_30,a30_31,a31_32,
                            a33_34,a34_35,a35_36,a36_37,a37_38,a38_39,a39_40,
                            a41_42,a42_43,a43_44,a44_45,a45_46,a46_47,a47_48,
                            a49_50,a50_51,a51_52,a52_53,a53_54,a54_55,a55_56,
                            a57_58,a58_59,a59_60,a60_61,a61_62,a62_63,a63_64;

    // Instantiate PEs wires for vertical connections
    wire [DATA_WIDTH-1:0]   b1_9,b2_10,b3_11,b4_12,b5_13,b6_14,b7_15,b8_16,
                            b9_17,b10_18,b11_19,b12_20,b13_21,b14_22,b15_23,b16_24,
                            b17_25,b18_26,b19_27,b20_28,b21_29,b22_30,b23_31,b24_32,
                            b25_33,b26_34,b27_35,b28_36,b29_37,b30_38,b31_39,b32_40,
                            b33_41,b34_42,b35_43,b36_44,b37_45,b38_46,b39_47,b40_48,
                            b41_49,b42_50,b43_51,b44_52,b45_53,b46_54,b47_55,b48_56,
                            b49_57,b50_58,b51_59,b52_60,b53_61,b54_62,b55_63,b56_64;

    PE pe1 (.clk(clk),.rst(rst),.a_in(a1),.b_in(b1),.a_out(a1_2),.b_out(b1_9),.c_out(c1));
    PE pe2 (.clk(clk),.rst(rst),.a_in(a1_2),.b_in(b2),.a_out(a2_3),.b_out(b2_10),.c_out(c2));
    PE pe3 (.clk(clk),.rst(rst),.a_in(a2_3),.b_in(b3),.a_out(a3_4),.b_out(b3_11),.c_out(c3));
    PE pe4 (.clk(clk),.rst(rst),.a_in(a3_4),.b_in(b4),.a_out(a4_5),.b_out(b4_12),.c_out(c4));
    PE pe5 (.clk(clk),.rst(rst),.a_in(a4_5),.b_in(b5),.a_out(a5_6),.b_out(b5_13),.c_out(c5));
    PE pe6 (.clk(clk),.rst(rst),.a_in(a5_6),.b_in(b6),.a_out(a6_7),.b_out(b6_14),.c_out(c6));
    PE pe7 (.clk(clk),.rst(rst),.a_in(a6_7),.b_in(b7),.a_out(a7_8),.b_out(b7_15),.c_out(c7));
    PE pe8 (.clk(clk),.rst(rst),.a_in(a7_8),.b_in(b8),.a_out(a8),.b_out(b8_16),.c_out(c8));

    PE pe9 (.clk(clk),.rst(rst),.a_in(a9),.b_in(b1_9),.a_out(a9_10),.b_out(b9_17),.c_out(c9));
    PE pe10 (.clk(clk),.rst(rst),.a_in(a9_10),.b_in(b2_10),.a_out(a10_11),.b_out(b10_18),.c_out(c10));
    PE pe11 (.clk(clk),.rst(rst),.a_in(a10_11),.b_in(b3_11),.a_out(a11_a12),.b_out(b11_19),.c_out(c11));
    PE pe12 (.clk(clk),.rst(rst),.a_in(a11_a12),.b_in(b4_12),.a_out(a12_13),.b_out(b12_20),.c_out(c12));
    PE pe13 (.clk(clk),.rst(rst),.a_in(a12_13),.b_in(b5_13),.a_out(a13_14),.b_out(b13_21),.c_out(c13));
    PE pe14 (.clk(clk),.rst(rst),.a_in(a13_14),.b_in(b6_14),.a_out(a14_15),.b_out(b14_22),.c_out(c14)); 
    PE pe15 (.clk(clk),.rst(rst),.a_in(a14_15),.b_in(b7_15),.a_out(a15_16),.b_out(b15_23),.c_out(c15));
    PE pe16 (.clk(clk),.rst(rst),.a_in(a15_16),.b_in(b8_16),.a_out(a16),.b_out(b16_24),.c_out(c16));

    PE pe17 (.clk(clk),.rst(rst),.a_in(a17),.b_in(b9_17),.a_out(a17_18),.b_out(b17_25),.c_out(c17));
    PE pe18 (.clk(clk),.rst(rst),.a_in(a17_18),.b_in(b10_18),.a_out(a18_19),.b_out(b18_26),.c_out(c18));
    PE pe19 (.clk(clk),.rst(rst),.a_in(a18_19),.b_in(b11_19),.a_out(a19_20),.b_out(b19_27),.c_out(c19));
    PE pe20 (.clk(clk),.rst(rst),.a_in(a19_20),.b_in(b12_20),.a_out(a20_21),.b_out(b20_28),.c_out(c20));
    PE pe21 (.clk(clk),.rst(rst),.a_in(a20_21),.b_in(b13_21),.a_out(a21_22),.b_out(b21_29),.c_out(c21));
    PE pe22 (.clk(clk),.rst(rst),.a_in(a21_22),.b_in(b14_22),.a_out(a22_23),.b_out(b22_30),.c_out(c22));
    PE pe23 (.clk(clk),.rst(rst),.a_in(a22_23),.b_in(b15_23),.a_out(a23_24),.b_out(b23_31),.c_out(c23));
    PE pe24 (.clk(clk),.rst(rst),.a_in(a23_24),.b_in(b16_24),.a_out(a24),.b_out(b24_32),.c_out(c24));

    PE pe25 (.clk(clk),.rst(rst),.a_in(a25),.b_in(b17_25),.a_out(a25_26),.b_out(b25_33),.c_out(c25));
    PE pe26 (.clk(clk),.rst(rst),.a_in(a25_26),.b_in(b18_26),.a_out(a26_27),.b_out(b26_34),.c_out(c26));
    PE pe27 (.clk(clk),.rst(rst),.a_in(a26_27),.b_in(b19_27),.a_out(a27_28),.b_out(b27_35),.c_out(c27));
    PE pe28 (.clk(clk),.rst(rst),.a_in(a27_28),.b_in(b20_28),.a_out(a28_29),.b_out(b28_36),.c_out(c28));
    PE pe29 (.clk(clk),.rst(rst),.a_in(a28_29),.b_in(b21_29),.a_out(a29_30),.b_out(b29_37),.c_out(c29));
    PE pe30 (.clk(clk),.rst(rst),.a_in(a29_30),.b_in(b22_30),.a_out(a30_31),.b_out(b30_38),.c_out(c30));
    PE pe31 (.clk(clk),.rst(rst),.a_in(a30_31),.b_in(b23_31),.a_out(a31_32),.b_out(b31_39),.c_out(c31));
    PE pe32 (.clk(clk),.rst(rst),.a_in(a31_32),.b_in(b24_32),.a_out(a32),.b_out(b32_40),.c_out(c32));

    PE pe33 (.clk(clk),.rst(rst),.a_in(a33),.b_in(b25_33),.a_out(a33_34),.b_out(b33_41),.c_out(c33));
    PE pe34 (.clk(clk),.rst(rst),.a_in(a33_34),.b_in(b26_34),.a_out(a34_35),.b_out(b34_42),.c_out(c34));
    PE pe35 (.clk(clk),.rst(rst),.a_in(a34_35),.b_in(b27_35),.a_out(a35_36),.b_out(b35_43),.c_out(c35));
    PE pe36 (.clk(clk),.rst(rst),.a_in(a35_36),.b_in(b28_36),.a_out(a36_37),.b_out(b36_44),.c_out(c36));
    PE pe37 (.clk(clk),.rst(rst),.a_in(a36_37),.b_in(b29_37),.a_out(a37_38),.b_out(b37_45),.c_out(c37));
    PE pe38 (.clk(clk),.rst(rst),.a_in(a37_38),.b_in(b30_38),.a_out(a38_39),.b_out(b38_46),.c_out(c38));
    PE pe39 (.clk(clk),.rst(rst),.a_in(a38_39),.b_in(b31_39),.a_out(a39_40),.b_out(b39_47),.c_out(c39));
    PE pe40 (.clk(clk),.rst(rst),.a_in(a39_40),.b_in(b32_40),.a_out(a40),.b_out(b40_48),.c_out(c40));

    PE pe41 (.clk(clk),.rst(rst),.a_in(a41),.b_in(b33_41),.a_out(a41_42),.b_out(b41_49),.c_out(c41));
    PE pe42 (.clk(clk),.rst(rst),.a_in(a41_42),.b_in(b34_42),.a_out(a42_43),.b_out(b42_50),.c_out(c42));
    PE pe43 (.clk(clk),.rst(rst),.a_in(a42_43),.b_in(b35_43),.a_out(a43_44),.b_out(b43_51),.c_out(c43));
    PE pe44 (.clk(clk),.rst(rst),.a_in(a43_44),.b_in(b36_44),.a_out(a44_45),.b_out(b44_52),.c_out(c44));
    PE pe45 (.clk(clk),.rst(rst),.a_in(a44_45),.b_in(b37_45),.a_out(a45_46),.b_out(b45_53),.c_out(c45));
    PE pe46 (.clk(clk),.rst(rst),.a_in(a45_46),.b_in(b38_46),.a_out(a46_47),.b_out(b46_54),.c_out(c46));
    PE pe47 (.clk(clk),.rst(rst),.a_in(a46_47),.b_in(b39_47),.a_out(a47_48),.b_out(b47_55),.c_out(c47));
    PE pe48 (.clk(clk),.rst(rst),.a_in(a47_48),.b_in(b40_48),.a_out(a48),.b_out(b48_56),.c_out(c48));

    PE pe49 (.clk(clk),.rst(rst),.a_in(a49),.b_in(b41_49),.a_out(a49_50),.b_out(b49_57),.c_out(c49));
    PE pe50 (.clk(clk),.rst(rst),.a_in(a49_50),.b_in(b42_50),.a_out(a50_51),.b_out(b50_58),.c_out(c50));
    PE pe51 (.clk(clk),.rst(rst),.a_in(a50_51),.b_in(b43_51),.a_out(a51_52),.b_out(b51_59),.c_out(c51));
    PE pe52 (.clk(clk),.rst(rst),.a_in(a51_52),.b_in(b44_52),.a_out(a52_53),.b_out(b52_60),.c_out(c52));
    PE pe53 (.clk(clk),.rst(rst),.a_in(a52_53),.b_in(b45_53),.a_out(a53_54),.b_out(b53_61),.c_out(c53));
    PE pe54 (.clk(clk),.rst(rst),.a_in(a53_54),.b_in(b46_54),.a_out(a54_55),.b_out(b54_62),.c_out(c54));
    PE pe55 (.clk(clk),.rst(rst),.a_in(a54_55),.b_in(b47_55),.a_out(a55_56),.b_out(b55_63),.c_out(c55));
    PE pe56 (.clk(clk),.rst(rst),.a_in(a55_56),.b_in(b48_56),.a_out(a56),.b_out(b56_64),.c_out(c56));

    PE pe57 (.clk(clk),.rst(rst),.a_in(a57),.b_in(b49_57),.a_out(a57_58),.b_out(b57),.c_out(c57));
    PE pe58 (.clk(clk),.rst(rst),.a_in(a57_58),.b_in(b50_58),.a_out(a58_59),.b_out(b58),.c_out(c58));
    PE pe59 (.clk(clk),.rst(rst),.a_in(a58_59),.b_in(b51_59),.a_out(a59_60),.b_out(b59),.c_out(c59));
    PE pe60 (.clk(clk),.rst(rst),.a_in(a59_60),.b_in(b52_60),.a_out(a60_61),.b_out(b60),.c_out(c60));
    PE pe61 (.clk(clk),.rst(rst),.a_in(a60_61),.b_in(b53_61),.a_out(a61_62),.b_out(b61),.c_out(c61));
    PE pe62 (.clk(clk),.rst(rst),.a_in(a61_62),.b_in(b54_62),.a_out(a62_63),.b_out(b62),.c_out(c62));
    PE pe63 (.clk(clk),.rst(rst),.a_in(a62_63),.b_in(b55_63),.a_out(a63_64),.b_out(b63),.c_out(c63));
    PE pe64 (.clk(clk),.rst(rst),.a_in(a63_64),.b_in(b56_64),.a_out(a64),.b_out(b64),.c_out(c64));
endmodule
