

module test1 (
  input  clk,
  input  [11:0] received_bits, // Received bits (12 bits)
  output reg [3:0] decoded_bit // Decoded bit output
);

reg [11:0] cw [0:15]; // Array to hold codewords
reg [3:0] hd_a [0:15]; // Array to hold Hamming distances
reg [3:0] hd, min;
reg [4:0] i, j;
reg [11:0] diff;
reg [1:0] state;

parameter IDLE = 2'b00, CALC_HD = 2'b01, FIND_MIN = 2'b10, DECODE = 2'b11;

initial begin
  hd = 0;
  min = 4'b1111;
  state = IDLE;
  i = 0;
  j = 0;
  diff = 0;
  decoded_bit = 0;

  // Initialize the codewords
  cw[0]  <= 12'b000000000000;
  cw[1]  <= 12'b000000111011;
  cw[2]  <= 12'b000011101100;
  cw[3]  <= 12'b000011010111;
  cw[4]  <= 12'b001110110000;
  cw[5]  <= 12'b001110001011;
  cw[6]  <= 12'b001101011100;
  cw[7]  <= 12'b001101100111;
  cw[8]  <= 12'b111011000000;
  cw[9]  <= 12'b111011111011;
  cw[10] <= 12'b111000101100;
  cw[11] <= 12'b111000010111;
  cw[12] <= 12'b110101110000;
  cw[13] <= 12'b110101001011;
  cw[14] <= 12'b110110011100;
  cw[15] <= 12'b110110100111;
end

always @(posedge clk) begin
  case(state)
    IDLE: begin
      // Reset variables
      hd <= 0;
      min <= 4'b1111;
      i <= 0;
      j <= 0;
		diff = 0;
      state <= CALC_HD;
    end
    
    CALC_HD: begin
	 if(j < 16)begin
			diff = cw[j] ^ received_bits ;
			hd = diff[0]+diff[1]+diff[2]+diff[3]+diff[4]+diff[5]+diff[6]+diff[7]+diff[8]+diff[9]+diff[10]+diff[11] ;
			hd_a[j] = hd;
			j = j + 1;
	 end
		else begin
			state = FIND_MIN;
			j = 0;
			diff = 0;
		end
			
	end

    FIND_MIN: begin
      if (j < 16) begin
        if (hd_a[j] < min && hd_a[j] != 0) begin
          min <= hd_a[j];
        end
//        j = j + 1;
      end else begin
        state <= DECODE;
        j <= 0;
      end
		 j <= j + 1;
    end

    DECODE: begin
      if (j < 16) begin
        if (hd_a[j] == min) begin
          decoded_bit <= j;
        end
//        j = j + 1;
      end
//			else begin
//        state <= IDLE;
//      end
		 j <= j + 1;
    end

  endcase
end

endmodule
