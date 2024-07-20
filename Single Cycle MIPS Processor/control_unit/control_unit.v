module control_unit
(
input [5:0]Opcode,
input [5:0]Funct,
output [2:0]ALUControl,
output  Jump,
output  MemWrite,
output  RegWrite,
output  RegDest,
output  ALUSrc,
output  MemtoReg,
output  Branch
);

wire [1:0]ALUOp;
main_control main_decoder(.Opcode(Opcode),.ALUOp(ALUOp),.Jump(Jump),.MemWrite(MemWrite),.RegWrite(RegWrite),.RegDest(RegDest),.ALUSrc(ALUSrc),
                     .MemtoReg(MemtoReg),.Branch(Branch));
alu_control ALu_Decoder(.ALUOp(ALUOp),.Funct(Funct),.ALUControl(ALUControl));
endmodule
