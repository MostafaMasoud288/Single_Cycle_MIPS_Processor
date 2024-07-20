module PC (
     input clk,reset_n,
     input[31:0] datain ,
     output reg [31:0]PC_reg);

     always@(posedge clk,negedge reset_n)
       begin
         if (reset_n==0)
                PC_reg=32'b0 ;
         else 
                PC_reg=datain ;
       end
endmodule


/////////////
module PC_tb();
  reg clk,reset_n;
  reg [31:0] datain ;
  wire[31:0]PC_reg;
PC dut(clk,reset_n,datain,PC_reg);
always
begin
clk=0;
#100;
clk=1;
#100;
end

initial
begin
datain=336;
reset_n=0;
#100;
reset_n=1;
#100;
reset_n=0;
#100;

end
endmodule
