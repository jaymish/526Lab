/**************************************************************************************************
***												***
*** EE 526 L Experiment #4					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #4  model an 8-bit register  							***
***												***
***************************************************************************************************
***  Filename: reg_tb.v				     	      Created by Jaymish patel, 2/27/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models a 2:1 mux        							***
***												***
**************************************************************************************************/
`timescale 1ns/1ns 

// use this define on top of your test bench 
`define CLK_PERIOD 100


module reg_tb();

	reg CLK=1'b0;


	initial begin
   		$monitor("%d", $time);
		//prints when atleast one of the variable changes its value
	end
		
	initial begin

	$vcdpluson;
			
	#500 $finish;
	end
 
   
   
	// Clock generation, use this block inside the body of your testbench
  	initial begin
    	forever begin
      			//#(`CLK_PERIOD/2) CLK = ~CLK;
			if(CLK) begin
				#(`CLK_PERIOD/4) CLK = ~CLK;
            end else begin
				#(`CLK_PERIOD*3/4) CLK = ~CLK;
            end
    	end
  	end
endmodule

