`timescale 1ns / 1ps



module PC_Adder(rst,Din,Dout);
input rst;
input [31:0] Din;
output reg[31:0] Dout;

always@(*) begin
    if(rst) 
        Dout = 32'h0000;
    else
        Dout = Din + 32'h0004;//memory word is 4 bytes. 
    end

endmodule
