module Controller(
	input clk,
	input rst,
	input [31:0] inst,
	//output [31:0] inst_out,
	output [12:0] bram0_addr,
	output [12:0] bram1_addr,
	output [3:0] bram1_wen,
	output [4:0] dsp_inmode,
	output [3:0] dsp_alumode,
	output [6:0] dsp_opmode
);

	//assign inst_out = inst; 

	parameter IDLE =  		2'b0;
	parameter READ_MEM =  	2'd1;
	parameter CAL =  		2'd2;
	parameter WRITE_MEM = 	2'd3;

	
	reg [1:0] st, nst;
	reg [2:0] cnt;

	always @(posedge clk or negedge rst) begin
		if (~rst) begin
			st <= IDLE;
			cnt <= 3'd0;
		end
		else
		begin
			cnt <= nst == IDLE ? 3'd0 : cnt + 3'd1;
			st <= nst;
		end
	end

	always @(*) begin
		if(~inst[31]) nst = IDLE;
		else begin
			case (st)
				IDLE: nst = READ_MEM;
				READ_MEM: nst = CAL; 
				CAL: nst = cnt == 3'd6 ? WRITE_MEM : CAL;
				//CAL: nst =  WRITE_MEM;
				WRITE_MEM: nst = IDLE;  
				default: nst = IDLE;
			endcase
		end
	end

	assign bram0_addr = { 8'd0, inst[4:0] };
	assign bram1_addr = st == WRITE_MEM ? { 8'd0, inst[14:10] } : { 8'd0, inst[9:5] };
	assign bram1_wen = st == WRITE_MEM ? 4'hf : 4'd0; 
	assign dsp_inmode = inst[19:15];
	assign dsp_alumode = inst[30:27];
	assign dsp_opmode = inst[26:20];

/*
	assign bram0_addr = { 8'd0, inst[4:0] };
	assign bram1_addr = st == WRITE_MEM ? 13'd6 : st == READ_MEM ? 13'd1 : st == CAL ? 13'd2 : 13'd31;
	assign bram1_wen = st != IDLE ? 4'hf : 4'd0; 
	assign dsp_inmode = inst[19:15];
	assign dsp_alumode = st != IDLE ? 4'd0 : inst[30:27];
	assign dsp_opmode = st != IDLE ? 7'd0 : inst[26:20];
*/
endmodule