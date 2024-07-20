module ALU_tb();
 reg [31:0] srca,srcb;
 reg [2:0] alu_control;
 wire [31:0] alu_result;
 wire zero_flag;

ALU dut(.scra(scra),.scrb(scrb),.alu_control(alu_control),.alu_result(alu_result),.zero_flag(zero_flag));
initial
begin
srca=16;
srcb=32;
alu_control=0;#50;
alu_control=1;#50;
alu_control=2;#50;
alu_control=3;#50;
alu_control=4;#50;
alu_control=5;#50;
alu_control=6;#50;
alu_control=7;#50;
end

endmodule

/////////////////////////
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
zero_flag=1;
else
zero_flag=0;
end
endmodule
