module FSM
#(parameter State_width = 2,
			A = 2'b00,
			B = 2'b01,
			C = 2'b10)
(
  input In1,
  input RST,
  input CLK, 
  output reg Out1
);
reg [(State_width-1):0] cur, nex;
always @(posedge CLK or RST or nex)
	begin
		if (RST==1'b0) 
			cur <= A;
		else 
			cur <= nex;
	end
always @(In1 or cur)
	begin: combi
	Out1<= 1'b0;
		case (cur) 
			A:  begin
				Out1 <= 1'b0;
				if(In1==1'b1)
					nex <= B;
				else if(In1==1'b0)
					nex <= A;
				end
			B:	begin
				Out1 <= 1'b0;
				if (In1==1'b1)
					nex <= B;
				else if(In1==1'b0)
					nex <= C;
				end
			C:	begin
				Out1 <= 1'b1;
				if (In1==1'b1) 
					nex <= A;
				else if(In1==1'b0)
					nex <= C;
				end
			default:
				nex <= A;
		endcase
	end
endmodule
	


