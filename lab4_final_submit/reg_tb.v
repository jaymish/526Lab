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
  	reg ENA, RST;
	reg [7:0] DATA; 
  	wire [7:0] R; 
	register UUT(CLK, RST, ENA, DATA, R);


	initial begin
   		$monitor("%d: CLK=%b, RST=%b, ENA=%b, DATA=%b | R=%b ", $time,CLK,RST,ENA,DATA,R);
		//prints when atleast one of the variable changes its value
	end
		
	initial begin

	$vcdpluson;
	#50 RST=0;ENA=1;DATA=8'b00000001;//the register resets as RST=0
  	#50 RST=1;ENA=0;
  	#50 RST=1;ENA=1;//The contents of the data bus are clocked into register as ENA=1
  	#50 DATA=8'b10000001;
  	#50 RST=1;ENA=1;//The contents of the data bus are ignored as ENA=0
  	#50 RST=1;ENA=0;
  	#50 DATA=8'b10001111;
  	#50 ENA=1;
  	#100 RST=0;ENA=1;//the register resets as RST=0
  	#50 RST=1;ENA=1;
  	#50 DATA=8'b01010101;
  	#150 RST=1;ENA=0;
	
		
	#100 $finish;
	end
 
   
   
	// Clock generation, use this block inside the body of your testbench
  	initial begin
    		forever begin
      			#(`CLK_PERIOD/2) CLK = ~CLK;
    		end
  	end
endmodule

