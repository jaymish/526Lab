`timescale 100ps/100ps

module mux2(OUT, A, B, SEL);

output OUT;
input A,B, SEL;

wire A1,A2,SEL_N;

not (SEL_N,SEL);
and (A1,A,SEL_N);
and (B1,B,SEL);
or (OUT, A1, B1);

endmodule