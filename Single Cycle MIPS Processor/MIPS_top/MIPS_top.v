module MIPS_top
(
 input clk,
 input reset,
 output [15:0]test_value
);
/////internal wires //////////
wire Jump;
wire  MemWrite;
wire  RegWrite;
wire  RegDest;
wire  ALUSrc;
wire  MemtoReg;
wire  Branch;
wire [2:0]ALUControl;
wire PCSrc;
wire Zero;
wire [4:0]WriteReg;
wire [27:0]jump_address;
wire [31:0]PCbranch,PCplus4,PC_MUX1_OUT,PCJump,PC_Next_State,PC_Current_State;
wire [31:0]instruction;
wire [31:0]Result,ReadData;
wire [31:0]RD1,RD2;
wire [31:0]SignImm;
wire [31:0]SrcA,SrcB,ALUResult;
wire [31:0]Shifted_SignImm;
///////instantiation//////////
mux_2x1 #(.WIDTH(32)) branch_Mux(.in0(PCplus4),.in1(PCbranch),.sel(PCSrc),.out(PC_MUX1_OUT));
mux_2x1 #(.WIDTH(32)) Jump_Mux(.in0(PC_MUX1_OUT),.in1(PCJump),.sel(Jump),.out(PC_Next_State));
mux_2x1 #(.WIDTH(5)) A3_Dest_Mux(.in0(instruction[20:16]),.in1((instruction[15:11])),.sel(RegDest),.out(WriteReg));
mux_2x1 #(.WIDTH(32)) ALU_Mux(.in0(RD2),.in1(SignImm),.sel(ALUSrc),.out(SrcB));
mux_2x1 #(.WIDTH(32)) Memory_Out_Mux(.in0(ALUResult),.in1(ReadData),.sel(MemtoReg),.out(Result));


PC pc(.datain(PC_Next_State),.clk(clk),.reset_n(reset),.PC_reg(PC_Current_State));

instruction_memory #(.memory_width(32) ,.memory_address(8) ) ROM(.A(PC_Current_State[9:2]),.RD(instruction));

register_file #(.memory_width(32),.address_width(5) ) RegFile(.A1(instruction[25:21]),.A2(instruction[20:16]),.A3(WriteReg),.WD3(Result),.clk(clk),.we3(RegWrite),
 	      .RD1(RD1),.RD2(RD2));

control_unit control(.Opcode(instruction[31:26]),.Funct(instruction[5:0]),.ALUControl(ALUControl),.Jump(Jump),.MemWrite(MemWrite),.RegWrite(RegWrite),.RegDest(RegDest),.ALUSrc(ALUSrc),
	      .MemtoReg(MemtoReg),.Branch(Branch));

sign_extend Sign_Extend(.inp(instruction[15:0]),.out(SignImm));

ALU alu(.srca(SrcA),.srcb(SrcB),.alu_control(ALUControl),.alu_result(ALUResult),.zero_flag(Zero));

data_memory RAM(.A(ALUResult),.WD(RD2),.clk(clk),.we(MemWrite),.RD(ReadData),.test_value(test_value));

adder adder_pc4(.add_in_1(PC_Current_State),.add_in_2('d4),.add_out(PCplus4));

shift_left_twice #(.width_in(32),.width_out(32)) Shifter_branch(.inp(SignImm),.out(Shifted_SignImm));

adder pc_adder_branch(.add_in_1(Shifted_SignImm),.add_in_2(PCplus4),.add_out(PCbranch));

shift_left_twice #(.width_in(26),.width_out(28)) Shifter_Jump(.inp(instruction[25:0]),.out(jump_address));

assign PCSrc =Zero & Branch;
assign SrcA=RD1;
assign PCJump={PCplus4[31:28],jump_address};

endmodule
