module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input rden, wren);
//signal declarations

reg [8:0] fifo_array[7:0];
reg [7:0] wrptr, rdptr;
wire [7:0] wr_cnt, rd_cnt;
always@(posedge clk,rst)
	begin
	if(rst==1) begin
		DataOut=9'b00000000; //default value
	if(wren==1) begin
		fifo_array[wrptr]=DataIn; 
		wrptr <=wrptr +WrInc; end 
	if(rden==1) begin
		DataOut=fifo_array[rdptr]; 
		rdptr =rdptr +RdInc; end 
	if(RdPtrClr) 
		rdptr <=0;
	if(WrPtrClr) 
		wrptr<=0;
	end
	else begin
		DataOut=9'bzzzzzzzzz; //reset condition2
	end
end
endmodule