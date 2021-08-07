`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/02/2021 07:19:36 PM
// Design Name: 
// Module Name: RegFile
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


module RegFile(clk,rst,read1,read2,w_en,w_data,w_reg,rs,rt);

input clk,rst;
input w_en;//write enable
input[4:0] read1,read2,w_reg;// first register to read address, second read register address, register to write address
input[31:0] w_data;//data to be written to write adress given write enable

output reg[31:0] rs,rt;//registers to be read 

reg [31:0] mem1 [0:31];
reg [31:0] i;//used in for loop to easily reset mem1
always@(posedge clk,posedge rst) begin
    if(rst) begin
        for( i = 0; i <= 31; i = i + 1)
        mem1[i] <= 32'h0000;    
    end
    
    else if (w_en)   
        mem1[w_reg] <= w_data;
end

always@(*) begin

    rs = mem1[read1];
    rt = mem1[read2];

end







endmodule
