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
