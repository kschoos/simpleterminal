`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2019 12:23:06 AM
// Design Name: 
// Module Name: uart
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


module uart(
    input clk,
    input rst,
    input rx,
    output tx,
    output reg [7:0] data,
    output reg newdata
    );
    
    // This module reads 9 bits from UART at 9600 Baudrate whenever it encounters a Startbit.
    // newdata goes high for 1 clock cycle, when a new datum arrived and is put out on the data bus.
    
    parameter CLK_START_OFFSET = 8571;
    parameter DIVIDER_CNT = 5208;
    parameter STATE_WAITING = 0;
    parameter STATE_RECEIVING = 1;
    
    reg state;
    reg entering;
    wire stb;
    
    reg [13:0] clkcnt;
    reg [1:0] divclk;
    reg [3:0] bitcnt;
    
    
    assign stb = divclk[0] & !divclk[1];
    
    always @(posedge clk) begin
        if(rst) begin
            entering <= 1;
            state <= STATE_WAITING;
            bitcnt <= 0;
            divclk <= 0;
            clkcnt <= 0;
        end
    
        case(state)
            STATE_WAITING: begin
                if(entering) begin
                    bitcnt <= 0;
                    entering <= 0;
                    newdata <= 0;
                end
                else begin
                    if(rx == 0) begin
                        state <= STATE_RECEIVING;
                        entering <= 1; 
                    end 
                    else begin
                        state <= 0;
                        bitcnt <= 0;
                        clkcnt <= 0;
                        divclk <= 0;
                    end
                end  
            end
            STATE_RECEIVING: begin
                if(entering) begin
                    entering <= 0;
                    bitcnt <= 0;
                    clkcnt <= CLK_START_OFFSET;
                    divclk <= 0; 
                end
                else begin
                    divclk[1] <= divclk[0];
                
                    if(clkcnt == DIVIDER_CNT) begin
                        clkcnt <= 0;
                        divclk[0] <= ~divclk[0];
                    end
                    else begin
                        clkcnt <= clkcnt + 1;
                    end    
                                
                    if(bitcnt > 8) begin
                        newdata <= 1;
                        state <= STATE_WAITING;
                        entering <= 1;
                    end
                    else if(stb) begin
                        data[bitcnt] <= rx;
                        bitcnt <= bitcnt + 1;
                    end   
                end         
            end
        
        endcase
    end
endmodule
