module data_memory_tb();
 reg clk,we;
 reg [31:0]A;
 reg [31:0]WD;
 wire[31:0] RD;
 wire [15:0] test_value;
data_memory dut(clk,we,A,WD,RD,test_value);
always
begin
clk=0;
#50;
clk=1;
#50;
end
initial 
begin
A=10;
we=0;
#100;
we=1;
A=0;
WD=32'h15151515;
#100;
end
endmodule 
