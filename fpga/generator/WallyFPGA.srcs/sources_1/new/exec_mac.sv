`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2025 02:00:21 PM
// Design Name: 
// Module Name: exec_mac
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

`include "/home/sidharth/Wally/cvw/config/shared/config-shared.vh"

module exec_mac #(
    parameter int DATA_WIDTH = 32
)(
    input  logic                   clk,
    input  logic                   rst,
    input  logic                   start,
    input  logic [`RegBus]         base_addr1,
    input  logic [`RegBus]         base_addr2,
    input  logic [`RegBus]         count,
    input  logic [`RegAddrBus]     mac_dst_reg_addr_i,
    input  logic [`RegBus]         mem_data,
    output logic [`RegAddrBus]     mac_dst_reg_addr_o,
    output logic [`RegBus]         mem_addr,
    output logic                   mem_req,
    output logic                   busy,
    output logic                   done,
    output logic [`RegBus]         acc_out
);

    // State machine definition using SystemVerilog enum
    typedef enum logic [2:0] {
        IDLE  = 3'd0,
        READ1 = 3'd1,
        READ2 = 3'd2,
        WRITE = 3'd3,
        MAC   = 3'd4,
        DONE  = 3'd5
    } state_t;

    state_t state;

    // Internal signals
    logic [`RegBus] rf1_wdata;
    logic [`RegBus] rf2_wdata;
    logic [`RegBus] final_count;
    logic [`RegBus] addr1, addr2;
    logic [DATA_WIDTH-1:0] acc;

    // Sequential state machine
    always_ff @(posedge clk) begin
        if (!rst) begin
            state    <= IDLE;
            busy     <= 1'b0;
            done     <= 1'b0;
            acc      <= '0;
            acc_out  <= '0;
            mem_req  <= `RIB_NREQ;
            mem_addr <= '0;
        end else begin
            done <= 1'b0;
            case (state)
                IDLE: begin
                    if (start) begin
                        busy <= 1'b1;
                        final_count <= 32'd8192;
                        if ((count != '0) && (count <= final_count)) begin
                            final_count <= count;
                        end
                        acc <= '0;
                        mac_dst_reg_addr_o <= mac_dst_reg_addr_i;
                        addr1 <= base_addr1;
                        addr2 <= base_addr2;
                        state <= READ1;
                    end
                end
                READ1: begin
                    mem_addr <= addr1;
                    mem_req  <= `RIB_REQ;
                    state    <= READ2;
                end
                READ2: begin
                    rf1_wdata <= mem_data;
                    mem_addr  <= addr2;
                    mem_req   <= `RIB_REQ;
                    state     <= WRITE;
                end
                WRITE: begin
                    rf2_wdata <= mem_data;
                    mem_req   <= `RIB_NREQ;
                    state     <= MAC;
                end
                MAC: begin
                    acc <= acc + (rf1_wdata * rf2_wdata);
                    if (final_count == 1) begin
                        state <= DONE;
                    end else begin
                        final_count <= final_count - 1;
                        addr1 <= addr1 + (DATA_WIDTH/8);
                        addr2 <= addr2 + (DATA_WIDTH/8);
                        state <= READ1;
                    end
                end
                DONE: begin
                    busy     <= 1'b0;
                    done     <= 1'b1;
                    mem_req  <= `RIB_NREQ;
                    acc_out  <= acc;
                    state    <= IDLE;
                end
            endcase
        end
    end

endmodule