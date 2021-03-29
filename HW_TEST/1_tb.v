`timescale 1ns/1ns 

module majority_tb();

reg a,b,c,d,e,f;
wire out;
//majority UUT(out,a,b,c,d);

	initial begin
   	//	$monitor("%d: a=%d, b=%d, c=%d, d=%d, out=%d", $time,a,b,c,d,out);
		//prints when atleast one of the variable changes its value
	end
 //Initial block A


		
	initial begin

	$vcdpluson;
   a=12,b=4,c=4'b1110,d=4'b0000,e=4'b001x,f=4'bzzzz;
     $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
    /*a = #50 b;     
     $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
       
        
    c = #100 d;
     $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);

    #51 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);		
     #50 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);	
     #50 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);	*/
	#10 $finish;
	end
 
endmodule

