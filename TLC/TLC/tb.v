`include "tlc.v"
module tb;
parameter RED=2'b00;
parameter YEL=2'b01;
parameter GRN=2'b10;
reg clk,rst;
wire [1:0]state;
wire [3:0]cnt;
tlc dut(clk,rst,state,cnt);


initial
begin
clk=0;
forever
begin
 #5 clk=~clk;
end
end 




	initial 
begin
rst=1;

	@(posedge clk);
	//#5;
	rst=0;
#150;
rst=1;
#200;
rst=0;
end

 initial
 begin
	#500 $finish;
end

initial
begin
	$monitor("time=%0t,clk=%b,rst=%b,state=%b,cnt=%d",$time,clk,rst,state,cnt);
end


endmodule


