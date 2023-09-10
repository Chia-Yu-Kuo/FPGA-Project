
module Sort (
    input clk,
    input rst,
    input en,
    input clear,
    input [7:0] in_data,    //8 data
    output [7:0] small_0,
    output [7:0] small_1,
    output [7:0] small_2,
    output [7:0] small_3,
    output [7:0] small_4,
    output [7:0] small_5,
    output [7:0] small_6,       //at cycle 9 output 8 in_data sort result 
    output [7:0] small_7
    //output out_valid
);
    //reg [3:0] cnt;
    reg [7:0] larger_equal_than; // (buff larger eqaual than in_data)       // initial all 1      
    reg [7:0] buffer [0:7];
    reg en_reg;

    integer i1 ,i2 ,i3;

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            //cnt <= 4'd0;

            for ( i1=0 ; i1 <8 ; i1=i1+1 ) begin
                buffer[i1] <= 8'd255;
            end
            en_reg<=1'b0;
        end
        else begin      //ov will out sat
            //cnt <= (cnt < 4'd8) ? cnt + 4'd1 : 4'd8;
            if (clear) begin
                for ( i1=0 ; i1 <8 ; i1=i1+1 ) begin
                    buffer[i1] <= 8'd255;
                end
            end
            else if ((en && (en^en_reg))) begin
                //[0]
                buffer[0] <= (larger_equal_than[0]) ? in_data : buffer[0] ;
                //[1~7]
                for ( i3=1 ; i3 <8 ; i3=i3+1 ) begin
                    buffer[i3] <= (~larger_equal_than[i3]) ? buffer[i3] : (larger_equal_than[i3] && ~larger_equal_than[i3-1]) ? in_data : buffer[i3-1] ;
                end   
            end
            //else keep result until rst
            en_reg <= en ; 
        end
    end

    always @(*) begin
        for ( i2=0 ; i2<8 ; i2=i2+1 ) begin
            larger_equal_than [i2] = buffer [i2] >= in_data;               
        end
    end

    assign small_0 = buffer[0];
    assign small_1 = buffer[1];
    assign small_2 = buffer[2];
    assign small_3 = buffer[3];
    assign small_4 = buffer[4];
    assign small_5 = buffer[5];
    assign small_6 = buffer[6];
    assign small_7 = buffer[7];

    //assign out_valid = cnt==4'd8 ;

endmodule