`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 01:05:11 AM
// Design Name: 
// Module Name: Sign_Extend
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


module Sign_Extend(Din,Dout);
    
input [15:0] Din;
output reg[31:0] Dout;




always@(*) begin
    Dout = (Din[15] == 1'b0)? {16'h0000,Din}: {16'hFFFF,Din};//{16{
end

endmodule
