`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2026 21:08:56
// Design Name: 
// Module Name: adder_branc
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


module adder_branc(
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] y
);

    assign y = a + b;
endmodule
