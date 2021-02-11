`timescale 1 ns / 1 ns
module mux4_1_tb();
	reg A,B,C,D, SEL0, SEL1;
	wire OUT;
	integer i,j;

	mux4_1 UUT(OUT, A, B, C, D, SEL0, SEL1);

	initial
	$monitorb ("%d Out= %b A= %b B= %b C= %b D=%b SEL0= %b SEL1= %b",
			$time, OUT, A, B, C, D, SEL0, SEL1);
	initial begin
	$vcdpluson;
	A=1; B=1; C=1; D=1; SEL0=1'bx; SEL1=1'bx;
	//#10 A=0; B=0; C=0; D=0; SEL0=0; SEL1=0;

	
	for(i=0;i<64;i=i+1)
	begin
		/*if(i==8)
		begin
			A=~A;
		end
		if(i%4==0)
		begin
			B=~B;
		end
		if(i%2==0)
		begin
			C=~C;
		end
		D=~D;
		#10 SEL0=0; SEL1=0;
		for(j=0;j<4;j=j+1)
		begin
			if(i%2==0)
			begin
				SEL0=~SEL0;
			end
		#10 SEL1=~SEL1;
		end*/
		#10 {A,B,C,D,SEL0,SEL1}=i;
		
	end
	#20 $finish;
	end
endmodule	
			
