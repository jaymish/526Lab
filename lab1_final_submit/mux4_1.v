/**************************************************************************************************
***												***
*** EE 526 L Experiment #1					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #1  Familiarization with Linux and Synopsys VCS					***
***												***
***************************************************************************************************
***  Filename: mux4_1.v				     	      Created by Jaymish patel, 1/29/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models a 4:1 mux:								***
***   Select0      Select1        Out	                                 			***
***      0            0            A    	                             			***
***      0            1            B    	                             			***
***      1	      0		   C    	                             			***
***      1	      1		   D	                                 			***
**************************************************************************************************/
`timescale 1 ns / 1 ns

module mux4_1(out, a, b, c, d, s0, s1);
//out - output signal
//a,b,c,d - input signals
//s0,s1 - select signals

//declaring the inputs output and wires used
output out;
input a, b, c, d, s0, s1;
wire s0_n, s1_n, T1, T2, T3, T4;

//model of a 4X1 MUX
not (s0_n, s0), (s1_n, s1);
and (T1, a ,s0_n, s1_n), (T2, b, s0_n, s1), (T3, c, s0, s1_n), (T4, d, s0, s1);
or(out, T1, T2, T3, T4);

endmodule
