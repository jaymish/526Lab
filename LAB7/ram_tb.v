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
`timescale 1 ns / 1 ns
module ram_tb();
	reg OE, WS, CS;//OE-active high |CS-active low
	reg [4:0] ADDR;
	reg [5:0] i;
	wire [7:0] DATA;
	reg [7:0] data_in;
	
	ram #(.depth(32))ram1(DATA, OE, WS, CS,ADDR);
	
	assign DATA=(WS==1'b1 & OE==1'b0 & CS==1'b0)? data_in:8'bZ;
	

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		$monitor("%d:ADDR=%d | CS=%b OE=%b WS=%b | DATA=%h",$time,ADDR,CS,OE, WS,DATA);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	
	ADDR=5'd0;CS=1'b1;WS=1'b0;OE=1'b0;
	#10 ADDR=5'd0;CS=1'b0;WS=1'b0;OE=1'b0;
	#10 ADDR=5'd0;i=0;
	while (i<32)
		begin
			WS=1'b0;ADDR=i;
			#10 OE=1'b0; WS=1'b1;data_in=ADDR;
			#15 i=i+1;
		end
	#10 ADDR=5'd1;WS=1'b0;OE=1'b0;
	#10 ADDR=5'd2;WS=1'b0;OE=1'b1;
	#20 CS=1'b1;
	#10 CS=1'b0;
	#10 ADDR=5'd0;i=0;
	while (i<32)
		begin
			WS=1'b0;ADDR=i;
			#10 OE=1'b1; data_in=ADDR;
			#15 i=i+1;
		end
	
	
	#10 CS=1'b1;
	#10 $finish;
	end
	
endmodule
