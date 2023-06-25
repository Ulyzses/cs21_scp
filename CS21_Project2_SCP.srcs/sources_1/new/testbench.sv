`timescale 1ns / 1ps

module testbench();

  logic         clk;
  logic         reset;
  
  logic [31:0]  writedata, dataadr, instr;
  logic         memwrite;
  
  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, instr, memwrite);
  
  // initialize test
  initial begin
    reset <= 1; #5; reset <= 0;
  end
  
  always begin
    clk <= 1; #5;
    clk <= 0; #5;
  end

endmodule
