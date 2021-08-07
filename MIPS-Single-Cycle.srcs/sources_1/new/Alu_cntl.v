`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 11:07:06 PM
// Design Name: 
// Module Name: Alu_cntl
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




module Alu_cntl(op,func,alu_cntl);

input[5:0] op;
input[5:0] func;

output reg[5:0] alu_cntl; 


always@(*) begin
    case(op)
        6'h00 : 
            case(func) 
                6'h27: alu_cntl = 6'h00;// R //NOR BITWISE NOR (NOT OR)
                6'h26: alu_cntl = 6'h01;// R //XOR BITWISE XOR (EXCLUSIVE OR)
                6'h25: alu_cntl = 6'h02;// R //OR  BITWISE OR
                6'h24: alu_cntl = 6'h03;// R //AND BITWISE AND
                6'h23: alu_cntl = 6'h04;// R //SUBU UNSIGNED SUBTRACT
                6'h22: alu_cntl = 6'h05;// R //SUB  SUBTRACT
                6'h21: alu_cntl = 6'h06;// R //ADDU UNSIGNED ADD
                6'h20: alu_cntl = 6'h07;// R //ADD  ADDITION
                6'h19: alu_cntl = 6'h08;// R //MULTU UNSIGNED MULTIPLY
                6'h18: alu_cntl = 6'h09;// R //MULT  MULTIPLY
                6'h13: alu_cntl = 6'h0A;// R //MTLO MOVE TO LO REG
                6'h12: alu_cntl = 6'h0B;// R //MFLO MOVE FROM LO REG
                6'h11: alu_cntl = 6'h0C;// R //MTHI MOVE TO HI REG
                6'h10: alu_cntl = 6'h0D;// R //MFHI MOVE FROM HI REG
                6'h09: alu_cntl = 6'h0E;// J //JALR JUMP AND LINK REG
                6'h08: alu_cntl = 6'h0F;// R //JR JUMP TO ADDRESS IN REG
                6'h03: alu_cntl = 6'h10;// R //SRA ARITHMETIC SHIFT RIGHT SIGN EXTENDED
                6'h2B: alu_cntl = 6'h11;// R //SLTU SET TO 1 IF LESS THAN UNSIGNED
                6'h2A: alu_cntl = 6'h12;// R //SLT SET TO 1 IF LESS THAN
                6'h02: alu_cntl = 6'h13;// R //SRL LOGICAL SHIFT RIGHT 0 EXTENDED
                6'h1B: alu_cntl = 6'h14;// R //DIVU UNSIGNED DIVIDE
                6'h1A: alu_cntl = 6'h15;// R //DIV  DIVIDE
                6'h00: alu_cntl = 6'h16;// R //SLL LOGICAL SHIFT LEFT
            endcase
        6'h0A: alu_cntl = 6'h17;// I //SLTI SET LESS THAN IMMEDIATE
        6'h0B: alu_cntl = 6'h18;// I //SLTIU SET LESS THAN UNSIGNED IMMEDIATE
        6'h0C: alu_cntl = 6'h19;// I //ANDI BITWISE AND IMMEDIATE
        6'h0D: alu_cntl = 6'h1A;// I //ORI BITWISE OR IMMEDIATE
        6'h0F: alu_cntl = 6'h1B;// I //LUI LOAD UPPER IMMEDIATE
        6'h02: alu_cntl = 6'h1C;// J //J JUMP TO ADDRESS
        6'h2B: alu_cntl = 6'h1D;// I //SW STORE WORD
        6'h03: alu_cntl = 6'h1E;// J //JAL JUMP AND LINK
        6'h04: alu_cntl = 6'h1F;// I //BEQ BRANCH IF EQUAL
        6'h05: alu_cntl = 6'h20;// I //BNE BRANCH IF NOT EQUAL
        6'h06: alu_cntl = 6'h21;// I //BLEZ BRANCH IF LESS THAN OR EQUAL TO ZERO
        6'h07: alu_cntl = 6'h22;// I //BGTZ BRANCH IF GREATER THAN ZERO
        6'h08: alu_cntl = 6'h23;// I //ADDI ADD IMMEDIATE
        6'h09: alu_cntl = 6'h24;// I //ADDIU ADD UNSIGNED IMMEDIATE
        6'h10: alu_cntl = 6'h25;// R //MFC0 MOVE FROM COPROCESSOR 0
        6'h20: alu_cntl = 6'h26;// I //LB LOAD BYTE
        6'h23: alu_cntl = 6'h27;// I //LW LOAD WORD
        6'h24: alu_cntl = 6'h28;// I //LBU LOAD BTYE UNIGNED
        6'h25: alu_cntl = 6'h29;// I //LHU LOAD HALF WORD UNSIGNED
        6'h28: alu_cntl = 6'h2A;// I //SB STORE BTYE
        6'h29: alu_cntl = 6'h2B;// I //SH STORE HALF WORD
    endcase
    


end











endmodule