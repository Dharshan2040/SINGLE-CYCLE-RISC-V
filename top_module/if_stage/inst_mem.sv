`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 09:22:42
// Design Name: 
// Module Name: inst_mem
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

module inst_mem (
    input  logic [31:0] address,
    output logic [31:0] instruction
);

    // 256 locations, each 32 bits
    logic [31:0] memory [0:255];

    // Load machine code from external file
    initial begin
        $readmemh("instruction.mem", memory);
    end

    // Address is byte address.
    // Since each instruction is 4 bytes:
    // 0  -> memory[0]
    // 4  -> memory[1]
    // 8  -> memory[2]
    // 12 -> memory[3]
    assign instruction = memory[address[9:2]];

endmodule