`timescale 1ns / 1ps

module maindec(input  logic [5:0] op,
               output logic       memtoreg, memwrite,
               output logic       branch, alusrc,
               output logic       regdst, regwrite,
               output logic       jump,
               output logic [1:0] aluop,
               output logic       immsrc);

  logic [9:0] controls;

  assign {regwrite, regdst, alusrc, branch, memwrite,
          memtoreg, jump, aluop, immsrc} = controls;

  always_comb
    case(op)
      6'b000000: controls <= 10'b1100000100; // RTYPE
      6'b100011: controls <= 10'b1010010001; // LW
      6'b101011: controls <= 10'b0010100001; // SW
      6'b000100: controls <= 10'b0001000011; // BEQ
      6'b001000: controls <= 10'b1010000001; // ADDI
      6'b000010: controls <= 10'b0000001001; // J
      default:   controls <= 10'bxxxxxxxxxx; // illegal op
    endcase
endmodule