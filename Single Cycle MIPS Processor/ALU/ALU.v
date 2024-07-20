module ALU(
 input [31:0] srca,srcb,
 input [2:0]alu_control,
 output reg [31:0] alu_result,
 output reg zero_flag
);
always@*
begin
case(alu_control)
3'b000: alu_result=srca&srcb;
3'b001: alu_result=srca^srcb;
3'b010: alu_result=srca+srcb;
3'b011: alu_result=32'bx;
3'b100: alu_result=srca-srcb;
3'b101: alu_result=srca*srcb;
3'b110: 
       begin
             if(srca<srcb)
             alu_result=1;
             else
             alu_result=0;  
       end 
3'b111: alu_result=32'bx;
endcase
if(alu_result==0)
zero_flag=1'b1;
else
zero_flag=1'b0;
end
endmodule