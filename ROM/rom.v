/*
//1PORT ROM design and verification with verilog
//design code in behavioral style

module rom(clk,rst,outdata,addr,en);//1
  //parameter/2
  
  input clk,rst,en;//3
  input [2:0]addr;//3
  output reg [7:0]outdata;//3
  //internal//4
  
  reg [7:0]mem[7:0] ;//8x8=64 bits //5
  
  
  always@(posedge clk,posedge rst)//6
    begin
      if(rst)
         outdata<=8'b0;//test case1=>180
      else
			  
        if(en)
          outdata<=mem[addr];//test case2=> 0 to 140
      else 
        outdata<=8'bx;//test case3=>200
	          	
    end//6
  
initial//7
  begin
    mem[0]=8'b0;
    mem[1]=8'b0;
    mem[2]=8'b1;
    mem[3]=8'b10;
    mem[4]=8'b1111;
	mem[5]=8'b1111;
mem[6]=8'b1111;
mem[7]=8'b1111;


  end//7

endmodule//8


//TB code

module tb;//1
  //parameter//2
  reg clk,rst,en;//3
  reg [2:0]addr;//3
  wire [7:0]outdata;//3
  //no internal in tb
  
  //variable declraton//4
  rom dut(.*);//5
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
     en=1;addr=3'b0;#20;
	 addr=3'bxxx;#20;//at 40,i dont want any data
	 	// addr=3'b1;#20;
	 addr=3'b10;#20;
	 addr=3'b11;#20;
	 addr=3'b100;#20;
	 addr=3'b101;#20;
	 addr=3'b110;#20;
	 addr=3'b111;#60;
en=0;
#20;addr=3'bxxx;en=1;//at 220 we checking with invlaid address
#20;


    end
  
  
endmodule */

//1PORT ROM design and verification with verilog
//design code in behavioral style

module rom(clk,rst,outdata,addr,en);//1
  parameter MEM_ADDR_SIZE = 3;
  parameter DATA_WIDTH =4;
  
  input clk,rst,en;//3
  input [MEM_ADDR_SIZE-1:0]addr;//3
  output reg [DATA_WIDTH-1:0]outdata;//3
  //internal//4
  
  reg [DATA_WIDTH-1:0]mem[DATA_WIDTH-1:0] ;//8x8=64 bits //5
  
  
  always@(posedge clk,posedge rst)//6
    begin
      if(rst)
         outdata<=8'b0;//test case1=>180
      else
			  
        if(en)
          outdata<=mem[addr];//test case2=> 0 to 140
      else 
        outdata<=8'bx;//test case3=>200
	          	
    end//6
  
initial//7
  begin
    mem[0]=8'b0;
    mem[1]=8'b0;
    mem[2]=8'b1;
    mem[3]=8'b10;
    mem[4]=8'b1111;
	mem[5]=8'b1111;
mem[6]=8'b1111;
mem[7]=8'b1111;


  end//7

endmodule//8


//TB code

module tb;//1
  parameter MEM_ADDR_SIZE = 3;
  parameter DATA_WIDTH =4;
  

  reg clk,rst,en;//3
  reg [MEM_ADDR_SIZE-1 :0]addr;//3
  wire [DATA_WIDTH-1:0]outdata;//3
  //no internal in tb
  
  //variable declraton//4
  rom dut(.*);//5
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
     en=1;addr=3'b0;#20;
	 addr=3'bxxx;#20;//at 40,i dont want any data
	 	// addr=3'b1;#20;
	 addr=3'b10;#20;
	 addr=3'b11;#20;
	 addr=3'b100;#20;
	 addr=3'b101;#20;
	 addr=3'b110;#20;
	 addr=3'b111;#60;
en=0;
#20;addr=3'bxxx;en=1;//at 220 we checking with invlaid address
#20;


    end
  
  
endmodule 
