`timescale 100ps/100ps 


module register(abc,CLK,a,b,c);
input [3:0] a;
input [3:0] b;
input [5:0] c;
//input [5:0] x;
input CLK;
output [3:0] abc;


//assign abc = a & b;
//$display("%d:a & b = %b",$time, abc);
//assign abc = a || b;
//$display("%d:a || b = %b",$time, abc);
//assign abc = a && b;
//$display("%d:a && b = %b",$time, abc);
//assign abc = a | b;
//$display("%d:a | b = %b",$time, abc);
//assign abc = a + b;
//$display("%d:a + b = %b",$time, abc);
//assign a=c;
//$display("%d:a= %b",$time,a);
//assign abc = a - b;
//$display("%d:a - b = %b",$time, abc);
//assign c=b;
//$display("%d:c= %b",$time,c);
//assign abc = & a;
//$display("%d:& b = %b",$time, abc);
assign abc = | a;
//$display("%d:| b = %b",$time, abc);                     

/*initial
    begin
 
       x = 1;
        $display ("Hello, x=%d, t=%t", x, $time);
        #15;

        x = 2;
        $display ("Hello, x=%d, t=%t", x, $time);
        #20;
 
        x = 3;
        $display ("Hello, x=%d, t=%t", x, $time);
        #10;
        
     end
 
   // Initial block B
   initial
     begin
        #5;
 
        x = 10;
        $display ("Hello, x=%d, t=%t", x, $time);
        #20;
 
        x = 20;
        $display ("Hello, x=%d, t=%t", x, $time);
        #5;
  
        x = 30;
        $display ("Hello, x=%d, t=%t", x, $time);
        #10;
        
     end*/
endmodule
