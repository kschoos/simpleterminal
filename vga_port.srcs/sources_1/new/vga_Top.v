`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/23/2019 07:39:00 PM
// Design Name: 
// Module Name: vga_Top
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


module vga_Top(
    input clk,
    input rst,
    input RX,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,  
    output Hsync,
    output Vsync,
    output TX
    );
    
    reg px_stb;
    reg [15:0] cnt;
    wire [9:0] horcnt;
    wire [9:0] vercnt;
    
    wire [7:0] char;
    wire [63:0] bmp;
    
    wire [9:0] x;
    wire [8:0] y;
    
    wire draw;
    wire [7:0] uartdata;
    wire newuartdata;
    
    wire [11:0] pxcolor;
    
    assign vgaRed = draw ? pxcolor[3:0] : 0;
    assign vgaGreen = draw ? pxcolor[7:4] : 0;
    assign vgaBlue = draw ? pxcolor[11:8] : 0;
    
    // Pixel strobe, divides clk by 4.
    // 2^16 / 4 = 2^14 = 0x4000
    always @(posedge clk) begin
        {px_stb, cnt} <= cnt + 16'h4000;
    end
    
    
    vga640x480 vga(
        .clk(clk),
        .rst(rst),
        .px_stb(px_stb),
        .hsync(Hsync),
        .vsync(Vsync),
        .horcnt(horcnt),
        .vercnt(vercnt),
        .x(x),
        .y(y),
        .draw(draw)
    );
    
    charToBmp ctb(
        .clk(clk),
        .rst(rst),
        .char(char),
        .bmp(bmp)     
    );
    
    
    charBuffer cb(
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y),
        .char(char),
        .datain(uartdata),
        .we(newuartdata)
    );
    
    renderer rdr(
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y),
        .bmp(bmp),
        .color(pxcolor)
    );
    
    uart txrx(
        .clk(clk),
        .rst(rst),
        .tx(TX),
        .rx(RX),
        .data(uartdata),
        .newdata(newuartdata)
    );
    
    // 800, 525
    
endmodule
