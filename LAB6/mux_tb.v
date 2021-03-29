/**************************************************************************************************
***												***
*** EE 526 L Experiment #6					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #6  scalable multiplexer									***
***												***
***************************************************************************************************
***  Filename: mux_tb.v				     	     Created by Jaymish patel, 3/27/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module is the test bench for experiment #6						***
***												***
**************************************************************************************************/
`timescale 1 ns / 1 ns

module mux_tb();
	//declaring the regs and wires used
	//out - output signal
	//in1,in2 - input signals
	reg [5:0] A,B;
	reg SEL=1'bx;
	wire [5:0] OUT;
	//instance of mux module
	mux mux1(OUT,A,B,SEL);
	mux #(4) mux2(OUT,A,B,SEL);
	mux #(.SIZE(5)) mux3(OUT,A,B,SEL);
	defparam mux4.SIZE=6;
	mux mux4(OUT,A,B,SEL);

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		
		$monitor("%d:SEL=%b || A=%b B=%b | OUT=%b || A=%b B=%b | OUT=%b || A=%b B=%b | OUT=%b || A=%b B=%b | OUT=%b \n", $time, SEL,mux1.A,mux1.B,mux1.OUT, mux2.A,mux2.B,mux2.OUT, mux3.A,mux3.B,mux3.OUT, mux4.A,mux4.B,mux4.OUT);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	//inputs assigned for test case
	$display("\n \t\t\t      Mux with width=1,\t     Mux with width=4,\t\t Mux with width=5, \t\tMux with width=6");
	#10 A<=6'b010101;B<=6'b010101; SEL<=1'b1;
	#10 SEL=1'b0;
	#10 SEL=1'bx;
	#10 A<=6'b010101;B<=6'b101010; SEL<=1'b1;
	#10 SEL=1'b0;
	#10 SEL=1'bx;
	#10 A<=6'b101010;B<=6'b010101; SEL<=1'b1;
	#10 SEL=1'b0;
	#10 SEL=1'bx;
	#10 A<=6'b000111;B<=6'b010101;
	#10 A<=6'b001011;
	#10 A<=6'b100110;
	#10 A<=6'b111000;
	#10 A<=6'b000111;B<=6'b101010;
	#10 A<=6'b001011;
	#10 A<=6'b100110;
	#10 A<=6'b111000;

	#10 $finish;
	end
endmodule
