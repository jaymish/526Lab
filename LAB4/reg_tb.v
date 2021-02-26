`timescale 1ns/1ns 
module lab3_tb();

	reg CLK=1'b1;
  reg ENA, RST;
  reg [7:0] DATA; 
  wire [7:0] R; 
	register UUT(CLK, RST, ENA, DATA, R);


	initial begin
   		$monitor("%d: CLK=%b, RST=%b, ENA=%b, DATA=%b | R=%b ", $time,CLK,RST,ENA,DATA,R);
		//prints when atleast one of the variable changes its value
	end
		
	initial begin

	$vcdpluson;
	#50 RST=0;ENA=1;DATA=8'b00000000;
  #50 RST=1;ENA=0;
  #50 RST=1;ENA=1;
  #50 DATA=8'b10000001;
  #50 RST=1;ENA=0;
  #50 RST=1;ENA=1;
  #50 DATA=8'b10001111;
  #150 RST=0;ENA=1;
  #50 RST=1;ENA=1;
  #50 DATA=8'b01010101;
  #150 RST=1;ENA=0;
	
		
	#100 $finish;
	end
 
   
   
	initial begin
      		forever
			#50 CLK = !CLK;
    	end
endmodule
