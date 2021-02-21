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
	wire Q, Qnot;
	dff UUT(Q, Qnot,clock, data, clear);


	initial begin
   		$monitor("%d: clock=%b, data=%b, clear=%b | Q=%b | Qnot=%b ", $time,clock,data,clear,Q,Qnot);
		//prints when atleast one of the variable changes its value
	end
		
	initial begin

	$vcdpluson;
	#5 data=1;clear=0;
	#50 data=0;clear=0;
	#50 data=1;clear=1; 
	$display("Display:At %d the value of clock is %b,value of data is %b,value of clear is %b and we get Q=%b and Qnot=%b", $time,clock,data,clear,Q,Qnot);
	//prints the immediate values once 
	#50 data=0;clear=1;
	#50 data=1;clear=1;
	#50 data=0;clear=1;
	$write("Write:At %d the value of clock is %b,value of data is %b,value of clear is %b and we get Q=%b and Qnot=%b", $time,clock,data,clear,Q,Qnot);
	//prints the immediate values once like display but does not terminate with a new-line
	#50 data=1;clear=1;	
	$strobe("Strobe:At %d the value of clock is %b,value of data is %b,value of clear is %b and we get Q=%b and Qnot=%b", $time,clock,data,clear,Q,Qnot);
	//prints the immediate values once at the end of the current time stamp
	#50 data=0;clear=1;
	
		
	#10 $finish;
	end
 
   
   
	initial begin
      		forever
			#20 clock = !clock;
    	end
endmodule
