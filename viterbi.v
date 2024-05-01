// Code your design here
module(
  input clk,
  output out
  
  
);
  reg [1:0]state;
  reg st;
  
  always@(posedge clk)
    begin
	 repeat(7)begin
      case(state)
        2'b00:
          begin
            if(st ==0)begin
					state <= 2'b00;
					out <= 2'b00;
				end
           else if(st ==1)begin
				state <= 2'b10;
				out <= 2'b11;
				end				
          end
          
        2'b01:
          begin
            if(st ==0)begin
					state <= 2'b00;
					out <= 2'b11;
				end
           else if(st ==1)begin
				state <= 2'b10;
				out <= 2'b00;
				end				
          end
          
        2'b10:
          begin
            if(st ==0)begin
					state <= 2'b01;
					out <= 2'b10;
				end
           else if(st ==1)begin
				state <= 2'b11;
				out <= 2'b01;
				end				
          end
          
          
        2'b11:     
		  begin
            if(st ==0)begin
					state <= 2'b01;
					out <= 2'b01;
				end
           else if(st ==1)begin
				state <= 2b11;
				out <= 2b10;
				end				
          end
          
    end
  end
  
  
endmodule
