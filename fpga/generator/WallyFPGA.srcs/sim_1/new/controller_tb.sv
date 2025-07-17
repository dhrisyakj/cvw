
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2025 01:27:45 PM
// Design Name: 
// Module Name: controller_tb
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

`timescale 1ns/1ps
 `include "/home/sidharth/RISC-V/wally_core/cvw/fpga/src/CopiedFiles_do_not_add_to_repo/config/config.vh"
`include "/home/sidharth/RISC-V/wally_core/cvw/config/shared/parameter-defs.vh"
import cvw::*;    // bring cvw_t into scope

module controller_tb;

  //------------------------------------------------------------------------
  // 1) Parameters & DUT declaration
  //------------------------------------------------------------------------
  // Minimal parameter set: RV64GC, all ext’s enabled for demonstration


  // Inputs
  logic         clk, reset;
  logic         StallD, FlushD, StallE, FlushE, StallM, FlushM, StallW, FlushW;
  logic [31:0]  InstrD;
  logic [1:0]   STATUS_FS;
  logic [3:0]   ENVCFG_CBE;
  logic         IllegalIEUFPUInstrD;
  logic [1:0]   FlagsE;
  logic         FWriteIntE, FCvtIntE;

  // Outputs (we'll sample a few)
  logic [2:0]   ImmSrcD;
  logic         JumpD, BranchD;
  logic         PCSrcE;
  logic [2:0]   ALUSelectE;
  logic [6:0]   Funct7E;
  logic [1:0]   ForwardAE;
  logic        ALUResultSrcE, mac_validE ;

  // Instantiate DUT
  controller #( .P(P) ) dut (
    .clk(clk), .reset(reset),
    .StallD(StallD), .FlushD(FlushD),
    .InstrD(InstrD),
    .STATUS_FS(STATUS_FS),
    .ENVCFG_CBE(ENVCFG_CBE),
    .ImmSrcD(ImmSrcD),
    .IllegalIEUFPUInstrD(IllegalIEUFPUInstrD),
    .IllegalBaseInstrD(),  // unused here
    .JumpD(JumpD),
    .BranchD(BranchD),
    .StructuralStallD(), .LoadStallD(), .StoreStallD(),
    .Rs1D(), .Rs2D(), .Rs2E(),
    .StallE(StallE), .FlushE(FlushE),
    .FlagsE(FlagsE),
    .FWriteIntE(FWriteIntE),
    .FCvtIntE(FCvtIntE),
    .PCSrcE(PCSrcE),
    .ALUSrcAE(), .ALUSrcBE(),
    .ALUResultSrcE(ALUResultSrcE), .ALUSelectE(ALUSelectE),
    .Funct3E(), .Funct7E(Funct7E),
    .IntDivE(), .W64E(), .UW64E(),
    .SubArithE(), .JumpE(), .BranchE(),
    .BranchSignedE(), .BSelectE(), .ZBBSelectE(),
    .BALUControlE(), .BMUActiveE(),
    .CZeroE(), .MDUActiveE(), .CMOpM(),
    .IFUPrefetchE(), .LSUPrefetchM(),
    .ForwardAE(ForwardAE), .ForwardBE(),
    .StallM(StallM), .FlushM(FlushM),
    .MemRWE(), .MemRWM(), .CSRReadM(),
    .CSRWriteM(), .PrivilegedM(), .AtomicM(),
    .Funct3M(), .InvalidateICacheM(), .FlushDCacheM(),
    .InstrValidD(), .InstrValidE(), .InstrValidM(),
    .FWriteIntM(), .StallW(StallW), .FlushW(FlushW),
    .RegWriteW(), .IntDivW(), .ResultSrcW(),
    .CSRWriteFenceM(), .RdE(), .RdM(), .RdW() , .mac_validE(mac_validE )
  );

  //------------------------------------------------------------------------
  // 2) Clock & reset
  //------------------------------------------------------------------------
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100 MHz
  end

  initial begin
    // global reset
    reset = 1;
    StallD = 0;
    StallE = 0;
    StallM = 0;
     StallW = 0;
    FlushD = 0;
    FlushE = 0;
    FlushM = 0;
    FlushW = 0;
    STATUS_FS = 2'b00;
    ENVCFG_CBE = 4'd0;
    IllegalIEUFPUInstrD = 0;
    FlagsE = 2'b00;
    FWriteIntE = 0;
    FCvtIntE = 0;
    InstrD = 32'h0;
    #20;
    reset = 0;
    #10;

    //------------------------------------------------------------------------
    // 3) Test cases
    //------------------------------------------------------------------------
    $display("\n--- Test R-type add (opcode=0110011, funct3=000, funct7=0000000) ---");
    apply_instr(7'b0110011, 3'b000, 7'b0000000, 5'd1, 5'd2, 5'd3);
    #10;

    $display("\n--- Test load (opcode=0000011) ---");
    apply_instr(7'b0000011, 3'b010, 7'b0000000, 5'd4, 5'd0, 5'd5);
    #10;

    $display("\n--- Test branch-eq (opcode=1100011, funct3=000) with FlagsE=eq ---");
    FlagsE = 2'b10;  // eq=1, lt=0
    apply_instr(7'b1100011, 3'b000, 7'b0000000, 5'd6, 5'd7, 5'd0);
    #10;
    FlagsE = 2'b00;

    $display("\n--- Test JAL (opcode=1101111) ---");
    apply_instr(7'b1101111, 3'b000, 7'b0000000, 5'd0, 5'd0, 5'd8);
    #10;

    $display("\n--- Test custom MAC (opcode=0101011, funct7=1000000) ---");
    apply_instr(7'b0101011, 3'b000, 7'b1000000, 5'd9, 5'd10, 5'd11);
    #10;

    $display("\nAll tests done.");
    $finish;
  end

  //------------------------------------------------------------------------
  // 4) Task to drive InstrD and display key outputs
  //------------------------------------------------------------------------
  task apply_instr(
    input logic [6:0] opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,
    input logic [4:0] rs1,
    input logic [4:0] rs2,
    input logic [4:0] rd
  );
    begin
      InstrD = {funct7, rs2, rs1, funct3, rd, opcode};
      @(posedge clk);
      #1; // small delay to let outputs settle
      $display("  InstrD = %b", InstrD);
      $display("    JumpD=%0b  BranchD=%0b  ImmSrcD=%0d",
               JumpD, BranchD, ImmSrcD);
      $display("    ALUSelectE=%0d  Funct7E=%b  PCSrcE=%0b   ForwardAE=%0b ALUResultSrcE=%0b mac_validE=%0b mac_validD=%0b",
               ALUSelectE, Funct7E, PCSrcE, ForwardAE, ALUResultSrcE ,mac_validE, dut.mac_validD );
    end
  endtask

endmodule

