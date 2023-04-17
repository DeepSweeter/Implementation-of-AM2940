module instruction_decoder(I, CR, plar, plwr, sela, selw, plcr,
                           seld, plac, ena, inca, deca, resw,
                           plwc, enw, incw, decw, oedata);
  input [2:0] I, CR;
  output reg plar, plwr, sela, selw, plcr, plac, ena, inca, deca, resw, plwc, enw, incw, decw, oedata;
  output reg [1:0] seld;
  
    always@(I or CR)
    casex({I,CR})
      6'b000_xxx: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b1;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b001_xxx: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'b1x;
        plac = 1'b0;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b1;
      end
      
      6'b010_xxx: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'b01;
        plac = 1'b0;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b1;
      end
      6'b011_xxx: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'b00;
        plac = 1'b0;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b1;
      end
      
      6'b100_xx0, 6'b100_x11: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'b1;
        selw = 1'b1;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b1;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b100_x01: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'b1;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b1;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b1;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b101_xxx: begin
        plar = 1'b1;
        plwr = 1'b0;
        sela = 1'b0;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b1;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
     6'b110_xx0, 6'b110_x11: begin
        plar = 1'b0;
        plwr = 1'b1;
        sela = 1'bx;
        selw = 1'b0;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b1;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b110_x01: begin
        plar = 1'b0;
        plwr = 1'b1;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b0;
        inca = 1'b0;
        deca = 1'b0;
        resw = 1'b1;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b111_000: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b1;
        inca = 1'b1;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b1;
        incw = 1'b0;
        decw = 1'b1;
        oedata = 1'b0;
      end
      
      6'b111_0x1: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b1;
        inca = 1'b1;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b1;
        incw = 1'b1;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b111_010: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b1;
        inca = 1'b1;
        deca = 1'b0;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b111_100: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b1;
        inca = 1'b0;
        deca = 1'b1;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b1;
        incw = 1'b0;
        decw = 1'b1;
        oedata = 1'b0;
      end
      
      6'b111_1x1: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b1;
        inca = 1'b0;
        deca = 1'b1;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b1;
        incw = 1'b1;
        decw = 1'b0;
        oedata = 1'b0;
      end
      
      6'b111_110: begin
        plar = 1'b0;
        plwr = 1'b0;
        sela = 1'bx;
        selw = 1'bx;
        plcr = 1'b0;
        seld = 2'bxx;
        plac = 1'b0;
        ena = 1'b1;
        inca = 1'b0;
        deca = 1'b1;
        resw = 1'b0;
        plwc = 1'b0;
        enw = 1'b0;
        incw = 1'b0;
        decw = 1'b0;
        oedata = 1'b0;
      end
    endcase
      
endmodule