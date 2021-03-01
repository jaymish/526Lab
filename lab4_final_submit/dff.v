/**************************************************************************************************
***												***
*** EE 526 L Experiment #4					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #4  model an 8-bit register  							***
***												***
***************************************************************************************************
***  Filename: dff.v				     	      Created by Jaymish patel, 2/18/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the D ff using SR latch previously modeled        			***
***												***
**************************************************************************************************/
`timescale 100ps/100ps 

`include "sr.v"

//defination of constant
`define PRIMARY_OUT	20
`define FAN_OUT_1	5
`define FAN_OUT_2	8
`define FAN_OUT_3	10
`define TIME_DELAY_1	30
`define TIME_DELAY_2	40
`define TIME_DELAY_3	50

module dff(q, qbar, clock, data, clear);
//q,qbar - output signal
//clock, data, clear - input signals

	//declaring the inputs output and wires used
	output q, qbar;
	input clock, data, clear;
	wire cbar,clr,clkbar,clk,dbar,d,sbar,s,r,rbar;


	//model of the circuit
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
