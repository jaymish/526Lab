/**************************************************************************************************
***												***
*** EE 526 L Experiment #3					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #3  model an edge triggered flip-flop						***
***												***
***************************************************************************************************
***  Filename: lab3_1_tb.v			    Created by Jaymish patel, 2/18/21		***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module is the test bench for experiment #3						***
***												***
**************************************************************************************************/
`timescale 1ns/1ns 
module lab3_tb();

	reg clock=1'b0;
	reg data, clear;
	wire Q;
	dff UUT(Q,clock, data, clear);


	initial begin
   		$monitor("%d: clock=%b, data=%b, clear=%b | Q=%b ", $time,clock,data,clear,Q);
	end
		
	initial begin

	$vcdpluson;
	data=1;clear=0;
	#50 data=0;clear=0;
	#50 data=1;clear=1;
  #15 clear=0;
  #10 clear=1; 
	#15 data=0;clear=1;
	#50 data=1;clear=1;
	#50 data=0;clear=1;
	#50 data=1;clear=1;	
	#50 data=0;clear=1;
  #50 data=0;clear=0;
	
		
	#10 $finish;
	end
 
   
   
	initial 
    begin
    forever
      #5 clock = !clock;
   	end
endmodule
