/**************************************************************************************************
***												***
*** EE 526 L Experiment #8					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #8  ALU modeling									***
***												***
***************************************************************************************************
***  Filename: alu_tb.v				     	     Created by Jaymish patel, 4/21/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module is the test bench for experiment #8						***
***												***
**************************************************************************************************/
`timescale 1 ns / 1 ns

`define CLK_PERIOD 10

module alu_tb();
	//declaring the regs and wires used
	
	reg OE, EN, CLK=1'b0;
	reg [3:0] OPCODE;
	reg  [7:0] A,B,ALU_OUT; 
	reg OF,SF,ZF,CF;
	//instances of alu module
	alu alu1(ALU_OUT,OF,SF,ZF,CF, OE, EN, CLK, OPCODE,A,B);

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		
		$monitor("%d:A=%d B=%d OPCODE=%d OutputEnable=%b ALU_ENABLE=%b | ALU_OUT=%d | OF=%b SF=%b ZF=%b CF=%b", $time, A,B,OPCODE,OE,EN,ALU_OUT,OF,SF,ZF,CF);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	//inputs assigned for test case
	EN=1'b1;OE=1'b1;A=3;B=2;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=2;B=3;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=3;B=3;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	#10 A=255;B=2;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=2;B=255;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=255;B=255;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	
	#10 A=3;B=2;OPCODE=4'b0010; $display("Addition");OE=1'b0;
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=2;B=3;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=3;B=3;OPCODE=4'b0010; $display("Addition");OE=1'b1;
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");EN=1'b0;
	
	#10 A=255;B=2;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=2;B=255;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	#10 A=255;B=255;OPCODE=4'b0010; $display("Addition");
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");EN=1'b1;

	#10 $finish;
	end
	
	initial begin
    		forever begin
      			#(`CLK_PERIOD/2) CLK = ~CLK;
    		end
  	end
endmodule
