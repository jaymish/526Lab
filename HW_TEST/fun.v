`timescale 1ns/1ns
module fun(OUT,in);
  input [2:0] in;
  output reg OUT;
  wire [2:0] sel;
    always @(in)
    begin
      case(in)
        3'b001  : OUT=1'b0;
        3'b110: OUT=1'b0;
        default: OUT=1'b1;
      endcase
    end
endmodule
