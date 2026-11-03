module wb_stage(input logic[31:0]alu_out,mem_out,
output logic[31:0] wb_out,input logic memtoreg

    );
mux aut (alu_out,mem_out,wb_out,memtoreg);
endmodule
