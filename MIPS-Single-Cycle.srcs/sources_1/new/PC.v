`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 05:09:28 PM
// Design Name: 
// Module Name: PC
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


module PC(rst,clk,Din,Dout);
input rst,clk;
input [31:0] Din;
output reg[31:0] Dout;

always@(posedge clk,posedge rst) begin
    if(rst) 
        Dout <= 32'h0000;
    else
        Dout <= Din;
    end

endmodule
