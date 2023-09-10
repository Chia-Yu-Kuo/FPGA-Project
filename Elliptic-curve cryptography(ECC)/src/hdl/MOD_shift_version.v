`include "MUL64.v"

module MOD (clk, enable, a, sign, valid, result);  //128%64 =64     // negative mod output is ? YES
    input clk;
    input enable;
    input [127:0] a;
    input sign;
    output valid;
    output [63:0] result;

    parameter LSB_MUL1  =3'd0;
    parameter MSB_MUL1  =3'd1;
    parameter ADD_SHIFT =3'd2;
    parameter LSB_MUL2  =3'd3;
    parameter MSB_MUL2  =3'd4;
    parameter ADD_ROUND =3'd5;
    parameter SUB       =3'd6;
    parameter DONE      =3'd7;

    reg [2:0] st, nst;
    reg [127:0] tmp;
    //wire [127:0] abs_a;
    wire [127:0] input_a;
    wire [64:0] pre_process1, pre_process2;
    wire [127:0] x;

    assign pre_process1 = ((a[127:64] > p) ? {(a[127:64] - p)} : a[127:64] ); 
    assign pre_process2 = ({pre_process1,a[63]} > p) ? {pre_process1,a[63]} - p : pre_process1 ; 

    assign dand2 = (dand1 >= dior1 ? (dand1-dior1) : dand1) << 1;
    assign dior2 = dior1;
    assign q_stage_2 = dand2 >= dior2;


    //k=64
    parameter const=64'b1101011010110110000000010011110111110100010110111110001011001011; //1+63
    parameter p =   64'b1001100010011101010011100100001111110101011111111100111101000101;
    //const : 1.8446744073709551616E+19 ÷ 1.0997031918897188677E+19 = 1.67742934727786437976534745433962487358816030409098483566924677063202883033317459540063522943232161250384614110012148673067320261
    //128 binary : 1.10101101011011000000001001111011111010001011011111000101100101111001111011111110111110100101111101111101110111010101101110010000
    //64 binary :  1.1010110101101100000000100111101111101000101101111100010110010111

/*
    //k=63
    parameter const=64'b1101011010110110000000010011110111110100010110111110001011001011;       //0+64
    parameter p =   64'b1001100010011101010011100100001111110101011111111100111101000101;
    //const : 9223372036854775808 ÷ 10997031918897188677 = 0.8387146736389321898826737271698124367940801520454924178346233853
    //64 binary :  0.1101011010110110000000010011110111110100010110111110001011001011
*/

    //128*64
    reg [63:0] mul1, mul2;
    reg mul_enable, nx_mul_enable;
    wire mul_valid;
    wire [127:0] mul_result;
    reg [127:0] mul_result1, mul_result2;
    wire [191:0] add_result;
    wire carry;
    
    assign add_result[63:0] = mul_result1[63:0] ;
    assign {carry,add_result[127:64]} = mul_result1[127:64] + mul_result2[63:0];
    assign add_result[191:128] = mul_result2[127:64] +carry;

    MUL64 mul64 
    (
        .clk(clk), 
        .mul1(mul1), 
        .mul2(mul2), 
        .enable(mul_enable), 
        .result(mul_result), 
        .valid(mul_valid)
    );


    //assign abs_a = -a;
    assign input_a =  {pre_process2,a[]};
    assign x= input_a - tmp;
    assign result = (sign) ? (p-x[63:0]) : x[63:0];
    assign valid = st==DONE;
    

    always @(posedge clk ) 
    begin
        if (enable) begin
            st <= LSB_MUL1;
            mul_enable <=1'b1;

            mul_result1 <= 128'd0;
            mul_result2 <= 128'd0;
            tmp <= 128'd0;        
        end    
        else begin
            st <= nst;
            mul_enable <= nx_mul_enable;

            mul_result1 <= ((st==LSB_MUL1 || st==LSB_MUL2) && mul_valid) ? mul_result : mul_result1;
            mul_result2 <= ((st==MSB_MUL1 || st==MSB_MUL2) && mul_valid) ? mul_result : mul_result2;
            /*
            if (st==ADD_SHIFT) begin
                tmp <= add_result[127:0];
            end
            else if ((st==ADD_ROUND)) begin
                tmp <= add_result[191:64] + add_result[63];
            end
            */
            //tmp <=  (st==ADD_SHIFT) ? add_result[127:0] /* 64+64 */ : (st==ADD_ROUND) ? add_result[191:64] + add_result[63] /*128+0 rounding*/ : tmp;  
            //tmp <=  (st==ADD_SHIFT) ? add_result[191:64] /* 128+0 */ : (st==ADD_ROUND) ? add_result[127:0]  /*128+0 rounding*/ : tmp; 
            tmp <=  (st==ADD_SHIFT) ? {63'd0,add_result[191:127]} /* 128+0 */ : (st==ADD_ROUND) ? add_result[127:0]  /*128+0 rounding*/ : tmp; 

        end
    end

    always @(*) 
    begin
        case (st)
        LSB_MUL1 : nst = (mul_valid) ? MSB_MUL1 : LSB_MUL1;
        MSB_MUL1 :  nst = (mul_valid) ? ADD_SHIFT : MSB_MUL1;
        ADD_SHIFT : nst = LSB_MUL2;
        LSB_MUL2 :  nst = (mul_valid) ? MSB_MUL2 : LSB_MUL2;
        MSB_MUL2 : nst = (mul_valid) ? ADD_ROUND : MSB_MUL2;
        ADD_ROUND : nst = SUB ;
        SUB : nst = DONE ;                
        DONE : nst = DONE ; 
        endcase    
    end

    always @(*) 
    begin
        nx_mul_enable = 1'b0;
        mul1 = 128'd0;
        mul2 = 64'd0;

        case (st)
        LSB_MUL1 : begin
            nx_mul_enable = (nst==MSB_MUL1) ? 1'b1 : 1'b0;
            mul1 = input_a[63:0] ;
            mul2 = const;
        end
        MSB_MUL1 :  begin
            mul1 = input_a[127:64] ;
            mul2 = const;
        end
        ADD_SHIFT : begin
            nx_mul_enable = 1'b1;
        end
        LSB_MUL2 :  begin
            nx_mul_enable = (nst==MSB_MUL2) ? 1'b1 : 1'b0;
            mul1 = tmp[63:0];
            mul2 = p;
        end
        MSB_MUL2 : begin
            mul1 = tmp[127:64];
            mul2 = p;
        end
        endcase       
    end



endmodule