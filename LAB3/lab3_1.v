`timescale 1ns/100ps 

`include "lab3.v"

`define PRIMARY_OUT	2
`define FAN_OUT_1	0.5
`define FAN_OUT_2	0.8
`define FAN_OUT_3	1
`define TIME_DELAY_1	3
`define TIME_DELAY_2	4
`define TIME_DELAY_3	5

module dff(q, qbar, clock, data, clear);
output q, qbar;
input clock, data, clear;
wire cbar,clr,clkbar,clk,dbar,d,sbar,s,r,rbar;

not #(`TIME_DELAY_1 + `FAN_OUT_1) clr1(cbar,clear);
not #(`TIME_DELAY_1 + `FAN_OUT_3) clr2(clr,cbar);

not #(`TIME_DELAY_1 + `FAN_OUT_1) clk1(clkbar,clock);
not #(`TIME_DELAY_1 + `FAN_OUT_2) clk2(clk,clkbar);

not #(`TIME_DELAY_1 + `FAN_OUT_1) data1(dbar,data);
not #(`TIME_DELAY_1 + `FAN_OUT_1) data2(d,dbar);

SR_Latch2 #(.delay_nand1(`TIME_DELAY_2 + `FAN_OUT_1), .delay_nand2(`TIME_DELAY_3 + `FAN_OUT_3)) sr1(sbar,s,1'b1,rbar,clr,clk);
SR_Latch2 #(.delay_nand1(`TIME_DELAY_3 + `FAN_OUT_2), .delay_nand2(`TIME_DELAY_3 + `FAN_OUT_2)) sr2(r,rbar,clk,s,clr,d);

SR_Latch2 #(.delay_nand1(`TIME_DELAY_2 + `FAN_OUT_2), .delay_nand2(`TIME_DELAY_3 + `FAN_OUT_2)) sr3(q,qbar,1'b1,s,clr,r);


endmodule
