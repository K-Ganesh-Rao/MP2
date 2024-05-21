module viterbi_decoder(
	input clk,
	output [0:4] out


);

reg [1:0]state;
reg [1:0] diff;
reg [3:0] matrix [3:0][6:0];

reg in;	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

initial begin
    for (i = 0; i < 4; i = i + 1) begin
        for (j = 0; j < 7; j = j + 1) begin
            matrix[i][j] = 4'b1111; // 4-bit logic high
        end
    end
end

////////////////////////////////////////////////////////////////////////////////////////////////////////////

always@(state )
    begin

      case(state )
        2'b00:
          begin
           if(in == 00)begin
				diff = 0;
				
				end
				if(in == 01)begin
				diff = 1;
				
				end
				if(in == 10)begin
				diff = 1 ;
				
				end
				if(in == 11)begin
				diff =  2;
				
				end
				
          end
          
        2'b01:
          begin
           if(in == 00)begin
				diff = 1;
				
				end
				if(in == 01)begin
				diff = 0;
				
				end
				if(in == 10)begin
				diff = 2 ;
				
				end
				if(in == 11)begin
				diff =  1;
				
				end
				
          end
          
        2'b10:
          begin
           if(in == 00)begin
				diff = 1;
				
				end
				if(in == 01)begin
				diff = 2;
				
				end
				if(in == 10)begin
				diff = 0 ;
				
				end
				if(in == 11)begin
				diff = 1;
				
				end
				
          end
          
          
        2'b11:     
		 begin
           if(in == 00)begin
				diff = 2;
				
				end
				if(in == 01)begin
				diff = 1;
				
				end
				if(in == 10)begin
				diff = 1 ;
				
				end
				if(in == 11)begin
				diff = 0;
				
				end
				
          end
          
      endcase    

  end
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
always@(posedge clk )begin 		
	state <= next_state; 
	end
  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  
function [2:0] compare_5bit;
        input [4:0] A, B; // 5-bit inputs
        begin
            if (A > B) begin
                compare_5bit = 3'b001; // A > B
            end else if (A == B) begin
                compare_5bit = 3'b010; // A == B
            end else begin
                compare_5bit = 3'b100; // A < B
            end
        end
    endfunction

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
always@(state)
begin
	if(state == 00)begin
		
	
	end
	
	if(state == 01)begin
	
	end

	
	if(state == 10)begin
	
	end

	
	if(state == 11)begin
	
	end


end

endmodule
