module shift_left_twice_tb();
parameter bits_number=16;
 reg[bits_number-1:0] inp;
 wire[bits_number-1:0] out;
initial
begin
inp=125;
#100;
inp=66;
#100;
inp=10;
#100;
end
shift_left_twice dut(inp,out);
endmodule

//////////
module shift_left_twice #(parameter bits_number=32)(

 input[bits_number-1:0] inp,
 input[bits_number-1:0] out

);
assign out= inp<<2;
endmodule
