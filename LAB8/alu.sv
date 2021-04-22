/**************************************************************************************************
***												***
*** EE 526 L Experiment #8					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #8  ALU modeling									***
***												***
***************************************************************************************************
***  Filename: alu.sv				     	     Created by Jaymish patel, 4/21/21 	***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module is the test bench for experiment #8						***
***												***
**************************************************************************************************/
`timescale 1ns/100ps 


module alu(ALU_OUT,OF,SF,ZF,CF, OE, EN, CLK, OPCODE,A,B);
//ALU_OUT - data output
//OF,SF,ZF,CF - flag output
//OE,EN,CLK,OPCODE - input signals
//A,B - data input

//declaring the inputs output and parameters used
parameter width=8;
input OE, EN, CLK;
input [3:0] OPCODE;
input  [width-1:0] A,B; 
reg [width-1:0] binput=0,ainput=0,x;
reg [width:0] out;
output reg OF,SF,ZF,CF;
output reg [width-1:0] ALU_OUT;


parameter alu_add = 4'b0010; 
parameter alu_sub = 4'b0011; 
parameter alu_and = 4'b0100; 
parameter alu_or = 4'b0101; 
parameter alu_xor = 4'b0110;
parameter alu_not = 4'b0111; 


always @(posedge CLK)//at positive edge of clock
begin
	if(EN)
	begin
		binput=B;
		ainput=A;
		OF=1'b0;SF=1'b0;ZF=1'b0;CF=1'b0;
		`ifdef SIGNED_ALU //for signed numbers
			if (OPCODE == alu_add || OPCODE == alu_sub)
			begin
				if(A[width-1]==1)
					ainput = ~A+ 1'b1;
				if(B[width-1]==1)
					binput = ~B+ 1'b1;
			end
		`endif
		if (OPCODE == alu_sub) 
			binput = ~binput + 1'b1;
		else
			binput = binput;

		case(OPCODE)
		alu_add: out = ainput + binput;
		alu_sub: out = ainput + binput;
		alu_and: out = ainput & binput;
		alu_or: out = ainput | binput;
		alu_xor: out = ainput ^ binput;
		alu_not	: out = ~ainput;
		endcase
		
		
			
		`ifdef SIGNED_ALU //for signed numbers
			
			CF=1'b0;
			if(OPCODE==alu_add)
			begin
			
				if(A[width-1]==1)
				begin
					if(B[width-1]==1)
					begin
						out=~out+1'b1;
						out={1'b0,1'b1,out[width-2:0]};
						SF=1'b1;
						x=A[width-2:0]+B[width-2:0];
						if(x[width-1]==1'b1)
							OF=1'b1;
						else
							OF=1'b0;
					end
					else
					begin
						OF=1'b0;
						if(A[width-2:0]<B[width-2:0])
						begin
							
							out={1'b0,1'b0,out[width-2:0]};
							SF=1'b0;
						end
						else
						begin
							out=~out+1'b1;
							out={1'b0,1'b1,out[width-2:0]};
							SF=1'b1;
						end
					end
				end
				else
				begin
					if(B[width-1]==1)
					begin
						OF=1'b0;
						if(A[width-2:0]<B[width-2:0])
						begin
							out=~out+1'b1;
							out={1'b0,1'b1,out[width-2:0]};
							SF=1'b1;
						end
						else
						begin
							out={2'b0,out[width-2:0]};
							SF=1'b0;
						end
					end
					else
					begin
						out={2'b0,out[width-2:0]};
						SF=1'b0;
						x=A[width-2:0]+B[width-2:0];
						if(x[width-1]==1'b1)
							OF=1'b1;
						else
							OF=1'b0;
						
					end
				end
			end
			else if(OPCODE==alu_sub)
			begin
			
				if(A[width-1]==1)
				begin
					if(B[width-1]==1)
					begin
						if(A[width-2:0]<B[width-2:0])
						begin
							out={1'b0,1'b1,out[width-2:0]};
							SF=1'b0;
						end
						else
						begin
							out=~out+1'b1;
							out={1'b0,1'b1,out[width-2:0]};
							SF=1'b1;
						end
						OF=1'b0;
					end
					else
					begin
						x=A[width-2:0]+B[width-2:0];
						if(x[width-1]==1'b1)
							OF=1'b1;
						else
							OF=1'b0;
						if(A[width-2:0]<B[width-2:0])
						begin
							out=~out+1'b1;
							out={1'b0,1'b1,out[width-2:0]};
							SF=1'b1;
						end
						else
						begin
							out=~out+1'b1;
							out={1'b0,1'b1,out[width-2:0]};
							SF=1'b1;
						end
					end
				end
				else
				begin
					if(B[width-1]==1)
					begin
						x=A[width-2:0]+B[width-2:0];
						if(x[width-1]==1'b1)
							OF=1'b1;
						else
							OF=1'b0;
						
							out={2'b0,out[width-2:0]};
							SF=1'b0;
						
					end
					else
					begin
						if(A[width-2:0]<B[width-2:0])
						begin
							out=~out+1'b1;
							out={1'b0,1'b1,out[width-2:0]};
							SF=1'b1;
						end
						else
						begin
							out={2'b0,out[width-2:0]};
							SF=1'b0;
						end
						OF=1'b0;
						
					end
				end
			end
			if(out[width-2:0]==0)
			begin
				ZF=1'b1;
				SF=1'b0;
			end	
			else
				ZF=1'b0;
				
		`endif
		`ifdef UNSIGNED_ALU //for unsigned numbers
			if(out[width-1:0]==0)
				ZF=1'b1;
			else
				ZF=1'b0;	
			OF=1'b0;
			SF=1'b0;
			if (OPCODE == alu_sub)
			begin
				if(A<B)
				begin
					CF=1'b1;
					SF=1'b1;
					out=~out+1'b1;
				end
				else
				begin
					CF=1'b0;
					SF=1'b0;
				end
			end
			else if (OPCODE==alu_add)
				CF=out[width];
		`endif
		if(OE)
		begin
			ALU_OUT=out[width-1:0];
		end
		else
			ALU_OUT=10'bz;
	end
end
endmodule