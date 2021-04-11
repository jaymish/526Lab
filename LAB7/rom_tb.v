/**************************************************************************************************
***												***
*** EE 526 L Experiment #7					Jaymish patel, Spring, 2021	***
***												***
*** Experiment #7  RAM  							***
***												***
***************************************************************************************************
***  Filename: ram.v			     	      Created by Jaymish patel, 4/9/21 ***
***    --- revision history, if any, goes here ---						***
***************************************************************************************************
*** This module models the ram         						***
***												***
**************************************************************************************************/
`timescale 1 ns / 1 ns
module ram_tb();
	reg OE_rom, CS_rom,OE_ram, WS_ram, CS_ram;//OE-active high |CS-active low
	reg [4:0] ADDR;
	wire [7:0] DATA_ram,DATA_rom;
	reg [7:0] temp;
	reg [7:0] data_in;
	
	
	rom #(.depth(1024))rom1(DATA_rom, OE_rom, CS_rom,ADDR);
	ram #(.depth(1024))ram1(DATA_ram, OE_ram, WS_ram, CS_ram,ADDR);
	
	assign DATA_ram=(WS_ram==1'b1 & OE_ram==1'b0 & CS_ram==1'b0)? data_in:8'bZ;
	

	initial begin
		//$monitorb - displays the values of all objects in its list whenever any one of them changes.
		$monitor("%d:ADDR=%d CS=%b OE=%b DATA_ROM=%h CS=%b OE=%b WS=%b DATA_RAM=%h",$time,ADDR,CS_rom,OE_rom,DATA_rom,CS_ram,OE_ram,WS_ram,DATA_ram);
		//$time - simulation time		
	end

	initial 
	begin
		$vcdpluson;
		ADDR=5'h04;CS_ram=1'b1;CS_rom=1'b0;OE_ram=1'b0;OE_rom=1'b1;
		#10 ADDR=5'h04;WS_ram=1'b0;CS_ram=1'b0;CS_rom=1'b0;OE_ram=1'b0;OE_rom=1'b0;
		
		
		#10 ADDR=5'h04;
		while (ADDR<5'h1F)
		begin
			OE_rom=1'b1; WS_ram=1'b0;
			#10 OE_ram=1'b0; WS_ram=1'b1;data_in={DATA_rom[0],DATA_rom[7],DATA_rom[1],DATA_rom[6],DATA_rom[2],DATA_rom[5],DATA_rom[3],DATA_rom[4]};
			#15 ADDR=ADDR+1'b1;
			
		end
		
		
		#10 $display("Reading Ram");CS_rom=1'b1;
		for (ADDR=5'h04;ADDR<5'h1F;ADDR=ADDR+1'b1)
		begin
			#10 OE_ram=1'b1; WS_ram=1'b0;
		end
		
		#10 $finish;
	end
	
endmodule
