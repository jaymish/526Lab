/**************************************************************************************************
***												***
*** EE 526 L Experiment #2					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #2  Change in Waveform due to delay						***
***												***
***************************************************************************************************
***  Filename: lab2_1.v				     	      Created by Jaymish patel, 2/9/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the case 2 of the given circuit in the lab manual			***
***												***
**************************************************************************************************/`timescale 1 ns / 100ps

//defination of constant
`define PRIMARY_OUT	5
`define FAN_OUT_1	0.5
`define FAN_OUT_2	1
`define TIME_DELAY_1	1
`define TIME_DELAY_2	2
`define TIME_DELAY_3	3

module lab2(in1, in2, out1);
//out1 - output signal
//in1, in2 - input signals


	//declaring the inputs output and wires used
	input in1,in2;
	output out1;
	wire NT,A1,A2,O1;

	//model of the circuit 
	not #(`TIME_DELAY_1 + `FAN_OUT_2) NOT1(NT,in1);
	and #(`TIME_DELAY_2 + `FAN_OUT_1) AND1(A1,in2,in1);
	and #(`TIME_DELAY_2 + `FAN_OUT_1) AND2(A2,in1,NT);
	nand #(`TIME_DELAY_3 + `PRIMARY_OUT) NAND1(out1,NT,A1,A2);

endmodule
