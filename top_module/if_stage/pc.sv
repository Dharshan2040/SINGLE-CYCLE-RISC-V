`timescale 1ns / 1ps

module pc (
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] a,
    output logic [31:0] y
);
always_ff @(posedge clk or posedge reset) begin
    if (reset)
        y <= 32'd0;
    else
        y <= a;
end
endmodule