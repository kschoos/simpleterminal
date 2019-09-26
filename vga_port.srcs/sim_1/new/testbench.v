`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2019 01:33:20 PM
// Design Name: 
// Module Name: testbench
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


module testbench;

// ipts
reg clk = 0;
reg [11:0] sw = 0;
reg btnC = 0;
reg RX = 0;

// opts
wire [3:0] vgaRed;
wire [3:0] vgaGreen;
wire [3:0] vgaBlue; 
wire Hsync;
wire Vsync;
wire [7:0] JC;
wire TX;
wire RX_out;
wire stb;

vga_Top uut(
    clk,
    sw,
    btnC,
    RX,
    vgaRed,
    vgaGreen,
    vgaBlue,  
    Hsync,
    Vsync,
    JC,
    TX,
    RX_out,
    stb
);

integer k = 0;
initial begin 
    for (k=0; k<1000000; k=k+1) begin
        #20 clk = ~clk;
    end
    
    $finish;
end

endmodule
