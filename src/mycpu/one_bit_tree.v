`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/22 01:33:57
// Design Name: 
// Module Name: one_bit_tree
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


module one_bit_tree(
    input  [16:0] P,
    input  [13:0] Cin,
    output [13:0] Cout,
    output        C,
    output        S
    );

    wire [14:0] mids;
    add_full c0(
        .a(P[0]),
        .b(P[1]),
        .cin(P[2]),
        .cout(Cout[0]),
        .s(mids[0])
    );
    add_full c1(
        .a(P[3]),
        .b(P[4]),
        .cin(P[5]),
        .cout(Cout[1]),
        .s(mids[1])
    );
    add_full c2(
        .a(P[6]),
        .b(P[7]),
        .cin(P[8]),
        .cout(Cout[2]),
        .s(mids[2])
    );
    add_full c3(
        .a(P[9]),
        .b(P[10]),
        .cin(P[11]),
        .cout(Cout[3]),
        .s(mids[3])
    );
    add_full c4(
        .a(P[12]),
        .b(P[13]),
        .cin(P[14]),
        .cout(Cout[4]),
        .s(mids[4])
    );
    add_full c5(
        .a(mids[0]),
        .b(mids[1]),
        .cin(mids[2]),
        .cout(Cout[5]),
        .s(mids[5])
    );
    add_full c6(
        .a(mids[3]),
        .b(mids[4]),
        .cin(P[15]),
        .cout(Cout[6]),
        .s(mids[6])
    );
    add_full c7(
        .a(Cin[0]),
        .b(Cin[1]),
        .cin(Cin[2]),
        .cout(Cout[7]),
        .s(mids[7])
    );
    add_full c8(
        .a(Cin[3]),
        .b(Cin[4]),
        .cin(P[16]),
        .cout(Cout[8]),
        .s(mids[8])
    );
    add_full c9(
        .a(mids[5]),
        .b(mids[6]),
        .cin(mids[7]),
        .cout(Cout[9]),
        .s(mids[9])
    );
    add_full c10(
        .a(mids[8]),
        .b(Cin[5]),
        .cin(Cin[6]),
        .cout(Cout[10]),
        .s(mids[10])
    );
    add_full c11(
        .a(mids[9]),
        .b(mids[10]),
        .cin(Cin[7]),
        .cout(Cout[11]),
        .s(mids[11])
    );
    add_full c12(
        .a(Cin[8]),
        .b(Cin[9]),
        .cin(Cin[10]),
        .cout(Cout[12]),
        .s(mids[12])
    );
    add_full c13(
        .a(mids[11]),
        .b(mids[12]),
        .cin(Cin[11]),
        .cout(Cout[13]),
        .s(mids[13])
    );
    add_full c14(
        .a(mids[13]),
        .b(Cin[12]),
        .cin(Cin[13]),
        .cout(C),
        .s(S)
    );
    
endmodule
