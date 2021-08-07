`timescale 1ns / 1ps



module Top_Level(
    input clk,
    input reset
    );
    
  wire [31:0]ALU_0_result;
  wire ALU_0_zero;
  wire [5:0]Alu_cntl_0_alu_cntl;
  wire [5:0]Control_Unit_0_alu_op;
  wire Control_Unit_0_alu_src;
  wire Control_Unit_0_beq;
  wire Control_Unit_0_bgtz;
  wire Control_Unit_0_blez;
  wire Control_Unit_0_bne;
  wire Control_Unit_0_jump;
  wire Control_Unit_0_mem_read;
  wire Control_Unit_0_mem_to_reg;
  wire Control_Unit_0_mem_write;
  wire Control_Unit_0_reg_dst;
  wire Control_Unit_0_reg_write;
  wire [31:0]Datamem_0_read_data;
  wire [31:0]Instmem_0_inst;
  wire [31:0]PC_0_Dout;
  wire [31:0]PC_Next_0_Dout;
  wire [31:0]RegFile_0_rs;
  wire [31:0]RegFile_0_rt;
  wire [31:0]Sign_Extend_0_Dout;
  wire [0:0]alu_lsb_Dout;
  wire clk_1;
  wire [5:0]func_Dout;
  wire [15:0]immediate_Dout;
  wire [25:0]jump_address_Dout;
  wire [31:0]mux_32_0_c;
  wire [31:0]mux_32_1_c;
  wire [4:0]mux_5_0_destination;
  wire [5:0]op_code_Dout;
  wire [4:0]rd_Dout;
  wire reset_1;
  wire [4:0]rs_Dout;
  wire [4:0]rt_Dout;
  wire [4:0]shamt_Dout;

  assign clk_1 = clk;
  assign reset_1 = reset;
  ALU ALU_0
       (.alu_cntl(Alu_cntl_0_alu_cntl),
        .result(ALU_0_result),
        .rs(RegFile_0_rs),
        .rt(mux_32_0_c),
        .shamt(shamt_Dout),
        .zero(ALU_0_zero));
  Alu_cntl Alu_cntl_0
       (.alu_cntl(Alu_cntl_0_alu_cntl),
        .func(func_Dout),
        .op(Control_Unit_0_alu_op));
  Control_Unit Control_Unit_0
       (.alu_op(Control_Unit_0_alu_op),
        .alu_src(Control_Unit_0_alu_src),
        .beq(Control_Unit_0_beq),
        .bgtz(Control_Unit_0_bgtz),
        .blez(Control_Unit_0_blez),
        .bne(Control_Unit_0_bne),
        .jump(Control_Unit_0_jump),
        .mem_read(Control_Unit_0_mem_read),
        .mem_to_reg(Control_Unit_0_mem_to_reg),
        .mem_write(Control_Unit_0_mem_write),
        .op_code(op_code_Dout),
        .reg_dst(Control_Unit_0_reg_dst),
        .reg_write(Control_Unit_0_reg_write));
  Datamem Datamem_0
       (.address(ALU_0_result),
        .clk(clk_1),
        .read(Control_Unit_0_mem_read),
        .read_data(Datamem_0_read_data),
        .rst(reset_1),
        .write(Control_Unit_0_mem_write),
        .write_data(RegFile_0_rt));
  Instmem Instmem_0
       (.address(PC_0_Dout),
        .inst(Instmem_0_inst),
        .rst(reset_1));
  PC PC_0
       (.Din(PC_Next_0_Dout),
        .Dout(PC_0_Dout),
        .clk(clk_1),
        .rst(reset_1));
  PC_Next PC_Next_0
       (.Dout(PC_Next_0_Dout),
        .alu_lsb(alu_lsb_Dout),
        .beq(Control_Unit_0_beq),
        .bgtz(Control_Unit_0_bgtz),
        .blez(Control_Unit_0_blez),
        .bne(Control_Unit_0_bne),
        .branch_address(Sign_Extend_0_Dout),
        .jump(Control_Unit_0_jump),
        .jump_address(jump_address_Dout),
        .pc(PC_0_Dout),
        .zero(ALU_0_zero));
  RegFile RegFile_0
       (.clk(clk_1),
        .read1(rs_Dout),
        .read2(rt_Dout),
        .rs(RegFile_0_rs),
        .rst(reset_1),
        .rt(RegFile_0_rt),
        .w_data(mux_32_1_c),
        .w_en(Control_Unit_0_reg_write),
        .w_reg(mux_5_0_destination));
  Sign_Extend Sign_Extend_0
       (.Din(immediate_Dout),
        .Dout(Sign_Extend_0_Dout));
        
   assign alu_lsb_Dout = ALU_0_result[0];
  //xlslice_0_7 alu_lsb
  //     (.Din(ALU_0_result),
  //      .Dout(alu_lsb_Dout));
  assign func_Dout = Instmem_0_inst[5:0];
//  xlslice_0_6 func
//       (.Din(Instmem_0_inst),
//        .Dout(func_Dout));
assign immediate_Dout = Instmem_0_inst[15:0];
//  xlslice_0_5 immediate
//       (.Din(Instmem_0_inst),
//        .Dout(immediate_Dout));
assign jump_address_Dout = Instmem_0_inst[25:0];
//  xlslice_0_1 jump_address
//       (.Din(Instmem_0_inst),
//        .Dout(jump_address_Dout));
  mux_32 mux_32_0
       (.a(Sign_Extend_0_Dout),
        .b(RegFile_0_rt),
        .c(mux_32_0_c),
        .sel(Control_Unit_0_alu_src));
  mux_32 mux_32_1
       (.a(Datamem_0_read_data),
        .b(ALU_0_result),
        .c(mux_32_1_c),
        .sel(Control_Unit_0_mem_to_reg));
  mux_5 mux_5_0
       (.RegDst(Control_Unit_0_reg_dst),
        .destination(mux_5_0_destination),
        .rd(rd_Dout),
        .rt(rt_Dout));
        assign op_code_Dout = Instmem_0_inst[31:26];
//  xlslice_0_0 op_code
//       (.Din(Instmem_0_inst),
//        .Dout(op_code_Dout));
assign rd_Dout = Instmem_0_inst[15:11];
//  xlslice_0_4 rd
//       (.Din(Instmem_0_inst),
//        .Dout(rd_Dout));
assign rs_Dout = Instmem_0_inst[25:21];
//  xlslice_0_2 rs
//       (.Din(Instmem_0_inst),
//        .Dout(rs_Dout));
assign rt_Dout = Instmem_0_inst[20:16];
//  xlslice_0_3 rt
//       (.Din(Instmem_0_inst),
//        .Dout(rt_Dout));
assign shamt_Dout = Instmem_0_inst[10:6];
//  xlslice_6_0 shamt
//       (.Din(Instmem_0_inst),
//        .Dout(shamt_Dout));
endmodule
