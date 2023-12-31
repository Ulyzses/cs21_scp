`timescale 1ns / 1ps

module controller(input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       memtoreg, memwrite,
                  output logic       pcsrc, alusrc,
                  output logic       regdst, regwrite,
                  output logic       jump,
                  output logic [3:0] alucontrol,
                  output logic       immsrc);

  logic [2:0] aluop;
  logic       branch;

  maindec md(op, memtoreg, memwrite, branch,
             alusrc, regdst, regwrite, jump, aluop, immsrc);
  aludec  ad(funct, aluop, alucontrol);

  assign pcsrc = branch & zero;
endmodule