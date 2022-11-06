module ula (op, s, a, b, cin, cout);
  input [2:0] op;
  input [7:0] a;
  input [7:0] b;
  input cin;
  output reg [7:0] s;
  output cout;

  wire [7:0] and_out, or_out, xor_out, not_out, fulladder_out;
  wire eq_out, mux_out;

  and8bit a1 (and_out, a, b);
  or8bit o1 (or_out, a, b);
  xor8bit x1 (xor_out, a, b);
  not8bit n1 (not_out, a);
  eq8bit e1 (eq_out, a, b);
  fulladder8bit fa1 (fulladder_out, cout, a, b, cin);
  mux8to1 m1 (mux_out, a, b[2:0]);

  always @ * begin
    case (op)
      3'b000: begin
        s = and_out;
      end
      3'b001: begin
        s = or_out;
      end
      3'b010: begin
        s = xor_out;
      end
      3'b011: begin
        s = not_out;
      end
      3'b100: begin
        s[7:1] = 7'b0000000;
        s[0] = eq_out;
      end
      3'b101: begin
        s = fulladder_out;
      end
      3'b110: begin
        s[7:1] = 7'b0000000;
        s[0] = mux_out;
      end
      default: begin
        s = 8'b00000000;
      end
    endcase
  end
endmodule

module and8bit (s, a, b);
  input [7:0] a;
  input [7:0] b;
  output [7:0] s;
  and (s[0], a[0], b[0]);
  and (s[1], a[1], b[1]);
  and (s[2], a[2], b[2]);
  and (s[3], a[3], b[3]);
  and (s[4], a[4], b[4]);
  and (s[5], a[5], b[5]);
  and (s[6], a[6], b[6]);
  and (s[7], a[7], b[7]);
endmodule

module or8bit (s, a, b);
  input [7:0] a;
  input [7:0] b;
  output [7:0] s;
  or (s[0], a[0], b[0]);
  or (s[1], a[1], b[1]);
  or (s[2], a[2], b[2]);
  or (s[3], a[3], b[3]);
  or (s[4], a[4], b[4]);
  or (s[5], a[5], b[5]);
  or (s[6], a[6], b[6]);
  or (s[7], a[7], b[7]);
endmodule

module xor8bit (s, a, b);
  input [7:0] a;
  input [7:0] b;
  output [7:0] s;
  xor (s[0], a[0], b[0]);
  xor (s[1], a[1], b[1]);
  xor (s[2], a[2], b[2]);
  xor (s[3], a[3], b[3]);
  xor (s[4], a[4], b[4]);
  xor (s[5], a[5], b[5]);
  xor (s[6], a[6], b[6]);
  xor (s[7], a[7], b[7]);
endmodule

module not8bit (s, a);
  input [7:0] a;
  output [7:0] s;
  nor (s[0], a[0]);
  nor (s[1], a[1]);
  nor (s[2], a[2]);
  nor (s[3], a[3]);
  nor (s[4], a[4]);
  nor (s[5], a[5]);
  nor (s[6], a[6]);
  nor (s[7], a[7]);
endmodule

module eq8bit (s, a, b);
  input [7:0] a;
  input [7:0] b;
  output s;
  wire [7:0] o, u;
  xor8bit x (o, a, b);
  not8bit n (u, o);
  and (s, u[0], u[1], u[2], u[3], u[4], u[5], u[6], u[7]);
endmodule

module mux8to1 (out, D, S);
  input [7:0] D;
  input [2:0] S;
  output out;
  wire [10:0] T;
  not (T[0], S[0]);
  not (T[1], S[1]);
  not (T[2], S[2]);
  and (T[3], D[0], T[0], T[1], T[2]);
  and (T[4], D[1], S[0], T[1], T[2]);
  and (T[5], D[2], T[0], S[1], T[2]);
  and (T[6], D[3], S[0], S[1], T[2]);
  and (T[7], D[4], T[0], T[1], S[2]);
  and (T[8], D[5], S[0], T[1], S[2]);
  and (T[9], D[6], T[1], S[1], S[2]);
  and (T[10],D[7], S[0], S[1], S[2]);
  or (out, T[3], T[4], T[5], T[6], T[7], T[8], T[9], T[10]);
endmodule

module fulladder (input a, b, cin, output s, cout);
  wire xor1out, and1out, and2out;
  xor (xor1out, a, b);
  xor (s, cin, xor1out);
  and (and1out, cin, xor1out);
  and (and2out, a, b);
  or (cout, and1out, and2out);
endmodule

module fulladder8bit (s, cout, a, b, cin);
  input [7:0] a;
  input [7:0] b;
  input cin;
  output [7:0] s;
  output cout;
  wire [6:0] c;
  fulladder f0 (a[0], b[0], cin,  s[0], c[0]);
  fulladder f1 (a[1], b[1], c[0], s[1], c[1]);
  fulladder f2 (a[2], b[2], c[1], s[2], c[2]);
  fulladder f3 (a[3], b[3], c[2], s[3], c[3]);
  fulladder f4 (a[4], b[4], c[3], s[4], c[4]);
  fulladder f5 (a[5], b[5], c[4], s[5], c[5]);
  fulladder f6 (a[6], b[6], c[5], s[6], c[6]);
  fulladder f7 (a[7], b[7], c[6], s[7], cout);
endmodule

