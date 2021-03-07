//counter_tb.v

` timescale 1 ns / 1 ns
`define clock_period 20

module tb_TOP_Counter();
  wire [7:0] CNT;
  reg [7:0] DATA;
  reg RST, CLK, LOAD, ENA;
  
  TOP_Counter UUT(CNT, DATA, CLK, RST, ENA, LOAD);
  //CLK Generator
  initial begin
    CLK = 1'b0;
    forever #(`clock_period/2) CLK = ~CLK;
  end
  
  initial
    $monitorb("%d CLK = %b ENA = %b RST = %b LOAD= %b DATA= %b | DEC_DATA=%d | CNT= %b | DEC_CNT=%d",$time, CLK, ENA, RST, LOAD, DATA, DATA, CNT, CNT);

  initial begin
    $vcdpluson;
    // Demonstrates Asynchronous Reset
    #10 $display ("\n Demonstrates an asynchronous reset\n"); RST =
    1'b0;
    // Counter initiates
    #20 $display ("\n The counter initiates incrementing after reset is released\n"); ENA = 1'b1; RST = 1'b1;
    LOAD = 1'b0;
    // After 8 there is parallel load of 250
    #180 $display ("\n After it reaches a count of 8, parallel load 250 decimal is introduced\n"); ENA
    = 1'b1; LOAD = 1'b1; DATA = 8'd250;
    //Starts counting from 250 and rolls over
    #20 $display ("\n It will count from 250 until the counter rolls over (i.e. returns to zero) and then starts counting back up\n"); LOAD = 1'b0;
    //Reset overrides Load
    #140 $display ("\n Reset overrides load\n"); LOAD = 1'b1; RST =
    1'b0;
    #30 $display("\n Parellel Load"); RST=1'b1;
    #40 $display("\n Counter reset"); RST=1'b0;
    
    // Reset overrides increment 
    #50 $display ("\n Reset overrides enable\n"); LOAD = 1'b0; ENA
    = 1'b1; RST = 1'b0; DATA = 8'd10;
    #60 ENA = 1'b1; RST = 1'b1; LOAD = 1'b0;
    //Enable low for Load
    #140 $display ("\n Enable low for Load\n"); LOAD = 1'b1; ENA =
    1'b0;
    // Enable low for increment
    #40 $display ("\n Enable low for increment \n"); LOAD = 1'b0; ENA
    = 1'b0; DATA = 8'd200;
    //#40 $stop;
    #40 $finish;
  end
endmodule