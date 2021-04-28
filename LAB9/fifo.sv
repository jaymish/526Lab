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
`timescale 1 ns / 1 ns


module FIFO_final(data_out, empty, almost_size_empty, full, almost_size_full, valid, overflow, underflow, count, data_in, clk, rd_en, wr_en, rst_n);
parameter depth=8, almost_size=2, count_size=3;
input clk, rst_n, rd_en, wr_en;
input [7:0]data_in;

output reg [7:0]data_out=8'b0;
output reg empty, almost_size_empty, full, almost_size_full, valid, overflow, underflow ;
output reg [count_size:0] count=4'b0; 

//parameter MEMORY_DEPTH = 5;
reg [count_size:0] temp;
reg [7:0] memory [0:depth-1];
reg [count_size-1:0] wr_p=3'b0, rd_p=3'b0;

initial
begin
	for(temp=0;temp<depth;temp=temp+1)
		memory[temp]=8'b0;
end
// reading data out from the FIFO
always @( posedge clk or posedge rst_n)
begin
   if( rst_n )
   begin
      data_out <= 0;
	  for(temp=0;temp<depth;temp=temp+1)
		memory[temp]=8'b0;
   end
   else
   begin
   `ifdef NORMAL
      if( rd_en && !empty )
	  begin
         data_out <= memory[rd_p];
		 valid <= 1;
		 end

      else
	  begin
         data_out <= data_out;
		 valid <= 0;
		 end
	`endif
	`ifdef FWFT
      if( rd_en && !empty )
	  begin
         data_out <= memory[rd_p+1];
		 valid <= 1;
		 end

      else
	  begin
         data_out <= memory[rd_p];
		 valid <= 0;
		 end
	`endif
   end
end

//writing data in the FIFO
always @(posedge clk)
begin
   if( wr_en && !full )
      memory[wr_p] <= data_in;

   else
      memory[wr_p] <= memory[wr_p];
end



//pointer increment system
always @ (posedge clk or posedge rst_n)
begin 
	if(rst_n)
	begin
		wr_p <= 0;
		rd_p <= 0;
		`ifdef FWFT
			rd_p <= 3'b001;
		`endif
	end
	else
	begin
		if(!full && wr_en)
		wr_p <= wr_p+1;
		
		else
		wr_p <= wr_p;
			
		if(!empty && rd_en)
		rd_p <= rd_p+1;
		else
		rd_p <= rd_p;
		
		if(full && wr_en)
		overflow <= 1;
		else
		overflow <= 0;
		
		if(empty && rd_en)
		underflow <= 1;
		else
		underflow <= 0;
		
	end
end

// code for counting
always @(posedge clk or posedge rst_n)
begin
   if( rst_n )
       count <= 0;

   else if( (!full && wr_en) && ( !empty && rd_en ) )
       count <= count;

   else if( !full && wr_en )
       count <= count + 1;

   else if( !empty && rd_en )
       count <= count - 1;
   else
      count <= count;
end

//for full and empty
always @(count)
begin
if(count==0)
  empty = 1 ;
  else
  empty = 0;
  
if(count<=almost_size)
  almost_size_empty = 1 ;
  else
  almost_size_empty = 0;
  
if(count>=(depth-almost_size))
  almost_size_full = 1 ;
  else
  almost_size_full = 0;

  if(count==depth)
   full = 1;
   else
   full = 0;
end

endmodule