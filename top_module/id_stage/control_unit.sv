//`timescale 1ns / 1ps

//module control_unit (
//    input  logic [6:0] opcode,

//    output logic       RegWrite,
//    output logic       ALUSrc,
//    output logic       MemRead,
//    output logic       MemWrite,
//    output logic       MemToReg,
//    output logic [1:0] ALUOp
//);

//    always_comb begin

//        // Default values
//        RegWrite = 1'b0;
//        ALUSrc   = 1'b0;
//        MemRead  = 1'b0;
//        MemWrite = 1'b0;
//        MemToReg = 1'b0;
//        ALUOp    = 2'b00;

//        case (opcode)

//            // R-type: ADD, SUB, AND, OR, XOR, SLT
//            7'b0110011: begin
//                RegWrite = 1'b1;
//                ALUSrc   = 1'b0;
//                MemRead  = 1'b0;
//                MemWrite = 1'b0;
//                MemToReg = 1'b0;
//                ALUOp    = 2'b10;
//            end

//            // I-type: ADDI
//            7'b0010011: begin
//                RegWrite = 1'b1;
//                ALUSrc   = 1'b1;
//                MemRead  = 1'b0;
//                MemWrite = 1'b0;
//                MemToReg = 1'b0;
//                ALUOp    = 2'b00;
//            end

//            // Load: LW
//            7'b0000011: begin
//                RegWrite = 1'b1;
//                ALUSrc   = 1'b1;
//                MemRead  = 1'b1;
//                MemWrite = 1'b0;
//                MemToReg = 1'b1;
//                ALUOp    = 2'b00;
//            end

//            // Store: SW
//            7'b0100011: begin
//                RegWrite = 1'b0;
//                ALUSrc   = 1'b1;
//                MemRead  = 1'b0;
//                MemWrite = 1'b1;
//                MemToReg = 1'b0;
//                ALUOp    = 2'b00;
//            end

//            // Unsupported instruction
//            default: begin
//                RegWrite = 1'b0;
//                ALUSrc   = 1'b0;
//                MemRead  = 1'b0;
//                MemWrite = 1'b0;
//                MemToReg = 1'b0;
//                ALUOp    = 2'b00;
//            end

//        endcase

//    end

//endmodule




`timescale 1ns / 1ps

module control_unit (
    input  logic [6:0] opcode,

    output logic       RegWrite,
    output logic       ALUSrc,
    output logic       MemRead,
    output logic       MemWrite,
    output logic       MemToReg,
    output logic       Branch,
    output logic [1:0] ALUOp
);

    always_comb begin

        // Default values
        RegWrite = 1'b0;
        ALUSrc   = 1'b0;
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        MemToReg = 1'b0;
        Branch   = 1'b0;
        ALUOp    = 2'b00;

        case (opcode)

            // R-type: ADD, SUB, AND, OR, XOR, SLT
            7'b0110011: begin
                RegWrite = 1'b1;
                ALUSrc   = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b10;
            end

            // I-type: ADDI
            7'b0010011: begin
                RegWrite = 1'b1;
                ALUSrc   = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

            // Load: LW
            7'b0000011: begin
                RegWrite = 1'b1;
                ALUSrc   = 1'b1;
                MemRead  = 1'b1;
                MemWrite = 1'b0;
                MemToReg = 1'b1;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

            // Store: SW
            7'b0100011: begin
                RegWrite = 1'b0;
                ALUSrc   = 1'b1;
                MemRead  = 1'b0;
                MemWrite = 1'b1;
                MemToReg = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

            // Branch: BEQ
            7'b1100011: begin
                RegWrite = 1'b0;
                ALUSrc   = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                Branch   = 1'b1;
                ALUOp    = 2'b01;
            end

            // Unsupported instruction
            default: begin
                RegWrite = 1'b0;
                ALUSrc   = 1'b0;
                MemRead  = 1'b0;
                MemWrite = 1'b0;
                MemToReg = 1'b0;
                Branch   = 1'b0;
                ALUOp    = 2'b00;
            end

        endcase

    end

endmodule