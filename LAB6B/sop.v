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


module SumOfProd(DATA_IN, CLK, C0, C1, C2, C3, OUT);
//DATA_IN - data input
//CLK - input signals
//R - data output 

//declaring the inputs output and parameters used
parameter width=1;
input CLK;
//reg [2:0] i;
input [width-1:0] DATA_IN,C0,C1,C2,C3;
reg [width-1:0] r0,r1,r2,r3; 
reg [2*width-1:0] m0,m1,m2,m3;
output reg [2*width+1:0] OUT; 

	always @(posedge CLK)//always block runs at posedge of CLK	
	begin
		#5 r0<=DATA_IN;
		r1<=r0;
		r2<=r1;
		r3<=r2;
		
	end
	always @(DATA_IN or r0 or r1 or r2 or r3 or CLK)
	begin
		m0=C0*r0;
		m1=C1*r1;
		m2=C2*r2;
		m3=C3*r3;
		
		OUT=m0+m1+m2+m3;
	end
endmodule