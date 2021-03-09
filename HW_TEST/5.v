`timescale 1ns/1ns 
`define delay1 40
`define delay2 30
`define delay3 20
`define delay4 10

module majority_tb();

reg a=0,b=1,c=0,d=1,e=0,f=1,k=0,g=1;
wire out;
//majority UUT(out,a,b,c,d);

	initial begin
   	//	$monitor("%d: a=%d, b=%d, c=%d, d=%d, out=%d", $time,a,b,c,d,out);
		//prints when atleast one of the variable changes its value
	end
 //Initial block A

initial 
  begin
    e <= #(`delay3) f;
    k <= #(`delay4) g;
    if(`delay1>`delay2)
      begin
        c = #(`delay2) d;
        a = #(`delay1-`delay2) b;    
      end
    else
      begin
        a = #(`delay1) b;
        c = #(`delay2-`delay1) d;
      end
  end


		
	initial begin

	$vcdpluson;
   //a=0; b = 1; c = 0;d=1;
     $display("%d:a=%b || b=%b ",$time,a,b);
    //a <= #50 b;     
     
     $display("%d:c=%b || d=%b ",$time,c,d); 
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g);         
    //c <= #100 d;
     #11$display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 

    #10 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 		
     #10 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 	
     #10 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 
     #10 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 
     #10 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 
     #10 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 
     
	#10 $finish;
	end
 
endmodule

