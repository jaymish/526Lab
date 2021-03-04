`timescale 1ns / 1 ns
`include "aasd.v"
`include "counter.v"

module TOP_Counter(CNT, DATA, CLK, RST, ENA, LOAD);
  output wire [7:0] CNT;
  input CLK, RST, ENA, LOAD;
  input [7:0] DATA;

  counter counter1 (CNT,CLK, AASD_RST, ENA, LOAD,DATA); // counterinstance

  AASD AASD1 (AASD_RST, CLK, RST); // AASDinstance
endmodule