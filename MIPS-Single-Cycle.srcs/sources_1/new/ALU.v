`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2021 05:13:49 PM
// Design Name: 
// Module Name: ALU
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


module ALU(rs, rt, alu_cntl, shamt, result,zero);


input[31:0] rs,rt;
input[5:0] alu_cntl;
input[4:0] shamt;

output reg[31:0] result;
output reg zero;//,carry_out,overflow;



always@(*) begin
    case(alu_cntl) 
        6'h00: result =  ~(rs | rt) ;
        6'h01: result = (rs ^ rt);
        6'h02: result = rs | rt;
        6'h03: result = rs & rt;
        6'h04: result = rs - rt;
        6'h05: result = rs - rt;
        6'h06: result = rs + rt;
        6'h07: result = rs + rt;
        //6'h08: result = rs * rt; does this work for all mult
        //6'h09: result = rs * rt; does this work for all mult
        //6'h0A: result = rs  rt;
        //6'h0B: result = rs  rt;
        //6'h0C: result = rs  rt;
        //6'h0D: result = rs  rt;
        //6'h0E: result = rs  rt;
        //6'h0F: result = rs  rt;
        6'h10: result = rs >>> shamt;
        6'h11: result = (rs < rt)? 32'h00000001: 32'h00000000;
        6'h12: result = (rs < rt)? 32'h00000001: 32'h00000000;
        6'h13: result = rs >> shamt;
        //6'h14: result = rs / rt; does this actually work for divisions
        //6'h15: result = rs / rt;
        6'h16: result = rs << shamt;
        6'h17: result = (rs < rt)? 32'h00000001: 32'h00000000;
        6'h18: result = (rs < rt)? 32'h00000001: 32'h00000000;
        6'h19: result = rs & rt;
        6'h1A: result = rs | rt;
        //6'h1B: result = rs  rt;
        //6'h1C: result = rs  rt;
        6'h1D: result = rs + rt;
        //6'h1E: result = rs  rt;
        6'h1F: result = rs - rt;//need to add harware for both beq and bne
        6'h20: result = rs - rt;//
        6'h21: result = (rs <= 32'h00000000)? 32'h00000001: 32'h00000000;//assuming we are comparing rs, we can set first bit of result and use it for conformation and add hardware
        6'h22: result = (rs > 32'h00000000)?  32'h00000001: 32'h00000000;
        6'h23: result = rs + rt;
        6'h24: result = rs + rt;
        //6'h25: result = rs  rt;
        //6'h26: result = rs  rt;
        6'h27: result = rs + rt;
        //6'h28: result = rs  rt;
        //6'h29: result = rs  rt;
        //6'h2A: result = rs  rt;
        //6'h2B: result = rs  rt;
        default: result = 32'h00000000;
    endcase
    
    zero = (result == 32'h00000000)? 1'b1: 1'b0;
    
    

end 




endmodule
