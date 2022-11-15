`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2022 06:53:50 PM
// Design Name: 
// Module Name: mysoc_sim
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


module mysoc_sim(

    );
reg resetn;
reg clk;

//goio
wire [15:0] led;
wire [1 :0] led_rg0;
wire [1 :0] led_rg1;
wire [7 :0] num_csn;
wire [6 :0] num_a_g;
wire [7 :0] switch;
wire [3 :0] btn_key_col;
wire [3 :0] btn_key_row;
wire [1 :0] btn_step;
wire UART_RX = 1'b0;
wire UART_TX;
assign switch      = 8'hff;
assign btn_key_row = 4'd0;
assign btn_step    = 2'd3;

initial
begin
    clk = 1'b0;
    resetn = 1'b0;
    #2000;
    resetn = 1'b1;
end
always #5 clk=~clk;
mysoc_top mysoc_top (
    .clk        (clk        ),
    .resetn     (resetn     ),
    .led        (led        ),
    .led_rg0    (led_rg0    ),
    .led_rg1    (led_rg1    ),
    .num_csn    (num_csn    ),
    .num_a_g    (num_a_g    ),
    .num_data   (num_data   ),
    .switch     (switch     ),
    .btn_key_col(btn_key_col),
    .btn_key_row(btn_key_row),
    .btn_step   (btn_step   ),
    .UART_RX    (UART_RX    ),
    .UART_TX    (UART_TX    )
);
endmodule
