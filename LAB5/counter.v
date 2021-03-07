  `timescale 1 ns / 1ns

module counter(CNT,CLK, RST, ENA, LOAD, DATA );
  output reg [7:0] CNT;
  input CLK, RST, ENA, LOAD;
  input [7:0] DATA;

always @ (posedge CLK or negedge RST)
  if(!RST) // Asynchronous reset
    CNT <= 8'b00000000;
  else if (ENA) //Synchronous enable
  begin
    if (LOAD) //if load, new data isloaded
      CNT <= DATA;
    else
      CNT <= CNT + 1; //When asserted, count isincremented
  end
endmodule