`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/03/2021 12:42:14 AM
// Design Name: 
// Module Name: Instmem
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


module Instmem(rst,address,inst);

input rst;
input[31:0] address;

output reg[31:0] inst;

reg [7:0] InstMem [0: 255];

wire[7:0] a0,a1,a2,a3;

reg[8:0] i;

always@(*) begin

    if(rst)begin
    
        InstMem[0]  = 8'h8c;InstMem[1]  = 8'h08;InstMem[2]  = 8'h00;InstMem[3]  = 8'h10;// 0X00  lw $t0, 16($zero), loading 1 into reg 
        InstMem[4]  = 8'h8c;InstMem[5]  = 8'h09;InstMem[6]  = 8'h00;InstMem[7]  = 8'h10;// 0X04  lw $t1, 16($zero) 
        InstMem[8]  = 8'h31;InstMem[9]  = 8'h0a;InstMem[10] = 8'h00;InstMem[11] = 8'h01;// 0X08  andi $t2, $t0, 1    <- oddevencheck
        InstMem[12] = 8'h10;InstMem[13] = 8'h0a;InstMem[14] = 8'h00;InstMem[15] = 8'h01;// 0X0C  beq  $t2, $zero, even 
        InstMem[16] = 8'h14;InstMem[17] = 8'h0a;InstMem[18] = 8'h00;InstMem[19] = 8'h02;// 0X10  bne  $t2, $zero, odd 
        InstMem[20] = 8'h01;InstMem[21] = 8'h09;InstMem[22] = 8'h40;InstMem[23] = 8'h20;// 0X14  add $t0, $t0, $t1   <- even
        InstMem[24] = 8'h10;InstMem[25] = 8'h00;InstMem[26] = 8'hff;InstMem[27] = 8'hfb;// 0X18  beq $zero, $zero oddevencheck 
        InstMem[28] = 8'h01;InstMem[29] = 8'h00;InstMem[30] = 8'h48;InstMem[31] = 8'h20;// 0X1C  add $t1, $t0, $zero <- odd
        InstMem[32] = 8'h01;InstMem[33] = 8'h08;InstMem[34] = 8'h40;InstMem[35] = 8'h20;// 0X20  add $t0, $t0, $t0
        InstMem[36] = 8'h10;InstMem[37] = 8'h00;InstMem[38] = 8'hff;InstMem[39] = 8'hf8;// 0X24  beq $zero, $zero oddevencheck 
        
        for( i = 40; i < 256; i = i + 1)begin //everything to address 255 should be 0 from this point forward
            InstMem[i] = 8'h00;
        end
                              
      
    end
    
    
    
    inst = {InstMem[address[7:0]],InstMem[address[7:0] + 8'h01], InstMem[address[7:0] + 8'h02],InstMem[address[7:0] + 8'h03]};
end







//assign a3 = InstMem[address[7:0]];
//assign a2 = InstMem[address[7:0] + 8'h01];
//assign a1 = InstMem[address[7:0] + 8'h02] ;
//assign a0 = InstMem[address[7:0] + 8'h03];

//assign inst = {a3,a2,a1,a0};

endmodule
