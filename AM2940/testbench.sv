module AM2940_tb();

  reg clkt, acit, wcit;
  reg [2:0] It;
  reg [7:0] dataint;
  wire[7:0] dataoutt, addroutt;
  wire wcot, acot, donet;
  
  AM2940 DUT(.clk(clkt), .I(It), .datain(dataint), .dataout(dataoutt), .addrout(addroutt), .done(donet), .aci(acit), .aco(acot), .wci(wcit), .wco(wcot));
 


  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, DUT);
    end
  
	initial
    	begin
        	#0 clkt = 1'b1;
      	forever #5 clkt =~clkt;
    end
  

  initial
    #750 $finish;

  initial
    begin
      // Scrie in CR o valoare| cei 3 mai nesemnificativi biti din datain:
      // I: Write Control Register | CR: x 
      #5 It = 3'b0; acit = 1'b0; wcit = 1'b0; dataint = 8'b0010_0000;
      // Citeste valoarea stocata in CR 
      // t10 I: Read Control Register | CR: x
      #10 It = 3'b001;
      
      // t20 I: Load Counter register
      #10 It = 3'b110; dataint = 8'hac;
      
      
      //Testez incarcarile si citirile in registrul de adrese si numaratorul de adrese
      
      // t30 I: Load Address register
      #10 It = 3'b101;
      // t40 I: Read Address Counter
      #10 It = 3'b011;
      // t50 I: Write control register
      #10 It = 3'b0; dataint = 8'b0;
      // t60 I: Enable counters: AC++; Wc-- until 0
      #10 It = 3'b111;
      // t110 I: Reinitialize: AR -> AC
      #50 It = 3'b100;
      // t120 I: Read Address Register*
      #10 It = 3'b011;
      
      
      //Testez incarcarile si citirile in registrul de cuvinte si numaratorul de cuvinte
      // Caz 1: CR = 0,2,3 => D->WR, WC
      
      // t130 Load Word Count
      #10 It = 3'b110; dataint = 8'hcd;
      // t140 Read Word Count
      #10 It = 3'b010;
      // t150 Write Control Register
      #10 It = 3'b000; dataint = 8'b010;
      // t160 Enable counters
      #10 It = 3'b111;
      // t210 Reinitialize
      #50 It = 3'b100;
      // t220 Read WC;
      #10 It = 3'b010;
      
      //OBS: ***Numaratorul de cuvinte ia valoare 0 dupa instructiunea 6, chiar daca registrul de control nu are valoare 1. Valoarea lui dataout ramane cea din numaratorul de adrese.***
      
      // Caz 2: CR = 1 => D->WR, 0 -> WC
      
      
      // t230 Load Word Count
      #10 It = 3'b110; dataint = 8'h18;
      // t240 Read Word Count
      #10 It = 3'b010;
      // t250 Write Control Register
      #10 It = 3'b000; dataint = 8'b001;
      // t260 Enable counters
      #10 It = 3'b111;
      // t310 Reinitialize
      #50 It = 3'b100;
      // t320 Read WC;
      #10 It = 3'b010;
      
      
      
		//Enabling counters
      
      // t330 I: Load Address register
      #10 It = 3'b101; dataint = 8'hab;
      
      // t340 I: Load Word register
      #10 It = 3'b110; dataint = 8'h3;
      
      // t350 Write control register
      #10 It = 3'b000; dataint = 8'b0000_0000;
     
      
      
      
      // t360 I: Enable counters | CR: Inc ADDR , Dec Word
      #10 It = 3'b111;     
      
      // t410 I: Write control register
	  #50 It = 3'b000; dataint = 8'b0000_0001;
      
      // t420 I: Enable counters | CR: Inc ADDR , Inc Word
      #10 It = 3'b111;
      
      // t440 I: Write control register
	  #50 It = 3'b000; dataint = 8'b0000_0010;
      
      // t490 I: Enable counters | CR: Inc ADDR , Encw = 0;
      #10 It = 3'b111;
      
      // t500 I: Write control register
	  #50 It = 3'b000; dataint = 8'b0000_0100;
      
      // t550 I: Enable counters | CR: Dec ADDR , Dec Word
      #10 It = 3'b111;
      
      // t560 I: Write control register
	  #50 It = 3'b000; dataint = 8'b0000_0111;
      
      // t610 I: Enable counters | CR: Dec ADDR , Inc Word
      #10 It = 3'b111;
      
      // t620 I: Write control register
	  #50 It = 3'b000; dataint = 8'b0000_0110;
      
      // t670 I: Enable counters | CR: Dec ADDR , Enwc = 0
      #10 It = 3'b111;
      
      // t680 I: Read word counter
      #10 It = 3'b010;
      
      // t690 I: Read address counter
      #10 It = 3'b011;
      
      // t700 I: Read Control register
      #10 It = 3'b001;
         
 
    end

endmodule 