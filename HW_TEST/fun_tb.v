`timescale 1ns/1ns 
module lab3_tb();

	reg clock=1'b0;
	//reg en;
 reg [2:0] in;
	wire OUT;
	fun UUT(OUT,in);


	initial begin
   		$monitor("%d: in=%b | OUT=%b ", $time,in,OUT);
	end
		
	initial begin

	$vcdpluson;
 //en=1;
	#50 in=3'b000;
  #50 in=3'b001;
  #50 in=3'b010;
  #50 in=3'b011;
  #50 in=3'b100;
  #50 in=3'b101;
  #50 in=3'b110;
  #50 in=3'b111; 	
		
	#10 $finish;
	end
 
   
   
	
endmodule
