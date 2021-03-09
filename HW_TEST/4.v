`timescale 1ns/1ns 

module majority_tb();

reg a,b,c,d;
wire out;
//majority UUT(out,a,b,c,d);

	initial begin
   	//	$monitor("%d: a=%d, b=%d, c=%d, d=%d, out=%d", $time,a,b,c,d,out);
		//prints when atleast one of the variable changes its value
	end
 //Initial block A


		
	initial begin

	$vcdpluson;
   a=0; b = 1; c = 0;d=1;
     $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
    a <= #50 b;     
     $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
       
        
    c <= #150 d;
     $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);

    #51 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);		
     #50 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);	
     #50 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);	
	#10 $finish;
	end
 
endmodule

