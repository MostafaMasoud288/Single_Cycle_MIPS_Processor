module register_file #(parameter memory_width=32,address_width=5)(
 input clk,we3,
 input [address_width-1:0]A1,A2,A3,
 input [memory_width-1:0]WD3,
 output [memory_width-1:0]RD1,RD2
);
reg [memory_width-1:0] RegisterFile [0:2**address_width-1];
integer i;
initial
begin
for(i=0;i<256;i=i+1)
RegisterFile[i]=32'b0;

RegisterFile[10]=32'h28082002;
RegisterFile[20]=32'h18022002;

end
////synchronous write process////
always@(posedge clk)
begin
if(we3)
RegisterFile[A3]<=WD3;
end
////asynchronous read process////
assign RD1 = RegisterFile[A1];
assign RD2 = RegisterFile[A2];
endmodule
/////////////////////
module register_file_tb(); 
parameter memory_width=32;
parameter address_width=5;
 reg clk,we3;
 reg [address_width-1:0]A1,A2,A3;
 reg [memory_width-1:0]WD3;
 wire [memory_width-1:0]RD1,RD2;
register_file dut(clk,we3,A1,A2,A3,WD3,RD1,RD2);
always
begin
clk=0;
#50;
clk=1;
#50;
end
initial
begin
A1=10;
A2=20;
we3=0;
#100;
A3=30;
we3=1;
WD3=32'h11111111;
#100;
end
endmodule

