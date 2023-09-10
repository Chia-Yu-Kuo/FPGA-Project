
module Arith (
    input signed [7:0] op1,
    input signed [7:0] op2,
    input [1:0] op,     //  00 +   01  -  10  *  
    output signed [7:0] result , //-128~127
    output ov
);
/*
//sequential
    reg signed [7:0] result_reg ;
    reg signed [15:0] nresult_reg;
    reg ov_reg;

    assign result=result_reg;
    assign ov = ov_reg;

    always @(posedge clk or negedge rst) begin
        if (~rst) begin
            result_reg <= 8'd0;
            ov_reg <= 1'b0;
        end
        else begin      //ov will out sat
            result_reg <= (nresult_reg > 16'd127 || nresult_reg < -16'd128 ) ? 8'd0 : nresult_reg [7:0];
            ov_reg <= (nresult_reg > 16'd127 || nresult_reg < -16'd128 ) ? 1'b1 : 1'b0;
        end
    end

    always @(*) begin
        case (op)
            2'b00: nresult_reg = op1 + op2;
            2'b01: nresult_reg = op1 - op2;
            2'b10: nresult_reg = op1 * op2;
            default: nresult_reg =16'd0;
        endcase
    end
    
*/

//combinational
    reg signed [15:0] temp_result;
    always @(*) begin
        case (op)
            2'b00: temp_result = op1 + op2;
            2'b01: temp_result = op1 - op2;
            2'b10: temp_result = op1 * op2;
            default: temp_result =16'd0;
        endcase
    end


    assign ov= ( temp_result> $signed(16'd127) ||  temp_result < $signed(-16'd128) ) ? 1'b1 : 1'b0;
    assign result = (ov) ? 8'd0 : temp_result [7:0];

    

endmodule