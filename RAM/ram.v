//1PORT RAM design and verification with verilog
//design code in behavioral style

module ram(clk,rst,indata,outdata,addr,en,wr);//1
  //parameter/2
  
  input clk,rst,en,wr;//3
  input [2:0]addr;//3
  input  [7:0]indata;//3
  output reg [7:0]outdata;//3
  //internal//4
  
  reg [7:0]mem[7:0] ;//8x8=64 bits //5
  
  
  always@(posedge clk,posedge rst)//6
    begin
      if(rst)
         outdata<=8'b0;//test case1=>180
      else
			  
        if(en && wr==1)
				mem[addr]=indata;//test case 2
				else if(en && wr==0)
          outdata<=mem[addr];//test case3=> 
      else 
        outdata<=8'bx;//test case3=>
	         
    end//6
  

endmodule//7


//TB code

module tb;//1
  //parameter//2
  reg clk,rst,en,wr;//3
  reg [2:0]addr;//3
  reg [7:0]indata;
  wire [7:0]outdata;//3
  //no internal in tb
  
  //variable declraton//4
  ram dut(.*);//5
  initial//6
    begin
      clk=1;
      forever #10 clk=~clk;
    end
  
  initial//7
    begin
          
      rst=0;
      #180 rst=1;
      #20; rst=0;
      #100 $finish;
  
    end
  
  initial//8
    begin
     en=1;addr=3'b0;indata=8'b0;wr=1;#20;
	 
     indata=8'bx;wr=0;#20;

/*	 addr=3'bxxx;#20;//at 40,i dont want any data
	 	// addr=3'b1;#20;
	 addr=3'b10;#20;
	 addr=3'b11;#20;
	 addr=3'b100;#20;
	 addr=3'b101;#20;
	 addr=3'b110;#20;
	 addr=4'b111;#60;
en=0;
#20;addr=3'bxxx;en=1;//at 220 we checking with invlaid address
#20;*/


    end
  
  
endmodule  
