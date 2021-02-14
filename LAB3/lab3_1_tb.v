`timescale 1ns/1ns 
module lab3_tb();

	reg clock=1'b0;
  reg data, clear;
  reg run_clk=1'b1;
	wire Q, Qnot;
	dff UUT(Q, Qnot,clock, data, clear);


	initial begin
		//$monitor("%d: clock=%b, data=%b, clear=%b | Q=%b | Qnot=%b | cbar%b | clr%b | clkbar%b | clk%b | dbar%b | d%b | sbar%b | s%b | r%b | rbar%b", $time,clock,data,clear,Q,Qnot,UUT.cbar,UUT.clr,UUT.clkbar,UUT.clk,UUT.dbar,UUT.d,UUT.sbar,UUT.s,UUT.r,UUT.rbar);
   $monitor("%d: clock=%b, data=%b, clear=%b | Q=%b | Qnot=%b ", $time,clock,data,clear,Q,Qnot);
	end
		
	initial begin

	$vcdpluson;
		#5 data=1;clear=0;
		#50 data=0;clear=0;
    #50 data=1;clear=1;
		#50 data=0;clear=1;
    #50 data=1;clear=1;
    #50 data=0;clear=1;
    #30 run_clk = 1'b0;
    #50 data=1;clear=1;run_clk=1'b0;	
    #50 data=0;clear=1;
	
		
		#10 $finish;
	end
 
   
   
  initial
    begin
      forever
        if(run_clk) #10 clock = !clock;
        else #10 clock = 0;
    end
endmodule
