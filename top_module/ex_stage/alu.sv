//`timescale 1ns / 1ps

//module alu (
//    input  logic [31:0] a,
//    input  logic [31:0] b,
//    input  logic [3:0]  alu_op,

//    output logic [31:0] result
//);

//    always_comb begin

//        case (alu_op)

//            // ADD
//            4'b0000: begin
//                result = a + b;
//            end

//            // SUB
//            4'b0001: begin
//                result = a - b;
//            end

//            // AND
//            4'b0010: begin
//                result = a & b;
//            end

//            // OR
//            4'b0011: begin
//                result = a | b;
//            end

//            // XOR
//            4'b0100: begin
//                result = a ^ b;
//            end

//            // SLT
//            4'b0101: begin
//                if ($signed(a) < $signed(b))
//                    result = 32'd1;
//                else
//                    result = 32'd0;
//            end

//            // Default
//            default: begin
//                result = 32'd0;
//            end

//        endcase

//    end

//endmodule




`timescale 1ns / 1ps

module alu (
    input  logic [31:0] a,
    input  logic [31:0] b,
    input  logic [3:0]  alu_op,

    output logic [31:0] result,
    output logic        Zero
);

    always_comb begin

        case (alu_op)

            // ADD
            4'b0000: begin
                result = a + b;
            end

            // SUB
            4'b0001: begin
                result = a - b;
            end

            // AND
            4'b0010: begin
                result = a & b;
            end

            // OR
            4'b0011: begin
                result = a | b;
            end

            // XOR
            4'b0100: begin
                result = a ^ b;
            end

            // SLT
            4'b0101: begin
                if ($signed(a) < $signed(b))
                    result = 32'd1;
                else
                    result = 32'd0;
            end

            // Default
            default: begin
                result = 32'd0;
            end

        endcase

        // Zero flag
        if (result == 32'd0)
            Zero = 1'b1;
        else
            Zero = 1'b0;

    end

endmodule