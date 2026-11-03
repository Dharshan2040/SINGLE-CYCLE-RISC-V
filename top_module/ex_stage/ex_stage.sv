//`timescale 1ns / 1ps

//module ex_stage (
//    input logic [31:0] rs1,
//    input logic [31:0] rs2,
//    input logic [31:0] imm,

//    input logic [1:0] aluop,
//    input logic [2:0] fun3,
//    input logic [6:0] fun7,

//    input logic alusrc,

//    output logic [31:0] alu_out
//);

//    logic [31:0] rval;
//    logic [3:0]  al_uop;


//    // ALU input B mux
//    mux dut (
//        rs2,
//        imm,
//        rval,
//        alusrc
//    );


//    // ALU operation control
//    alu_operation but (
//        aluop,
//        fun7,
//        fun3,
//        al_uop
//    );


//    // ALU
//    alu cut (
//        rs1,
//        rval,
//        al_uop,
//        alu_out
//    );

//endmodule



`timescale 1ns / 1ps

module ex_stage (
    input logic [31:0] rs1,
    input logic [31:0] rs2,
    input logic [31:0] imm,

    input logic [1:0] aluop,
    input logic [2:0] fun3,
    input logic [6:0] fun7,

    input logic alusrc,
    input logic[31:0]pc_p,

    output logic [31:0] alu_out,
    output logic[31:0]pc_pulse_b,
    output logic Zero
);

    logic [31:0] rval;
    logic [3:0]  al_uop;
    logic [31:0]shifted_value;


    // ALU input B mux
    mux dut (
        rs2,
        imm,
        rval,
        alusrc
    );


    // ALU operation control
    alu_operation but (
        aluop,
        fun7,
        fun3,
        al_uop
    );


    // ALU
    alu cut (
        rs1,
        rval,
        al_uop,
        alu_out,
        Zero
    );
    
    
    shifter vut (imm,shifted_value);
    adder_branc nut (pc_p,shifted_value,pc_pulse_b);
    

endmodule