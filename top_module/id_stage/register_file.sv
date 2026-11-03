`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 13:12:09
// Design Name: 
// Module Name: register_file
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


`timescale 1ns / 1ps

module register_file (
    input  logic        clk,
    input  logic        reset,

    // Read addresses
    input  logic [4:0]  rs1,
    input  logic [4:0]  rs2,

    // Read data
    output logic [31:0] read_data1,
    output logic [31:0] read_data2,

    // Write port
    input  logic        reg_write,
    input  logic [4:0]  rd,
    input  logic [31:0] write_data
);

    // 32 registers, each 32 bits
    logic [31:0] registers [0:31];

    integer i;

    // Write operation
    always_ff @(posedge clk or posedge reset) begin

        if (reset) begin

            for (i = 0; i < 32; i = i + 1)
                registers[i] <= 32'd0;

        end
        else begin

            // x0 must always remain zero
            if (reg_write && (rd != 5'd0))
                registers[rd] <= write_data;

        end

    end

    // Read operation
    always_comb begin

        // x0 always reads as zero
        if (rs1 == 5'd0)
            read_data1 = 32'd0;
        else
            read_data1 = registers[rs1];

        if (rs2 == 5'd0)
            read_data2 = 32'd0;
        else
            read_data2 = registers[rs2];

    end

endmodule
