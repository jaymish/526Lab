/**************************************************************************************************
***												***
*** EE 526 L Experiment #6B					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #6B  model an scalable register  							***
***												***
***************************************************************************************************
***  Filename: register.v			     	      Created by Jaymish patel, 3/29/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the scalable register        						***
***												***
**************************************************************************************************/
`timescale 1ns/1ns 


module multiplier(C, multiplicant, OUT);
//DATA_IN - data input
//CLK - input signals
//R - data output 

//declaring the inputs output and parameters used
parameter width=1;
//input CLK;
reg [2:0] i;
input [width-1:0] multiplicant,C; 
output reg [2*width-1:0] OUT; 

	always @(C or multiplicant)//always block runs at posedge of CLK	
	begin
		OUT=C*multiplicant;
	end
endmodule