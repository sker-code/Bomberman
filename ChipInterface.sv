`default_nettype none
module ChipInterface
  (output logic R1, R0, G1, G0, B1, B0, HS, VS,
   output logic [7:0] led,
   input  logic clk, rst_n);

  logic [1:0] red, green, blue;
  logic [9:0] row, col;
  logic blank;
  logic [9:0] HS_counter, VS_counter;

  assign {R1, R0} = red;
  assign {G1, G0} = green;
  assign {B1, B0} = blue;
  always_comb begin
    led[6:0] = VS_counter[6:0];
    led[7] = ~VS_counter[0];
  end

  VGA vga(.clk(clk), .rst_n(rst_n),
          .HS(HS), .VS(VS), .blank(blank),
          .row(row), .col(col), .*);
  
  display display (.row(row),
                   .col(col),
                   .red(red),
                   .green(green),
                   .blue(blue),
                   .blank(blank));

endmodule: ChipInterface

module VGA
  (input  logic clk, rst_n,
   output logic HS, VS, blank,
   output logic [9:0] row, col,
   output logic [9:0] HS_counter, VS_counter);

  logic HS_blank, VS_blank;

  assign blank = HS_blank | VS_blank;
  assign col = HS_counter - 10'd144;
  assign row = VS_counter - 10'd31;

  always_comb begin
    if (HS_counter < 10'd96) begin //96 (T_PW)
      HS = 1'b0;
      HS_blank = 1'b1;
    end
    else if (HS_counter < 10'd144) begin //96 + 48 = 144 (T_BP)
      HS = 1'b1;
      HS_blank = 1'b1;
    end
    else if (HS_counter < 10'd784) begin // 96 + 48 + 640 = 784 (T_DISP)
      HS = 1'b1;
      HS_blank = 1'b0;
    end
    else if (HS_counter < 10'd800) begin // 96 + 48 + 640 + 16 = 800 (T_FP)
      HS = 1'b1;
      HS_blank = 1'b1;
    end
    else begin
      HS = 1'b1;
      HS_blank = 1'b1;
    end
  end
  always_ff @(posedge clk, negedge rst_n) begin //HS
    if (~rst_n) begin
      HS_counter <= 10'd0;
    end
    else begin
      if (HS_counter < 10'd799) begin
        HS_counter <= HS_counter + 1;
      end
      else begin
        HS_counter <= 10'd0;
      end
    end
  end

  always_comb begin
    if (VS_counter < 10'd2) begin //2 (T_PW)
      VS = 1'b0;
      VS_blank = 1'b1;
    end
    else if (VS_counter < 10'd31) begin //2 + 29 = 31 (T_BP)
      VS = 1'b1;
      VS_blank = 1'b1;
    end
    else if (VS_counter < 10'd511) begin //2 + 29 + 480 = 511 (T_DISP)
      VS = 1'b1;
      VS_blank = 1'b0;
    end
    else if (VS_counter < 10'd521) begin //2 + 29 + 480 + 10 = 521 (T_FP)
      VS = 1'b1;
      VS_blank = 1'b1;
    end
    else begin
      VS = 1'b1;
      VS_blank = 1'b1;
    end
  end

  always_ff @(posedge clk, negedge rst_n) begin //VS
    if (~rst_n) begin
      VS_counter <= 10'b0;
    end
    else begin
      if (VS_counter < 10'd520) begin
        if (HS_counter >= 10'd799) begin
          VS_counter <= VS_counter + 1;
        end
      end
      else begin
        VS_counter <= 10'b0;
      end
    end
  end
endmodule : VGA

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
        red = 2'd1;
        green = 2'd3;
        blue = 2'd0;
      end else if (row > 10'd100 && row < 10'd200 && col > 10'd390 && col < 10'd490) begin
        red = 2'd1;
        green = 2'd3;
        blue = 2'd0;
      end else if (row > 10'd300 && row < 10'd400 && col > 10'd100 && col < 10'd540) begin
        red = 3;
        green = 3;
        blue = 2'd0;
      end 
      else begin
        // red = 2'd3;
        // green = 2'd1;
        // blue = 2'd2;
        red = 2'd1;
        green = 2'd1;
        blue = 2'd1; 
      end
    end
  end
endmodule: display
