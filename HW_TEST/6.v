//vcs -debug -full64 5.v

`timescale 1ns/1ns 
`define delay1 40
`define delay2 30
`define delay3 20
`define delay4 10

module majority_tb();

reg CLK=1'b0;
reg [3:0] a,b,c,d,e,f,g,k;
wire out;
//majority UUT(out,a,b,c,d);

	initial begin
   	//	$monitor("%d: a=%d, b=%d, c=%d, d=%d, out=%d", $time,a,b,c,d,out);
		//prints when atleast one of the variable changes its value
	end
 //Initial block A

/*initial 
    a = #(`delay1) b;
initial
    c = #(`delay2) d;
initial
  begin
    e <= #(`delay3) f;
    k <= #(`delay4) g;
  end*/
  /*always@(posedge CLK)
   a <= b;
always@(posedge CLK)
   b <= a;*/
   /*always @(posedge CLK)
   begin
	c=a;
	a=b;
	end
	
	always @(posedge CLK)
	b=c;*/
	/*initial 
	begin 
	#5 a = b;
	#(12-5) c = d;
	end*/




		
	initial begin
	a=12;b=4;c=4'b1110;d=4'b0000;e=4'b001x;f=4'bzzzz;	
	$vcdpluson;
   //a=0; b = 1; c = 0;d=1;
     $display("%d:a&&b=%b  ",$time,(~&e));
    //a <= #50 b;     
     
     $display("%d:c=%b || d=%b ",$time,c,d); 
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g);         
    /*/c <= #100 d;
     #2$display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 

    #3 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 		
     #1 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 	
     #5 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 
     #1 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 
     #1 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); 
     #10 $display("%d:a=%b || b=%b ",$time,a,b);
     $display("%d:c=%b || d=%b ",$time,c,d);
     $display("%d:e=%b || f=%b ",$time,e,f); 
     $display("%d:k=%b || g=%b ",$time,k,g); */
     
	#10 $finish;
	end

always begin  
  if(CLK) begin
    #(10) CLK = ~CLK;
  end
  else begin
    #(10) CLK = ~CLK;
  end
end
 
endmodule
/*module loop (z,a);
input [31:0] a;
  output z;
  reg [4:0] i;
  reg s, z;

  initial 
     begin
       s = 0;
       for (i=0; i<=31; i=i+1) 
          s = s | a[i];
          z = !s;
		  $display(i,s,z);
     end

endmodule*/


