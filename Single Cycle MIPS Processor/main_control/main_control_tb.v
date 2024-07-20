module main_control(
input [5:0] Opcode,
output reg Jump,
output reg MemWrite,
output reg RegWrite,
output reg RegDest,
output reg ALUSrc,
output reg MemtoReg,
output reg Branch,
output reg[1:0]ALUOp
);
always@*
begin
case(Opcode)
6'b100011:   //lw
begin
 Jump=0;
 MemWrite=0;
 RegWrite=1;
 RegDest=0;
 ALUSrc=1;
 MemtoReg=1;
 Branch=0;
 ALUOp=2'b00;
end
6'b101011:   //sw
begin
 Jump=0;
 MemWrite=1;
 RegWrite=0;
 RegDest=0;
 ALUSrc=1;
 MemtoReg=1;
 Branch=0;
 ALUOp=2'b00;
end
6'b000000:   //R TYPE
begin
 Jump=0;
 MemWrite=0;
 RegWrite=1;
 RegDest=1;
 ALUSrc=0;
 MemtoReg=0;
 Branch=0;
 ALUOp=2'b10;
end
6'b001000:   //addi
begin
 Jump=0;
 MemWrite=0;
 RegWrite=1;
 RegDest=0;
 ALUSrc=1;
 MemtoReg=0;
 Branch=0;
 ALUOp=2'b00;
end
6'b000100:   //beq
begin
 Jump=0;
 MemWrite=0;
 RegWrite=0;
 RegDest=0;
 ALUSrc=0;
 MemtoReg=0;
 Branch=1;
 ALUOp=2'b01;
end
6'b000010:   //jal&j
begin
 Jump=1;
 MemWrite=0;
 RegWrite=0;
 RegDest=0;
 ALUSrc=0;
 MemtoReg=0;
 Branch=0;
 ALUOp=2'b00;
end
default:
begin
 Jump=0;
 MemWrite=0;
 RegWrite=0;
 RegDest=0;
 ALUSrc=0;
 MemtoReg=0;
 Branch=0;
 ALUOp=2'b00;
end
endcase
end

endmodule
///////////////////////////////////
module main_control_tb();
reg [5:0] Opcode;
wire Jump;
wire MemWrite;
wire RegWrite;
wire RegDest;
wire ALUSrc;
wire MemtoReg;
wire Branch;
wire[1:0]ALUOp;
main_control dut(Opcode,
 Jump,
 MemWrite,
 RegWrite,
 RegDest,
 ALUSrc,
 MemtoReg,
 Branch,
 ALUOp);
initial
begin
Opcode=6'b100011;
#100;
Opcode=6'b101011;
#100;
Opcode=6'b000000;
#100;
Opcode=6'b001000;
#100;
Opcode=6'b000100;
#100;
Opcode=6'b000010;
#100;
Opcode=6'b111111;
#100;
end
endmodule
