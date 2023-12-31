`timescale 1ns / 1ps

module maindec(input  logic [5:0] op,
               output logic       memtoreg, memwrite,
               output logic       branch, alusrc,
               output logic       regdst, regwrite,
               output logic       jump,
               output logic [2:0] aluop,
               output logic       immsrc);

  logic [10:0] controls;

  assign {regwrite, regdst, alusrc, branch, memwrite,
          memtoreg, jump, aluop, immsrc} = controls;

  always_comb
    case(op)
      6'b000000: controls <= 11'b11000000100; // RTYPE
      6'b010001: controls <= 11'b10100001100; // LI
      6'b011101: controls <= 11'b00010001011; // BGTZ
      6'b100011: controls <= 11'b10100100001; // LW
      6'b101011: controls <= 11'b00101000001; // SW
      6'b000100: controls <= 11'b00010000011; // BEQ
      6'b001000: controls <= 11'b10100000001; // ADDI
      6'b001110: controls <= 11'b10100000110; // XORI
      6'b001111: controls <= 11'b10100001000; // LUI
      6'b000010: controls <= 11'b00000010001; // J
      default:   controls <= 11'bxxxxxxxxxxx; // illegal op
    endcase
endmodule