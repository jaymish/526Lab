/**************************************************************************************************
***												***
*** EE 526 L Experiment #7					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #7  RAM  							***
***												***
***************************************************************************************************
***  Filename: ram.v			     	      Created by Jaymish patel, 4/9/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the ram         						***
***												***
**************************************************************************************************/
`timescale 1ns/1ns 


module ram(DATA, OE, WS, CS, ADDR);
//DATA - data output
//OE,CS,WS - input signals
//ADDR - data input

//declaring the inputs output and parameters used
parameter width=8,depth=256;
input OE, WS, CS;//OE-active high | CS-active low
input [4:0] ADDR;
inout  [width-1:0] DATA; 
reg [width-1:0] memory [0:depth-1];
assign DATA= (OE & !CS) ? memory[ADDR]:8'bZ;
always @(posedge WS )//always at the rising edge of WS
begin
	if(!CS)
	begin
		if(!OE)
		begin
			
				#1 memory[ADDR]=DATA;
			
		end	
	end
end
endmodule