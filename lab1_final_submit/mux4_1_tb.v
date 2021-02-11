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
module mux4_1_tb();
	//declaring the inputs output and wires used
	//out - output signal
	//a,b,c,d - input signals
	//s0,s1 - select signals
	reg A,B,C,D, SEL0, SEL1;
	wire OUT;

	mux4_1 UUT(OUT, A, B, C, D, SEL0, SEL1);

	initial
	//$monitorb - displays the values of all objects in its list whenever any one of them changes.
	$monitorb ("%d Out= %b A= %b B= %b C= %b D=%b SEL0= %b SEL1= %b",
			$time, OUT, A, B, C, D, SEL0, SEL1);//$time - simulation time
	initial begin
	$vcdpluson;
	//inputs assigned for test case
	A=1; B=1; C=1; D=1; SEL0=1'bx; SEL1=1'bx;
	#10 A=0; B=1; C=0; D=1; SEL0=0; SEL1=0;
	#20 SEL0=0; SEL1=1;
	#20 SEL0=1; SEL1=0;
	#20 SEL0=1; SEL1=1;
	#10 A=1; B=0; C=1; D=0; SEL0=0; SEL1=0;
	#20 SEL0=0; SEL1=1;
	#20 SEL0=1; SEL1=0;
	#20 SEL0=1; SEL1=1;
	#20 $finish;
	end
endmodule
