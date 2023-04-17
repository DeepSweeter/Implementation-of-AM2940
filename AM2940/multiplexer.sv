module mux_1_2(din0, din1, dout, sel);
  
  input [7:0] din0, din1;
  input sel;
  output [7:0] dout;
  
  assign dout = sel ? din1 : din0;
endmodule

module mux_1_3(din0, din1, din2, dout, sel);
  
  input [7:0] din0, din1;
  input [2:0] din2;
  output reg [7:0] dout;
  input [1:0] sel;
  always @(din0 or din1 or din2 or sel)
    casex(sel)
      3'b00: dout = din0;
      3'b01: dout = din1;
      3'b1x: dout = {5'b11111,din2};
    endcase
  
endmodule
