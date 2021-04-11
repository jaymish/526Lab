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

`include "register.v"
`include "adder.v"
`include "multiplier.v"

module second_level(DATA_IN, CLK, C0, C1, OUT, reg_out);
//DATA_IN - data input
//CLK - input signals
//R - data output 

//declaring the inputs output and parameters used
parameter width=1;
input CLK;
input [width-1:0] DATA_IN,C0,C1; 
wire [width-1:0] reg1;
output [width-1:0] reg_out;
wire [2*width-1:0] mul1,mul2;
output [2*width:0] OUT; 

	//always @(posedge CLK)//always block runs at posedge of CLK	
	//begin
		register #(width) R1(CLK, DATA_IN, reg1);
		multiplier #(width) M1(C0,reg1,mul1);
		
		register #(width) R2(CLK, reg1, reg_out);
		multiplier #(width) M2(C1,reg_out,mul2);
		
		adder #(2*width) A1(mul1, mul2, OUT);
	//end
endmodule