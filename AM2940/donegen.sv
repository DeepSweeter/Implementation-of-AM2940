module done_gen(dowc, dowr, doac, cinw, mode, done);
  input[7:0] dowc, dowr, doac;
  input[1:0] mode;
  input cinw;
  output reg done;
  
  always @(dowc or dowr or doac or cinw or mode)
    casex({mode, cinw})
      3'b00_0: done = (dowc === 8'b1);
      3'b00_1: done = ~(dowc);
      3'b01_0: done = (dowc + 1 === dowr);
      3'b01_1: done = (dowc === dowr);
      3'b10_x: done = (dowc === doac);
      3'b11_x: done = 1'b0;
    endcase
endmodule