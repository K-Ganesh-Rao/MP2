module sine_wave_gen(clk, F, dout);
input  clk, F;
output [7:0] dout;
reg [7:0] dout;
reg [7:0] a[0:100];
integer i, j, counter;
initial begin
    i = 0;
    j = 0;
    counter = 0;
    a[0] = 8'h7F;    a[1] = 8'h86; 
    a[2] = 8'h8E;    a[3] = 8'h96;
    a[4] = 8'h9E;    a[5] = 8'hA6;
    a[6] = 8'hAD;    a[7] = 8'hB5;
    a[8] = 8'hBC;    a[9] = 8'hC3;
    a[10] = 8'hC9;    a[11] = 8'hCF;
    a[12] = 8'hD5;    a[13] = 8'hDB;
    a[14] = 8'hE0;    a[15] = 8'hE5;
    a[16] = 8'hEA;    a[17] = 8'hEE;
    a[18] = 8'hF1;    a[19] = 8'hF5;
    a[20] = 8'hF7;    a[21] = 8'hFA;
    a[22] = 8'hFB;    a[23] = 8'hFC;
    a[24] = 8 'hFD;   a[25] = 8'hFE;
    a[26] = 8'hFD;    a[27] = 8'hFC;
    a[28] = 8'hFB;    a[29] = 8'hFA;
    a[30] = 8'hF7;    a[31] = 8'hF5;
    a[32] = 8'hF1;    a[33] = 8'hEE;
    a[34] = 8'hEA;    a[35] = 8'hE5;
    a[36] = 8'hE0;    a[37] = 8'hDB;
    a[38] = 8'hD5;    a[39] = 8'hCF;
    a[40] = 8'hC9;    a[41] = 8'hC3;
    a[42] = 8'hBC;    a[43] = 8'hB5;
    a[44] = 8'hAD;    a[45] = 8'hA6;
    a[46] = 8'h9E;    a[47] = 8'h96;
    a[48] = 8'h8E;    a[49] = 8'h86;
    a[50] = 8'h7F;    a[51] = 8'h77;
    a[52] = 8'h6F;    a[53] = 8'h67;
    a[54] = 8'h5F;    a[55] = 8'h57;
    a[56] = 8'h50;    a[57] = 8'h48;
    a[58] = 8'h41;    a[59] = 8'h3A;
    a[60] = 8'h34;    a[61] = 8'h2E;
    a[62] = 8'h28;    a[63] = 8'h22;
    a[64] = 8'h1D;    a[65] = 8'h18;
    a[66] = 8'h13;    a[67] = 8'hF;
    a[68] = 8'hC;     a[69] = 8'h8;
    a[70] = 8'h6;     a[71] = 8'h3;
    a[72] = 8'h2;     a[73] = 8'h1;
    a[74] = 8'h0;     a[75] = 8'h0;
    a[76] = 8'h0;     a[77] = 8'h1;
    a[78] = 8'h2;     a[79] = 8'h3;
    a[80] = 8'h6;     a[81] = 8'h8;
    a[82] = 8'hC;     a[83] = 8'hF;
    a[84] = 8'h13;    a[85] = 8'h18;
    a[86] = 8'h1D;    a[87] = 8'h22;
    a[88] = 8'h28;    a[89] = 8'h2E;
    a[90] = 8'h34;    a[91] = 8'h3A;
    a[92] = 8'h41;    a[93] = 8'h48;
    a[94] = 8'h50;    a[95] = 8'h57;
    a[96] = 8'h5F;    a[97] = 8'h67;
    a[98] = 8'h6F;    a[99] = 8'h77;
    a[100]=8'h7E;

end

    always @ (posedge clk)
    begin
    if(F == 0)
    begin
        if(i >= 100) 
            i = 0;
        else
            i=i+1;
     end
else
begin 
      if(counter >= 2-1)
            counter = 0;
      else 
            counter = counter +1;
      if(counter == 0)
      begin
            if(i >= 100)
                i = 0;
            else
                i = i+1;
      end 
 end 
 dout = a[i];
 end                                 
endmodule
