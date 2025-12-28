`timescale 1ns/1ps
module alu_tb;

reg [7:0] a, b;
reg [2:0] sel;
wire [7:0] out;

alu uut (
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
);

initial begin
  $display("Time\t a\t b\t sel\t out");
  $monitor("%0t\t %b\t %b\t %b\t %b", $time, a, b, sel, out);

  a = 8'b 0000_0101; b = 8'b0000_0011; 
  sel = 3'b000; #10; // Addition
  sel = 3'b001; #10; // Subtraction
  sel = 3'b010; #10; // AND
  sel = 3'b011; #10; // OR
  sel = 3'b100; #10; // XOR
  sel = 3'b101; #10; // NOT A
  sel = 3'b110; #10; // NAND
  sel = 3'b111; #10; // Default case

  $finish;
  end
endmodule
