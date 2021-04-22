/**************************************************************************************************
***												***
*** EE 526 L Experiment #8					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #8  ALU modeling									***
***												***
***************************************************************************************************
***  Filename: alu_tb1.v				     	     Created by Jaymish patel, 4/21/21 	***
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
		$monitor("%d:A=%b,%d B=%b,%d OPCODE=%d OutputEnable=%b ALU_ENABLE=%b | ALU_OUT=%b,OUT_num=%d | OF=%b SF=%b ZF=%b CF=%b",$time, A,A[6:0],B,B[6:0],OPCODE,OE,EN,ALU_OUT,ALU_OUT[6:0],OF,SF,ZF,CF);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	//inputs assigned for test case
	
	EN=1'b1;OE=1'b1;A=8'b00000011;B=8'b00000010;OPCODE=4'b0010; $display("Addition");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	#10 A=8'b00000010;B=8'b00000011;OPCODE=4'b0010; $display("Addition");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b00000011;B=8'b00000011;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	

	#10 A=8'b01111111;B=8'b00000010;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b00000010;B=8'b01111111;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b01111111;B=8'b01111111;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	
	
	
	#10 A=8'b10000011;B=8'b00000010;OPCODE=4'b0010; $display("Addition");
	$display("-A");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b10000010;B=8'b00000011;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b10000011;B=8'b00000011;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	

	#10 A=8'b11111111;B=8'b00000010;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b10000010;B=8'b01111111;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b11111111;B=8'b01111111;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	
	
	#10 A=8'b10000011;B=8'b10000010;OPCODE=4'b0010; $display("Addition");
	$display("-A-B");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b10000010;B=8'b10000011;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b10000011;B=8'b10000011;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	

	#10 A=8'b11111111;B=8'b10000010;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b10000010;B=8'b11111111;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b11111111;B=8'b11111111;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	
	
	#10 A=8'b00000011;B=8'b10000010;OPCODE=4'b0010; $display("Addition");
	$display("-B");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	#10 A=8'b00000010;B=8'b10000011;OPCODE=4'b0010; $display("Addition");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	#10 A=8'b00000011;B=8'b10000011;OPCODE=4'b0010; $display("Addition");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	
	
	#10 A=8'b01111111;B=8'b10000010;OPCODE=4'b0010; $display("Addition");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	#10 A=8'b00000010;B=8'b11111111;OPCODE=4'b0010; $display("Addition");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	#10 A=8'b01111111;B=8'b11111111;OPCODE=4'b0010; $display("Addition");
	
	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");
	
	
	
	#10 A=8'b00000011;B=8'b10000010;OPCODE=4'b0010; $display("Addition");
	$display("-B");

	#10 OPCODE=4'b0011; $display("Subtraction");OE=1'b0;$display("OE=0 so output will go into high impedance");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b00000010;B=8'b10000011;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b00000011;B=8'b10000011;OPCODE=4'b0010; $display("Addition");OE=1'b1;$display("OE=1");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");EN=1'b0;$display("EN=0");

	
	
	#10 A=8'b01111111;B=8'b10000010;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b00000010;B=8'b11111111;OPCODE=4'b0010; $display("Addition");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	#10 A=8'b01111111;B=8'b11111111;OPCODE=4'b0010; $display("Addition");EN=1'b1;$display("EN=1");

	#10 OPCODE=4'b0011; $display("Subtraction");#10 OPCODE=4'b0100; $display("And Operation");#10 OPCODE=4'b0101; $display("Or Operation");#10 OPCODE=4'b0110; $display("Xor Operation");#10 OPCODE=4'b0111; $display("Not A");

	


	#10 $finish;
	end
	
	initial begin
    		forever begin
      			#(`CLK_PERIOD/2) CLK = ~CLK;
    		end
  	end
endmodule
