`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 23:30:06
// Design Name: 
// Module Name: fifo
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


module fifo #(parameter address=3,parameter data=8) (write_data,read_clk,read_inc,read_rst,write_clk,write_inc,write_rst,read_data,read_empty,write_full);
input [data-1:0]write_data;
input read_clk,write_clk,read_inc,write_inc,read_rst,write_rst;
output [data-1:0]read_data;
output read_empty,write_full;

wire [address-1:0]write_addr,read_addr;
wire [address:0]write_ptr,sync_write_ptr,read_ptr,sync_read_ptr;

memory #(address,data) des1(write_data,write_addr,read_addr,write_inc,write_full,write_clk,read_data);
SyncWritepointer_in_ReadClk #(address) des2(write_ptr,read_rst,read_clk,sync_write_ptr);
SyncReadpointer_in_WriteClk #(address) des3(read_ptr,write_rst,write_clk,sync_read_ptr);
ReadEmpty #(address) des4(read_clk,read_rst,read_inc,sync_write_ptr,read_ptr,read_addr,read_empty);
WriteFull #(address) des5(write_clk,write_rst,write_inc,sync_read_ptr,write_ptr,write_addr,write_full);



















endmodule
