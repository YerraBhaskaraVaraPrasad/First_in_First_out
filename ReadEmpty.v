`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 20:57:18
// Design Name: 
// Module Name: ReadEmpty
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


module ReadEmpty #(parameter address=3)(read_clk,read_rst,read_inc,sync_write_ptr,read_ptr,read_addr,read_empty);
input read_clk,read_rst,read_inc;
input [address:0]sync_write_ptr;
output reg [address:0]read_ptr;
output reg [address-1:0]read_addr;
output reg read_empty;

reg [address:0]read_binary,binary_next,gray_next;

always@*
begin
read_addr=read_binary[address-1:0];
binary_next=read_binary+(read_inc&&(~read_empty));
gray_next=(binary_next>>1)^binary_next;
end

always@(posedge read_clk or posedge read_rst)
begin
if(read_rst) {read_binary,read_ptr}<=0;
else {read_binary,read_ptr}<={binary_next,gray_next};
end

always@(posedge read_clk or posedge read_rst)
begin
if(read_rst) read_empty<=1;
else read_empty<=(gray_next==sync_write_ptr);
end




















endmodule
