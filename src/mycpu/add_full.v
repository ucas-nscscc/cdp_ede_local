`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/22 01:40:44
// Design Name: 
// Module Name: add_full
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


module add_full(
    input a,
    input b,
    input cin,
    output cout,
    output s
);
    assign cout = a & b | a & cin | b & cin;
    assign s    = ~a & ~b & cin | ~a & b & ~cin | a & ~b & ~cin | a & b & cin;
endmodule
