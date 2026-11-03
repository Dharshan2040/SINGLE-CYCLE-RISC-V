//`timescale 1ns / 1ps

//module ID_stage (
//    input logic        clk,
//    input logic        reset,
//    input logic [31:0] instruction,

//    // From WB stage
//    input logic [31:0] write_data,

//    // To EX stage
//    output logic [31:0] rs1,
//    output logic [31:0] rs2,
//    output logic [31:0] imme,

//    output logic [2:0]  funct3,
//    output logic [6:0]  funct7,

//    output logic        ALUSrc,
//    output logic        MemRead,
//    output logic        MemWrite,
//    output logic        MemToReg,
//    output logic [1:0]  ALUop
//);

//    // Internal signals
//    logic [6:0] opcode;

//    logic [4:0] rs1_in;
//    logic [4:0] rs2_in;
//    logic [4:0] rd;

//    logic RegWrite;


//    // -----------------------------------------
//    // Instruction Decoder
//    // -----------------------------------------

//    instruction_decoder DEC (
//        .instruction(instruction),

//        .opcode(opcode),
//        .rs1(rs1_in),
//        .rs2(rs2_in),
//        .rd(rd),
//        .funct3(funct3),
//        .funct7(funct7)
//    );


//    // -----------------------------------------
//    // Register File
//    // -----------------------------------------

//    register_file REG (
//        .clk(clk),
//        .reset(reset),

//        .rs1(rs1_in),
//        .rs2(rs2_in),

//        .read_data1(rs1),
//        .read_data2(rs2),

//        .reg_write(RegWrite),
//        .rd(rd),
//        .write_data(write_data)
//    );


//    // -----------------------------------------
//    // Immediate Generator
//    // -----------------------------------------

//    immediate_generator IMM (
//        .instruction(instruction),
//        .immediate(imme)
//    );


//    // -----------------------------------------
//    // Control Unit
//    // -----------------------------------------

//    control_unit CTRL (
//        .opcode(opcode),

//        .RegWrite(RegWrite),
//        .ALUSrc(ALUSrc),
//        .MemRead(MemRead),
//        .MemWrite(MemWrite),
//        .MemToReg(MemToReg),
//        .ALUOp(ALUop)
//    );

//endmodule

`timescale 1ns / 1ps

module ID_stage (
    input logic        clk,
    input logic        reset,
    input logic [31:0] instruction,

    // From WB stage
    input logic [31:0] write_data,

    // To EX stage
    output logic [31:0] rs1,
    output logic [31:0] rs2,
    output logic [31:0] imme,

    output logic [2:0]  funct3,
    output logic [6:0]  funct7,

    output logic        ALUSrc,
    output logic        MemRead,
    output logic        MemWrite,
    output logic        MemToReg,
    output logic        Branch,
    output logic [1:0]  ALUop
);

    // Internal signals
    logic [6:0] opcode;

    logic [4:0] rs1_in;
    logic [4:0] rs2_in;
    logic [4:0] rd;

    logic RegWrite;


    // -----------------------------------------
    // Instruction Decoder
    // -----------------------------------------

    instruction_decoder DEC (
        .instruction(instruction),

        .opcode(opcode),
        .rs1(rs1_in),
        .rs2(rs2_in),
        .rd(rd),
        .funct3(funct3),
        .funct7(funct7)
    );


    // -----------------------------------------
    // Register File
    // -----------------------------------------

    register_file REG (
        .clk(clk),
        .reset(reset),

        .rs1(rs1_in),
        .rs2(rs2_in),

        .read_data1(rs1),
        .read_data2(rs2),

        .reg_write(RegWrite),
        .rd(rd),
        .write_data(write_data)
    );


    // -----------------------------------------
    // Immediate Generator
    // -----------------------------------------

    immediate_generator IMM (
        .instruction(instruction),
        .immediate(imme)
    );


    // -----------------------------------------
    // Control Unit
    // -----------------------------------------

    control_unit CTRL (
        .opcode(opcode),

        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .Branch(Branch),
        .ALUOp(ALUop)
    );

endmodule