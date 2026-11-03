module mux(input logic[31:0]a,b,output logic[31:0]y,input logic sel);
assign y= sel?b:a;

endmodule
