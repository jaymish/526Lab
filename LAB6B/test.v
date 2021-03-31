`timescale 1 ns / 1 ns
module text();
	//declaring the regs and wires used
	//out - output signal
	//in1,in2 - input signals
	reg [3:0] A,B,DATA_IN;
	reg CLK;
	wire [3:0] R,reg_out;
	//instance of mux module
	register #(4) r(CLK, DATA_IN, R);

	

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		
		$monitor("%d:DATA_IN=%b | R=%b", $time, DATA_IN,R);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	//inputs assigned for test case
	DATA_IN=4'b0000; A=4'b0011;B=4'b0011;
	#20 DATA_IN=4'b0001;
	#20 DATA_IN=4'b0010;
	#20 DATA_IN=4'b0011;
	#20 DATA_IN=4'b0100;A=4'b0010;
	#20 DATA_IN=4'b0101;
	#20 DATA_IN=4'b0110;
	#20 DATA_IN=4'b0111;
	#20 DATA_IN=4'b1000;
	#20 DATA_IN=4'b1001;
	#20 DATA_IN=4'b1010;
	#20 DATA_IN=4'b1011;A=4'b1111;
	#20 DATA_IN=4'b1100;
	#20 DATA_IN=4'b1101;
	#20 DATA_IN=4'b1110;
	#20 DATA_IN=4'b1111;
	

	#10 $finish;
	end
	initial begin
    CLK = 1'b0;
    forever #5 CLK = ~CLK;
	end
endmodule
