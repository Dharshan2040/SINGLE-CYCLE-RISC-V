//`timescale 1ns / 1ps

//module immediate_generator (
//    input  logic [31:0] instruction,
//    output logic [31:0] immediate
//);

//    always_comb begin

//        immediate = 32'd0;

//        case (instruction[6:0])

//            // ADDI - I type
//            7'b0010011: begin

//                immediate = {{20{instruction[31]}},
//                             instruction[31:20]};

//            end

//            // LW - I type
//            7'b0000011: begin

//                immediate = {{20{instruction[31]}},
//                             instruction[31:20]};

//            end

//            // SW - S type
//            7'b0100011: begin

//                immediate = {{20{instruction[31]}},
//                             instruction[31:25],
//                             instruction[11:7]};

//            end

//            // R type
//            7'b0110011: begin

//                immediate = 32'd0;

//            end

//            default: begin

//                immediate = 32'd0;

//            end

//        endcase

//    end

//endmodule




`timescale 1ns / 1ps

module immediate_generator (
    input logic [31:0] instruction,
    output logic [31:0] immediate
);

    always_comb begin

        immediate = 32'd0;

        case (instruction[6:0])

            // ADDI - I type
            7'b0010011: begin

                immediate = {{20{instruction[31]}},
                             instruction[31:20]};

            end


            // LW - I type
            7'b0000011: begin

                immediate = {{20{instruction[31]}},
                             instruction[31:20]};

            end


            // SW - S type
            7'b0100011: begin

                immediate = {{20{instruction[31]}},
                             instruction[31:25],
                             instruction[11:7]};

            end


            // BEQ - B type
            // Shift left 1 is done separately
            7'b1100011: begin

                immediate = {{21{instruction[31]}},
                             instruction[31],
                             instruction[30:25],
                             instruction[11:8]};

            end


            // R type
            7'b0110011: begin

                immediate = 32'd0;

            end


            // Default
            default: begin

                immediate = 32'd0;

            end

        endcase

    end

endmodule