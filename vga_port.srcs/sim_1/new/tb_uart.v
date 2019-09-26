`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2019 02:14:38 PM
// Design Name: 
// Module Name: tb_uart
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


module tb_uart;

reg clk;
reg rst;
reg rx;
wire tx;
wire [7:0] data;
wire stb;

integer k;
integer x;
integer i = 8;

uart uut(clk, rst, rx, tx, data, stb);

    initial begin
        clk = 0;
        rx = 1;
        x = 100;
        rst = 1;
    
        for(k = 0; k < 1000000; k=k+1) begin
            #1 clk = ~clk;
            rst = rst & clk;
           
            if(k == x && i) begin
                i = i - 1;
                rx = ~rx;
                #1 x = x + 20834;
            end
                           
        end
    end


endmodule
