`timescale 1ns / 1ps

module alu(input  logic [31:0] a, b,
           input  logic [2:0]  alucontrol,
           output logic [31:0] result,
           output logic        zero);
 
  logic [31:0] diff;
  
  assign diff = a - b;
  
  always_comb
    case (alucontrol)
      3'b000: result = a & b;       // and
      3'b001: result = a | b;       // or
      3'b010: result = a + b;       // add
      3'b011: result = a ^ b;       // xor
      3'b100: result = {b, 16'b0};  // lui
      3'b101: result = b >> a[4:0]; // srl
      3'b110: result = diff;        // sub
      3'b111: result = diff[31];    // slt
    endcase

  assign zero = (result == 32'b0);
endmodule
