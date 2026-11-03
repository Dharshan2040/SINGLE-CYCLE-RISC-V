//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 27.09.2026 19:38:27
//// Design Name: 
//// Module Name: TOP_STAGE
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module TOP_STAGE(
//input logic clk,reset
//    );
//    logic[31:0]instruction,rs1,rs2,
//    imme,alu_out,read_data,write_data;
//    logic[6:0]fun7;
//    logic[2:0]fun3;
//    logic memtoreg,memread,memwrite,alu_src;
//    logic[1:0]alu_op;
    
    
//   if_stage aut (clk,reset,instruction);
//   ID_stage but (clk,reset,instruction,write_data,rs1,rs2,imme,fun3,fun7,
//   alu_src,memread,memwrite,memtoreg,alu_op);
//   ex_stage cut (rs1,rs2,imme,alu_op,fun3,fun7,alu_src,alu_out);
//   mem_stage dut (clk,reset,alu_out,rs2,memread,memwrite,read_data);
//   wb_stage eut (alu_out,read_data,write_data,memtoreg);
   
   
//endmodule



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2026 19:38:27
// Design Name: 
// Module Name: TOP_STAGE
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TOP_STAGE(
input logic clk,reset
    );
    logic[31:0]instruction,rs1,rs2,pc_in,pc4,pc_out,pc_p_b,
    imme,alu_out,read_data,write_data;
    logic[6:0]fun7;
    logic[2:0]fun3;
    logic memtoreg,memread,memwrite,alu_src,branch,zero;
    logic[1:0]alu_op;
    
    
   if_stage aut (clk,reset,pc_in,pc4,instruction,pc_out);
   ID_stage but (clk,reset,instruction,write_data,rs1,rs2,imme,fun3,fun7,
   alu_src,memread,memwrite,memtoreg,branch,alu_op);
   ex_stage cut (rs1,rs2,imme,alu_op,fun3,fun7,alu_src,pc_out,alu_out,pc_p_b,zero);
   mem_stage dut (clk,reset,zero,branch,alu_out,rs2,pc_p_b,pc4,memread,memwrite,read_data,pc_in);
   wb_stage eut (alu_out,read_data,write_data,memtoreg);
   
   
endmodule







