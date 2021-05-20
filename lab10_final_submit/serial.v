/**************************************************************************************************
***												***
*** EE 526 L Experiment #9					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #9  Parameterized Synchronous FIFO									***
***												***
***************************************************************************************************
***  Filename: fifo.v				     	     Created by Jaymish patel, 5/1/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module is the design for experiment #9						***
***												***
**************************************************************************************************/
`timescale 1 ns / 1 ns


module serial_protocal(SYS_CLK,D_in,Send,D_out,Valid);
input SYS_CLK, Send;
input [7:0]D_in;

output [7:0]D_out;
output Valid;

wire CLK,Data,Strobe;
	serial_in sin(SYS_CLK,D_in,Send,CLK,Data,Strobe);
	serial_out sout(CLK,Data,Strobe,D_out,Valid);
endmodule




module serial_in(SYS_CLK,D_in,Send,O_CLK,O_Data,O_Strobe);
input SYS_CLK, Send;
input [7:0]D_in;

reg [7:0] data;
reg [2:0] counter=3'b0;
reg waiting=1'b0;
reg [1:0] state=2'b0;

output reg O_CLK,O_Data,O_Strobe;


parameter ideal_state = 2'b00; 
parameter send_state = 2'b10; 
parameter wait_state = 2'b11;
parameter state_wait = 2'b01;
always @(SYS_CLK)
begin
	O_CLK=1'b0;
	#5 O_CLK=1'b1;
end	
always @(posedge O_CLK)
begin
	state={Send,waiting};
	case(state)
		ideal_state:begin
			O_Data=1'b0;
			O_Strobe=1'b0;
			counter=3'b0;
			waiting=1'b0;
		end
		send_state:begin
			data=D_in;
			O_Data=data[counter];
			O_Strobe=1'b1;
			waiting=1'b1;
			counter=counter+1'b1;
		end
		state_wait,
		wait_state:begin
			if(counter<7)
			begin
				O_Data=data[counter];
				O_Strobe=1'b1;
				waiting=1'b1;
				counter=counter+1'b1;
			end
			else
			begin
				O_Data=data[counter];
				O_Strobe=1'b0;
				waiting=1'b0;
				counter=counter+1'b1;
			end
		end
	endcase
end

endmodule




module serial_out(I_CLK,I_Data,I_Strobe,D_out,Valid);
input I_CLK,I_Data,I_Strobe;

reg [2:0] counter=3'b0;
reg waiting=1'b0;
reg [1:0] state=2'b0;

output reg [7:0]D_out;
output reg Valid;

parameter ideal_state = 2'b00; 
parameter receive_state = 2'b10; 
parameter wait_state = 2'b11;
parameter state_wait = 2'b01;

always @( negedge I_CLK)
begin
   state={I_Strobe,waiting};
	case(state)
		ideal_state:begin
			D_out=8'bx;
			Valid=1'b0;
			counter=3'b0;
			waiting=1'b0;
		end
		receive_state:begin
			D_out=8'bx;
			D_out[counter]=I_Data;
			Valid=1'b0;
			waiting=1'b1;
			counter=counter+1'b1;
		end
		state_wait,
		wait_state:begin
			if(counter<7)
			begin
				D_out[counter]=I_Data;
				Valid=1'b0;
				waiting=1'b1;
				counter=counter+1'b1;
			end
			else
			begin
				D_out[counter]=I_Data;
				Valid=1'b1;
				waiting=1'b0;
				counter=counter+1'b1;
			end
		end
	endcase
end

endmodule