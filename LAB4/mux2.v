/**************************************************************************************************
***												***
*** EE 526 L Experiment #4					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #4  model an 8-bit register  							***
***												***
***************************************************************************************************
***  Filename: mux2.v				     	      Created by Jaymish patel, 2/27/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models a 2:1 mux        							***
***												***
**************************************************************************************************/
`timescale 100ps/100ps

module mux2(OUT, A, B, SEL);
//OUT - output signal
//A,B - input signals
//SEL - select signals

//declaring the inputs output and wires used
output OUT;
input A,B, SEL;

wire A1,A2,SEL_N;


//model of a 2X1 MUX
not (SEL_N,SEL);
and (A1,A,SEL_N);
and (B1,B,SEL);
or (OUT, A1, B1);

endmodule
