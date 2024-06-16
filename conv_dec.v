//`timescale 1ns / 1ps // Adjust timescale as needed

module test1 (
  input  clk,
//  input reg reset,
  input  [11:0] received_bits, // Received bits (2 bits)
  output reg [3:0]decoded_bit // Decoded bit output
);


reg [3:0] msg[15:0];
wire [11:0] cw [15:0];
reg [3:0] hd_a [15:0]; 
reg [3:0] hd,min;
reg [3:0] i,j,k,l;
reg flag1,flag2;
///////////////////////////////////////////////////////////////////////////////////////
initial begin
hd = 0;
min = 4'b1111;

end


/////////////////////////////////////////////////////////////////////////////////////////////
assign cw[0] =  12'b000000000000;
assign cw[1] =  12'b000000111011;
assign cw[2] =  12'b000011101100;
assign cw[3] =  12'b000011010111;
assign cw[4] =  12'b001110110000;
assign cw[5] =  12'b001110001011;
assign cw[6] =  12'b001101011100;
assign cw[7] =  12'b001101100111;
assign cw[8] =  12'b111011000000;
assign cw[9] =  12'b111011111011;
assign cw[10] = 12'b111000101100;
assign cw[11] = 12'b111000010111;
assign cw[12] = 12'b110101110000;
assign cw[13] = 12'b110101001011;
assign cw[14] = 12'b110110011100;
assign cw[15] = 12'b110110100111;



always @(posedge clk)begin
if(flag1 == 0)begin
	for( j = 4'd0; j< 5'd16 ; j = j+4'd1)begin
	
//    hd = 0;
    for ( i = 4'd0; i < 4'd12; i = i + 4'd1) begin
        if (cw[i] != received_bits[i]) begin
            hd = hd + 4'd1;
        end
    end
	 hd_a[j] = hd;
end
	
end
	flag1 = 1;
end
//end


always@(posedge clk)begin
if(flag1 == 1)begin
	if(flag2 == 0)begin
//		min = 1111;
		for( k = 5'd0; k < 5'd16 ; k = k+5'd1 )begin
			if(hd_a[k] < min  && hd_a[k] != 0)
				min = hd_a[k];
			else
				min = min;
		
		end
		flag2 = 1;
	end
	else if(flag2 == 1)begin
		for ( l=0; l<16; l = l+1)begin
			if(hd_a[l]	== min)begin
				decoded_bit = l;
				
			end
			
		end
//			flag2 = 0 ;
	end
	
end

end

endmodule
