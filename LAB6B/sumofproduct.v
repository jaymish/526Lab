/**************************************************************************************************
***												***
*** EE 526 L Experiment #6B					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #6B  model an scalable register  							***
***												***
***************************************************************************************************
***  Filename: register.v			     	      Created by Jaymish patel, 3/29/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the scalable register        						***
***												***
**************************************************************************************************/
`timescale 1ns/1ns 

`include "second_level.v"


module SOP(DATA_IN, CLK, C0, C1, C2, C3, OUT);
//DATA_IN - data input
//CLK - input signals
//R - data output 

//declaring the inputs output and parameters used
parameter width=1;
input CLK;
input [width-1:0] DATA_IN,C0,C1,C2,C3; 
wire [width-1:0] reg1,reg_out;
//reg [width-1:0] reg_out;
wire [2*width-1:0] mul1,mul2;
wire [2*width:0] S1_OUT,S2_OUT; 
output [2*width+1:0] OUT; 
		
		second_level #(width) S1(DATA_IN, CLK, C0, C1, S1_OUT, reg_out);
		second_level #(width) S2(reg_out, CLK, C2, C3, S2_OUT, reg1);
		
		adder #(2*width+1) A1(S1_OUT, S2_OUT, OUT);
		
endmodule