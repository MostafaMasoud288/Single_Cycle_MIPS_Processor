module instruction_memory #(parameter memory_width=32 ,memory_address=8)
(
  input [memory_address-1:0] A,
  output [memory_width-1:0] RD
);
reg [memory_width-1:0] ROM [0:2**memory_address-1];
integer i;

/////program_test1///////
initial
begin
ROM[0]=32'h00008020;
ROM[1]=32'h20100007;
ROM[2]=32'h00008820;
ROM[3]=32'h20110001;
ROM[4]=32'h12000003;
ROM[5]=32'h0230881C;
ROM[6]=32'h2210FFFF;
ROM[7]=32'h08000004;
ROM[8]=32'hAC110000;
   for(i=9;i<256;i=i+1)
       begin
         ROM[i]=32'h0;
       end
end

/////program_test2///////
/*initial
begin
ROM[0]=32'h00008020;
ROM[1]=32'h20100078;
ROM[2]=32'h00008820;
ROM[3]=32'h201100B4;
ROM[4]=32'h00009020;
ROM[5]=32'h12110006;
ROM[6]=32'h0211482A;
ROM[7]=32'h11200002;
ROM[8]=32'h02308822;
ROM[9]=32'h08000005;
ROM[10]=32'h02118022;
ROM[11]=32'h08000005;
ROM[12]=32'h00109020;
ROM[13]=32'hAC120000;
   for(i=14;i<256;i=i+1)
       begin
         ROM[i]=32'h0;
       end
end*/
assign RD = ROM[A]; ///address=PC[9:2];
endmodule
