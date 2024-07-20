module data_memory (
 input clk,we,
 input [31:0]A,
 input [31:0]WD,
 output reg [31:0] RD,
 output [15:0] test_value
);
reg [31:0] RAM [0:255];
integer i;
initial
begin
for(i=0;i<256;i=i+1)
RAM[i]=32'b0;
end
////synchronous write process////
always@(posedge clk)
begin
if(we)
RAM[A]<=WD;
else
RAM[A]<=RAM[A];
end
////asynchronous read process////
always@*
begin
if(!we)
RD = RAM[A];
else
RD = RD;
end
assign test_value = RAM[0][15:0];
endmodule
