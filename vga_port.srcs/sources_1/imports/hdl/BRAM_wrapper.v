//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1.3 (win64) Build 2644227 Wed Sep  4 09:45:24 MDT 2019
//Date        : Thu Sep 26 11:08:31 2019
//Host        : DESKTOP-BKGDGM2 running 64-bit major release  (build 9200)
//Command     : generate_target BRAM_wrapper.bd
//Design      : BRAM_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module BRAM_wrapper
   (BRAM_PORTA_0_addr,
    BRAM_PORTA_0_clk,
    BRAM_PORTA_0_din,
    BRAM_PORTA_0_dout,
    BRAM_PORTA_0_we,
    rsta_0);
  input [12:0]BRAM_PORTA_0_addr;
  input BRAM_PORTA_0_clk;
  input [7:0]BRAM_PORTA_0_din;
  output [7:0]BRAM_PORTA_0_dout;
  input [0:0]BRAM_PORTA_0_we;
  input rsta_0;

  wire [12:0]BRAM_PORTA_0_addr;
  wire BRAM_PORTA_0_clk;
  wire [7:0]BRAM_PORTA_0_din;
  wire [7:0]BRAM_PORTA_0_dout;
  wire [0:0]BRAM_PORTA_0_we;
  wire rsta_0;

  BRAM BRAM_i
       (.BRAM_PORTA_0_addr(BRAM_PORTA_0_addr),
        .BRAM_PORTA_0_clk(BRAM_PORTA_0_clk),
        .BRAM_PORTA_0_din(BRAM_PORTA_0_din),
        .BRAM_PORTA_0_dout(BRAM_PORTA_0_dout),
        .BRAM_PORTA_0_we(BRAM_PORTA_0_we),
        .rsta_0(rsta_0));
endmodule
