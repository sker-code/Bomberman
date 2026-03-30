`default_nettype none
module ChipInterface
  (output logic [1:0] red, green, blue, 
   output logic HS, VS,
   input  logic clk, rst_n);

  logic [9:0] row, col;
  logic blank;

  VGA vga(.clk(clk), .rst_n(rst_n),
          .HS(HS), .VS(VS), .blank(blank),
          .row(row), .col(col));
  
  display display (.row(row),
                   .col(col),
                   .red(red),
                   .green(green),
                   .blue(blue),
                   .blank(blank));

endmodule: ChipInterface

module display
  (input  logic [9:0] row, col,
   input  logic blank,
   output logic [1:0] red, green, blue);
  
  always_comb begin
    if (blank) begin
      red = '0;
      green = '0;
      blue = '0;
    end
    else begin
      if (row > 10'd125 && row < 10'd175 && col > 10'd150 && col < 10'd250) begin
        red = 2'd3;
        green = 2'd3;
        blue = 2'd3;
      end else if (row > 10'd100 && row < 10'd200 && col > 10'd390 && col < 10'd490) begin
        red = 2'd3;
        green = 2'd2;
        blue = 2'd2;
      end else if (row > 10'd300 && row < 10'd400 && col > 10'd100 && col < 10'd540) begin
        red = 2'd3;
        green = 2'd1;
        blue = 2'd1;
      end 
      else begin
        red = 2'd2;
        green = 2'd2;
        blue = 2'd3; 
      end
    end
  end
endmodule: display
