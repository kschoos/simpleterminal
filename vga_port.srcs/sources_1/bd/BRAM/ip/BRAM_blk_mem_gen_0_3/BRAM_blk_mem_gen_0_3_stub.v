// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1.3 (win64) Build 2644227 Wed Sep  4 09:45:24 MDT 2019
// Date        : Thu Sep 26 11:12:44 2019
// Host        : DESKTOP-BKGDGM2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/skysk/Documents/Vivado_Projects/vga_port/vga_port.srcs/sources_1/bd/BRAM/ip/BRAM_blk_mem_gen_0_3/BRAM_blk_mem_gen_0_3_stub.v
// Design      : BRAM_blk_mem_gen_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1.3" *)
module BRAM_blk_mem_gen_0_3(clka, rsta, wea, addra, dina, douta, rsta_busy)
/* synthesis syn_black_box black_box_pad_pin="clka,rsta,wea[0:0],addra[12:0],dina[7:0],douta[7:0],rsta_busy" */;
  input clka;
  input rsta;
  input [0:0]wea;
  input [12:0]addra;
  input [7:0]dina;
  output [7:0]douta;
  output rsta_busy;
endmodule
