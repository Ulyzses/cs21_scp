`timescale 1ns / 1ps

module alu(input  logic [31:0] a, b,
           input  logic [3:0]  alucontrol,
           output logic [31:0] result,
           output logic        zero);
 
  logic [31:0] diff;
  
  assign diff = a - b;
  
  always_comb
    case (alucontrol)
      4'b0000: result = a & b;       // and
      4'b0001: result = a | b;       // or
      4'b0010: result = a + b;       // add
      4'b0011: result = a ^ b;       // xor
      4'b0100: result = {b, 16'b0};  // lui
      4'b0101: result = b >> a[4:0]; // srl
      4'b0110: result = diff;        // sub
      4'b0111: result = diff[31];    // slt
      4'b1000: result = a[31] !== 0 || a === 0; // bgtz
      4'b1001: result = b;           // li
    endcase

  assign zero = (result == 32'b0);
endmodule
