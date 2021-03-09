`timescale 1ns/1ns

module dff(Q,clock, data, clear);

input clock,data,clear;
output reg Q;

always @(negedge clock or negedge clear)
  begin 
    if(clear==1'b0)
      Q<=1'b0;
    else
      Q<=data;
  end

endmodule