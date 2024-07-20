
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