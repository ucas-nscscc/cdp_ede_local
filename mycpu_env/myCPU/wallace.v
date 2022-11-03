`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/09/22 01:17:25
// Design Name: 
// Module Name: wallace
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


module wallace(
    input        mul_clk,
    input        resetn,
    input [31:0] x,
    input [31:0] y,
    input        mul_signed, // signed = 1 means signed number
    output [63:0] result
    );

    wire[65:0] x_w;
    wire [65:0] P [0:16];
    wire [16:0] C;
    reg [15:0] C_from_last;
    wire [3:0] select [0:16];
    wire[34:0] y_w;

    assign x_w = {{34{x[31] & mul_signed}}, x};
    assign y_w = {{2{y[31] & mul_signed}}, y, 1'b0};

    genvar j;
    generate for(j = 0; j < 17; j = j + 1)
        begin: alfor
            assign select[j][0] =  y_w[2*j+2] & ~y_w[2*j+1] & ~y_w[2*j]; //-2
            assign select[j][1] =  y_w[2*j+2] & (y_w[2*j+1] ^ y_w[2*j]); //-1
            assign select[j][2] = ~y_w[2*j+2] & (y_w[2*j+1] ^ y_w[2*j]); //1
            assign select[j][3] = ~y_w[2*j+2] &  y_w[2*j+1] &  y_w[2*j]; //2
            assign P[j] = {64{select[j][0]}} & ~(x_w << (2*j+1))
                        | {64{select[j][1]}} & ~(x_w << (2*j))
                        | {64{select[j][2]}} &  (x_w << (2*j))
                        | {64{select[j][3]}} &  (x_w << (2*j+1));
            assign C[j] = select[j][0] | select[j][1];
        end
    endgenerate

    wire [13:0] midC [0:66];
    wire [65:0] Cresult;
    reg [65:0] C_;
    wire [65:0] Sresult;
    reg [65:0] S_;
    assign midC[0] = C[13:0];

    genvar i;
    generate for(i = 0; i < 66; i = i + 1)
        begin: mdfor
            one_bit_tree u(
                .P({P[16][i], P[15][i], P[14][i], P[13][i], P[12][i], P[11][i], P[10][i], 
                    P[9][i], P[8][i], P[7][i], P[6][i], P[5][i], 
                    P[4][i], P[3][i], P[2][i], P[1][i], P[0][i]}),
                .Cin(midC[i]),
                .Cout(midC[i+1]),
                .C(Cresult[i]),
                .S(Sresult[i])
            );
        end
    endgenerate

    always @(posedge mul_clk) begin
        if(~resetn)begin
            C_ <= 66'b0;
            S_ <= 66'b0;
            C_from_last <= 16'b0;
        end
        else begin
            C_ <= Cresult;
            S_ <= Sresult;
            C_from_last <= C;
        end
    end

    assign result = {C_[62:0], C_from_last[14]} + S_ + C_from_last[15];
endmodule
