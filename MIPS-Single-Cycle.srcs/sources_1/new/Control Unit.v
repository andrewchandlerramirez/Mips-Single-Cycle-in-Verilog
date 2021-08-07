`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 03:44:31 PM
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(op_code,reg_dst,jump,beq,bne,blez,bgtz,mem_read,mem_to_reg,alu_op,mem_write,alu_src, reg_write);    
input [5:0] op_code;//used to set control signals in processor
output reg[5:0] alu_op; //just pass opcode
//output reg [4:0] shamt; //shift amount is 5 bit from inst[10:6]
output reg reg_dst //destination register changing from R type to I type (rd to rt)
        ,jump  
        ,beq   //branch if z flag and beq
        ,bne   //branch if ~z flag and bne
        ,blez  //branch if less than or equal to zero and blez
        ,bgtz  //branch if greater than zero and bgtz
        ,mem_read //send data from datamem address to output
        ,mem_to_reg //data write in regfile will come from datamem instead of alu
        ,mem_write //write data from alu to datamem
        ,alu_src   //alu will use immediate operrant for I type if asserted
        ,reg_write;//reg file will be written with alu or datamem output


always@(*) begin
    alu_op = op_code;
    
    
    
    case(op_code)
        6'h00 : //R-type
            begin 
                reg_dst = 1'b1; //destination register will be rd inst[15:11]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'b0;//alu data goes to regfile write data
                mem_write = 1'b0;//data mem will not be written
                alu_src  = 1'b0;//alu will use rt as second input
                reg_write= 1'b1;//regfile will be written
            end
        6'h0A: //alu_cntl = 6'h17;// I //SLTI SET LESS THAN IMMEDIATE
            begin 
                reg_dst = 1'b0; //destination register will be rt inst[20:16]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'b0;//alu data goes to regfile write data
                mem_write = 1'b0;//data mem will not be written
                alu_src  = 1'b1;//alu will use sign extended immediate as second input
                reg_write= 1'b1;//regfile will be written
            end
        6'h0B: //alu_cntl = 6'h18;// I //SLTIU SET LESS THAN UNSIGNED IMMEDIATE
            begin 
                reg_dst = 1'b0; //destination register will be rt inst[20:16]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'b0;//alu data goes to regfile write data
                mem_write = 1'b0;//data mem will not be written
                alu_src  = 1'b1;//alu will use sign extended immediate as second input
                reg_write= 1'b1;//regfile will be written
            end
        6'h0C: //alu_cntl = 6'h19;// I //ANDI BITWISE AND IMMEDIATE
            begin 
                reg_dst = 1'b0; //destination register will be rt inst[20:16]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'b0;//alu data goes to regfile write data
                mem_write = 1'b0;//data mem will not be written
                alu_src  = 1'b1;//alu will use sign extended immediate as second input
                reg_write= 1'b1;//regfile will be written
            end
        6'h0D: //alu_cntl = 6'h1A;// I //ORI BITWISE OR IMMEDIATE
            begin 
                reg_dst = 1'b0; //destination register will be rt inst[20:16]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'b0;//alu data goes to regfile write data
                mem_write = 1'b0;//data mem will not be written
                alu_src  = 1'b1;//alu will use sign extended immediate as second input
                reg_write= 1'b1;//regfile will be written
            end
        //6'h0F: alu_cntl = 6'h1B;// I //LUI LOAD UPPER IMMEDIATE
        6'h02: //alu_cntl = 6'h1C;// J //J JUMP TO ADDRESS
            begin 
                reg_dst = 1'bx; //destination irrelevent because reg_write = 1'b0;
                jump = 1'b1; //jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'bx;//irrelevent, not data written reg_write = 1'b0;
                mem_write = 1'b0;//data mem will not be written with rt data
                alu_src  = 1'bx;//irrelevent to jump 
                reg_write= 1'b0;//regfile will not be written
            end
        6'h2B: //alu_cntl = 6'h1D;// I //SW STORE WORD
            begin 
                reg_dst = 1'bx; //destination irrelevent because reg_write = 1'b0;
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'bx;//irrelevent, not data written reg_write = 1'b0;
                mem_write = 1'b1;//data mem will be written with rt data
                alu_src  = 1'b1;//alu will use sign extended immediate as second input 
                reg_write= 1'b0;//regfile will not be written
            end
        //6'h03: alu_cntl = 6'h1E;// J //JAL JUMP AND LINK
        6'h04: //alu_cntl = 6'h1F;// I //BEQ BRANCH IF EQUAL
            begin 
                reg_dst = 1'bx; //destination irrelevent because reg_write = 1'b0;
                jump = 1'b0; //not jump
                beq  = 1'b1; //branch if z flag
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'bx;//irrelevent, not data written reg_write = 1'b0;
                mem_write = 1'b0;//data mem not will be written with rt data
                alu_src  = 1'b0;//alu will use rt as second input 
                reg_write= 1'b0;//regfile will not be written
            end
        6'h05: //alu_cntl = 6'h20;// I //BNE BRANCH IF NOT EQUAL
            begin 
                reg_dst = 1'bx; //destination irrelevent because reg_write = 1'b0;
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b1; //branch if ~z flag
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'bx;//irrelevent, not data written reg_write = 1'b0;
                mem_write = 1'b0;//data mem not will be written with rt data
                alu_src  = 1'b0;//alu will use rt as second input
                reg_write= 1'b0;//regfile will not be written
            end
        6'h06: //alu_cntl = 6'h21;// I //BLEZ BRANCH IF LESS THAN OR EQUAL TO ZERO
            begin 
                reg_dst = 1'bx; //destination irrelevent because reg_write = 1'b0;
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b1; //branch lsb output is set to 1
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'bx;//irrelevent, not data written reg_write = 1'b0;
                mem_write = 1'b0;//data mem not will be written with rt data
                alu_src  = 1'b0;//alu will use rt as second input //irrelevent
                reg_write= 1'b0;//regfile will not be written
            end
        6'h07:// alu_cntl = 6'h22;// I //BGTZ BRANCH IF GREATER THAN ZERO
            begin 
                reg_dst = 1'bx; //destination irrelevent because reg_write = 1'b0;
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b1; // branch if lsb of alu output is set to 1
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'bx;//irrelevent, not data written reg_write = 1'b0;
                mem_write = 1'b0;//data mem not will be written with rt data
                alu_src  = 1'b0;//alu will use rt as second input //irrelevent
                reg_write= 1'b0;//regfile will not be written
            end
        6'h08: //alu_cntl = 6'h23;// I //ADDI ADD IMMEDIATE
            begin 
                reg_dst = 1'b0; //destination register will be rt inst[20:16]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'b0;//alu data goes to regfile write data
                mem_write = 1'b0;//data mem will not be written
                alu_src  = 1'b1;//alu will use sign extended immediate as second input
                reg_write= 1'b1;//regfile will be written
            end
        6'h09: //alu_cntl = 6'h24;// I //ADDIU ADD UNSIGNED IMMEDIATE
            begin 
                reg_dst = 1'b0; //destination register will be rt inst[20:16]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b0;//alu output will not be used to read datamem 
                mem_to_reg = 1'b0;//alu data goes to regfile write data
                mem_write = 1'b0;//data mem will not be written
                alu_src  = 1'b1;//alu will use sign extended immediate as second input
                reg_write= 1'b1;//regfile will be written
            end
        //6'h10: alu_cntl = 6'h25;// R //MFC0 MOVE FROM COPROCESSOR 0
        //6'h20: alu_cntl = 6'h26;// I //LB LOAD BYTE
        6'h23: //alu_cntl = 6'h27;// I //LW LOAD WORD
            begin 
                reg_dst = 1'b0; //destination register will be rt inst[20:16]
                jump = 1'b0; //not jump
                beq  = 1'b0; //no branch
                bne  = 1'b0; //no branch
                blez = 1'b0; //no branch
                bgtz = 1'b0; //no branch
                mem_read = 1'b1;//alu output will be used to read datamem 
                mem_to_reg = 1'b1;//datamem output will be written into RegFile at reg_dst
                mem_write = 1'b0;//data mem not will be written with rt data
                alu_src  = 1'b1;//alu will use sign extended immediate as second input 
                reg_write= 1'b1;//regfile will be written
            end
        //6'h24: alu_cntl = 6'h28;// I //LBU LOAD BTYE UNIGNED
        //6'h25: alu_cntl = 6'h29;// I //LHU LOAD HALF WORD UNSIGNED
        //6'h28: alu_cntl = 6'h2A;// I //SB STORE BTYE
        //6'h29: alu_cntl = 6'h2B;// I //SH STORE HALF WORD
     endcase

 end


endmodule
