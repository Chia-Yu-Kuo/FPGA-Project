module top(output R_out_4, R_out_5,
           output G_out_4, G_out_5, 
           output B_out_4, B_out_5,
           input [1:0] sw,
           input rst,
           input clk);

//----------Variables----------//
wire clk_div;
wire [7:0] R_time_out_4;
wire [7:0] G_time_out_4;
wire [7:0] B_time_out_4;
wire [7:0] R_time_out_5;
wire [7:0] G_time_out_5;
wire [7:0] B_time_out_5;

/*
reg [1:0] sw_reg;
always @(posedge clk_div) begin
  sw_reg <= sw;
end
*/

//----------Module instances----------//
divider_0 div(.clk(clk), .rst(rst), .clk_div(clk_div));

PWM_Decoder4_0 PWM_Decoder4(.sw(sw), .R_time_out(R_time_out_4), .G_time_out(G_time_out_4), .B_time_out(B_time_out_4));
RGB_LED_0 RGB_LED_4(.clk(clk), .rst(rst), .R_time_in(R_time_out_4), .G_time_in(G_time_out_4), .B_time_in(B_time_out_4),
              .R_out(R_out_4), .G_out(G_out_4), .B_out(B_out_4));


PWM_Decoder5_0 PWM_Decoder5(.clk_div(clk_div), .rst(rst), .sw(sw), /*.sw_reg(sw_reg), */.R_time_out(R_time_out_5), .G_time_out(G_time_out_5), .B_time_out(B_time_out_5));
RGB_LED_0 RGB_LED_5(.clk(clk), .rst(rst), .R_time_in(R_time_out_5), .G_time_in(G_time_out_5), .B_time_in(B_time_out_5),
              .R_out(R_out_5), .G_out(G_out_5), .B_out(B_out_5));

 endmodule

