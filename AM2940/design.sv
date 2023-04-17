// Chirica Andrei
// 1209A

`include"register.sv" 
`include"multiplexer.sv"
`include"counter.sv"
`include"donegen.sv"
`include"instructiondec.sv"


module AM2940(clk, I, datain, dataout, addrout, done, aci, aco, wci, wco);
  input clk, aci, wci;
  input [2:0] I;
  input [7:0] datain;
  output [7:0] addrout;
  output [7:0] dataout;
  output  wco, aco, done;
  
  
  // Variabile de transfer intre module
  wire plar, plwr, sela, selw, plcr, plac, ena, inca, deca, resw, plwc, enw, incw, decw, oedata;
  wire[1:0] seld;
  wire[7:0] arout, wrout, amout, wmout, acout, wcout;
  wire[2:0] crout;
  
  assign addrout = acout;
  
  // Decodorul de instructiuni. Face decode in functie de I(instruction) si CR(Command register)
  instruction_decoder instr_dec(.I(I), .CR(datain[2:0]), .plar(plar), .plwr(plwr), .sela(sela), .selw(selw), .plcr(plcr),
                      .seld(seld), .plac(plac), .ena(ena), .inca(inca), .deca(deca), .resw(resw),
                      .plwc(plwc), .enw(enw), .incw(incw), .decw(decw), .oedata(oedata));
 
  // Registrul de adresa
  reg8 addrReg(.clk(clk), .pl(plar), .din(datain[7:0]), .dout(arout[7:0])); 
  // Multiplexorul cu output in registrul numarator al adreselor
  mux_1_2 addrMux(.din0(datain[7:0]), .din1(arout[7:0]), .dout(amout[7:0]), .sel(sela));
  // Registrul numarator al adreselor
  counter_8b addrCnt(.clk(clk), .reset(1'b0), .pl(plac), .ci(aci), .cout(aco), .dec(deca), .inc(inca), .encnt(ena), .di(amout[7:0]), .dout(acout[7:0]));

  // Registrul pentru cuvinte
  reg8 wordReg(.clk(clk), .pl(plwr), .din(datain), .dout(wrout));
  // Multiplexor cu output in registrul numarator al cuvintelor
  mux_1_2 wordMux(.din0(datain), .din1(wrout), .dout(wmout[7:0]), .sel(selw));
  
  // Numaratorul de cuvinte
  counter_8b wordCnt(.clk(clk), .reset(resw), .pl(plwc), .ci(wci), .cout(wco), .dec(decw), .inc(incw), .encnt(enw), .di(wmout[7:0]), .dout(wcout[7:0]));
  
  // Registrul in care se stocheaza comanda
  reg3 controlReg(.clk(clk), .pl(plcr), .din(datain[2:0]), .dout(crout));
  
  // Multiplexor pentru a alege ce intra in magistrala de Data pentru output
  mux_1_3 dataMux(.din0(acout), .din1(wcout[7:0]), .din2(crout[2:0]), .dout(dataout), .sel(seld[1:0]));
  
  //Generatorul semnalul done care indica momentul cand s-a terminat executia
  //instructiunii
  done_gen done_generator(.dowc(wcout), .dowr(wrout), .doac(acout), .cinw(~wci), .mode(crout[1:0]), .done(done));
  

  
endmodule


