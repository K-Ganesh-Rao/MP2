// Code your design here
module viterbi(
  input clk,
 
  output reg [11:0]ans
  
  
);

reg [1:0]state;
reg st;
reg  [0:0] array [5:0];
reg [0:2]i;
reg next_state;
reg [1:0]out;
reg reset;

  
initial begin 
state = 0;
out = 0;
next_state = 0;
reset = 1;
i = 0;
end

initial begin
 array[0]= 1'b0;
 array[1]= 1'b1;
 array[2]= 1'b1;
 array[3]= 1'b1;
 array[4]= 1'b0;
 array[5]= 1'b0;
end
 
 always@(posedge state)
 begin
//	for(i = 0 ; i<6 ;i=i+1)begin
//	 st <= array[i];
//	 ans <= ans << 2 ;
//	 ans <= ans| out;
   ans  <= ans << 2;
	ans <= {ans[9:0] , out};
	
	
//	end
 end
   
	
always@(state or reset )
    begin

      case(state)
        2'b00:
          begin
            if(st ==0)begin
					next_state = 2'b00;
					out = 2'b00;
				end
           else if(st ==1)begin
				next_state = 2'b10;
				out = 2'b11;
				end				
          end
          
        2'b01:
          begin
            if(st ==0)begin
					next_state = 2'b00;
					out = 2'b11;
				end
           else if(st ==1)begin
				next_state = 2'b10;
				out = 2'b00;
				end				
          end
          
        2'b10:
          begin
            if(st ==0)begin
					next_state = 2'b01;
					out = 2'b10;
				end
           else if(st ==1)begin
				next_state = 2'b11;
				out = 2'b01;
				end				
          end
          
          
        2'b11:     
		  begin
            if(st ==0)begin
					next_state = 2'b01;
					out = 2'b01;
				end
           else if(st ==1)begin
				next_state = 2'b11;
				out = 2'b10;
				end				
          end
      endcase    

  end
  
  
always@(posedge clk )begin
	state = next_state;
	st = array[i];
	reset = reset + 1;
	i = i + 1;
//	next_state = next_state+1;

end

  
endmodule
