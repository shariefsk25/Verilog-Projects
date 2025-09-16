module tlc(clk,rst,state,cnt);
parameter RED=2'b00;
parameter YEL=2'b01;
parameter GRN=2'b10;
input clk,rst;
output reg [1:0]state;
output reg [3:0]cnt=0;


always@(posedge clk) 
begin
                
	if(rst) 
              begin
		state <=RED;

              end
	else 
                  begin
		if(state==RED) 
                     begin
			cnt  <=cnt+1;
			if(cnt==5) 
                              begin
			state <= GRN; 
			      end
		      end

		if(state==GRN) 
                      begin
			cnt <=cnt+1;
			if(cnt==10) 
                               begin
				state <= YEL;
			        end
		      end

		if(state==YEL) 
                      begin
			cnt <=cnt+1;
			if(cnt==15) 
                                begin
				state <= RED;
			         end
		       end
	            end
end



endmodule
