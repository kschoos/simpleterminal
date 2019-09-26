`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2019 11:04:07 AM
// Design Name: 
// Module Name: vga640x480
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


module vga640x480(
    input clk,
    input rst,
    input px_stb,
    output hsync,
    output vsync,
    output reg [9:0] horcnt,
    output reg [9:0] vercnt,
    output reg [9:0] x,
    output reg [8:0] y,
    output draw
    );
    
    parameter H_FRONTPORCH = 16;
    parameter H_BACKPORCH = 48;
    parameter H_SYNCPULSE = 96;
    
    parameter V_FRONTPORCH = 11;
    parameter V_BACKPORCH = 33;
    parameter V_SYNCPULSE = 2;
    
    parameter WIDTH = 800;
    parameter HEIGHT = 525;
    
    parameter PIXEL_WIDTH = 640;
    parameter PIXEL_HEIGHT = 480;
        
    assign vsync = vercnt >= 2;
    assign hsync = horcnt >= 96;
    
    
    assign draw = ((horcnt >= H_SYNCPULSE + H_BACKPORCH) & (horcnt < WIDTH - H_FRONTPORCH)) & ((vercnt >= V_SYNCPULSE + V_BACKPORCH) & (vercnt < HEIGHT - V_FRONTPORCH));
    
    // Logic for creating the VGA signal
    
    always @(posedge clk) begin
        if (rst) begin
            horcnt <= 0;
            vercnt <= 0;
            x <= 0;
            y <= 0;
        end
        else begin
            if (px_stb) begin             
                if(draw) begin
                    if(x == PIXEL_WIDTH - 1) begin
                        x <= 0;
                        y <= y + 1;
                    end
                    else begin
                        x <= x + 1;
                    end
                    
                    if(y == PIXEL_HEIGHT - 1)
                        y <= 0;
                end
            
                if (horcnt == WIDTH) begin
                    horcnt <= 0;
                    vercnt <= vercnt + 1;
                end
                else begin
                    horcnt <= horcnt + 1;
                end
                
                if (vercnt == HEIGHT) begin
                    vercnt <= 0;
                    x <= 0;
                    y <= 0;
                end
            end
        end
    end 
    
endmodule
