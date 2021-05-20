/**************************************************************************************************
***												***
*** EE 526 L Experiment #9					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #9  Parameterized Synchronous FIFO									***
***												***
***************************************************************************************************
***  Filename: fifo_tb.v				     	     Created by Jaymish patel, 5/1/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module is the test bench for experiment #9						***
***												***
**************************************************************************************************/
`timescale 1 ns / 1 ns

`define clk_PERIOD 20

module alu_tb();
	//declaring the regs and wires used
	
	reg Send, SYS_CLK=1'b0;
	reg  [7:0] D_in=8'b0;
	wire Valid;
	wire [7:0] D_out;
	//instances of alu module
	serial_protocal sp(SYS_CLK,D_in,Send,D_out,Valid);

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		
		$monitor("%d:D_in=%b, Send=%b, Data=%b, Strobe=%b, D_out=%b, Valid=%b ", $time, D_in,Send,sp.Data,sp.Strobe,D_out,Valid);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
		Send=0;
		#20 D_in=8'b10101011; Send=1'b1;
		#20 Send=1'b1;D_in=8'b11111111;
		#140 D_in=8'b01010101; Send=1'b1;
		#20 Send=1'b0;

	#100 $finish;
	end
	
	initial begin
    		forever begin
      			#(`clk_PERIOD/2) SYS_CLK = ~SYS_CLK;
    		end
  	end
endmodule
