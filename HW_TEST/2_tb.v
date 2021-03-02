`timescale 1ns/1ns 

`define CLK_PERIOD 100


module reg_tb();
	reg CLK=1'b0;
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
	#500 $finish;
	end
    
endmodule
