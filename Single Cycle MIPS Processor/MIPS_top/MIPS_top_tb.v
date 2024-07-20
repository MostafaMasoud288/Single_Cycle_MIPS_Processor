module MIPS_top_tb();
reg clk;
reg reset;
wire [15:0]test_value;

MIPS_top mips(.clk(clk),.reset(reset),.test_value(test_value));

localparam T=10;
always 
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial
begin
reset=1'b0;
#5;
reset=1'b1;
#50;
end

endmodule
