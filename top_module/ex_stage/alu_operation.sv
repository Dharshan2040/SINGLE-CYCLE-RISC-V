//`timescale 1ns / 1ps

//module alu_operation (
//    input  logic [1:0] aluop,
//    input  logic [6:0] fun7,
//    input  logic [2:0] fun3,

//    output logic [3:0] alu_op
//);

//    always_comb begin

//        case (aluop)

//            // ADDI, LW, SW
//            2'b00: begin
//                alu_op = 4'b0000;   // ADD
//            end

//            // R-type
//            2'b10: begin

//                case (fun3)

//                    3'b000: begin
//                        if (fun7 == 7'b0100000)
//                            alu_op = 4'b0001;   // SUB
//                        else
//                            alu_op = 4'b0000;   // ADD
//                    end

//                    3'b111: begin
//                        alu_op = 4'b0010;       // AND
//                    end

//                    3'b110: begin
//                        alu_op = 4'b0011;       // OR
//                    end

//                    3'b100: begin
//                        alu_op = 4'b0100;       // XOR
//                    end

//                    3'b010: begin
//                        alu_op = 4'b0101;       // SLT
//                    end

//                    default: begin
//                        alu_op = 4'b0000;
//                    end

//                endcase
//            end

//            default: begin
//                alu_op = 4'b0000;
//            end

//        endcase

//    end

//endmodule


`timescale 1ns / 1ps

module alu_operation (
    input  logic [1:0] aluop,
    input  logic [6:0] fun7,
    input  logic [2:0] fun3,

    output logic [3:0] alu_op
);

    always_comb begin

        case (aluop)

            // ADDI, LW, SW
            2'b00: begin
                alu_op = 4'b0000;   // ADD
            end


            // BEQ
            2'b01: begin
                alu_op = 4'b0001;   // SUB
            end


            // R-type
            2'b10: begin

                case (fun3)

                    // ADD / SUB
                    3'b000: begin
                        if (fun7 == 7'b0100000)
                            alu_op = 4'b0001;   // SUB
                        else
                            alu_op = 4'b0000;   // ADD
                    end

                    // AND
                    3'b111: begin
                        alu_op = 4'b0010;
                    end

                    // OR
                    3'b110: begin
                        alu_op = 4'b0011;
                    end

                    // XOR
                    3'b100: begin
                        alu_op = 4'b0100;
                    end

                    // SLT
                    3'b010: begin
                        alu_op = 4'b0101;
                    end

                    default: begin
                        alu_op = 4'b0000;
                    end

                endcase
            end


            default: begin
                alu_op = 4'b0000;
            end

        endcase

    end

endmodule