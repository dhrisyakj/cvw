`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 03:42:53 PM
// Design Name: 
// Module Name: datapath_tb
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

import cvw::*;  // bring cvw_t into scope


`timescale 1ns/1ps

module tb_datapath;
  
  // Parameter configuration for the datapath (32-bit base RV32I core with common bitmanip extensions)


  // Clock and reset
  reg clk;
  reg reset;

  // --- Datapath inputs as regs ---
  reg [2:0]        ImmSrcD;
  reg [31:0]       InstrD;
  reg [4:0]        Rs1D, Rs2D, Rs2E;
  reg [P.XLEN-1:0] PCE, PCLinkE;
  reg [2:0]        Funct3E;
  reg [6:0]        Funct7E;
  reg              StallE, FlushE;
  reg [1:0]        ForwardAE, ForwardBE;
  reg              W64E, UW64E;
  reg              SubArithE;
  reg              ALUSrcAE, ALUSrcBE;
  reg              ALUResultSrcE;
  reg [2:0]        ALUSelectE;
  reg              JumpE;
  reg              BranchSignedE;
  reg [3:0]        BSelectE, ZBBSelectE;
  reg [2:0]        BALUControlE;
  reg              BMUActiveE;
  reg [1:0]        CZeroE;
  reg              StallM, FlushM;
  reg              FWriteIntM, FCvtIntW;
  reg [P.XLEN-1:0] FIntResM;
  reg              StallW, FlushW;
  reg              RegWriteW, IntDivW, SquashSCW;
  reg [2:0]        ResultSrcW;
  reg [P.XLEN-1:0] FCvtIntResW, ReadDataW, CSRReadValW, MDUResultW, FIntDivResultW;
  reg              mac_validE;
  reg [4:0]        RdW;

  // --- Datapath outputs as wires ---
  wire [1:0]        FlagsE;
  wire [P.XLEN-1:0] IEUAdrE;
  wire [P.XLEN-1:0] ForwardedSrcAE;
  wire [P.XLEN-1:0] ForwardedSrcBE;
  wire [P.XLEN-1:0] SrcAM;
  wire [P.XLEN-1:0] WriteDataM;

 logic [P.XLEN-1:0] R1D, R2D;
  // Instantiate the datapath module
  datapath #(P) dut (
    .clk(clk),
    .reset(reset),
    .ImmSrcD(ImmSrcD),
    .InstrD(InstrD),
    .Rs1D(Rs1D),
    .Rs2D(Rs2D),
    .Rs2E(Rs2E),
    .PCE(PCE),
    .PCLinkE(PCLinkE),
    .Funct3E(Funct3E),
    .Funct7E(Funct7E),
    .StallE(StallE),
    .FlushE(FlushE),
    .ForwardAE(ForwardAE),
    .ForwardBE(ForwardBE),
    .W64E(W64E),
    .UW64E(UW64E),
    .SubArithE(SubArithE),
    .ALUSrcAE(ALUSrcAE),
    .ALUSrcBE(ALUSrcBE),
    .ALUResultSrcE(ALUResultSrcE),
    .ALUSelectE(ALUSelectE),
    .JumpE(JumpE),
    .BranchSignedE(BranchSignedE),
    .BSelectE(BSelectE),
    .ZBBSelectE(ZBBSelectE),
    .BALUControlE(BALUControlE),
    .BMUActiveE(BMUActiveE),
    .CZeroE(CZeroE),
    .FlagsE(FlagsE),
    .IEUAdrE(IEUAdrE),
    .ForwardedSrcAE(ForwardedSrcAE),
    .ForwardedSrcBE(ForwardedSrcBE),
    .StallM(StallM),
    .FlushM(FlushM),
    .FWriteIntM(FWriteIntM),
    .FCvtIntW(FCvtIntW),
    .FIntResM(FIntResM),
    .SrcAM(SrcAM),
    .WriteDataM(WriteDataM),
    .StallW(StallW),
    .FlushW(FlushW),
    .RegWriteW(RegWriteW),
    .IntDivW(IntDivW),
    .SquashSCW(SquashSCW),
    .ResultSrcW(ResultSrcW),
    .FCvtIntResW(FCvtIntResW),
    .ReadDataW(ReadDataW),
    .CSRReadValW(CSRReadValW),
    .MDUResultW(MDUResultW),
    .FIntDivResultW(FIntDivResultW),
    .mac_validE(mac_validE),
    .RdW(RdW)
  );

  // Clock generation: 100 MHz
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset sequence
  initial begin
    reset = 1;
    #20 reset = 0;
  end

  // Test stimulus
  initial begin
    // Initialize all inputs to zero
    {ImmSrcD, InstrD, Rs1D, Rs2D, Rs2E, PCE, PCLinkE, Funct3E, Funct7E,
     StallE, FlushE, ForwardAE, ForwardBE, W64E, UW64E, SubArithE,
     ALUSrcAE, ALUSrcBE, ALUResultSrcE, ALUSelectE, JumpE, BranchSignedE,
     BSelectE, ZBBSelectE, BALUControlE, BMUActiveE, CZeroE,
     StallM, FlushM, FWriteIntM, FCvtIntW, FIntResM,
     StallW, FlushW, RegWriteW, IntDivW, SquashSCW,
     ResultSrcW, FCvtIntResW, ReadDataW, CSRReadValW, MDUResultW,
     FIntDivResultW, mac_validE, RdW} = '0;

    // Wait for reset deassertion
    @(negedge reset);
 
  dut.R1D = 64'd4;
    // Example Test: ADD x3 = x1 + x2
    InstrD    = 32'b1000000_00010_00001_000_00011_0101011; // add x3,x1,x2
    ImmSrcD   = 3'd0;
    Rs1D      = 5'd1;
    Rs2D      = 5'd2;

    StallE    = 0;
    FlushE    = 0;
    ForwardAE = 2'b00;
    ForwardBE = 2'b00;

    #20;
    $display("[ADD] IEUAdrE = %0h, FlagsE = %b", IEUAdrE, FlagsE);

    #100;
    $finish;
  end
endmodule

