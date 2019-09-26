`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2019 02:11:27 PM
// Design Name: 
// Module Name: renderer
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


module renderer(
    input clk,
    input rst,
    input [9:0] x,
    input [8:0] y,
    input [63:0] bmp,
    output reg [11:0] color
    );
    
    wire [5:0] idx;
    assign idx = {y[2:0], x[2:0]}; 
    
    // Given the last 3 bits in the x and y coordinates, we find the pixels in the 8x8 bitmaps.
    always @(posedge clk) begin       
        if(bmp & (1 << idx)) 
            color <= 12'hFFF;
        else
            color <= 12'h000;
    end
    
    
endmodule
