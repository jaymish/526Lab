`timescale 1 ns / 1 ns

module AASD (AASD_RST, CLK, RST);
  output reg AASD_RST;
  input CLK, RST;
  reg HIGH;

always @ (posedge CLK or negedge RST)
  if (!RST) begin // if reset is low then,
    AASD_RST <= 1'b0; // output will always be zero
  end
  else begin
    AASD_RST <= 1'b1; // output is synchronized and
  end // counter will work normally
endmodule