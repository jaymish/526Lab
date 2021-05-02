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
	
	reg rd_en, wr_en, rst_n, clk=1'b0;
	wire [5:0] count;
	reg  [7:0] data_in=8'd1;
	wire empty, almost_empty, full, almost_full, valid, overflow_fifo, underflow;
	wire [7:0] data_out;
	//instances of alu module
	FIFO_final #(.depth(32), .width(8), .almost_size(2), .count_size(5)) fifo1(data_out, empty, almost_empty, full, almost_full, valid, overflow_fifo, underflow, count, data_in, clk, rd_en, wr_en, rst_n);

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		
		$monitor("%d:rst_n=%b, data_in=%d, wr_en=%b, almost_full=%b, full=%b, overflow=%b, rd_en=%b data_out=%d, valid=%b, almost_empty=%b, empty=%b, underflow=%b, count=%d", $time, rst_n, data_in, wr_en, almost_full, full, overflow_fifo, rd_en, data_out, valid, almost_empty, empty, underflow, count);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	//inputs assigned for test case
	
	wr_en=0;rd_en=0;
	#20 wr_en=1;
	#660 wr_en=0;
	#20 rd_en=1;
	#660 wr_en=0;rd_en=0;
	
	#20 wr_en=1;
	#660 wr_en=0;
	#20 rst_n=1;
	#20 rd_en=1;rst_n=0;
	#40 wr_en=0;rd_en=0;
	
	#20 wr_en=1;
	#120 wr_en=0;
	#20 rst_n=1;
	#20 rd_en=1;rst_n=0;
	#40 wr_en=0;rd_en=0;
	
	#20 wr_en=1;
	#120 wr_en=1;
	#20 rd_en=1;rst_n=0;
	#60 rst_n=1;
	#40 wr_en=0;rd_en=0;
	
	#20 wr_en=1;rst_n=0;
	#660 wr_en=0; rd_en=1;rst_n=0;
	#60 wr_en=1;rd_en=0;
	#20 rd_en=1;wr_en=0;
	#660 wr_en=0;rd_en=0;
	//#100 wr_en=0;rd_en=1;
	
	

	#20 $finish;
	end
	
	initial begin
    		forever begin
      			#(`clk_PERIOD/2) clk = ~clk;
    		end
  	end
	initial begin
    		forever begin
      			#(`clk_PERIOD) data_in=data_in+1;
    		end
  	end
endmodule
