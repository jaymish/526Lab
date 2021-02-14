`timescale 1ns/1ns 
module lab3_tb();

	reg s0,s1,r0,r1;
	wire Q, Qnot;
	SR_Latch2 UUT(Q, Qnot,s0,s1,r0,r1);


	initial begin
		$monitor("%d: s0=%b, s1=%b, r0=%b, r1=%b | Q=%b | Qnot=%b", $time,s0,s1,r0,r1,Q,Qnot);
	end
		
	initial begin

	$vcdpluson;
		#10 s0=0;s1=0;r0=1;r1=1;
    #10 s0=1;s1=1;r0=0;r1=0;
		#10 s0=1;s1=1;r0=1;r1=1;
		#10 $finish;
	end
endmodule
