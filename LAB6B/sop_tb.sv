/**************************************************************************************************
***												***
*** EE 526 L Experiment #6B					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #6B  model an scalable register  							***
***												***
***************************************************************************************************
***  Filename: register.v			     	      Created by Jaymish patel, 3/29/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the scalable register        						***
***												***
**************************************************************************************************/
`timescale 1 ns / 1 ns
module text();
	//declaring the regs and wires used
	//out - output signal
	//in1,in2 - input signals
	reg x;
	reg [3:0] C0,C1,C2,C3,DATA_IN;
	reg CLK,error=0;
	reg [4:0] i,j,k,l,m;
	wire [9:0] OUT_sop1,OUT_sop2;
	//instance of Sum of Product modules
	SOP #(4) SOP1(DATA_IN, CLK, C0, C1, C2, C3, OUT_sop1);
	SumOfProd #(4) SOP2(DATA_IN, CLK, C0, C1, C2, C3, OUT_sop2);

	

	initial begin
//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		$monitor("%d:DATA_IN=%b R0=%b R1=%b R2=%b R3=%b m0=%b m1=%b m2=%b m3=%b C0=%b C1=%b C2=%b C3=%b \n%d:DATA_IN=%b R0=%b R1=%b R2=%b R3=%b m0=%b m1=%b m2=%b m3=%b C0=%b C1=%b C2=%b C3=%b | OUT_sop1=%b OUT_sop2=%b",$time,DATA_IN,SOP1.S1.R1.R, SOP1.S1.R2.R,SOP1.S2.R1.R, SOP1.S2.R2.R,SOP1.S1.M1.OUT,SOP1.S1.M2.OUT,SOP1.S2.M1.OUT,SOP1.S2.M2.OUT,SOP1.S1.M1.C,SOP1.S1.M2.C,SOP1.S2.M1.C,SOP1.S2.M2.C,$time,DATA_IN,SOP2.r0,SOP2.r1,SOP2.r2,SOP2.r3,SOP2.m0,SOP2.m1,SOP2.m2,SOP2.m3, SOP2.C0,SOP2.C1,SOP2.C2,SOP2.C3,OUT_sop1,OUT_sop2);
		//$time - simulation time
	end

	initial begin
	$vcdpluson;
	//inputs assigned for test case
	for(i=0;i<16;i=i+1)
	begin
		#20 C0=i;
		for(j=0;j<16;j=j+1)
		begin
			#20 C1=j;
			for(k=0;k<16;k=k+1)
			begin
				#20 C2=k;
				for(l=0;l<16;l=l+1)
				begin
					#20 C3=l;
					for(m=0;m<16;m=m+1)
					begin
						#20 DATA_IN=m;	
						
						`ifdef FORCE_ERROR
							if(i==15 && j==15 && k==15 && l==0 && m==4)
							begin
								force OUT_sop1=8'b00000000;
								//$display($time," Error ",i," ",j," ",k," ",l," ",m," ",OUT_sop1," %b",OUT_sop2);
							end
						`endif
						
						if(OUT_sop1===OUT_sop2)
						begin
							if(i==0 && j==0 && k==0 && l==0 && m==12)
								$monitoroff;											
							
							if(i==15 && j==15 && k==15 && l==15 && m==4)
								$monitoron;
						end
						else
						begin
							error=1;
							$monitoroff;
							break;
						end
					end
					if(error==1)
						break;
				end
				if(error==1)
						break;
			end
			if(error==1)
						break;
		end
		if(error==1)
						break;
	end
	#10 if(!error)
		$display("The test was successful");
		else
		begin
		$display("The Test failed at time %d. | Output Obtained = %b | Expected Output = %b ",$time,OUT_sop1,OUT_sop2);
		end
	

	 $finish;
	end
	
	initial begin
    CLK = 1'b0;
    forever #10 CLK = ~CLK;
  end
endmodule
