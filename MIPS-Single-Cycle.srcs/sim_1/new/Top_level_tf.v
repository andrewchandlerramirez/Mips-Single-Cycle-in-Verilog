`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2021 12:26:07 AM
// Design Name: 
// Module Name: Top_level_tf
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


module Top_level_tf();
    reg clk,reset;
    
    Top_Level UUT(.clk(clk), .reset(reset));
    
    always #20 clk = ~clk;
    
    initial begin
    clk = 1'b0;
    reset = 1'b1;
    #20;
    reset = 1'b0;
    clk = 1'b0;
    end
    
endmodule
