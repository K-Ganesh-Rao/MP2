// Code your design here
module viterbi(
  input clk,
 
  output reg [11:0]ans
  
  
);
  reg [1:0]state;
  reg st;
  wire [5:0] array;
  integer i;

  reg [1:0]out;
  

	assign array[0]= 0;
	assign array[1]= 1;
	assign array[2]= 1;
	assign array[3]= 1;
	assign array[4]= 0;
	assign array[5]= 0;

 
 always@(posedge clk)
 begin
	for(i = 0 ; i<6 ;i=i+1)begin
	 st <= array[i];
	 ans <= ans << 2 ;
	 ans <= ans| out;
	
 end
 end
   
	
initial begin 
state = 0;
out = 0;
end

  always@(posedge clk)
    begin

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
				state <= 2'b11;
				out <= 2'b10;
				end				
          end
      endcase    

  end
  
  
endmodule
