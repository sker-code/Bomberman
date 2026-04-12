`default_nettype none
module MapDisplay
  (input  logic [9:0] row, col,
   input  logic [10:0][14:0][2:0] map,
   output logic [1:0] red, green, blue);
  
  logic [2:0] map_value;
  
  MapDisplayDecoder mapdecoder(.map_value(map_value), 
                               .red(red), .green(green), .blue(blue));

  always_comb begin
    if (row < 10'd40) begin // row 0
      if      (col < 10'd40)  map_value = map[0][0]; // col 0
      else if (col < 10'd80)  map_value = map[0][1]; // col 1
      else if (col < 10'd120) map_value = map[0][2]; // col 2
      else if (col < 10'd160) map_value = map[0][3]; // col 3
      else if (col < 10'd200) map_value = map[0][4]; // col 4
      else if (col < 10'd240) map_value = map[0][5]; // col 5
      else if (col < 10'd280) map_value = map[0][6]; // col 6
      else if (col < 10'd320) map_value = map[0][7]; // col 7
      else if (col < 10'd360) map_value = map[0][8]; // col 8
      else if (col < 10'd400) map_value = map[0][9]; // col 9
      else if (col < 10'd440) map_value = map[0][10]; // col 10
      else if (col < 10'd480) map_value = map[0][11]; // col 11
      else if (col < 10'd520) map_value = map[0][12]; // col 12
      else if (col < 10'd560) map_value = map[0][13]; // col 13
      else                    map_value = map[0][14]; // col 14
    end
    else if (row < 10'd80) begin // row 1
      if      (col < 10'd40)  map_value = map[1][0]; // col 0
      else if (col < 10'd80)  map_value = map[1][1]; // col 1
      else if (col < 10'd120) map_value = map[1][2]; // col 2
      else if (col < 10'd160) map_value = map[1][3]; // col 3
      else if (col < 10'd200) map_value = map[1][4]; // col 4
      else if (col < 10'd240) map_value = map[1][5]; // col 5
      else if (col < 10'd280) map_value = map[1][6]; // col 6
      else if (col < 10'd320) map_value = map[1][7]; // col 7
      else if (col < 10'd360) map_value = map[1][8]; // col 8
      else if (col < 10'd400) map_value = map[1][9]; // col 9
      else if (col < 10'd440) map_value = map[1][10]; // col 10
      else if (col < 10'd480) map_value = map[1][11]; // col 11
      else if (col < 10'd520) map_value = map[1][12]; // col 12
      else if (col < 10'd560) map_value = map[1][13]; // col 13
      else                    map_value = map[1][14]; // col 14
    end
    else if (row < 10'd120) begin // row 2
      if      (col < 10'd40)  map_value = map[2][0]; // col 0
      else if (col < 10'd80)  map_value = map[2][1]; // col 1
      else if (col < 10'd120) map_value = map[2][2]; // col 2
      else if (col < 10'd160) map_value = map[2][3]; // col 3
      else if (col < 10'd200) map_value = map[2][4]; // col 4
      else if (col < 10'd240) map_value = map[2][5]; // col 5
      else if (col < 10'd280) map_value = map[2][6]; // col 6
      else if (col < 10'd320) map_value = map[2][7]; // col 7
      else if (col < 10'd360) map_value = map[2][8]; // col 8
      else if (col < 10'd400) map_value = map[2][9]; // col 9
      else if (col < 10'd440) map_value = map[2][10]; // col 10
      else if (col < 10'd480) map_value = map[2][11]; // col 11
      else if (col < 10'd520) map_value = map[2][12]; // col 12
      else if (col < 10'd560) map_value = map[2][13]; // col 13
      else                    map_value = map[2][14]; // col 14
    end
    else if (row < 10'd160) begin // row 3
      if      (col < 10'd40)  map_value = map[3][0]; // col 0
      else if (col < 10'd80)  map_value = map[3][1]; // col 1
      else if (col < 10'd120) map_value = map[3][2]; // col 2
      else if (col < 10'd160) map_value = map[3][3]; // col 3
      else if (col < 10'd200) map_value = map[3][4]; // col 4
      else if (col < 10'd240) map_value = map[3][5]; // col 5
      else if (col < 10'd280) map_value = map[3][6]; // col 6
      else if (col < 10'd320) map_value = map[3][7]; // col 7
      else if (col < 10'd360) map_value = map[3][8]; // col 8
      else if (col < 10'd400) map_value = map[3][9]; // col 9
      else if (col < 10'd440) map_value = map[3][10]; // col 10
      else if (col < 10'd480) map_value = map[3][11]; // col 11
      else if (col < 10'd520) map_value = map[3][12]; // col 12
      else if (col < 10'd560) map_value = map[3][13]; // col 13
      else                    map_value = map[3][14]; // col 14
    end
    else if (row < 10'd200) begin // row 4
      if      (col < 10'd40)  map_value = map[4][0]; // col 0
      else if (col < 10'd80)  map_value = map[4][1]; // col 1
      else if (col < 10'd120) map_value = map[4][2]; // col 2
      else if (col < 10'd160) map_value = map[4][3]; // col 3
      else if (col < 10'd200) map_value = map[4][4]; // col 4
      else if (col < 10'd240) map_value = map[4][5]; // col 5
      else if (col < 10'd280) map_value = map[4][6]; // col 6
      else if (col < 10'd320) map_value = map[4][7]; // col 7
      else if (col < 10'd360) map_value = map[4][8]; // col 8
      else if (col < 10'd400) map_value = map[4][9]; // col 9
      else if (col < 10'd440) map_value = map[4][10]; // col 10
      else if (col < 10'd480) map_value = map[4][11]; // col 11
      else if (col < 10'd520) map_value = map[4][12]; // col 12
      else if (col < 10'd560) map_value = map[4][13]; // col 13
      else                    map_value = map[4][14]; // col 14
    end
    else if (row < 10'd240) begin // row 5
      if      (col < 10'd40)  map_value = map[5][0]; // col 0
      else if (col < 10'd80)  map_value = map[5][1]; // col 1
      else if (col < 10'd120) map_value = map[5][2]; // col 2
      else if (col < 10'd160) map_value = map[5][3]; // col 3
      else if (col < 10'd200) map_value = map[5][4]; // col 4
      else if (col < 10'd240) map_value = map[5][5]; // col 5
      else if (col < 10'd280) map_value = map[5][6]; // col 6
      else if (col < 10'd320) map_value = map[5][7]; // col 7
      else if (col < 10'd360) map_value = map[5][8]; // col 8
      else if (col < 10'd400) map_value = map[5][9]; // col 9
      else if (col < 10'd440) map_value = map[5][10]; // col 10
      else if (col < 10'd480) map_value = map[5][11]; // col 11
      else if (col < 10'd520) map_value = map[5][12]; // col 12
      else if (col < 10'd560) map_value = map[5][13]; // col 13
      else                    map_value = map[5][14]; // col 14
    end
    else if (row < 10'd280) begin // row 6
      if      (col < 10'd40)  map_value = map[6][0]; // col 0
      else if (col < 10'd80)  map_value = map[6][1]; // col 1
      else if (col < 10'd120) map_value = map[6][2]; // col 2
      else if (col < 10'd160) map_value = map[6][3]; // col 3
      else if (col < 10'd200) map_value = map[6][4]; // col 4
      else if (col < 10'd240) map_value = map[6][5]; // col 5
      else if (col < 10'd280) map_value = map[6][6]; // col 6
      else if (col < 10'd320) map_value = map[6][7]; // col 7
      else if (col < 10'd360) map_value = map[6][8]; // col 8
      else if (col < 10'd400) map_value = map[6][9]; // col 9
      else if (col < 10'd440) map_value = map[6][10]; // col 10
      else if (col < 10'd480) map_value = map[6][11]; // col 11
      else if (col < 10'd520) map_value = map[6][12]; // col 12
      else if (col < 10'd560) map_value = map[6][13]; // col 13
      else                    map_value = map[6][14]; // col 14
    end
    else if (row < 10'd320) begin // row 7
      if      (col < 10'd40)  map_value = map[7][0]; // col 0
      else if (col < 10'd80)  map_value = map[7][1]; // col 1
      else if (col < 10'd120) map_value = map[7][2]; // col 2
      else if (col < 10'd160) map_value = map[7][3]; // col 3
      else if (col < 10'd200) map_value = map[7][4]; // col 4
      else if (col < 10'd240) map_value = map[7][5]; // col 5
      else if (col < 10'd280) map_value = map[7][6]; // col 6
      else if (col < 10'd320) map_value = map[7][7]; // col 7
      else if (col < 10'd360) map_value = map[7][8]; // col 8
      else if (col < 10'd400) map_value = map[7][9]; // col 9
      else if (col < 10'd440) map_value = map[7][10]; // col 10
      else if (col < 10'd480) map_value = map[7][11]; // col 11
      else if (col < 10'd520) map_value = map[7][12]; // col 12
      else if (col < 10'd560) map_value = map[7][13]; // col 13
      else                    map_value = map[7][14]; // col 14
    end
    else if (row < 10'd360) begin // row 8
      if      (col < 10'd40)  map_value = map[8][0]; // col 0
      else if (col < 10'd80)  map_value = map[8][1]; // col 1
      else if (col < 10'd120) map_value = map[8][2]; // col 2
      else if (col < 10'd160) map_value = map[8][3]; // col 3
      else if (col < 10'd200) map_value = map[8][4]; // col 4
      else if (col < 10'd240) map_value = map[8][5]; // col 5
      else if (col < 10'd280) map_value = map[8][6]; // col 6
      else if (col < 10'd320) map_value = map[8][7]; // col 7
      else if (col < 10'd360) map_value = map[8][8]; // col 8
      else if (col < 10'd400) map_value = map[8][9]; // col 9
      else if (col < 10'd440) map_value = map[8][10]; // col 10
      else if (col < 10'd480) map_value = map[8][11]; // col 11
      else if (col < 10'd520) map_value = map[8][12]; // col 12
      else if (col < 10'd560) map_value = map[8][13]; // col 13
      else                    map_value = map[8][14]; // col 14
    end
    else if (row < 10'd400) begin // row 9
      if      (col < 10'd40)  map_value = map[9][0]; // col 0
      else if (col < 10'd80)  map_value = map[9][1]; // col 1
      else if (col < 10'd120) map_value = map[9][2]; // col 2
      else if (col < 10'd160) map_value = map[9][3]; // col 3
      else if (col < 10'd200) map_value = map[9][4]; // col 4
      else if (col < 10'd240) map_value = map[9][5]; // col 5
      else if (col < 10'd280) map_value = map[9][6]; // col 6
      else if (col < 10'd320) map_value = map[9][7]; // col 7
      else if (col < 10'd360) map_value = map[9][8]; // col 8
      else if (col < 10'd400) map_value = map[9][9]; // col 9
      else if (col < 10'd440) map_value = map[9][10]; // col 10
      else if (col < 10'd480) map_value = map[9][11]; // col 11
      else if (col < 10'd520) map_value = map[9][12]; // col 12
      else if (col < 10'd560) map_value = map[9][13]; // col 13
      else                    map_value = map[9][14]; // col 14
    end
    else begin // row 10
      if      (col < 10'd40)  map_value = map[10][0]; // col 0
      else if (col < 10'd80)  map_value = map[10][1]; // col 1
      else if (col < 10'd120) map_value = map[10][2]; // col 2
      else if (col < 10'd160) map_value = map[10][3]; // col 3
      else if (col < 10'd200) map_value = map[10][4]; // col 4
      else if (col < 10'd240) map_value = map[10][5]; // col 5
      else if (col < 10'd280) map_value = map[10][6]; // col 6
      else if (col < 10'd320) map_value = map[10][7]; // col 7
      else if (col < 10'd360) map_value = map[10][8]; // col 8
      else if (col < 10'd400) map_value = map[10][9]; // col 9
      else if (col < 10'd440) map_value = map[10][10]; // col 10
      else if (col < 10'd480) map_value = map[10][11]; // col 11
      else if (col < 10'd520) map_value = map[10][12]; // col 12
      else if (col < 10'd560) map_value = map[10][13]; // col 13
      else                    map_value = map[10][14]; // col 14
    end
  end
endmodule: MapDisplay