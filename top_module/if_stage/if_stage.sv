`timescale 1ns / 1ps

//module if_stage (
//    input  logic        clk,
//    input  logic        reset,
   
//    output logic [31:0] instru_ction
//);

//    logic [31:0] pc_in;
//    logic [31:0] pc_out;

//    // PC
//    pc dut (
//        clk,
//        reset,
//        pc_in,
//        pc_out
//    );

//    // PC + 4
//    adder but (
//        pc_out,
//        pc_in
//    );

//    // Instruction Memory
//    inst_mem dum (
//        pc_out,
//        instru_ction
//    );

//endmodule





module if_stage (
    input  logic        clk,
    input  logic        reset,
    input logic[31:0]pc_in,
    output logic[31:0]pc_4,
    output logic [31:0] instru_ction,
     output   logic [31:0] pc_out

);


    // PC
    pc dut (
        clk,
        reset,
        pc_in,
        pc_out
    );

    // PC + 4
    adder but (
        pc_out,
        pc_4
    );

    // Instruction Memory
    inst_mem dum (
        pc_out,
        instru_ction
    );

endmodule