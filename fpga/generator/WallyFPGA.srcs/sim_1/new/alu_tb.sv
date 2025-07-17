`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 01:05:57 PM
// Design Name: 
// Module Name: alu_tb
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
 `include "/home/sidharth/RISC-V/wally_core/cvw/fpga/src/CopiedFiles_do_not_add_to_repo/config/config.vh"
`include "/home/sidharth/RISC-V/wally_core/cvw/config/shared/parameter-defs.vh"

import cvw::*; 
module alu_tb;
/*
parameter cvw P = '{
    XLEN:            32,
    LOG_XLEN:         5,
    ZICOND_SUPPORTED: 1,
    ZBS_SUPPORTED:    1,
    ZBC_SUPPORTED:    1,
    ZBA_SUPPORTED:    1,
    ZBB_SUPPORTED:    1,
    ZBKB_SUPPORTED:   1,
    ZBKC_SUPPORTED:    1,
    ZBKX_SUPPORTED:   1,
    ZKND_SUPPORTED:   1,
    ZKNE_SUPPORTED:   1,
    ZKNH_SUPPORTED:   1
  };*/
/*
module alu_tb#(parameter  P = {
    XLEN:            32,
    LOG_XLEN:         5,
    ZICOND_SUPPORTED: 1,
    ZBS_SUPPORTED:    1,
    ZBC_SUPPORTED:    1,
    ZBA_SUPPORTED:    1,
    ZBB_SUPPORTED:    1,
    ZBKB_SUPPORTED:   1,
    ZBKC_SUPPORTED:   1,
    ZBKX_SUPPORTED:   1,
    ZKND_SUPPORTED:   1,
    ZKNE_SUPPORTED:   1,
    ZKNH_SUPPORTED:   1
  }) (); */


  //-------------------------------------------------------------------------
  // 1) Parameterization: 32-bit mode, with all bit-manip/ZICOND support enabled
  //-------------------------------------------------------------------------
  /*
  parameter P = '{
    XLEN:            32,
    LOG_XLEN:         5,
    ZICOND_SUPPORTED: 1,
    ZBS_SUPPORTED:    1,
    ZBC_SUPPORTED:    1,
    ZBA_SUPPORTED:    1,
    ZBB_SUPPORTED:    1,
    ZBKB_SUPPORTED:   1,
    ZBKC_SUPPORTED:   1,
    ZBKX_SUPPORTED:   1,
    ZKND_SUPPORTED:   1,
    ZKNE_SUPPORTED:   1,
    ZKNH_SUPPORTED:   1
  }*/

  //-------------------------------------------------------------------------
  // 2) Testbench signals
  //-------------------------------------------------------------------------
  logic [P.XLEN-1:0] A, B;
  logic              W64, UW64, SubArith;
  logic [2:0]        ALUSelect;
  logic [3:0]        BSelect, ZBBSelect;
  logic [2:0]        Funct3;
  logic [6:0]        Funct7, OpD;
  logic [4:0]        Rs2E;
  logic [2:0]        BALUControl;
  logic              BMUActive;
  logic [1:0]        CZero;
  wire [P.XLEN-1:0]  ALUResult, Sum;

  //-------------------------------------------------------------------------
  // 3) Instantiate DUT
  //-------------------------------------------------------------------------
  alu #(.P(P) ) dut (
    .A(A),
    .B(B),
    .W64(W64),
    .UW64(UW64),
    .SubArith(SubArith),
    .ALUSelect(ALUSelect),
    .BSelect(BSelect),
    .ZBBSelect(ZBBSelect),
    .Funct3(Funct3),
    .Funct7(Funct7),
    .OpD(OpD),
    .Rs2E(Rs2E),
    .BALUControl(BALUControl),
    .BMUActive(BMUActive),
    .CZero(CZero),
    .ALUResult(ALUResult),
    .Sum(Sum)
  );

  //-------------------------------------------------------------------------
  // 4) Simple waveform dump (for GTKWave or similar)
  //-------------------------------------------------------------------------
  /*
  initial begin
    $dumpfile("tb_alu.vcd");
    $dumpvars(0, tb_alu);
  end */

  //-------------------------------------------------------------------------
  // 5) Stimulus
  //-------------------------------------------------------------------------
  initial begin
    // Header
    $display("\n time |   A    |   B    | SEL | Sub |   Sum   | ALUResult");
    $display("-------------------------------------------------------");

    // Initialize all control signals
    {W64, UW64, SubArith, BSelect, ZBBSelect, Funct3, Funct7,
     OpD, Rs2E, BALUControl, BMUActive, CZero} = 0;

    // Walk through a few ALU functions
    // (1) ADD: 10 + 5 => 15
    A = 32'd10; B = 32'd5; ALUSelect = 3'b000; SubArith = 1'b0; 
    #5   $display("%4dns | %0d | %0d | 000 |  0  | %0d | %0d", $time, A, B, Sum, ALUResult);

    // (2) SUB: 10 - 5 => 5
    SubArith = 1'b1;
    #5   $display("%4dns | %0d | %0d | 000 |  1  | %0d | %0d", $time, A, B, Sum, ALUResult);

    // (3) SLL: 3 << 2 => 12
    A = 32'd11; B = 32'd2;
    SubArith = 1'b0;
    ALUSelect = 3'b001; Funct3 = 3'b001; BALUControl = 3'b000; OpD=7'b0101011; Funct7=7'b0000001;
    #5   $display("%4dns | %0d | %0d | 001 |  0  | %0d | %0d", $time, A, B, Sum, ALUResult);
    
     // (3) SLL: 3 << 2 => 12
    A = 32'd3; B = 32'd2;
    SubArith = 1'b0;
    ALUSelect = 3'b001; Funct3 = 3'b001; BALUControl = 3'b000; OpD=7'b0; Funct7=7'b0;
    #5   $display("%4dns | %0d | %0d | 001 |  0  | %0d | %0d", $time, A, B, Sum, ALUResult);

    // (4) SLT: 2 < 5 => 1
    A = 32'd2; B = 32'd5;
    ALUSelect = 3'b010; SubArith = 1'b1;  // subtraction for flag
    #5   $display("%4dns | %0d | %0d | 010 |  1  | %0d | %0d", $time, A, B, Sum, ALUResult);

    // (5) SLTU: -1 < 1 unsigned => 0
    A = -1; B = 32'd1;
    ALUSelect = 3'b011; SubArith = 1'b1;
    #5   $display("%4dns | %0d | %0d | 011 |  1  | %0d | %0d", $time, A, B, Sum, ALUResult);

    // (6) XOR: F0F0_... ^ 0F0F_... => FFFF_FFFF
    A = 32'hF0F0_F0F0; B = 32'h0F0F_0F0F;
    ALUSelect = 3'b100; SubArith = 1'b0;
    #5   $display("%4dns | %h | %h | 100 |  0  | %h | %h", $time, A, B, Sum, ALUResult);

    // (7) OR: reuse A, B
    ALUSelect = 3'b110;
    #5   $display("%4dns | %h | %h | 110 |  0  | %h | %h", $time, A, B, Sum, ALUResult);

    // (8) AND:
    ALUSelect = 3'b111;
    #5   $display("%4dns | %h | %h | 111 |  0  | %h | %h", $time, A, B, Sum, ALUResult);

    // Finish up
    #5 $finish;
  end

endmodule

