/**************************************************************************************************
***												***
*** EE 526 L Experiment #2					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #2  Change in Waveform due to delay						***
***												***
***************************************************************************************************
***  Filename: lab_tb.v				     	      Created by Jaymish patel, 2/9/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module is the test bench for experiment #2						***
***												***
**************************************************************************************************/`timescale 1 ns / 1 ns

//defination of constant
`define MONITOR_STR_1 "%d: in1=%b, in2=%b, | out=%b | A1=%b | A2=%b | O1=%b | NT=%b" 


module lab2_tb();
	//declaring the inputs output and wires used
	//out - output signal
	//in1,in2 - input signals
	reg in1,in2;
	wire out;
	lab2 UUT(in1,in2,out);

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		$monitor(`MONITOR_STR_1, $time, in1,in2,out,UUT.A1,UUT.A2,UUT.O1,UUT.NT);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	//inputs assigned for test case
	#15 in1 = 1'b0;
	    in2 = 1'b0;
	#15 in1 = 1'b0;
	    in2 = 1'b1;
	#15 in1 = 1'b1;
	    in2 = 1'b0;
	#15 in1 = 1'b1;
	    in2 = 1'b1;

	#15 $finish;
	end
endmodule
