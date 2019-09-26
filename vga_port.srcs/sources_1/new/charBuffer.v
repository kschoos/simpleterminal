`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2019 01:52:30 PM
// Design Name: 
// Module Name: charBuffer
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


module charBuffer(
    input clk,
    input rst,
    input [9:0] x,
    input [8:0] y,
    input [7:0] datain,
    input we,
    output [7:0] char
    );
    
    wire [6:0] x_ind;
    wire [5:0] y_ind;
    wire [12:0] ind;
    wire en;
    
    reg [12:0] writeindex;
    reg [9:0]  writeindexcalc;
    reg [5:0] overlines;
    
    
    assign x_ind = x[9:3];
    assign y_ind = y[8:3];
    
    assign ind = we ? writeindex : y_ind * 128 + x_ind;
    assign en = 1;
    
    // The RAM is larger than it needs to (128 bytes per row instead of 80) in order to do fast modulo operation
    // Could this be solved differently?
    
    always @(posedge clk) begin
        if(rst) begin
            writeindex <= 0;
        end
        else begin
            if(we) begin
                if(datain != 10)
                    writeindex <= writeindex + 1;
                else
                    // Here we add a line and remove the modulo_128 part
                    writeindex <= writeindex + 128 - (writeindex & 7'h7F);
            end
        end
    end
    
       
   BRAM_wrapper bram(
    .BRAM_PORTA_0_addr(ind),
    .BRAM_PORTA_0_clk(clk),
    .BRAM_PORTA_0_din(datain),
    .BRAM_PORTA_0_dout(char),
    .rsta_0(rst),
    .BRAM_PORTA_0_we(we)
   );
    
endmodule
