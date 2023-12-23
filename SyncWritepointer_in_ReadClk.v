`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 17:17:34
// Design Name: 
// Module Name: SyncWritepointer_in_ReadClk
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


module SyncWritepointer_in_ReadClk #(parameter address=3)(write_ptr,read_rst,read_clk,sync_write_ptr);
input [address:0]write_ptr;
input read_rst,read_clk;
output reg [address:0]sync_write_ptr;

reg [address:0]tmp;

always@(posedge read_clk or posedge read_rst)
begin
if(read_rst) {sync_write_ptr,tmp}<=0;
else {sync_write_ptr,tmp}<={tmp,write_ptr};
end


endmodule
