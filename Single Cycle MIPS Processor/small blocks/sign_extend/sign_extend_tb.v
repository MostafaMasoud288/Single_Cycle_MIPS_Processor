module sign_extend(

input [15:0] inp,
output [31:0] out

);
assign out = {{16{inp[15]}} , inp};
endmodule

///////////////
module sign_extend_tb();

reg [15:0] inp;
wire [31:0] out;
sign_extend dut(inp,out);
initial begin
inp=16'h8000;
#100;
inp=16'h4fff;
#100;
inp=16'hff00;
#100;
end

endmodule
