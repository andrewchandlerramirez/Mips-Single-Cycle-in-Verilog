`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 07:17:08 PM
// Design Name: 
// Module Name: mux_5
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


module mux_5(RegDst, rt,rd,destination);
input RegDst;
input[4:0] rt,rd;
output wire[4:0] destination;
      
assign destination = (RegDst == 1'b1)? rd: rt;
endmodule
