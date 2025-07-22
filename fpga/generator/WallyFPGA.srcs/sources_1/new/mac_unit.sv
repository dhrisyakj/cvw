
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 01:59:35 PM
// Design Name: 
// Module Name: mac_unit
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

module mac_unit#(
    parameter int IN_WIDTH   = 64,
    parameter int ACC_WIDTH  = 64 
) (
    input  logic                      clk,
    input  logic                      acc_rst,    // reset the accumulator
    input  logic                      valid,
    input  logic [IN_WIDTH-1:0]       a,
    input  logic [IN_WIDTH-1:0]       b,
    output logic [ACC_WIDTH-1:0]      acc

);

    logic [IN_WIDTH-1:0]                 product= a * b; // Multiplication
    logic [ACC_WIDTH-1:0]              result;
  
    
    always_ff @(posedge clk) begin  
        if (acc_rst) begin
            acc <= 64'b0;
        end else begin
            if (valid) begin
               acc <= acc + product;  // Accumualtion 
            end                  
        //end
    end
        
   end
endmodule

