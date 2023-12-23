`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 16:32:41
// Design Name: 
// Module Name: memory
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


module memory #(parameter address=3,parameter data=8)(write_data,write_addr,read_addr,wr,write_full,write_clk,read_data);
input [data-1:0]write_data;
input [address-1:0]write_addr,read_addr;
input wr,write_full,write_clk;
output [data-1:0]read_data;

localparam fifo_depth=1<<address;

reg [data-1:0]mem[0:fifo_depth-1];

assign read_data=mem[read_addr];

always@(posedge write_clk)
begin
if(wr&&(!write_full)) mem[write_addr]<=write_data;
end




















endmodule
