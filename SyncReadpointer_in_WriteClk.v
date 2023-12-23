`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 19:02:48
// Design Name: 
// Module Name: SyncReadpointer_in_WriteClk
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


module SyncReadpointer_in_WriteClk #(parameter address=3)(read_ptr,write_rst,write_clk,sync_read_ptr);
input [address:0]read_ptr;
input write_rst,write_clk;
output  reg [address:0]sync_read_ptr;
reg [address:0]tmp;

always@(posedge write_clk or posedge write_rst)
begin
if(write_rst) {sync_read_ptr,tmp}<=0;
else {sync_read_ptr,tmp}<={tmp,read_ptr};
end






















endmodule
