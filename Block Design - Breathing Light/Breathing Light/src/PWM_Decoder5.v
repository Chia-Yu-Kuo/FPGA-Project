module PWM_Decoder5 (
  input clk_div, 
  input rst,
  input  [1:0] sw,
  //input  [1:0] sw_reg,
  output reg [7:0] R_time_out,
  output reg [7:0] G_time_out,
  output reg [7:0] B_time_out
);


reg [7:0] R_time_out_coef;
reg [7:0] G_time_out_coef;
reg [7:0] B_time_out_coef;

reg [5:0] counter, next_counter;

reg [1:0] sw_reg;

reg [1:0] sw_reg;
always @(posedge clk_div) begin
  sw_reg <= sw;
end

always @(posedge clk_div or posedge rst) begin
  if(rst) begin
      counter <= 6'd0;
  end
  else if(sw != sw_reg) begin
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
  else if(sw != sw_reg) begin
    R_time_out <= 8'd0;
    G_time_out <= 8'd0;
    B_time_out <= 8'd0;
  end
  else if(counter[5] == 1'b0) begin
    R_time_out <= (R_time_out + R_time_out_coef == 8'h0)  && (sw!=2'b01) ? 8'hff : R_time_out + R_time_out_coef;
    G_time_out <= (G_time_out + G_time_out_coef == 8'h0)  && (sw!=2'b11) ? 8'hff : G_time_out + G_time_out_coef;
    B_time_out <= (B_time_out + B_time_out_coef == 8'h0)  && (sw!=2'b10) ? 8'hff : B_time_out + B_time_out_coef;
  end
  else if(counter[5] == 1'b1) begin
    R_time_out <= (R_time_out - R_time_out_coef == 8'hff) && (sw!=2'b01) ? 8'h0 : R_time_out - R_time_out_coef;
    G_time_out <= (G_time_out - G_time_out_coef == 8'hff) && (sw!=2'b11) ? 8'h0 : G_time_out - G_time_out_coef;
    B_time_out <= (B_time_out - B_time_out_coef == 8'hff) && (sw!=2'b10) ? 8'h0 : B_time_out - B_time_out_coef;
  end
end

always @(*) begin
  next_counter = counter + 6'd1;
end

  always @ ( * ) begin
    case (sw)
      2'b00: begin
        R_time_out_coef = 8'h4;
        G_time_out_coef = 8'h1;
        B_time_out_coef = 8'h8;
      end
      2'b01: begin
        R_time_out_coef = 8'h0;
        G_time_out_coef = 8'h8;
        B_time_out_coef = 8'h8;
      end
      2'b10: begin
        R_time_out_coef = 8'h8;
        G_time_out_coef = 8'h8;
        B_time_out_coef = 8'h0;
      end
      2'b11: begin
        R_time_out_coef = 8'h8;
        G_time_out_coef = 8'h0;
        B_time_out_coef = 8'h8;
      end
    endcase
  end

endmodule // Decoder

