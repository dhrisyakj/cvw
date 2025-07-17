
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
    // output logic                 done
    // output logic [ACC_WIDTH-1:0] count
);

    logic [IN_WIDTH:0]                 product = a * b;
    logic [ACC_WIDTH:0]              result;
    
    always_ff @(posedge clk) begin
        // done <= 1'b0;
        if (acc_rst) begin
            acc <= '0;
        end else begin
            if (valid) begin
               result = acc + product;
                acc <= result[ACC_WIDTH-1:0]; // Accumulation
                // done <= 1'b1;
            end                  
        end
    end
        
   /*
    always_ff @(posedge clk) begin   
      if (acc_rst)
        result <= '0;
      else
        result <= acc; // Writing the result of accumulation into a result
    end 
   */
endmodule

