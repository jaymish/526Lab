/**************************************************************************************************
***												***
*** EE 526 L Experiment #3					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #3  model an edge triggered flip-flop						***
***												***
***************************************************************************************************
***  Filename: lab3.v				     	      Created by Jaymish patel, 2/18/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the SR latch                                      			***
***												***
**************************************************************************************************/
`timescale 100ps/100ps 

//defination of constant
`define PRIMARY_OUT	20
`define FAN_OUT_1	5
`define FAN_OUT_2	8
`define FAN_OUT_3	10
`define TIME_DELAY_1	30
`define TIME_DELAY_2	40
`define TIME_DELAY_3	50

module SR_Latch2(Q, Qnot, s0,s1, r0,r1);
//Q,Qmot - output signal
//s0,s1,r0,r1 - input signals

	//declaring the inputs output and parameter used
  	output Q, Qnot;
	input s0, s1, r0, r1;
	parameter delay_nand1=5.8,delay_nand2=5.8;
	
  	//model of the circuit 
	nand #(delay_nand1) A1(Q,s0,s1,Qnot);
	nand #(delay_nand2) A2(Qnot,r0,r1,Q);

endmodule
