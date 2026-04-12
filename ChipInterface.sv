`default_nettype none
module ChipInterface
  (input  logic clk, rst_n,
   output logic [1:0] red, green, blue, 
   output logic HS, VS);

  logic [9:0] row, col;
  logic blank;
  logic [10:0][14:0][2:0] map;
  logic refresh;

  VGA vga(.clk(clk), .rst_n(rst_n),
          .HS(HS), .VS(VS), .blank(blank),
          .row(row), .col(col));
  
  Display display(.row(row), .col(col),
                  .blank(blank),
                  .map(map),
                  .red(red), .green(green), .blue(blue));

  assign refresh = (row == 10'd479 && col == 10'd639);

  always_comb begin
    map[0][0] = 3'd2;
    map[0][1] = 3'd2;
    map[0][2] = 3'd2;
    map[0][3] = 3'd2;
    map[0][4] = 3'd2;
    map[0][5] = 3'd2;
    map[0][6] = 3'd2;
    map[0][7] = 3'd2;
    map[0][8] = 3'd2;
    map[0][9] = 3'd2;
    map[0][10] = 3'd2;
    map[0][11] = 3'd2;
    map[0][12] = 3'd2;
    map[0][13] = 3'd2;
    map[0][14] = 3'd2;

    map[1][0] = 3'd2;
    map[1][1] = 3'd5;
    map[1][2] = 3'd3;
    map[1][3] = 3'd1;
    map[1][4] = 3'd1;
    map[1][5] = 3'd1;
    map[1][6] = 3'd1;
    map[1][7] = 3'd1;
    map[1][8] = 3'd0;
    map[1][9] = 3'd1;
    map[1][10] = 3'd1;
    map[1][11] = 3'd1;
    map[1][12] = 3'd1;
    map[1][13] = 3'd0;
    map[1][14] = 3'd2;

    map[2][0] = 3'd2;
    map[2][1] = 3'd0;
    map[2][2] = 3'd2;
    map[2][3] = 3'd1;
    map[2][4] = 3'd2;
    map[2][5] = 3'd1;
    map[2][6] = 3'd2;
    map[2][7] = 3'd0;
    map[2][8] = 3'd2;
    map[2][9] = 3'd1;
    map[2][10] = 3'd2;
    map[2][11] = 3'd1;
    map[2][12] = 3'd2;
    map[2][13] = 3'd0;
    map[2][14] = 3'd2;

    map[3][0] = 3'd2;
    map[3][1] = 3'd1;
    map[3][2] = 3'd1;
    map[3][3] = 3'd1;
    map[3][4] = 3'd1;
    map[3][5] = 3'd1;
    map[3][6] = 3'd1;
    map[3][7] = 3'd1;
    map[3][8] = 3'd1;
    map[3][9] = 3'd0;
    map[3][10]  = 3'd1;
    map[3][11]  = 3'd1;
    map[3][12]  = 3'd1;
    map[3][13]  = 3'd0;
    map[3][14]  = 3'd2;

    map[4][0] = 3'd2;
    map[4][1] = 3'd1;
    map[4][2] = 3'd2;
    map[4][3] = 3'd0;
    map[4][4] = 3'd2;
    map[4][5] = 3'd1;
    map[4][6] = 3'd2;
    map[4][7] = 3'd1;
    map[4][8] = 3'd2;
    map[4][9] = 3'd0;
    map[4][10] = 3'd2;
    map[4][11] = 3'd1;
    map[4][12] = 3'd2;
    map[4][13] = 3'd1;
    map[4][14] = 3'd2;

    map[5][0] = 3'd2;
    map[5][1] = 3'd1;
    map[5][2] = 3'd1;
    map[5][3] = 3'd1;
    map[5][4] = 3'd1;
    map[5][5] = 3'd0;
    map[5][6] = 3'd1;
    map[5][7] = 3'd1;
    map[5][8] = 3'd1;
    map[5][9] = 3'd1;
    map[5][10]  = 3'd0;
    map[5][11]  = 3'd1;
    map[5][12]  = 3'd1;
    map[5][13]  = 3'd1;
    map[5][14]  = 3'd2;

    map[6][0] = 3'd2;
    map[6][1] = 3'd1;
    map[6][2] = 3'd2;
    map[6][3] = 3'd1;
    map[6][4] = 3'd2;
    map[6][5] = 3'd1;
    map[6][6] = 3'd2;
    map[6][7] = 3'd1;
    map[6][8] = 3'd2;
    map[6][9] = 3'd1;
    map[6][10]  = 3'd2;
    map[6][11]  = 3'd1;
    map[6][12]  = 3'd2;
    map[6][13]  = 3'd1;
    map[6][14]  = 3'd2;

    map[7][0] = 3'd2;
    map[7][1] = 3'd1;
    map[7][2] = 3'd0;
    map[7][3] = 3'd0;
    map[7][4] = 3'd1;
    map[7][5] = 3'd1;
    map[7][6] = 3'd1;
    map[7][7] = 3'd1;
    map[7][8] = 3'd1;
    map[7][9] = 3'd1;
    map[7][10]   = 3'd1;
    map[7][11]   = 3'd1;
    map[7][12]   = 3'd1;
    map[7][13]   = 3'd1;
    map[7][14]   = 3'd2;

    map[8][0] = 3'd2;
    map[8][1] = 3'd0;
    map[8][2] = 3'd2;
    map[8][3] = 3'd1;
    map[8][4] = 3'd2;
    map[8][5] = 3'd1;
    map[8][6] = 3'd2;
    map[8][7] = 3'd1;
    map[8][8] = 3'd2;
    map[8][9] = 3'd1;
    map[8][10]  = 3'd2;
    map[8][11]  = 3'd1;
    map[8][12]  = 3'd2;
    map[8][13]  = 3'd0;
    map[8][14]  = 3'd2;

    map[9][0] = 3'd2;
    map[9][1] = 3'd1;
    map[9][2] = 3'd1;
    map[9][3] = 3'd1;
    map[9][4] = 3'd0;
    map[9][5] = 3'd1;
    map[9][6] = 3'd1;
    map[9][7] = 3'd1;
    map[9][8] = 3'd1;
    map[9][9] = 3'd0;
    map[9][10]   = 3'd1;
    map[9][11]   = 3'd1;
    map[9][12]   = 3'd0;
    map[9][13]   = 3'd6;
    map[9][14]   = 3'd2;

    map[10][0] = 3'd2;
    map[10][1] = 3'd2;
    map[10][2] = 3'd2;
    map[10][3] = 3'd2;
    map[10][4] = 3'd2;
    map[10][5] = 3'd2;
    map[10][6] = 3'd2;
    map[10][7] = 3'd2;
    map[10][8] = 3'd2;
    map[10][9] = 3'd2;
    map[10][10] = 3'd2;
    map[10][11] = 3'd2;
    map[10][12] = 3'd2;
    map[10][13] = 3'd2;
    map[10][14] = 3'd2;
  end

endmodule: ChipInterface

    