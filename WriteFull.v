`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2023 22:30:26
// Design Name: 
// Module Name: WriteFull
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


module WriteFull #(parameter address=3)(write_clk,write_rst,write_inc,sync_read_ptr,write_ptr,write_addr,write_full);
input write_clk,write_rst,write_inc;
input [address:0]sync_read_ptr;
output reg [address:0]write_ptr;
output reg [address-1:0]write_addr;
output reg write_full;

reg [address:0]write_binary,binary_next,gray_next;

always@*
begin
write_addr=write_binary[address-1:0];
binary_next=write_binary+(write_inc&&(~write_full));
gray_next=(binary_next>>1)^binary_next;
end 

always@(posedge write_clk or posedge write_rst)
begin
if(write_rst) {write_binary,write_ptr}<=0;
else {write_binary,write_ptr}<={binary_next,gray_next};
end

always@(posedge write_clk or write_rst)
begin
if(write_rst) write_full<=0;
else write_full<=(gray_next=={~sync_read_ptr[address:address-1],sync_read_ptr[address-2:0]});
end




















endmodule
