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
for(i=0;i<32;i=i+1)
RegisterFile[i]=32'b0;
end
////synchronous write process////
always@(posedge clk)
begin
if(we3)
RegisterFile[A3]<=WD3;
else
RegisterFile[A3]<=RegisterFile[A3];
end
////asynchronous read process////
assign RD1 = RegisterFile[A1];
assign RD2 = RegisterFile[A2];
endmodule