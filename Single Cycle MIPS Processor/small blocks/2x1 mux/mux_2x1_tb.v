module mux_2x1_tb ();
parameter WIDTH =16;
    reg [WIDTH-1:0] in0;
    reg [WIDTH-1:0] in1;
    reg sel;
    wire  [WIDTH-1:0] out;
mux_2x1 dut(in0,in1,sel,out);

initial begin
in0=50;
in1=40;
sel=0;
#100;
sel=1;
#100;
end
endmodule

/////////////////
module mux_2x1 #(parameter WIDTH =32 ) (
    input wire [WIDTH-1:0] in0,
    input wire [WIDTH-1:0] in1,
    input wire sel,
    output reg  [WIDTH-1:0] out
);

always@*
begin
if(sel)
out=in1;
else
out=in0;
end

endmodule