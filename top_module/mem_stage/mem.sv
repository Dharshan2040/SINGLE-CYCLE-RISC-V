`timescale 1ns / 1ps

module mem_stage (
    input logic        clk,
    input logic        reset,Z,B,

    input logic [31:0] alu_out,
    input logic [31:0] rs2,pc_pu_b,pc_4p,

    input logic        MemRead,
    input logic        MemWrite,

    output logic [31:0] read_data,pc_n
);
logic sel;
    data_memory MEM (
        .clk(clk),
        .reset(reset),

        .address(alu_out),
        .write_data(rs2),

        .MemRead(MemRead),
        .MemWrite(MemWrite),

        .read_data(read_data)
    );
    and_gate nut (B,Z,sel);
    mux mut (pc_4p,pc_pu_b,pc_n,sel);

endmodule
