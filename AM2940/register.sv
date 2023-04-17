module reg8(clk, pl, din, dout);
  
  input clk, pl;
  input[7:0] din;
  output reg[7:0] dout;
  
  always @(posedge clk)
      if(pl)
        dout <= din;


endmodule

module reg3(clk, pl, din, dout);
  
  input clk, pl;
  input[2:0] din;
  output reg[2:0] dout;
  
  always @(posedge clk)
      if(pl)
        dout <= din;
  
endmodule