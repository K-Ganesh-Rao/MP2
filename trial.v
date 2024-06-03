module viterbi_decoder(
	input clk,
	output [0:4] out


);

reg [1:0]state;
reg [1:0] diff;
reg [3:0] matrix [3:0][6:0];
reg [3:0] hw
reg in;	

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

initial begin
    for (i = 0; i < 4; i = i + 1) begin
        for (j = 0; j < 7; j = j + 1) begin
            matrix[i][j] = 4'b1111; // 4-bit logic high
        end
    end
end

initial begin
state = 00;

end
////////////////////////////////////////////////////////////////////////////////////////////////////////////
always@(diff)begin
matrix[0][0] = 0;
for(
matrix[i][j] = hw;
end
////////////////////////////////////////////////////////////////////////////////////////////////////////////
always@(posedge state)begin
if(state == 00)begin
	next_state1 = 00;
	next_state2 = 10;
end
if(state == 01)begin
	next_state1 = 00;
	next_state2 = 10;
end
if(state == 10)begin
	next_state1 = 01;
	next_state2 = 11;
end
if(state == 11)begin
	next_state1 = 01;
	next_state2 = 11;
end

end
/////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////
always@(state)begin
    case ({in, gout})
        4'b0000: BM = 2'b00; // BM(00,00) = 0
        4'b0100: BM = 2'b01; // BM(01,00) = 1
        4'b1000: BM = 2'b01; // BM(10,00) = 1
        4'b1100: BM = 2'b10; // BM(11,00) = 2
		  
		  4'b0001: BM = 2'b01; // BM(00,01) = 1
        4'b0101: BM = 2'b00; // BM(01,01) = 0
        4'b1001: BM = 2'b01; // BM(10,01) = 2
        4'b1101: BM = 2'b10; // BM(11,01) = 1
		  
        4'b0010: BM = 2'b01; // BM(00,10) = 1
        4'b0110: BM = 2'b10; // BM(01,10) = 2
        4'b1010: BM = 2'b00; // BM(10,10) = 0
        4'b1110: BM = 2'b01; // BM(11,10) = 1
		  
		  4'b0011: BM = 2'b10; // BM(00,11) = 2
        4'b0111: BM = 2'b01; // BM(01,11) = 1
        4'b1011: BM = 2'b01; // BM(10,11) = 1
        4'b1111: BM = 2'b00; // BM(11,11) = 0
	
end
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

always@(state )
    begin

      case(state )
        2'b00:
          begin
			 if(next_state == 00)begin
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
			if(next_state == 10)begin
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
	
	else if(state == 01)begin
	
	end

	
	else if(state == 10)begin
	
	end

	
	else if(state == 11)begin
	
	end


end

endmodule
