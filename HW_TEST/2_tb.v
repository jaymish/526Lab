`timescale 1ns/1ns 

`define CLK_PERIOD 100


module reg_tb();
	reg CLK=1'b0;
	reg a,b,c,d,e,f;
always begin  
  if(CLK) begin
    #(100/4) CLK = ~CLK;
  end
  else begin
    #(100*3/4) CLK = ~CLK;
  end
end
	
		
	initial begin
	$vcdpluson;
	a=12,b=4,c=4'b1110,d=4'b0000,e=4'b001x,f=4'bzzzz;
	#500 $finish;
	end
    
endmodule
