module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y
);

always @(A or B)
	begin
		case (Op_code) 
			"000":
				Y <= A;
			"001":
				Y <= A+B;
			"010":
				Y <= A-B;
			"011":
				Y <= A & B;
			"100":
				Y <= A | B;
			"101":
				Y <= A+1;
			"110":
				Y <= A-1;
			"111":
				Y <= B;
			default:
				Y <= 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
		endcase
	end
endmodule
		