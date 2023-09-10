module PWM_Decoder5 (
  input clk_div, 
  input rst,
  output reg [7:0] R_time_out,
  output reg [7:0] G_time_out,
  output reg [7:0] B_time_out
);


reg [7:0] R_time_out_coef;
reg [7:0] G_time_out_coef;
reg [7:0] B_time_out_coef;

reg [5:0] counter, next_counter;
reg [2:0] color;

always @(posedge clk_div or posedge rst) begin
    if(rst) color <= 3'd0;
    else color <= counter == 6'd63 ? color == 3'd5 ? 3'd0 : color + 3'd1 : color;
end

always @(posedge clk_div or posedge rst) begin
  if(rst) begin
      counter <= 6'd0;
  end
  else begin
      counter <= next_counter;
  end
end

always @(posedge clk_div or posedge rst) begin
  if(rst) begin
    R_time_out <= 8'd0;
    G_time_out <= 8'd0;
    B_time_out <= 8'd0;
  end
  else if(counter[5] == 1'b0) begin
    R_time_out <= (R_time_out + R_time_out_coef == 8'd0) && (color==3'd0 || color==3'd1 || color==3'd2 || color==3'd5) ? 8'hff : R_time_out + R_time_out_coef;
    G_time_out <= (G_time_out + G_time_out_coef == 8'd0) && (color==3'd1 || color==3'd2 || color==3'd3 || color==3'd5) ? 8'hff : G_time_out + G_time_out_coef;
    B_time_out <= (B_time_out + B_time_out_coef == 8'd0) && (color==3'd4 || color==3'd5) ? 8'hff : B_time_out + B_time_out_coef;
  end
  else if(counter[5] == 1'b1) begin
    R_time_out <= (R_time_out - R_time_out_coef == 8'hff) && (color==3'd0 || color==3'd1 || color==3'd2 || color==3'd5) ? 8'h0 : R_time_out - R_time_out_coef;
    G_time_out <= (G_time_out - G_time_out_coef == 8'hff) && (color==3'd1 || color==3'd2 || color==3'd3 || color==3'd5) ? 8'h0 : G_time_out - G_time_out_coef;
    B_time_out <= (B_time_out - B_time_out_coef == 8'hff) && (color==3'd4 || color==3'd5) ? 8'h0 : B_time_out - B_time_out_coef;
  end
end

always @(*) begin
  next_counter = counter + 6'd1;
end

  always @ ( * ) begin
    case (color)
      3'd0: begin
        R_time_out_coef = 8'h8;
        G_time_out_coef = 8'h0;
        B_time_out_coef = 8'h0;
      end
      3'd1: begin
        R_time_out_coef = 8'h8;
        G_time_out_coef = 8'h3;
        B_time_out_coef = 8'h0;
      end
      3'd2: begin
        R_time_out_coef = 8'h8;
        G_time_out_coef = 8'h8;
        B_time_out_coef = 8'h0;
      end
      3'd3: begin
        R_time_out_coef = 8'h0;
        G_time_out_coef = 8'h8;
        B_time_out_coef = 8'h0;
      end
      3'd4: begin
        R_time_out_coef = 8'h0;
        G_time_out_coef = 8'h0;
        B_time_out_coef = 8'h8;
      end
      3'd5: begin
        R_time_out_coef = 8'h4;
        G_time_out_coef = 8'h1;
        B_time_out_coef = 8'h8;
      end
      default: begin
        R_time_out_coef = 8'h0;
        G_time_out_coef = 8'h0;
        B_time_out_coef = 8'h0;
      end
    endcase
  end

endmodule // Decoder