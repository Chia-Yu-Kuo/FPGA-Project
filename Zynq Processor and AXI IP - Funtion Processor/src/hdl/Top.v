module Top (
    input clk ,
    input rst ,
    input [1:0] mode,
    input [31:0] in_data,
    output [31:0] slv_reg2,
    output [31:0] slv_reg3
);
    wire clear;
    assign clear = mode==2'd3;

    wire [7:0] result_3_1;
    wire ov_3_1;

    wire [7:0] small_0_3_2;         //smallest
    wire [7:0] small_1_3_2;
    wire [7:0] small_2_3_2;
    wire [7:0] small_3_3_2;
    wire [7:0] small_4_3_2;
    wire [7:0] small_5_3_2;
    wire [7:0] small_6_3_2;
    wire [7:0] small_7_3_2;         //bigest

    wire parity_3_3;

    assign slv_reg2 = (mode==2'd0) ? {23'd0 , ov_3_1 , result_3_1} : (mode==2'd1) ? {small_0_3_2 , small_1_3_2 , small_2_3_2 ,small_3_3_2 } : {31'd0 , parity_3_3};
    assign slv_reg3 = {small_4_3_2 , small_5_3_2 , small_6_3_2 ,small_7_3_2 } ;

    Arith arith(
        .op1(in_data[7:0]),
        .op2(in_data[15:8]),
        .op(in_data[17:16]),     //  00 +   01  -  10  *  
        .result(result_3_1) , //-128~127
        .ov(ov_3_1)
    );
      
    Sort sort(
        .clk(clk),
        .rst(rst),
        .en(in_data[8]),
        .clear(clear),
        .in_data(in_data[7:0]),    //8 data
        .small_0(small_0_3_2),
        .small_1(small_1_3_2),
        .small_2(small_2_3_2),
        .small_3(small_3_3_2),
        .small_4(small_4_3_2),
        .small_5(small_5_3_2),
        .small_6(small_6_3_2),      
        .small_7(small_7_3_2)
        //.out_valid
    );

    Parity parity(
        .pattern(in_data),
        .parity(parity_3_3)
    );

    
endmodule