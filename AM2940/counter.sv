module counter_8b(clk, reset, pl, ci, cout, dec, inc, encnt, di, dout);
  input clk, reset, encnt, ci, inc, dec, pl;
  input [7:0] di;
  output reg[7:0] dout;
  output cout;
    
  assign cout = !((!((dout === 8'hff)&& encnt && inc && (!ci))) && (!((dout === 8'h0) && encnt && dec && (!ci))));
  
  always @(posedge clk)
    if(reset)
      dout <= 8'b0;
  	else
      if(pl)
        dout <= di;
      else
        if(encnt && !ci)
          casex({inc, dec})
            2'b1_x: dout <= dout + 1;
            2'b0_1: dout <= dout - 1;
          endcase
  
endmodule