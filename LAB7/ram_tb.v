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
	wire [7:0] DATA;
	reg [7:0] data_in;
	
	ram #(.depth(8))ram1(DATA, OE, WS, CS,ADDR);
	
	assign DATA=(WS==1'b1 & OE==1'b0 & CS==1'b0)? data_in:8'bZ;
	

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		$monitor("%d:ADDR=%d CS=%b OE=%b WS=%b DATA=%h",$time,ADDR,CS,OE, WS,DATA);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	
	ADDR=5'd0;CS=1'b1;WS=1'b0;OE=1'b0;
	#10 ADDR=5'd0;CS=1'b0;WS=1'b0;OE=1'b0;
	#10 ADDR=5'd0;
	#10 ADDR=5'd0;
	#10 ADDR=5'd0;CS=1'b0;WS=1'b1;OE=1'b0;data_in=8'd0;
	#10 WS=1'b0;OE=1'b0;
	#10 WS=1'b0;OE=1'b0;
	#10 WS=1'b0;OE=1'b1;
	#10 WS=1'b0;OE=1'b0;
	#10 ADDR=5'd1;data_in=8'd1;WS=1'b1;OE=1'b0;
	#10 ADDR=5'd3;data_in=8'd3;WS=1'b0;
	#5 WS=1'b1;	
	#10 ADDR=5'd4;data_in=8'd4;WS=1'b0;
	#5 WS=1'b1;
	#10 ADDR=5'd5;data_in=8'd5;WS=1'b0;
	#5 WS=1'b1;
	#10 ADDR=5'd6;data_in=8'd6;WS=1'b0;
	#5 WS=1'b1;
	#10 ADDR=5'd7;data_in=8'd7;WS=1'b0;
	#5 WS=1'b1;
	#10 ADDR=5'd1;WS=1'b0;OE=1'b0;
	#10 ADDR=5'd2;WS=1'b1;OE=1'b0;data_in=8'd2;
	#10 WS=1'b0;OE=1'b0;
	#10 WS=1'b0;OE=1'b1;
	#10 CS=1'b1;
	#10 CS=1'b0;
	#10 ADDR=5'd0;WS=1'b0;OE=1'b1;
	#10 ADDR=5'd1;
	#10 ADDR=5'd2;
	#10 ADDR=5'd3;
	#10 ADDR=5'd4;
	#10 ADDR=5'd5;
	#10 ADDR=5'd6;
	#10 ADDR=5'd7;
	#10 CS=1'b1;
	#10 $finish;
	end
	
endmodule
