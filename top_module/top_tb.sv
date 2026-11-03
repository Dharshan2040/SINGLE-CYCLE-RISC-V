`timescale 1ns / 1ps

module TOP_STAGE_tb;

    logic clk;
    logic reset;

    TOP_STAGE dut (
        .clk(clk),
        .reset(reset)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10;
        reset = 0;

        #220;
        $finish;
    end

    always @(posedge clk) begin
        #1;

        $display(
            "TIME=%0t | PC=%h | INSTR=%h | Branch=%b | Zero=%b | PC4=%h | BranchTarget=%h | NextPC=%h | ALU=%h | MemR=%b | MemW=%b | WriteData=%h | ReadData=%h | MEM[0]=%h | x1=%h | x2=%h | x3=%h | x4=%h | x5=%h | x6=%h | x7=%h | x8=%h | x9=%h | x10=%h | x11=%h | x12=%h | x13=%h",
            
            $time,
            dut.pc_out,
            dut.instruction,
            dut.branch,
            dut.zero,
            dut.pc4,
            dut.pc_p_b,
            dut.pc_in,
            dut.alu_out,
            dut.memread,
            dut.memwrite,
            dut.rs2,
            dut.read_data,
            dut.dut.MEM.memory[0],
            dut.but.REG.registers[1],
            dut.but.REG.registers[2],
            dut.but.REG.registers[3],
            dut.but.REG.registers[4],
            dut.but.REG.registers[5],
            dut.but.REG.registers[6],
            dut.but.REG.registers[7],
            dut.but.REG.registers[8],
            dut.but.REG.registers[9],
            dut.but.REG.registers[10],
            dut.but.REG.registers[11],
            dut.but.REG.registers[12],
            dut.but.REG.registers[13]
        );
    end

endmodule