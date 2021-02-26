`timescale 100ps/100ps 

`include "dff.v"
`include "mux2.v"

module register(CLK, RST, ENA, DATA, R); 
input CLK, ENA, RST; 
input [7:0] DATA; 
output [7:0] R; 
wire M1,M2,M3,M4,M5,M6,M7,M8;
wire [7:0] temp;
wire [7:0] MUXOUT;

mux2 mux2_1(M1, DATA[0], R[0], ENA);
mux2 mux2_2(M2, DATA[1], R[1], ENA);
mux2 mux2_3(M3, DATA[2], R[2], ENA);
mux2 mux2_4(M4, DATA[3], R[3], ENA);
mux2 mux2_5(M5, DATA[4], R[4], ENA);
mux2 mux2_6(M6, DATA[5], R[5], ENA);
mux2 mux2_7(M7, DATA[6], R[6], ENA);
mux2 mux2_8(M8, DATA[7], R[7], ENA);

//mux2 (MUXOUT, DATA, R, ENA);


dff dff_1(R[0], temp[0], CLK, M1, RST);
dff dff_2(R[1], temp[1], CLK, M2, RST);
dff dff_3(R[2], temp[2], CLK, M3, RST);
dff dff_4(R[3], temp[3], CLK, M4, RST);
dff dff_5(R[4], temp[4], CLK, M5, RST);
dff dff_6(R[5], temp[5], CLK, M6, RST);
dff dff_7(R[6], temp[6], CLK, M7, RST);
dff dff_8(R[7], temp[7], CLK, M8, RST);

//dff (R, temp, CLK, MUXOUT, RST);


endmodule