module Bomberman
  (input  logic clk, rst_n, refresh,
   input  logic btn_up, btn_down, btn_left, btn_right,
   output logic [10:0][14:0][2:0] map,
   output logic [7:0] led);
  
  logic [10:0][14:0][2:0] temp_map;
  logic [3:0] pl1_x, pl1_y;
  logic [3:0] pl2_x, pl2_y;

  assign led = {pl1_x, pl1_y};

  
  Map map_m(.clk(clk), .rst_n(rst_n), .refresh(refresh),
            .temp_map(temp_map),
            .map(map));

  TempMap tempmap_m(.rst_n(rst_n), .refresh(refresh),
                    .map(map),
                    .pl1_x(pl1_x), .pl1_y(pl1_y),
                    .pl2_x(pl2_x), .pl2_y(pl2_y),
                    .temp_map(temp_map));
  
  Player player_m(.clk(clk), .rst_n(rst_n), .refresh(refresh),
                  .btn_up(btn_up), .btn_down(btn_down), .btn_left(btn_left), .btn_right(btn_right),
                  .pl1_x(pl1_x), .pl1_y(pl1_y),
                  .pl2_x(pl2_x), .pl2_y(pl2_y));

  
endmodule: Bomberman

module Player
  (input  logic clk, rst_n, refresh,
   input  logic btn_up, btn_down, btn_left, btn_right,
   output logic [3:0] pl1_x, pl1_y,
   output logic [3:0] pl2_x, pl2_y);
  
  logic up, down, left, right;

  ButtonBuffer up_m(.button_in(btn_up), .clk(clk), .rst_n(rst_n),
                    .button_out(up));
  
  ButtonBuffer down_m(.button_in(btn_down), .clk(clk), .rst_n(rst_n),
                    .button_out(down));

  ButtonBuffer left_m(.button_in(btn_left), .clk(clk), .rst_n(rst_n),
                    .button_out(left));
  
  ButtonBuffer right_m(.button_in(btn_right), .clk(clk), .rst_n(rst_n),
                    .button_out(right));

  always_ff @(posedge clk) begin
    if (~rst_n) begin
      pl1_x <= 1;
      pl1_y <= 1;
      pl2_x <= 9;
      pl2_y <= 13;
    end
    if (up && pl1_y > 0) begin
      pl1_y <= pl1_y - 1;
    end
    else if (down && pl1_y < 11) begin
      pl1_y <= pl1_y + 1;
    end
    else if (left && pl1_x > 0) begin
      pl1_x <= pl1_x - 1;
    end
    else if (right && pl1_x < 15) begin
      pl1_x <= pl1_x + 1;
    end
  end
  
endmodule: Player

module ButtonBuffer
  (input  logic button_in, clk, rst_n,
   output logic button_out);
  
  enum logic {UP, DOWN} curr_state, next_state;
  
  always_comb begin
    case (curr_state)
      UP: begin
        next_state = (button_in) ? DOWN : UP;
        button_out = button_in;
      end
      DOWN: begin 
        next_state = (~button_in) ? UP : DOWN;
        button_out = 0;
      end
    endcase
  end
  always_ff @(posedge clk) begin
  if (~rst_n) 
    curr_state <= UP;
  else
    curr_state <= next_state;
  end
endmodule: ButtonBuffer

module TempMap
  (input  logic rst_n, refresh,
   input  logic [10:0][14:0][2:0] map,
   input  logic [3:0] pl1_x, pl1_y,
   input  logic [3:0] pl2_x, pl2_y,
   output logic [10:0][14:0][2:0] temp_map);
  
  always_comb begin
    if (~rst_n) begin
      for (int i = 0; i < 11; i++) begin
        for (int j = 0; j < 15; j++) begin
          if ((i == 0) || (i == 10) || (j == 0) || (j == 14)) begin 
            temp_map[i][j] = 3'd2; // unbreakable borders
          end
          // else if ((i == pl1_x) && (j == pl1_y)) begin
          //   temp_map[i][j] = 3'd5; // player 1
          // end
          // else if ((i == 9) && (j == 13)) begin
          //   temp_map[i][j] = 3'd6; // player 2
          // end
          else if ((i[0] == 0) && (j[0] == 0))
            temp_map[i][j] = 3'd2; // between unbreakable blocks
          else if (((i == 1) && ((j == 1) || (j == 2) || (j == 8))) ||
                   ((i == 2) && ((j == 1) || (j == 7))) ||
                   ((i == 3) && ((j == 9)|| (j == 13))) ||
                   ((i == 4) && ((j == 3)|| (j == 9)))  ||
                   ((i == 5) && ((j == 5)|| (j == 10))) ||
                   ((i == 7) && ((j == 2)|| (j == 3)))  ||
                   ((i == 8) && ((j == 1)|| (j == 13))) ||
                   ((i == 9) && ((j == 9)|| (j == 12) || (j == 13)))) begin
            temp_map[i][j] = 3'd0; // grass
          end
          else begin
            temp_map[i][j] = 3'd1; // breakable block
          end
        end
      end
    end
    else begin
      for (int i = 0; i < 11; i++) begin
        for (int j = 0; j < 15; j++) begin
          if ((i == pl1_y) && (j == pl1_x)) begin
            temp_map[i][j] = 3'd5; // player 1
          end
          else if ((i == 9) && (j == 13)) begin
            temp_map[i][j] = 3'd6; // player 2
          end
          else begin
            temp_map[i][j] = map[i][j];
          end
        end
      end
    end
  end

endmodule : TempMap

module Map
  (input  logic clk, rst_n, refresh,
   input  logic [10:0][14:0][2:0] temp_map,
   output logic [10:0][14:0][2:0] map);

  always_ff @(posedge clk) begin
    if (refresh)
      map <= temp_map;
  end

endmodule: Map