module modulo_2_adder (
  input [3:0] a,
  input [3:0] b,
  output [3:0] sum
);

  assign sum = a ^ b;

endmodule  


module test_modulo_2_adder;

  reg [3:0] a, b;
  wire [3:0] sum;

  modulo_2_adder adder (
    .a(a),
    .b(b),
    .sum(sum)
  );

  initial begin
    a = 4'b1011;
    b = 4'b0101;

    #10;

    $display("sum = %b", sum);
  end

endmodule 
