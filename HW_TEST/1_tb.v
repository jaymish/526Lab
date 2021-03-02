`timescale 1ns/1ns 

module majority_tb();

reg a,b,c,d;
wire out;
majority UUT(out,a,b,c,d);

	initial begin
   		$monitor("%d: a=%d, b=%d, c=%d, d=%d, out=%d", $time,a,b,c,d,out);
		//prints when atleast one of the variable changes its value
	end
 //Initial block A


		
	initial begin

	$vcdpluson;
   #10 a=1; b = 1; c = 1;d=1;
  #10 a=1; b = 1; c = 1;d=0;
  #10 a=1; b = 1; c = 0;d=1;
  #10 a=1; b = 0; c = 1;d=1;
  #10 a=0; b = 1; c = 1;d=1;
  #10 a=1; b = 1; c = 0;d=0;
  #10 a=1; b = 0; c = 1;d=0;
  #10 a=0; b = 1; c = 1;d=0;
  #10 a=1; b = 0; c = 0;d=1;
  #10 a=0; b = 1; c = 0;d=1;
  #10 a=0; b = 0; c = 1;d=1;
  #10 a=1; b = 0; c = 0;d=0;
  #10 a=0; b = 1; c = 0;d=0;
  #10 a=0; b = 0; c = 1;d=0;
  #10 a=0; b = 0; c = 0;d=1;
  #10 a=0; b = 0; c = 0;d=0;
			
	#10 $finish;
	end
 
endmodule

