module test_ula();
  reg [7:0] a;
  reg [7:0] b;
  reg cin;
  reg [2:0] op;
  
  wire [7:0] s;
  wire cout;

  ula ula1 (op, s, a, b, cin, cout);
  
  initial begin

    $dumpfile("dump.vcd");
    $dumpvars(1);

    $display("========================");
    $display(" AND 8-bit");
    $display("------------------------");
    op = 3'b000;
    a = 8'b00100110;
    b = 8'b00101011; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    a = 8'b11010111;
    b = 8'b01011011; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);


    $display();
    $display("========================");
    $display(" OR 8-bit");
    $display("------------------------");
    op = 3'b001;
    a = 8'b00100110;
    b = 8'b00101011; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    a = 8'b11010111;
    b = 8'b01011011; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);


    $display();
    $display("========================");
    $display(" XOR 8-bit");
    $display("------------------------");
    op = 3'b010;
    a = 8'b00100110;
    b = 8'b00101011; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    a = 8'b11010111;
    b = 8'b01011011; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);


    $display();
    $display("========================");
    $display(" NOT 8-bit");
    $display("------------------------");
    op = 3'b011;
    a = 8'b00100110; #10;
    $display("a = %b\ns = %b", a, s);
    $display("------------------------");
    a = 8'b11010111; #10;
    $display("a = %b\ns = %b", a, s);


    $display();
    $display("========================");
    $display(" Equal 8-bit");
    $display("------------------------");
    op = 3'b100;
    a = 8'b00100110;
    b = 8'b00100110; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    a = 8'b00000011; #10;
    b = 8'b00000111; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    a = 8'b00000011; #10;
    b = 8'b00000011; #10;
    $display("a = %b\nb = %b\ns = %b", a, b, s);


    $display();
    $display("========================");
    $display(" Somador Completo 8-bit");
    $display("------------------------");
    $display("[cin] a + b = [cout] sum");
    $display("------------------------");
    op = 3'b101;
    a = 8'd10; b = 8'd22; cin = 1'b0; #10;
    $display("[%b] %d + %d = [%b] %d", cin, a, b, cout, s);
    a = 8'd10; b = 8'd1; cin = 1'b1; #10;
    $display("[%b] %d + %d = [%b] %d", cin, a, b, cout, s);
    a = 8'd220; b = 8'd55; cin = 1'b0; #10;
    $display("[%b] %d + %d = [%b] %d", cin, a, b, cout, s);


    $display();
    $display("========================");
    $display(" MUX 8:1");
    $display("------------------------");
    op = 3'b110;
    a = 8'b00100110;
    b = 3'b000; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    b = 3'b001; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    b = 3'b010; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    b = 3'b011; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    b = 3'b100; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    b = 3'b101; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    b = 3'b110; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);
    $display("------------------------");
    b = 3'b111; #10
    $display("a = %b\nb = %b\ns = %b", a, b, s);

    $display("========================");
  end
endmodule

