// Code your design here
module(
  input clk,
  output out
  
  
);
  reg [1:0]state;
  reg st;
  
  always@(posedge clk)
    begin
      case(state)
        00:
          begin
            if(st ==1)begin
				
		end
           else 
	if(st ==0)begin
				
	end				
          end
          
        01:
          begin
            if(st ==1)begin
				
		end
           else 
		if(st ==0)begin
				
		end				
          end
        
        10:
          begin
            if(st ==1)begin
				
		end
           else 
		if(st ==0)begin
				
		end				
          end
          
        11:
          begin
            if(st ==1)begin
				
		end
           else 
		if(st ==0)begin
				
		end				
          end
    end
  
  
  
endmodule
