` timescale 1 ns / 1 ns

module tb_TOP_Counter();
  wire [7:0] CNT;
  reg [7:0] DATA;
  reg RST, CLK, LOAD, ENA;
  
  TOP_Counter UUT(CNT, DATA, CLK, RST, ENA, LOAD);
  //CLK Generator
  initial begin
    CLK = 1'b0;
    forever #10 CLK = ~CLK;
  end
  
  initial
    $monitorb("%d CLK = %b ENA = %b RST = %b LOAD= %b DATA= %b | DEC_DATA=%d | CNT= %b | DEC_CNT=%d",$time, CLK, ENA, RST, LOAD, DATA, DATA, CNT, CNT);
  //$monitorb - displays the values of all objects in its list whenever any one of them changes.
  initial begin
    $vcdpluson;
    // Demonstrates Asynchronous Reset
    #10 $display ("\n Demonstrates Asynchronous Reset\n"); RST =
    1'b0;
    // Counter initiates
    #20 $display ("\n Counter initiates\n"); ENA = 1'b1; RST = 1'b1;
    LOAD = 1'b0;
    // After 8 there is parallel load of 250
    #200 $display ("\n After 8 there is parallel load of 250\n"); ENA
    = 1'b1; LOAD = 1'b1; DATA = 8'd250;
    //Starts counting from 250 and rolls over
    #20 $display ("\n Starts counting from 250\n"); LOAD = 1'b0;
    //Reset overrides Load
    #140 $display ("\n Reset overrides load\n"); LOAD = 1'b1; RST =
    1'b0;
    // Reset overrides increment
    #40 $display ("\n Reset overrides increment\n"); LOAD = 1'b0; ENA
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