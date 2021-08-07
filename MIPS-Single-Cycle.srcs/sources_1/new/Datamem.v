`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2021 02:46:17 PM
// Design Name: 
// Module Name: Datamem
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


module Datamem(clk,rst,address, read,write,read_data,write_data);

input clk,rst,read,write;
input[31:0] address,write_data;

output reg[31:0] read_data;

reg [31:0] datamem [0:31];

always@(posedge clk,posedge rst) begin
    if(rst)begin
                 datamem[0]  <= 32'h00000000;//0
		         datamem[1]  <= 32'hFFFFFFFF;//1
			     datamem[2]  <= 32'h12345678;//2
	       		 datamem[3]  <= 32'h00000008;//3
				 datamem[4]  <= 32'h00000001;//4
				 datamem[5]  <= 32'h00000003;//5
			     datamem[6]  <= 32'h00000000;//6
			     datamem[7]  <= 32'h00000000;//7
		         datamem[8]  <= 32'h00000000;//8
			     datamem[9]  <= 32'h00000000;//9
				 datamem[10] <= 32'h00000000;//10
				 datamem[11] <= 32'h00000000;//11
				 datamem[12] <= 32'h00000000;//12
				 datamem[13] <= 32'h00000000;//13
				 datamem[14] <= 32'h00000000;//14
				 datamem[15] <= 32'h00000000;//15
			     datamem[16] <= 32'h00000000;//16
				 datamem[17] <= 32'h00000000;//17
			     datamem[18] <= 32'h00000000;//18
				 datamem[19] <= 32'h00000000;//19
				 datamem[20] <= 32'h00000000;//20
				 datamem[21] <= 32'h00000000;//21
				 datamem[22] <= 32'h00000000;//22
				 datamem[23] <= 32'h00000000;//23
				 datamem[24] <= 32'h00000000;//24
				 datamem[25] <= 32'h00000000;//25
				 datamem[26] <= 32'h00000000;//26
				 datamem[27] <= 32'h00000000;//27
				 datamem[28] <= 32'h00000000;//28
				 datamem[29] <= 32'h00000000;//29
				 datamem[30] <= 32'h00000000;//30
				 datamem[31] <= 32'h00000000;//31
    end
    else begin //only one enable can be asserted at a time
    datamem[address[6:2]] <= (write == 1'b1)? write_data: datamem[address[6:2]];//what address to use?
    
    end

end    


always@(*)begin 
read_data = (read == 1'b1)? datamem[address[6:2]]: read_data;
end



endmodule
