/**************************************************************************************************
***												***
*** EE 526 L Experiment #6					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #6  scalable multiplexer									***
***												***
***************************************************************************************************
***  Filename: mux.v				     	     Created by Jaymish patel, 3/27/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module describe the function of scalable mux					***
***												***
**************************************************************************************************/
`timescale 1ns / 1 ns


module mux(OUT, A, B, SEL);
	//declaring the inputs output regs and parameter used
	//out - output signal
	//in1,in2 - input signals
	parameter SIZE=1;
	reg [2:0] i;
	output reg [SIZE-1:0] OUT;
	input SEL;
	input [SIZE-1:0] A,B;
  
	always @(SEL or A or B)//always block runs whenever SEL, A, B changes	
		begin
			if(!SEL)//when SEL =0
				OUT=A;
			else if(SEL)//when SEL =1
				OUT=B;
			else
				begin
					for(i=0;i<SIZE;i=i+1)
						begin
							if(A[i]==B[i])//if SEL =x and bit of A and B are same output bit will be as input bit
								OUT[i]<=A[i];
							else//if  SEL =x and bit of A and B are not same output bit will be x
								OUT[i]<=1'bx;
						end
				end
		end

  
endmodule