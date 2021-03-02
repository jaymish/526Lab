`timescale 100ps/100ps 


module majority(out,a,b,c,d);
input a,b,c,d;
output out;
wire a1,a2,a3,a4;


/*and and1(a1,a,b,c);
and and2(a2,a,b,d);
and and3(a3,a,c,d);
and and4(a4,b,c,d);

or or1(out,a1,a2,a3,a4);*/

assign a1=a&b&c;
assign a2=a&b&d;
assign a3=a&c&d;
assign a4=b&c&d;

assign out=a1|a2|a3|a4;


endmodule