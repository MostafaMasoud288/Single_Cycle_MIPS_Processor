module shift_left_twice #(parameter width_in=32,width_out=32)(

 input[width_in-1:0] inp,
 input[width_out-1:0] out

);
assign out= inp<<2;
endmodule
